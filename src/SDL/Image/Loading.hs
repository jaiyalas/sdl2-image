{-|
Module : SDL.Image.Loading
Copyright   : Copyright (c) 2016 Yun-Yan Chi
License     : MIT
Maintainer  : jaiyalas@gmail.com

"SDL.Image.Loading" provides a ligh-level interface to SDL2_image image loading library.
-}
module SDL.Image.Loading
   ( -- * Loading into 'Surface'
     -- ** automatically loading
     surfaceFromFile
   , surfaceFromFileT
     -- ** loading with specified type
   , surfaceBMP
   , surfaceCUR
   , surfaceGIF
   , surfaceICO
   , surfaceJPG
   , surfaceLBM
   , surfacePCX
   , surfacePNG
   , surfacePNM
   , surfaceTGA
   , surfaceTIF
   , surfaceXCF
   , surfaceXPM
   , surfaceXV
     -- * Loading into 'Image'
   , loadImg
   , surfaceFromImg
   , surfaceFromImg'
   , surfaceFromImgT
   , surfaceFromImgT'
     -- * Datatypes
   , Image (..)
   , ImageType (..)
   ) where
--
import qualified SDL.Raw as Raw
import qualified SDL as SDL
--
import qualified  SDL.Image.Raw as IRaw
--
import Foreign.Ptr
-- import Foreign.C.Types
import Foreign.C.String (withCAString, newCString)
-- import Data.Bits
-- import Control.Monad
import Control.Monad.IO.Class
--
-- | Supported image type
data ImageType = Img_BMP
               | Img_CUR
               | Img_GIF
               | Img_ICO
               | Img_JPG
               | Img_LBM
               | Img_PCX
               | Img_PNG
               | Img_PNM
               | Img_TGA
               | Img_TIF
               | Img_XCF
               | Img_XPM
               | Img_XV
               deriving (Show, Read, Enum, Ord, Eq)

it2Str :: ImageType -> String
it2Str Img_BMP = "BMP"
it2Str Img_CUR = "CUR"
it2Str Img_GIF = "GIF"
it2Str Img_ICO = "ICO"
it2Str Img_JPG = "JPG"
it2Str Img_LBM = "LBM"
it2Str Img_PCX = "PCX"
it2Str Img_PNG = "PNG"
it2Str Img_PNM = "PNM"
it2Str Img_TGA = "TGA"
it2Str Img_TIF = "TIF"
it2Str Img_XCF = "XCF"
it2Str Img_XPM = "XPM"
it2Str Img_XV  = "XV"
--
-- | Directly loading image into 'Surface' from file using raw c function.
surfaceFromFile :: MonadIO m => FilePath -> m SDL.Surface
surfaceFromFile fpath = liftIO $
   withCAString fpath IRaw.imgLoad
   >>= return . (flip SDL.Surface $ Nothing)
-- | Image loader with given 'ImageType'
surfaceFromFileT :: MonadIO m => ImageType -> FilePath -> m SDL.Surface
surfaceFromFileT it fp = loadImg fp >>= surfaceFromImgT it
-- | @.bmp@ loader
surfaceBMP :: MonadIO m => FilePath -> m SDL.Surface
surfaceBMP = surfaceFromFileT Img_BMP
-- | @.gif@ loader
surfaceGIF :: MonadIO m => FilePath -> m SDL.Surface
surfaceGIF = surfaceFromFileT Img_GIF
-- | @.jpg@ or @.jpeg@ loader
surfaceJPG :: MonadIO m => FilePath -> m SDL.Surface
surfaceJPG = surfaceFromFileT Img_JPG
-- | @.lbm@ or @.iff@ loader
surfaceLBM :: MonadIO m => FilePath -> m SDL.Surface
surfaceLBM = surfaceFromFileT Img_LBM
-- | @.pcx@ loader
surfacePCX :: MonadIO m => FilePath -> m SDL.Surface
surfacePCX = surfaceFromFileT Img_PCX
-- | @.png@ loader
surfacePNG :: MonadIO m => FilePath -> m SDL.Surface
surfacePNG = surfaceFromFileT Img_PNG
-- | @.pbm@, @.pgm@ or @.ppm@ loader
surfacePNM :: MonadIO m => FilePath -> m SDL.Surface
surfacePNM = surfaceFromFileT Img_PNM
-- | @.tga@ loader
surfaceTGA :: MonadIO m => FilePath -> m SDL.Surface
surfaceTGA = surfaceFromFileT Img_TGA
-- | @.tif@ loader
surfaceTIF :: MonadIO m => FilePath -> m SDL.Surface
surfaceTIF = surfaceFromFileT Img_TIF
-- | @.xcf@ loader
surfaceXCF :: MonadIO m => FilePath -> m SDL.Surface
surfaceXCF = surfaceFromFileT Img_XCF
-- | @.xpm@ loader
surfaceXPM :: MonadIO m => FilePath -> m SDL.Surface
surfaceXPM = surfaceFromFileT Img_XPM
-- | @.cur@ loader
surfaceCUR :: MonadIO m => FilePath -> m SDL.Surface
surfaceCUR = surfaceFromFileT Img_CUR
-- | @.ico@ loader
surfaceICO :: MonadIO m => FilePath -> m SDL.Surface
surfaceICO  = surfaceFromFileT Img_ICO
-- | @.xv@ loader
surfaceXV :: MonadIO m => FilePath -> m SDL.Surface
surfaceXV = surfaceFromFileT Img_XV

-- | Newtype for wrapping SDL_RWops structure.
--
-- See @<https://wiki.libsdl.org/SDL_RWops>@ or
-- 'SDL.Raw.RWops' for more details.
newtype Image = Image (Ptr Raw.RWops)

-- | Load file into an 'Image'.
loadImg :: (Monad m, MonadIO m) => FilePath -> m Image
loadImg fpath = liftIO $
   newCString "r"
   >>= withCAString fpath . (flip Raw.rwFromFile)
   >>= return . Image
-- | Transform an 'Image' into a 'Surface'
-- WITH automatically releasing 'Image'.
surfaceFromImg :: MonadIO m => Image -> m SDL.Surface
surfaceFromImg (Image ptr) = liftIO $
   IRaw.imgLoadRW ptr True
   >>= return . (flip SDL.Surface $ Nothing)
-- | Transform an 'Image' into a 'Surface'
-- WITHOUT automatically releasing 'Image'.
surfaceFromImg' :: MonadIO m => Image -> m SDL.Surface
surfaceFromImg' (Image ptr) = liftIO $
   IRaw.imgLoadRW ptr False
   >>= return . (flip SDL.Surface $ Nothing)
-- | A 'ImageType'-specified variant of 'surfaceFromImg'.
surfaceFromImgT :: MonadIO m => ImageType -> Image -> m SDL.Surface
surfaceFromImgT it (Image ptr) = liftIO $
   withCAString (it2Str it) (IRaw.imgLoadRWTyped ptr True)
   >>= return . (flip SDL.Surface $ Nothing)
-- | A 'ImageType'-specified variant of 'surfaceFromImg''.
surfaceFromImgT' :: MonadIO m => ImageType -> Image -> m SDL.Surface
surfaceFromImgT' it (Image ptr) = liftIO $
   withCAString (it2Str it) (IRaw.imgLoadRWTyped ptr False)
   >>= return . (flip SDL.Surface $ Nothing)
