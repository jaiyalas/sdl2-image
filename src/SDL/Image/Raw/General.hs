module SDL.Image.Raw.General
   ( -- * General operations for SDL_image
     imgInit
   , imgQuit
   )where
--
import Foreign.C.Types
--
import Control.Monad.IO.Class
--
import SDL.Image.Raw.Enum
--
foreign import ccall "SDL_image.h IMG_Init" imgInit_FFI :: IIFlag -> IO CInt
foreign import ccall "SDL_image.h IMG_Quit" imgQuit_FFI :: IO ()
-- | Raw function for @IMG_Init@
imgInit :: MonadIO m => IIFlag -> m CInt
imgInit fs = liftIO $ imgInit_FFI fs
{-# INLINE imgInit #-}
-- | Raw function for @IMG_Quit@
imgQuit :: MonadIO m => m ()
imgQuit = liftIO imgQuit_FFI
{-# INLINE imgQuit #-}
