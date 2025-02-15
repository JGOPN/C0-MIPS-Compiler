{
module Lexer where
import Data.Char
}
%wrapper "basic"

$digit = [0-9]
$alpha = [a-zA-Z]
$hexdigit = [0-9a-fA-F]
@id = [A-Za-z_][A-Za-z0-9_]*
@string = \"[$alpha$digit$white]*\"

tokens :-

$white+               ;-- ignorar carateres "brancos"
"//".*\n              ;--comentarios
"/*"[.\n]*"*/"        ;--comentarios 
"if"                  { \_ -> TK_IF }          
"else"                { \_ -> TK_ELSE }          
"while"               { \_ -> TK_WHILE }          
"return"              { \_ -> TK_RETURN }
"for"                 { \_ -> TK_FOR }
";"                   { \_ -> TK_SEMICOLON }
","                   { \_ -> TK_COMMA }
"+"                   { \_ -> TK_PLUS }
"-"                   { \_ -> TK_MINUS }
"*"                   { \_ -> TK_ASTERISK }
"%"                   { \_ -> TK_MOD }
"/"                   { \_ -> TK_DIV }
"("                   { \_ -> TK_LPAREN }
")"                   { \_ -> TK_RPAREN }
"{"                   { \_ -> TK_LBRACE }
"}"                   { \_ -> TK_RBRACE }
"["                   { \_ -> TK_LBRACK }
"]"                   { \_ -> TK_RBRACK }
"="                   { \_ -> TK_ASSIGN }
"+="                  { \_ -> TK_ADDASSIGN }
"-="                  { \_ -> TK_SUBASSIGN }
"*="                  { \_ -> TK_MULASSIGN }
"/="                  { \_ -> TK_DIVASSIGN }
"++"                  { \_ -> TK_INC }
"--"                  { \_ -> TK_DEC }
"<"                   { \_ -> TK_LrT}
"<="                  { \_ -> TK_LTE }
">"                   { \_ -> TK_GrT}
">="                  { \_ -> TK_GTE }
"=="                  { \_ -> TK_EQUAL }
"!="                  { \_ -> TK_NOTEQUAL }
"!"                   { \_ -> TK_NOT }
"->"                  { \_ -> TK_RARROW }
"."                   { \_ -> TK_DOT }
"int"                 { \_ -> TK_INT }
"bool"                { \_ -> TK_BOOL}
"void"                { \_ -> TK_VOID}
"string"              { \_ -> TK_STRING }
"true"                { \_ -> TK_TRUE}
"false"               { \_ -> TK_FALSE}
$digit+               { \s -> TK_NUM (read s) }
@id                   { \s -> TK_ID s}
"0"[xX]$hexdigit+     { \s -> TK_NUM (read s) }
@string               { \s -> TK_STRLIT (trimString s) }

{


--TODO binary shifts, logical ops, assign ops except =, postop
data Token = TK_PLUS | TK_MINUS | TK_ASTERISK | TK_DIV | TK_MOD
           | TK_LPAREN | TK_RPAREN | TK_LBRACE | TK_RBRACE | TK_LBRACK | TK_RBRACK
           | TK_INC | TK_DEC | TK_ADDASSIGN | TK_SUBASSIGN | TK_MULASSIGN | TK_DIVASSIGN
           | TK_SEMICOLON | TK_COMMA | TK_ASSIGN | TK_NOT | TK_DOT | TK_RARROW
           | TK_NUM Int | TK_ID String | TK_VOID | TK_STRLIT String
           | TK_INT | TK_BOOL | TK_CHAR | TK_STRING | TK_TRUE | TK_FALSE
           | TK_LrT | TK_LTE | TK_GrT | TK_GTE | TK_EQUAL | TK_NOTEQUAL
           | TK_IF | TK_ELSE | TK_WHILE | TK_RETURN | TK_FOR
        deriving (Eq, Show)

trimString :: String -> String --removes (escape double quotes) from string
trimString s = drop 1 (take ((length s)-1) s)

}