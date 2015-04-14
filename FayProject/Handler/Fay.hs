module Handler.Fay where

import Fay.Convert (readFromFay)
import Import
import Prelude     ((!!))
import Yesod.Fay

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (drop 1 fibs)

onCommand :: CommandHandler App
onCommand render command =
    case readFromFay command of
      Just (GetFib index r) -> render r . pack . show $ fibs !! index
      Just (CalcOp op x y r) -> 
            case op of
                  FayAdd -> render r $ x + y
                  FayMul -> render r $ x * y 
                  FaySub -> render r $ x - y
                  FayDiv -> if y /= 0 
                           then render r $ x / y
                           else invalidArgs ["Division by zero"]
      Nothing -> invalidArgs ["Invalid command"]
