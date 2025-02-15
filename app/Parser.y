 {
module Parser where
import Lexer  
import AST
}

%name parse
%tokentype { Token }
%error { parseError }
%right '='
%left '==' '!='
%left '<' '<=' '>=' '>'
%left '-' '+'
%right '!'
%left '*' '/'  '%'


%token

    'num'           { TK_NUM $$ }
    'if'            { TK_IF }        
    'int'           { TK_INT }
    'bool'          { TK_BOOL }
    'void'          { TK_VOID }
    'string'        { TK_STRING }
    Id              { TK_ID $$ }
    Str             { TK_STRLIT $$ }
    'else'          { TK_ELSE }          
    'while'         { TK_WHILE }          
    'return'        { TK_RETURN }
    'for'           { TK_FOR }
    ';'             { TK_SEMICOLON }
    ','             { TK_COMMA }
    '+'             { TK_PLUS }
    '-'             { TK_MINUS }
    '*'             { TK_ASTERISK }
    '%'             { TK_MOD }
    '/'             { TK_DIV }
    '('             { TK_LPAREN }
    ')'             { TK_RPAREN }
    '{'             { TK_LBRACE }
    '}'             { TK_RBRACE }
    '['             { TK_LBRACK }
    ']'             { TK_RBRACK }
    '='             { TK_ASSIGN }
    '+='            { TK_ADDASSIGN }
    '-='            { TK_SUBASSIGN }
    '*='            { TK_MULASSIGN }
    '/='            { TK_DIVASSIGN }
    '++'            { TK_INC }
    '--'            { TK_DEC }
    '<'             { TK_LrT}
    '<='            { TK_LTE }
    '>'             { TK_GrT}
    '>='            { TK_GTE }
    '=='            { TK_EQUAL }
    '!='            { TK_NOTEQUAL }
    '!'             { TK_NOT }
    '->'            { TK_RARROW }
    '.'             { TK_DOT }
    'true'          { TK_TRUE}
    'false'         { TK_FALSE}

%%

Prog : Fns                              { Prog $1 }
Fns : FnDecs                            { $1 }
    | FnDefs                            { $1 }

FnDefs : FunctionDef                    { [$1] }
       | FunctionDef Fns                { $1 : $2}

FnDecs : FunctionDec                    { [$1] }
       | FunctionDec Fns                { $1 : $2}

FunctionDef : Type Id '(' Args ')' '{' Decls Stmts '}' { FnDef $1 $2 $4 $7 $8 }
FunctionDec : Type Id '(' Args ')' ';'   { FnDec $1 $2 $4}

Type : 'bool'                           { Type_Bool }
     | 'int'                            { Type_Int }
     | 'string'                         { Type_Str }

Args :                                  { [] }
       | VarDecl                        { [$1] }
       | VarDecl ',' Args               { $1 : $3 }

Stmts :                                 { [] }
      | Stmt                            {[$1]}
      | Stmt Stmts                      {$1 : $2}

Stmt :'if' '(' Exp ')' Stmt 'else' Stmt { IfElse $3 $5 $7 }
     | 'if' '(' Exp ')' Stmt            { If $3 $5 }
     | '{' Decls Stmts '}'              { Block $2 $3 }
     | 'return' Exp ';'                 { Return $2 }
     | 'while' '(' Exp ')' Stmt         { While $3 $5}
     | 'for' '(' SimpleStmt ';' Exp ';' SimpleStmt ')' Stmt { For $3 $5 $7 $9} --add decl support, first stmt should be nullable
     | SimpleStmt ';'                   { $1 }

VarDecl : Type Id                       { ($2, $1) }

Decls :                                 { [] }
      | DeclList ';' Decls              { $1 ++ $3 }  

DeclList : VarDecl                      { [$1] }
         | VarDecl ',' VarList          { [$1] ++ zip $3 (repeat (snd $1)) }

VarList : Id                            { [$1] }
        | Id ',' VarList                { $1 : $3 }

SimpleStmt: Exp                         { Exp $1 }
          | Id '=' Exp                  { Assign $1 $3 }
          | Id '+=' Exp                 { Assign $1 (BinOp Add (Var $1) ($3)) }
          | Id '-=' Exp                 { Assign $1 (BinOp Sub (Var $1) ($3)) }
          | Id '*=' Exp                 { Assign $1 (BinOp Mult (Var $1) ($3)) }
          | Id '/=' Exp                 { Assign $1 (BinOp Div (Var $1) ($3)) }
          | Id '++'                     { Assign ($1) (BinOp Add (Var $1) (Num 1))}
          | Id '--'                     { Assign ($1) (BinOp Sub (Var $1) (Num 1))}

Exp : 'true'                            { Bool True }
    | 'false'                           { Bool False }
    | '(' Exp ')'                       { Paren $2 }
    | 'num'                             { Num (checkNum($1)) }
    | Id                                { Var $1 }
    | Str                               { Str $1 }
    | Id '(' Exps ')'                   { FnCall $1 $3}
    | Exp '+' Exp                       { BinOp Add $1 $3 }
    | Exp '-' Exp                       { BinOp Sub $1 $3 }
    | Exp '/' Exp                       { checkDivMod (BinOp Div $1 $3) }
    | Exp '*' Exp                       { BinOp Mult $1 $3 }
    | Exp '%' Exp                       { checkDivMod (BinOp Mod $1 $3) }
    | Exp '>' Exp                       { BinOp Gtr $1 $3 }
    | Exp '>=' Exp                      { BinOp GtrEq $1 $3 }
    | Exp '<' Exp                       { BinOp Gtr $3 $1 }
    | Exp '<=' Exp                      { BinOp GtrEq $3 $1 }
    | Exp '==' Exp                      { BinOp Eq $1 $3 }
    | Exp '!=' Exp                      { BinOp NotEq $1 $3 }
    | '!' Exp                           { UnOp Not $2 }
    | '-' Exp                           { BinOp Sub (Num 0) $2 }
    | '*' Exp                           { UnOp Deref $2 }

Exps :                                  { [] }
    | Exp                               { [$1] }
    | Exp ',' Exps                      { $1 : $3 }

{

--comentarios (nao fazer parse de */ dentro de comment)
--todo: for cycles, arrays, func calls

parseError :: [Token] -> a
parseError toks = error "parse error"  

checkNum :: Int -> Int
checkNum x | (x>(-2147483648) && x<2147483647) = x
           | otherwise = error "error: Number not in 32-bit range"

checkDivMod :: Exp -> Exp
checkDivMod x | checkAux x = x
              | otherwise = error "Overflow exception (invalid modulus or division)"
checkAux :: Exp -> Bool
checkAux (BinOp Div (Num n) (Num k)) | k==0 = False
                               | n== -2147483648 && k== -1 = False
                               | otherwise = True
checkAux (BinOp Mod (Num n) (Num k)) | k==0 = False
                               | n== -2147483648 && k== -1 = False
                               | otherwise = True
checkAux _ = True

}
