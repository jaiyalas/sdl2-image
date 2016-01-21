module SDL.Image.Raw.Info where
--
import Foreign.Marshal.Utils (toBool)
import Foreign.Ptr
import Foreign.C.Types
--
import Control.Monad.IO.Class
--
import SDL.Raw.Types as RT
--
foreign import ccall "SDL_image.h IMG_isPNG"
   _imgIsPNG :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isJPG"
   _imgIsJPG :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isBMP"
   _imgIsBMP :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isGIF"
   _imgIsGIF :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isICO"
   _imgIsICO :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isPCX"
   _imgIsPCX :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isPNM"
   _imgIsPNM :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isTIF"
   _imgIsTIF :: Ptr RT.RWops -> IO CInt

foreign import ccall "SDL_image.h IMG_isXCF"
   _imgIsXCF :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isCUR"
   _imgIsCUR :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isLBM"
   _imgIsLBM :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isXPM"
   _imgIsXPM :: Ptr RT.RWops -> IO CInt
foreign import ccall "SDL_image.h IMG_isXV"
   _imgIsXV :: Ptr RT.RWops -> IO CInt
--
imgIsPNG :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsPNG ptr = liftIO $ fmap toBool $ _imgIsPNG ptr
{-# INLINE imgIsPNG #-}
--
imgIsJPG :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsJPG ptr = liftIO $ fmap toBool $ _imgIsJPG ptr
{-# INLINE imgIsJPG #-}
--
imgIsBMP :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsBMP ptr = liftIO $ fmap toBool $ _imgIsBMP ptr
{-# INLINE imgIsBMP #-}
--
imgIsGIF :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsGIF ptr = liftIO $ fmap toBool $ _imgIsGIF ptr
{-# INLINE imgIsGIF #-}
--
imgIsICO :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsICO ptr = liftIO $ fmap toBool $ _imgIsICO ptr
{-# INLINE imgIsICO #-}
--
imgIsPCX :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsPCX ptr = liftIO $ fmap toBool $ _imgIsPCX ptr
{-# INLINE imgIsPCX #-}
--
imgIsPNM :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsPNM ptr = liftIO $ fmap toBool $ _imgIsPNM ptr
{-# INLINE imgIsPNM #-}
--
imgIsTIF :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsTIF ptr = liftIO $ fmap toBool $ _imgIsTIF ptr
{-# INLINE imgIsTIF #-}
--
imgIsXCF :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsXCF ptr = liftIO $ fmap toBool $ _imgIsXCF ptr
{-# INLINE imgIsXCF #-}
--
imgIsCUR :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsCUR ptr = liftIO $ fmap toBool $ _imgIsCUR ptr
{-# INLINE imgIsCUR #-}
--
imgIsLBM :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsLBM ptr = liftIO $ fmap toBool $ _imgIsLBM ptr
{-# INLINE imgIsLBM #-}
--
imgIsXPM :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsXPM ptr = liftIO $ fmap toBool $ _imgIsXPM ptr
{-# INLINE imgIsXPM #-}
--
imgIsXV :: MonadIO m => Ptr RT.RWops -> m Bool
imgIsXV ptr = liftIO $ fmap toBool $ _imgIsXV ptr
{-# INLINE imgIsXV #-}
--
