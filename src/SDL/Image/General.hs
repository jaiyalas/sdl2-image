module SDL.Image.General
   ( ImgInitFlag
   , initImg
   , initImgAll
   , quitImg
   ) where
--
import qualified SDL.Image.Raw as IRaw
--
import Foreign.C.Types
import Data.Bits
import Control.Monad.IO.Class
--
import Foreign.Marshal.Error (throwIfNeg_)
--
-- | Structure for SDL2-image initialization flags.
data ImgInitFlag = InitJPG -- ^ = @1 :: CInt@
                 | InitPNG -- ^ = @2 :: CInt@
                 | InitTIF -- ^ = @4 :: CInt@
                 deriving (Bounded, Enum, Eq, Ord, Read, Show)
--
bittizedFlag :: ImgInitFlag -> CInt
bittizedFlag InitJPG = IRaw.IMG_INIT_JPG
bittizedFlag InitPNG = IRaw.IMG_INIT_PNG
bittizedFlag InitTIF = IRaw.IMG_INIT_TIF

-- | Initialize SDL2-image with specified 'ImgInitFlag'
initImg :: MonadIO m => [ImgInitFlag] -> m ()
initImg = liftIO
   . throwIfNeg_ msg
   . IRaw.imgInit
   . foldl (\hs y -> hs .|. (bittizedFlag y)) 0
   where msg = \i -> "SDL.Image.General.initImg: " ++ show i

-- | Initialize SDL2-image with all 'ImgInitFlag'
initImgAll :: MonadIO m => m ()
initImgAll = liftIO $
   throwIfNeg_ (const "SDL.Image.General.initImgAll") $
   IRaw.imgInit 7

-- | Quit and release SDL2-image.
-- Equivalent to 'imgQuit'.
quitImg :: MonadIO m => m ()
quitImg = IRaw.imgQuit
{-# INLINE quitImg #-}
