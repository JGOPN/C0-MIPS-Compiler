import Lexer
import Parser
import System.Directory

main :: IO ()
main = do
  {- filePath <- getLine
  currentDir <- getCurrentDirectory
  print currentDir
  contents <- readFile filePath  -}
  contents <- getLine
  let lexed = alexScanTokens contents
  print lexed
  let parsed = (parse lexed)
  print parsed