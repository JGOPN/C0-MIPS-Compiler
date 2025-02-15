module IntermediateCode where

import AST

type Temp  = String
type Label = String
data Func = Func Ident [Ident] [Instr]
data Instr
  = MOVE Temp Temp                -- t1 := t2
  | MOVEI Temp Int                -- t  := n
  | OP Binop Temp Temp Temp       -- t3 := t1 op t2
  | OPI Binop Temp Temp Int       -- t2 := t1 op n
  | LABEL Label                   -- define label
  | JUMP Label                    -- unconditional jump
  | COND Temp Binop Temp Label Label  -- conditional jump
  | CALL Temp Label [Temp]         -- call a function
  | RETURN Temp                    -- return from a function
  deriving (Eq, Show)

