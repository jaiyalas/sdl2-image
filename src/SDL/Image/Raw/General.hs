module SDL.Image.Raw.General where
--
import Foreign.C.Types
--
import Control.Monad.IO.Class
--
import SDL.Image.Raw.Enum
--
foreign import ccall "SDL_image.h IMG_Init" _imgInit :: ImgInitFlag -> IO CInt
foreign import ccall "SDL_image.h IMG_Quit" _imgQuit :: IO ()
--
imgInit :: MonadIO m => ImgInitFlag -> m CInt
imgInit fs = liftIO $ _imgInit fs
{-# INLINE imgInit #-}
--
imgQuit :: MonadIO m => m ()
imgQuit = liftIO _imgQuit
{-# INLINE imgQuit #-}
