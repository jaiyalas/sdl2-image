module SDL.Image.Raw.Loading
   ( -- * Automagic Loading
     imgLoad
   , imgLoadRW
   , _imgLoad
     -- * Specific Loaders
   )where
--
import Foreign.Marshal.Utils (fromBool)
import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
--
import Control.Monad.IO.Class
--
import qualified SDL.Raw.Types as RT
--
foreign import ccall "SDL_image.h IMG_Load"
   _imgLoad :: CString -> IO (Ptr RT.Surface)
foreign import ccall "SDL_image.h IMG_Load_RW"
   _imgLoadRW :: Ptr RT.RWops -> CInt -> IO (Ptr RT.Surface)
--
imgLoad :: MonadIO m => CString -> m (Ptr RT.Surface)
imgLoad path = liftIO $ _imgLoad path
{-# INLINE imgLoad #-}
--
imgLoadRW :: MonadIO m => Ptr RT.RWops -> Bool -> m (Ptr RT.Surface)
imgLoadRW p autoFree = liftIO $ _imgLoadRW p (fromBool autoFree)
{-# INLINE imgLoadRW #-}
--
