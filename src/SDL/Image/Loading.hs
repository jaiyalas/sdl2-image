-- | "SDL.Image.Loading" provides a ligh-level interface to SDL2_image
-- image loading library.
--
module SDL.Image.Loading
   ( -- * Loading image into 'Surface'
     surfaceFromImgFile
     -- * Loading with type 'Image'
   , Image
   , loadImg
   , surfaceFromImg
   , surfaceFromImg'
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
-- | Directly loading image into 'Surface' from file using raw c function.
surfaceFromImgFile :: MonadIO m => FilePath -> m SDL.Surface
surfaceFromImgFile fpath = liftIO $
   withCAString fpath IRaw.imgLoad
   >>= return . (flip SDL.Surface $ Nothing)
--
-- | Newtype for wrapping SDL_RWops structure.
--
-- See @<https://wiki.libsdl.org/SDL_RWops>@ or
-- 'SDL.Raw.RWops' for more details.
newtype Image = Image (Ptr Raw.RWops)

-- | Load image file into a 'Image' which is in fact a 'RWops'
loadImg :: (Monad m, MonadIO m) => FilePath -> m Image
loadImg fpath = liftIO $
   newCString "r"
   >>= withCAString fpath . (flip Raw.rwFromFile)
   >>= return . Image
-- | Transform an 'Image' into a 'Surface'
-- WITH automatically releasing RWops.
surfaceFromImg :: MonadIO m => Image -> m SDL.Surface
surfaceFromImg (Image ptr) = liftIO $
   IRaw.imgLoadRW ptr True
   >>= return . (flip SDL.Surface $ Nothing)
-- | Transform an 'Image' into a 'Surface'
-- WITHOUT automatically releasing RWops.
surfaceFromImg' :: MonadIO m => Image -> m SDL.Surface
surfaceFromImg' (Image ptr) = liftIO $
   IRaw.imgLoadRW ptr False
   >>= return . (flip SDL.Surface $ Nothing)


-- imgLoadRWTyped :: MonadIO m => Ptr RowType.RWops
--                -> Bool
--                -> CString
--                -> m (Ptr RowType.Surface)
--
--
-- --
-- loadImage :: FilePath -> SDL.Source
-- imgToSource :: Image -> SDL.Source
-- loadImageTyped
-- -- * Specific Loaders
-- imgLoadRWJPG
-- imgLoadRWPNG
-- imgLoadRWBMP
-- imgLoadRWCUR
-- imgLoadRWGIF
-- imgLoadRWICO
-- imgLoadRWLBM
-- imgLoadRWPCX
-- imgLoadRWPNM
-- imgLoadRWTGA
-- imgLoadRWTIF
-- imgLoadRWXCF
-- imgLoadRWXPM
-- imgLoadRWXV
-- --
-- imgLoadRWJPG ::
--    MonadIO m => Ptr RowType.RWops -> m (Ptr RowType.Surface)
