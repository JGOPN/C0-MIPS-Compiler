{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
module Main where

import Lexer
import Parser
import AST
import TypeChecking
import IntermediateCode
import ICGenerator
import AssemblyGenerator

main :: IO ()
main = do
  txt <- getContents
  print $ alexScanTokens txt
  let prog = (parse $ alexScanTokens txt)
  print prog
  checkProg prog --checkProg = typechecking
  let ic = runCodeGen (do transProg prog)
  let mips = icToMipsString ic
  putStrLn mips