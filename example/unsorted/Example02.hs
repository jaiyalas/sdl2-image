{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified SDL.Image as Img
import qualified SDL as SDL
import Control.Concurrent (threadDelay)
import Control.Monad (unless)
import Linear.Affine
import Linear.V2
import Linear.V4

frameRate = 25

main :: IO ()
main = do
    SDL.initialize [SDL.InitVideo]
    Img.initImg [Img.InitPNG]
    window <- SDL.createWindow "Example01" SDL.defaultWindow
    SDL.showWindow window
    --
    p01SF <- Img.surfacePNG "img/p01.png"
    rdr <- SDL.createRenderer window (-1) SDL.defaultRenderer
    p01TX <- SDL.createTextureFromSurface rdr p01SF
    SDL.freeSurface p01SF
    --
    let loop (x,y,i) = do
            events <- SDL.pollEvents
            let quit = any (== SDL.QuitEvent) $ map SDL.eventPayload events
            --
            SDL.clear rdr
            SDL.copy rdr p01TX Nothing $ Just $ SDL.Rectangle (P $ V2 x y) (V2 30 30)
            SDL.present rdr
            threadDelay $ 10^6 `div` frameRate
            unless (quit || i >= 15 * frameRate) $
                loop (if x >= 770 then 30 else x+1 , if y >= 570 then 30 else y+2,i+1)
    -- exec our main loop
    loop (30,30,0)
    SDL.destroyWindow window
    SDL.destroyTexture p01TX
    Img.quitImg
    SDL.quit
