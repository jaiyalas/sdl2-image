module SDL.Image.Raw.Loading
   ( -- * Automagic Loading
     imgLoad
   , imgLoadRW
   , imgLoadRWTyped
     -- * Specific Loaders
   , imgLoadRWJPG
   , imgLoadRWPNG
   )where
--
import Foreign.Marshal.Utils (fromBool)
import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
--
import Control.Monad.IO.Class
--
import qualified SDL.Raw.Types as RowType
--
foreign import ccall "SDL_image.h IMG_Load"
   imgLoad_FFI :: CString -> IO (Ptr RowType.Surface)
foreign import ccall "SDL_image.h IMG_Load_RW"
   imgLoadRW_FFI :: Ptr RowType.RWops -> CInt -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadTyped_RW"
   imgLoadRWTyped_FFI :: Ptr RowType.RWops
                      -> CInt
                      -> CString
                      -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadJPG_RW"
   imgLoadRWJPG_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadPNG_RW"
   imgLoadRWPNG_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)

--
imgLoad :: MonadIO m => CString -> m (Ptr RowType.Surface)
imgLoad path = liftIO $ imgLoad_FFI path
{-# INLINE imgLoad #-}
--
imgLoadRW :: MonadIO m => Ptr RowType.RWops
          -> Bool
          -> m (Ptr RowType.Surface)
imgLoadRW p autoFree = liftIO $
   imgLoadRW_FFI p (fromBool autoFree)
{-# INLINE imgLoadRW #-}
--
imgLoadRWTyped :: MonadIO m => Ptr RowType.RWops
               -> Bool
               -> CString
               -> m (Ptr RowType.Surface)
imgLoadRWTyped p autoFree typeStr = liftIO $
   imgLoadRWTyped_FFI p (fromBool autoFree) typeStr
{-# INLINE imgLoadRWTyped #-}
--
imgLoadRWJPG :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWJPG p = liftIO $ imgLoadRWJPG_FFI p
{-# INLINE imgLoadRWJPG #-}
--
imgLoadRWPNG :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWPNG p = liftIO $ imgLoadRWPNG_FFI p
{-# INLINE imgLoadRWPNG #-}
