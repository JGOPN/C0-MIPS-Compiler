{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant return" #-}
module ICGenerator where
import IntermediateCode
import AST
import           Data.Map (Map)
import qualified Data.Map as Map
import           Control.Monad.State (State)
import qualified Control.Monad.State as State

type Table = Map Ident Temp
type Supply = (Int, Int)


newTemp :: State Supply Temp
newTemp
  = do (temps,labels) <- State.get
       State.put (temps+1, labels)
       return ("t"++show temps)

newLabel :: State Supply Label
newLabel
  = do (temps,labels) <- State.get
       State.put (temps, labels+1)
       return ("L"++show labels)

newTemps :: Int -> State Supply [Temp]
newTemps 0 = do return []
newTemps n | n > 0 = do
                     t <- newTemp
                     ts <- newTemps (n-1)
                     return (t:ts)

reuseTemps :: Int -> State Supply ()
reuseTemps n
  = do (temps, labels) <- State.get
       State.put (temps-n, labels)

--------------------------------------------------------------

-- translate an expression
transExp :: Exp -> Table -> Temp -> State Supply [Instr]
transExp (Var x) tabl dest
  = case Map.lookup x tabl of
      Just temp -> return [MOVE dest temp]
      Nothing -> error "undefined variable"

transExp (Num n) tabl dest
  = return [MOVEI dest n]

transExp (BinOp op e1 e2) tabl dest
  = do temp1 <- newTemp
       temp2 <- newTemp
       code1 <- transExp e1 tabl temp1
       code2 <- transExp e2 tabl temp2
       reuseTemps 2
       return (code1 ++ code2 ++ [OP op dest temp1 temp2])

transExp (FnCall id args) tabl dest
  = do (code, temps) <- transArgs args tabl
       reuseTemps (length temps)
       return (code ++ [CALL dest id temps])

transExp (Bool True) tabl dest
  = do return [MOVEI dest 1]
transExp (Bool False) tabl dest
  = do return [MOVEI dest 0]

transExp (Paren exp) tabl dest 
  = transExp exp tabl dest

-- translate functions arguments
-- each one gets a new temporary
transArgs :: [Exp] -> Table -> State Supply ([Instr], [Temp])
transArgs [] tabl = return ([], [])
transArgs (exp:exps) tabl
      = do temp <- newTemp
           code <- transExp exp tabl temp
           (code', temps') <- transArgs exps tabl
           return (code++code', temp:temps')


-- translate a statement
transStm :: Stmt -> Table -> State Supply [Instr]
transStm (Assign var expr) tabl
  = case Map.lookup var tabl of
      Nothing -> error "undefined variable"
      Just dest -> transExp expr tabl dest


transStm (If cond stm1) tabl
  = do ltrue  <- newLabel
       lfalse <- newLabel
       code0  <- transCond cond tabl ltrue lfalse
       code1  <- transStm stm1 tabl
       return (code0 ++ [LABEL ltrue] ++
               code1 ++ [LABEL lfalse])


transStm (IfElse cond stm1 stm2) tabl
  = do ltrue <- newLabel
       lfalse <- newLabel
       lend <- newLabel
       code0 <- transCond cond tabl  ltrue lfalse
       code1 <- transStm stm1 tabl
       code2 <- transStm stm2 tabl
       return (code0 ++ [LABEL ltrue] ++ code1 ++
               [JUMP lend, LABEL lfalse] ++ code2 ++
               [LABEL lend])

transStm  (While cond stm) tabl =
  do lcond <- newLabel
     lbody <- newLabel
     lend <- newLabel
     code1 <- transCond cond tabl  lbody lend
     code2 <- transStm stm tabl
     return ([LABEL lcond] ++ code1 ++
             [LABEL lbody] ++ code2 ++
             [JUMP lcond, LABEL lend])

transStm (Return expr) tabl =
  do dest <- newTemp
     code <- transExp expr tabl  dest
     reuseTemps 1
     return (code ++ [RETURN dest])

transStm (Exp e) tabl =
  do dest <- newTemp
     code <- transExp e tabl dest
     reuseTemps 1
     return code

transStm (For stm1 cond stm2 stms) tabl = --review this
  do lcond <- newLabel
     lbody <- newLabel
     lend <- newLabel
     code1 <- transStm stm1 tabl
     codeCond <- transCond cond tabl  lbody lend
     code2 <- transStm stm2 tabl
     code3 <- transStm stms tabl
     return ( code1 ++  
             [LABEL lcond] ++ codeCond ++
             [LABEL lbody] ++ code3 ++ code2 ++
             [JUMP lcond, LABEL lend])

--deve criar ts para todas decls
transStm (Block decls stmts) tabl =
  do newtemps <- newTemps (length decls)
     let newTable = Map.fromList (Map.toList tabl ++ zip (map fst decls) newtemps)
     code <- transStmList stmts newTable
     return code

-- translate a condition
transCond :: Exp -> Table -> Label -> Label -> State Supply [Instr]
transCond (BinOp rel e1 e2) tabl ltrue lfalse
  | rel == Gtr || rel == GtrEq || rel == Eq || rel == NotEq  =
      do temp1 <- newTemp
         temp2 <- newTemp
         code1 <- transExp e1 tabl temp1
         code2 <- transExp e2 tabl temp2
         reuseTemps 2
         return ( code1 ++ code2 ++
                  [COND temp1 rel temp2 ltrue lfalse] )
transCond (Bool b) tabl ltrue lfalse | b = do return [JUMP ltrue]
                                     | not b = do return [JUMP lfalse]
transCond (UnOp Not exp) tabl ltrue lfalse = transCond exp tabl lfalse ltrue
transCond exp tabl ltrue lfalse =
  do temp1 <- newTemp
     temp2 <- newTemp
     code1 <- transExp exp tabl temp1
     code2 <- transExp (Num 0) tabl temp2
     reuseTemps 2
     return (code1 ++ code2 ++ [COND temp1 NotEq temp2 ltrue lfalse])

-- translate individual statements and join the resulting instructions
transStmList :: [Stmt] -> Table -> State Supply [Instr]
transStmList [] tabl = return []
transStmList (stm:rest) tabl = do
  code1 <- transStm stm tabl
  code2 <- transStmList rest tabl
  return (code1 ++ code2)

-- translate a function definition
transFnDef :: FnDecOrDef -> State Supply [Instr]
transFnDef (FnDef t fname args locals body)
  = do targs <- newTemps (length args)      -- temporaries for arguments
       tlocals <- newTemps (length locals)  -- temporaries for locals
       let table = Map.fromList (zip (map fst args) targs ++ zip (map fst locals) tlocals)
       code <- transStmList body table
       reuseTemps (length targs + length tlocals)
       return (LABEL fname : code)

transProg :: Prog -> State Supply [Instr]
transProg (Prog [fn]) = do 
    code <- transFnDef fn
    return code 
transProg (Prog (fn:fns)) = do
  code1 <- transFnDef fn
  code2 <- transProg (Prog fns)
  return (code1 ++ code2)

printIR :: [Instr] -> IO ()
printIR = mapM_ print

-- run a code generation action with initial supply
runCodeGen :: State Supply [Instr] -> [Instr]
runCodeGen gen = State.evalState gen (0,0)