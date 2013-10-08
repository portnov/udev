-- |
--   Copyright   :  (c) Sam Truzjan 2013
--   License     :  BSD3
--   Maintainer  :  pxqr.sta@gmail.com
--   Stability   :  experimental
--   Portability :  portable
--
module System.UDev
       ( module System.UDev.Context
       , module System.UDev.Device
       , module System.UDev.Enumerate
       , module System.UDev.HWDB
       , module System.UDev.List
       , module System.UDev.Monitor
       , module System.UDev.Queue
       , module System.UDev.Util
       ) where

import Data.Monoid

import System.UDev.Context
import System.UDev.Device
import System.UDev.Enumerate
import System.UDev.HWDB
import System.UDev.List
import System.UDev.Monitor
import System.UDev.Queue
import System.UDev.Util


type Subsystem = ()
type Devtype   = ()
type Tag       = ()

data Filter = Filter (Maybe (Subsystem, Devtype)) (Maybe Tag)

instance Monoid Filter where
  mempty  = Filter Nothing Nothing
  Filter sda ta `mappend` Filter sdb tb
    = Filter (sda `mappend` sdb) (ta `mappend` tb)