module SDL.Image.Raw.Loading
   ( -- * Automagic Loading
     imgLoad
   , imgLoadRW
   , imgLoadRWTyped
     -- * Specific Loaders
   , imgLoadRWJPG
   , imgLoadRWPNG
   , imgLoadRWBMP
   , imgLoadRWCUR
   , imgLoadRWGIF
   , imgLoadRWICO
   , imgLoadRWLBM
   , imgLoadRWPCX
   , imgLoadRWPNM
   , imgLoadRWTGA
   , imgLoadRWTIF
   , imgLoadRWXCF
   , imgLoadRWXPM
   , imgLoadRWXV
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
--
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
foreign import ccall "SDL_image.h IMG_LoadBMP_RW"
   imgLoadRWBMP_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadCUR_RW"
   imgLoadRWCUR_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadGIF_RW"
   imgLoadRWGIF_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadICO_RW"
   imgLoadRWICO_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadLBM_RW"
   imgLoadRWLBM_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadPCX_RW"
   imgLoadRWPCX_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadPNM_RW"
   imgLoadRWPNM_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadTGA_RW"
   imgLoadRWTGA_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadTIF_RW"
   imgLoadRWTIF_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadXCF_RW"
   imgLoadRWXCF_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadXPM_RW"
   imgLoadRWXPM_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
foreign import ccall "SDL_image.h IMG_LoadXV_RW"
   imgLoadRWXV_FFI :: Ptr RowType.RWops
                    -> IO (Ptr RowType.Surface)
--
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
--
imgLoadRWBMP :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWBMP p = liftIO $ imgLoadRWBMP_FFI p
{-# INLINE imgLoadRWBMP #-}
--
imgLoadRWCUR :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWCUR p = liftIO $ imgLoadRWCUR_FFI p
{-# INLINE imgLoadRWCUR #-}
--
imgLoadRWGIF :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWGIF p = liftIO $ imgLoadRWGIF_FFI p
{-# INLINE imgLoadRWGIF #-}
--
imgLoadRWICO :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWICO p = liftIO $ imgLoadRWICO_FFI p
{-# INLINE imgLoadRWICO #-}
--
imgLoadRWLBM :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWLBM p = liftIO $ imgLoadRWLBM_FFI p
{-# INLINE imgLoadRWLBM #-}
--
imgLoadRWPCX :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWPCX p = liftIO $ imgLoadRWPCX_FFI p
{-# INLINE imgLoadRWPCX #-}
--
imgLoadRWPNM :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWPNM p = liftIO $ imgLoadRWPNM_FFI p
{-# INLINE imgLoadRWPNM #-}
--
imgLoadRWTGA :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWTGA p = liftIO $ imgLoadRWTGA_FFI p
{-# INLINE imgLoadRWTGA #-}
--
imgLoadRWTIF :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWTIF p = liftIO $ imgLoadRWTIF_FFI p
{-# INLINE imgLoadRWTIF #-}
--
imgLoadRWXCF :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWXCF p = liftIO $ imgLoadRWXCF_FFI p
{-# INLINE imgLoadRWXCF #-}
--
imgLoadRWXPM :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWXPM p = liftIO $ imgLoadRWXPM_FFI p
{-# INLINE imgLoadRWXPM #-}
--
imgLoadRWXV :: MonadIO m => Ptr RowType.RWops
             -> m (Ptr RowType.Surface)
imgLoadRWXV p = liftIO $ imgLoadRWXV_FFI p
{-# INLINE imgLoadRWXV #-}
--
