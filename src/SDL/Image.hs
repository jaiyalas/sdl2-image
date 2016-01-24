{-|
Module : SDL.Image
Copyright   : Copyright (c) 2016 Yun-Yan Chi
License     : MIT
Maintainer  : jaiyalas@gmail.com

This module provides functions for
loading a image file into SDL2.

One can load a file into an 'Image',
which is defined in 'SDL.Image.Loading'
and is simply a (Ptr RWops),
or into a 'Surface' provided by "SDL".
-}

module SDL.Image
   ( module SDL.Image.General
   , module SDL.Image.Loading
   , module SDL.Image.Info
   , module SDL.Image.Raw
   )where
--
import SDL.Image.General
import SDL.Image.Loading
import SDL.Image.Info
--
import SDL.Image.Raw
