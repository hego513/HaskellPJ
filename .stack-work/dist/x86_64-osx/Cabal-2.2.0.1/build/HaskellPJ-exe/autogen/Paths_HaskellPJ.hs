{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_HaskellPJ (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/bin"
libdir     = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/lib/x86_64-osx-ghc-8.4.4/HaskellPJ-0.1.0.0-D90d8QCvXky7sMUXLDf3fu-HaskellPJ-exe"
dynlibdir  = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/lib/x86_64-osx-ghc-8.4.4"
datadir    = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/share/x86_64-osx-ghc-8.4.4/HaskellPJ-0.1.0.0"
libexecdir = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/libexec/x86_64-osx-ghc-8.4.4/HaskellPJ-0.1.0.0"
sysconfdir = "/Users/sminagi/src/HaskellPJ/HaskellPJ/.stack-work/install/x86_64-osx/lts-12.18/8.4.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HaskellPJ_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HaskellPJ_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HaskellPJ_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HaskellPJ_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HaskellPJ_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HaskellPJ_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
