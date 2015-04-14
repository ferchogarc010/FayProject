{-# LANGUAGE RebindableSyntax #-}
{-# LANGUAGE OverloadedStrings #-}

module Home where

import           FFIExample

import           DOM
import           Data.Text (fromString)
import qualified Data.Text as T
import           Fay.Yesod
import           Prelude
import           SharedTypes

operar :: Operador -> Element -> Element -> Element -> Fay ()
operar op inputX inputY result = do
    xS <- getValue inputX
    x <- parseDouble xS
    yS <- getValue inputY
    y <- parseDouble yS
    call (CalcOp op x y) $ setInnerHTML result . T.pack . show
   


main :: Fay ()
main = do
    input <- getElementById "fibindex"
    result <- getElementById "fibresult"
    btnAdd <- getButtonById "btnAdd"
    btnMul <- getButtonById "btnMul"
    btnSub <- getButtonById "btnSub"
    btnDiv <- getButtonById "btnDiv"
    btnOtr <- getButtonById "btnOtr"
    inputX <- getElementById "arg0"
    inputY <- getElementById "arg1"
    opresult <- getElementById "opresult"
    onKeyUp input $ do
        indexS <- getValue input
        index <- parseInt indexS
        call (GetFib index) $ setInnerHTML result
    onClickBtn btnAdd $ operar FayAdd inputX inputY opresult
    onClickBtn btnMul $ operar FayMul inputX inputY opresult
    onClickBtn btnDiv $ operar FayDiv inputX inputY opresult
    onClickBtn btnSub $ operar FaySub inputX inputY opresult
    onClickBtn btnOtr $ do
                           let s = map (*2) [1..10]
                           setInnerHTML opresult . T.pack. show $ s
