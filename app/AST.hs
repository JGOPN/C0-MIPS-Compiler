{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Use camelCase" #-}
module AST where

data Prog = Prog [FnDecOrDef] deriving Show
data FnDecOrDef = FnDec Type Ident [Decl]
                | FnDef Type Ident [Decl] [Decl] [Stmt] --type id [args] [locals] [stmts]
                deriving Show

data Type = Type_Bool | Type_Int | Type_Str | Type_Char
        deriving (Show,Eq)

type Ident = String
type Decl = (Ident, Type)

data Exp = Paren Exp
         | Num Int              
         | Bool Bool
         | Str String
         | Var Ident
         | FnCall Ident [Exp]     -- id([args])
         | BinOp Binop Exp Exp
         | UnOp Unop Exp 
         deriving Show      

data Stmt = Assign Ident Exp
         | Exp Exp
         | If Exp Stmt
         | IfElse Exp Stmt Stmt
         | While Exp Stmt
         | Block [Decl] [Stmt]       -- { Stmts }
         | For Stmt Exp Stmt Stmt
         | Return Exp
         deriving Show

data Binop = Add | Sub | Mult | Div | Mod | Gtr | GtrEq | Eq | NotEq deriving (Show,Eq)
data Unop = Not | Neg | Deref deriving (Show,Eq)