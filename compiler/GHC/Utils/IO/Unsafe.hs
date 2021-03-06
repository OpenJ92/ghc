{-
(c) The University of Glasgow, 2000-2006
-}

{-# LANGUAGE CPP, MagicHash, UnboxedTuples #-}

module GHC.Utils.IO.Unsafe
   ( inlinePerformIO,
   )
where

#include "HsVersions.h"

import GHC.Prelude ()

import GHC.Exts
import GHC.IO   (IO(..))

-- Just like unsafeDupablePerformIO, but we inline it.
{-# INLINE inlinePerformIO #-}
inlinePerformIO :: IO a -> a
inlinePerformIO (IO m) = case m realWorld# of (# _, r #)   -> r
