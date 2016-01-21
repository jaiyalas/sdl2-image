module Paths_sdl2_image (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [2,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jaiyalas/.cabal/bin"
libdir     = "/Users/jaiyalas/.cabal/lib/x86_64-osx-ghc-7.10.2/sdl2-image-2.0.1-KUlaIow0lBXEjvkeJsEzQm"
datadir    = "/Users/jaiyalas/.cabal/share/x86_64-osx-ghc-7.10.2/sdl2-image-2.0.1"
libexecdir = "/Users/jaiyalas/.cabal/libexec"
sysconfdir = "/Users/jaiyalas/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sdl2_image_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sdl2_image_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "sdl2_image_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sdl2_image_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sdl2_image_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)