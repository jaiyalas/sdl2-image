{-|
Module : SDL.Image.Info
Copyright   : Copyright (c) 2016 Yun-Yan Chi
License     : MIT
Maintainer  : jaiyalas@gmail.com

"SDL.Image.Info" provides a ligh-level interface to query
whether a 'Image' is an image.
-}
module SDL.Image.Info where
--
import SDL.Image.Loading
import qualified SDL.Image.Raw as IRaw
--
import Control.Monad.IO.Class
--
isPNG :: MonadIO m => Image -> m Bool
isPNG (Image ptr) = IRaw.imgIsPNG ptr
isJPG :: MonadIO m => Image -> m Bool
isJPG (Image ptr) = IRaw.imgIsJPG ptr
isBMP :: MonadIO m => Image -> m Bool
isBMP (Image ptr) = IRaw.imgIsBMP ptr
isGIF :: MonadIO m => Image -> m Bool
isGIF (Image ptr) = IRaw.imgIsGIF ptr
isICO :: MonadIO m => Image -> m Bool
isICO (Image ptr) = IRaw.imgIsICO ptr
isPCX :: MonadIO m => Image -> m Bool
isPCX (Image ptr) = IRaw.imgIsPCX ptr
isPNM :: MonadIO m => Image -> m Bool
isPNM (Image ptr) = IRaw.imgIsPNM ptr
isTIF :: MonadIO m => Image -> m Bool
isTIF (Image ptr) = IRaw.imgIsTIF ptr
isXCF :: MonadIO m => Image -> m Bool
isXCF (Image ptr) = IRaw.imgIsXCF ptr
isCUR :: MonadIO m => Image -> m Bool
isCUR (Image ptr) = IRaw.imgIsCUR ptr
isLBM :: MonadIO m => Image -> m Bool
isLBM (Image ptr) = IRaw.imgIsLBM ptr
isXPM :: MonadIO m => Image -> m Bool
isXPM (Image ptr) = IRaw.imgIsXPM ptr
isXV :: MonadIO m => Image -> m Bool
isXV (Image ptr) = IRaw.imgIsXV ptr
