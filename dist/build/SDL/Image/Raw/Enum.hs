{-# LINE 1 "src/SDL/Image/Raw/Enum.hsc" #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LINE 2 "src/SDL/Image/Raw/Enum.hsc" #-}
{-# LANGUAGE PatternSynonyms #-}
module SDL.Image.Raw.Enum
   ( -- * Enumerations
     -- ** Initialization Flag
     ImgInitFlag
   , pattern IMG_INIT_JPG
   , pattern IMG_INIT_PNG
   , pattern IMG_INIT_TIF
   ) where



{-# LINE 14 "src/SDL/Image/Raw/Enum.hsc" #-}

import Foreign.C.Types

type ImgInitFlag = CInt

pattern IMG_INIT_JPG = (1) :: ImgInitFlag
{-# LINE 20 "src/SDL/Image/Raw/Enum.hsc" #-}
pattern IMG_INIT_PNG = (2) :: ImgInitFlag
{-# LINE 21 "src/SDL/Image/Raw/Enum.hsc" #-}
pattern IMG_INIT_TIF = (4) :: ImgInitFlag
{-# LINE 22 "src/SDL/Image/Raw/Enum.hsc" #-}
