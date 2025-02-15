This C0 to MIPS compiler was written for a Uni Compilers class. It uses the Alex Haskell library to perform lexical analysis, and Happy for parsing. It also features basic type checking. 
The parsed code is represented as a AST (Abstract Syntax Tree), that is then traversed, generating a intermediate code repersentation. This intermediate code is then translated into 32-bit MIPS assembly code.
