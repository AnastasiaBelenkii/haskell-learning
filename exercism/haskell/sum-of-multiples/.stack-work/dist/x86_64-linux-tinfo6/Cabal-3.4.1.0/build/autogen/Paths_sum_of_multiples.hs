{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_sum_of_multiples (
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
version = Version [1,5,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/bin"
libdir     = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/lib/x86_64-linux-ghc-9.0.2/sum-of-multiples-1.5.0.10-FIlUKZg0Y3DCIaqKHoVtli"
dynlibdir  = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/share/x86_64-linux-ghc-9.0.2/sum-of-multiples-1.5.0.10"
libexecdir = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/libexec/x86_64-linux-ghc-9.0.2/sum-of-multiples-1.5.0.10"
sysconfdir = "/home/ec2-user/exercism/haskell/sum-of-multiples/.stack-work/install/x86_64-linux-tinfo6/889c1507a5c614c720abbafd241fa173e80ca858246f193272cab606948dfeed/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sum_of_multiples_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sum_of_multiples_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "sum_of_multiples_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "sum_of_multiples_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sum_of_multiples_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sum_of_multiples_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
