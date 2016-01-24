{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PatternSynonyms #-}
module SDL.Image.Raw.Enum
   ( -- * Enumerations
     -- ** Initialization Flag
     IIFlag
   , pattern IMG_INIT_JPG
   , pattern IMG_INIT_PNG
   , pattern IMG_INIT_TIF
   ) where
--
#include "SDL_image.h"
--
import Foreign.C.Types
--
type IIFlag = CInt
--
pattern IMG_INIT_JPG = (#const IMG_INIT_JPG) :: IIFlag
pattern IMG_INIT_PNG = (#const IMG_INIT_PNG) :: IIFlag
pattern IMG_INIT_TIF = (#const IMG_INIT_TIF) :: IIFlag
