module TypeChecking where

import Parser
import AST
import qualified Data.Map as Map

type TypeEnv = Map.Map String AST.Type

aritOps = [Add,Sub,Mult,Div,Mod]
types = [Type_Char,Type_Bool,Type_Int,Type_Str]

checkProg :: Prog -> IO()
checkProg (Prog fns) = if (all checkFns fns) then print "Passed" else print ""

checkFns :: FnDecOrDef -> Bool
checkFns (FnDef _ _ args locals stmts)
    = let env = extendEnv Map.empty (args++locals)
          stmtlist = map (checkStmt env) stmts
      in and stmtlist
checkFns (FnDec _ _ _) = True


checkExp :: TypeEnv -> Exp -> AST.Type
checkExp _ (Num _) = Type_Int
checkExp _ (Bool _) = Type_Bool
checkExp _ (Str _) = Type_Str
checkExp env (Paren e) = checkExp env e
checkExp env (BinOp op e1 e2) = checkBinopExp env op e1 e2
checkExp env (UnOp op e1) = checkUnopExp env op e1
checkExp env (Var id) = case Map.lookup id env of
                        Just t -> t
                        Nothing -> error "undeclared var"
checkExp env (FnCall id _) = Type_Int{- case Map.lookup id env of
                             Just t -> t
                             Nothing -> error "undeclared function" -}

checkUnopExp :: TypeEnv -> Unop -> Exp -> AST.Type
checkUnopExp env u e | u==Not =
  let t1 = checkExp env e
  in if t1==Type_Bool then Type_Bool else error "! can only be applied to bools"
                     | u==Neg =
  let t1 = checkExp env e
  in if t1==Type_Int then Type_Int else error "- can only be applied to ints"

checkBinopExp :: TypeEnv -> Binop -> Exp -> Exp -> AST.Type
checkBinopExp env b e1 e2 | b==Eq || b==NotEq =
    let t1 = checkExp env e1
        t2 = checkExp env e2
    in if t1==t2 then Type_Bool else error "types do not match"
                          | b `elem` aritOps = --if b is aritop
    let t1 = checkExp env e1
        t2 = checkExp env e2
    in if t1==Type_Int && t2==Type_Int then Type_Int else error "arithmetic operands have to be ints"
                          | b==Gtr || b==GtrEq =
    let t1 = checkExp env e1
        t2 = checkExp env e2
    in if t1==Type_Int && t2==Type_Int then Type_Bool else error "comparsion operands have to be ints "
                          | otherwise = error "err"

checkStmt :: TypeEnv -> Stmt -> Bool
checkStmt env (Exp exp) = elem (checkExp env exp) types
checkStmt env (Assign id exp) =
    let t1 = case Map.lookup id env of
                             Just t -> t
                             Nothing -> error "undeclared variable"
        t2 = checkExp env exp
    in t1==t2
checkStmt env (If exp stmt) =
    let condType = checkExp env exp
        s1 = checkStmt env stmt
    in (condType==Type_Bool) && s1
checkStmt env (IfElse exp stmt1 stmt2) =
    let if1 = checkStmt env (If exp stmt1)
        if2 = checkStmt env (If exp stmt2)
    in (if1 && if2)
checkStmt env (While exp stmt) = checkStmt env (If exp stmt)
checkStmt env (Block decls stmts) = all (checkStmt (extendEnv env decls)) stmts
checkStmt env (Return exp) = elem (checkExp env exp) types
checkStmt env (For s1 cond s2 stmts) = let st1 = checkStmt env s1 
                                           condAndBody = checkStmt env (If cond stmts)
                                           st2 = checkStmt env s2
                                       in (st1 && st2 && condAndBody)

extendEnv :: TypeEnv -> [Decl] -> TypeEnv
extendEnv env [] = env
extendEnv env ((id,t):rest) = extendEnv (Map.insert id t env) rest