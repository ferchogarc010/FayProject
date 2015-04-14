-- | Example of defining FFI functions.
--
-- The `ffi' method is currently incompatible with 'RebindableSyntax',
-- so these are defined in another module.

module FFIExample where

import Data.Text (Text)
import DOM
import FFI

data Button

getButtonById :: Text -> Fay Button
getButtonById = ffi "document.getElementById(%1)"

parseDouble :: Text -> Fay Double
parseDouble = ffi "parseFloat(%1)"

onKeyUp :: Element -> Fay () -> Fay ()
onKeyUp = ffi "%1.onkeyup=%2"

onClickBtn :: Button -> Fay() -> Fay()
onClickBtn = ffi "%1.onclick=%2"

setInnerHTML :: Element -> Text -> Fay ()
setInnerHTML = ffi "%1.innerHTML=%2"
