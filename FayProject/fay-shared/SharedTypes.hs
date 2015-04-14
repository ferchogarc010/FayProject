{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveDataTypeable #-}
module SharedTypes where

import Prelude
import Data.Data
import Fay.Yesod
import Data.Text

data Operador = FayAdd
              | FayMul
              | FayDiv
              | FaySub
    deriving (Typeable, Data)


data Command = GetFib Int (Returns Text)
             | CalcOp Operador Double Double (Returns Double)
     deriving (Typeable, Data)


