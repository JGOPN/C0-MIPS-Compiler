module AssemblyGenerator where

import IntermediateCode
import AST
import           Data.Map (Map)
import qualified Data.Map as Map

data AddrImm = Imm Int | Addr String deriving Show
data MipsInstr = RFormat Ident Temp Temp Temp | IFormat Ident Temp Temp AddrImm | JFormat Ident AddrImm | Label String | Comp [MipsInstr] | Syscall deriving Show

icToMips :: [Instr] -> [MipsInstr]
icToMips [] = []
icToMips (COND c1 op c2 ltrue lfalse : rest) 
        | op==Eq =  
                if head rest == LABEL lfalse then Comp [IFormat "beq" c1 c2 (Addr ltrue), Label lfalse]  : icToMips (drop 1 rest)
                else if head rest == LABEL ltrue then Comp [IFormat "bne" c1 c2 (Addr lfalse), Label ltrue]  : icToMips (drop 1 rest)
                else Comp [IFormat "beq" c1 c2 (Addr ltrue), JFormat "j" (Addr lfalse)]  : icToMips rest
        | op==NotEq =
                if head rest == LABEL lfalse then Comp [IFormat "bne" c1 c2 (Addr ltrue), Label lfalse]  : icToMips (drop 1 rest)
                else if head rest == LABEL ltrue then Comp [IFormat "beq" c1 c2 (Addr lfalse), Label ltrue]  : icToMips (drop 1 rest)
                else Comp [IFormat "bne" c1 c2 (Addr ltrue), JFormat "j" (Addr lfalse)]  : icToMips rest
        | op==Gtr =
                if head rest == LABEL lfalse then Comp [IFormat "bgt" c1 c2 (Addr ltrue), Label lfalse]  : icToMips (drop 1 rest)
                else if head rest == LABEL ltrue then Comp [IFormat "ble" c1 c2 (Addr lfalse), Label ltrue]  : icToMips (drop 1 rest)
                else Comp [IFormat "bgt" c1 c2 (Addr ltrue), JFormat "j" (Addr lfalse)]  : icToMips rest
        | op==GtrEq =
                if head rest == LABEL lfalse then Comp [IFormat "gte" c1 c2 (Addr ltrue), Label lfalse]  : icToMips (drop 1 rest)
                else if head rest == LABEL ltrue then Comp [IFormat "blt" c1 c2 (Addr lfalse), Label ltrue]  : icToMips (drop 1 rest)
                else Comp [IFormat "gte" c1 c2 (Addr ltrue), JFormat "j" (Addr lfalse)]  : icToMips rest
icToMips ((MOVE to from) : rest) = RFormat "move" to from "" : icToMips rest
icToMips ((MOVEI to n) : rest)   = IFormat "li" to "" (Imm n) : icToMips rest
icToMips ((LABEL l) : rest)      = Label l : icToMips rest
icToMips ((JUMP l) : rest)       = JFormat "j" (Addr l) : icToMips rest
icToMips ((OPI op from to imm) : rest)
  = case op of
        Add -> IFormat "addi" to from (Imm imm) : icToMips rest
        Sub -> IFormat "subi" to from (Imm imm) : icToMips rest
icToMips ((OP op t1 t2 t3 ) : rest) 
  = case op of
        Mult -> RFormat "mul" t1 t2 t3 : icToMips rest
        Div  -> RFormat "div" t1 t2 t3 : icToMips rest
        Add  -> RFormat "add" t1 t2 t3 : icToMips rest
        Sub  -> RFormat "sub" t1 t2 t3 : icToMips rest
        Mod -> Comp [RFormat "div" t1 t2 t3, RFormat "mfhi" t1 "" "" ]  : icToMips rest
        Eq -> RFormat "seq" t1 t2 t3 : icToMips rest
        NotEq -> RFormat "sne" t1 t2 t3 : icToMips rest
icToMips ((RETURN ret) : rest) = IFormat "move" "v0" "" (Addr ret) : icToMips rest
icToMips ((CALL ret label args) : rest) 
  = case label of
        "print_int" -> [IFormat "li" "v0" "" (Imm 1), IFormat "move" "a0" "" (Addr (head args)),Syscall] ++ icToMips rest
        "scan_int" -> [IFormat "li" "v0" "" (Imm 5),Syscall,IFormat "move" ret "" (Addr "v0")] ++ icToMips rest

transMips :: MipsInstr -> String
transMips (Comp [i1,i2]) = transMips i1 ++ "\n" ++ transMips i2 --para nao colocar um newline a mais
transMips (Comp insList) = transMips (head insList) ++ "\n" ++  transMips (Comp (tail insList))
transMips i = case i of
                     (RFormat name to "" "") -> name ++ " $" ++ to
                     (RFormat name to from "") -> name ++ " $" ++ to ++ ", $" ++ from
                     (RFormat name to from extra) -> name ++ " $" ++ to ++ ", $" ++ from ++ ", $" ++ extra
                     (IFormat name rs "" (Imm n)) -> name ++ " $" ++ rs ++ ", " ++ show n
                     (IFormat name rs "" (Addr arg)) -> name ++ " $" ++ rs ++ ", $" ++ arg
                     (IFormat name to from (Imm n)) -> name ++ " $" ++ to ++ ", $" ++ from ++ ", " ++ show n
                     (IFormat name c1 c2 (Addr ltrue)) -> name ++ " $" ++ c1 ++ ", $" ++ c2 ++ ", _" ++ ltrue
                     (JFormat "j" (Addr s)) -> "j _" ++ s
                     (JFormat "j" (Imm i)) -> "j " ++ show i
                     (JFormat name (Addr l)) -> name ++ "$"
                     (Label l) -> "_" ++ l ++ ":"
                     Syscall -> "syscall"

icToMipsString :: [Instr] -> String
icToMipsString ins = concatMap ((++"\n") . transMips) (icToMips ins)
