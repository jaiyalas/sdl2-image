{-# LANGUAGE OverloadedStrings #-}
--
module Main where
--
import Control.Concurrent (threadDelay)
import Control.Monad (unless)
import Linear.Affine
import Linear.V2
--
import qualified SDL.Image as Img
import qualified SDL as SDL
--
main :: IO ()
main = do
    SDL.initialize [SDL.InitVideo]
    -- sdl2-image initialization
    Img.initImg [Img.InitPNG]
    window <- SDL.createWindow "Example01" SDL.defaultWindow
    SDL.showWindow window
    -- load PNG file to surface
    p01SF <- Img.surfacePNG "img/p01.png"
    rdr <- SDL.createRenderer window (-1) SDL.defaultRenderer
    p01TX <- SDL.createTextureFromSurface rdr p01SF
    SDL.freeSurface p01SF
    (SDL.TextureInfo _ _ txW txH) <- SDL.queryTexture p01TX
    let loop = do
            events <- SDL.pollEvents
            let quit = any (== SDL.QuitEvent) $ map SDL.eventPayload events
            --
            SDL.clear rdr
            SDL.copy rdr p01TX Nothing $
                Just $ SDL.Rectangle (P $ V2 100 100) (V2 txW txH)
            SDL.present rdr
            threadDelay 40000
            unless quit loop
    loop
    SDL.destroyWindow window
    SDL.destroyTexture p01TX
    -- quit sdl2-image
    Img.quitImg
    SDL.quit
