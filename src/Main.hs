{-# LANGUAGE OverloadedStrings #-}
module Main where
--
import SDL.Image
import qualified SDL as SDL
import qualified SDL.Raw.Filesystem as SDL.RW
import Linear.V4
import Control.Concurrent (threadDelay)
import Control.Monad (unless)
import Foreign.C.String
--
img :: String
img =
   "/Users/jaiyalas/cubeEX01.png"
--
main :: IO ()
main = do
   SDL.initialize [SDL.InitVideo]
   window <- SDL.createWindow "Lesson03" SDL.defaultWindow
   SDL.showWindow window
   gSurface <- SDL.getWindowSurface window
   print "p1"
   gg <- imgInit 2
   print gg
   path <- newCString img
   rw <- newCString "rw"
   print "p2"
   ptrRWops <- SDL.RW.rwFromFile path rw
   print "p3"
   -- pSur <- imgLoadRW ptrRWops False
   pSur <- imgLoad path
   print "p4"
   let imgSur = SDL.Surface pSur Nothing
   -- define the main loop
   print "p5"
   let
      loop = do
         -- fetch all events from events pool
         events <- SDL.pollEvents
         -- check the existence of QuitEvent
         let quit = any (== SDL.QuitEvent) $ map SDL.eventPayload events
         SDL.surfaceFillRect gSurface Nothing $
            V4 minBound maxBound minBound maxBound
         SDL.surfaceBlit imgSur Nothing gSurface Nothing
         SDL.updateWindowSurface window
         threadDelay 20000
         unless quit loop
   -- exec our main loop
   loop
   SDL.destroyWindow window
   SDL.freeSurface imgSur
   SDL.quit
