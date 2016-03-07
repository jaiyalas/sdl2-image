# sdl2-image

to Haskell Binding

As described in [here](http://jcatki.no-ip.org:8080/SDL_image/SDL_image_frame.html), source codes are arranged by 

* General
* Loading
* Info
* <strike>Error</strike>[^1]

The development of this package contains two phases. Raw binding and basic functionalites will be implemented within phase one. After that, we will design and develop some advanced functions in the phase two. So far, the phase one is almost done. The phase two has been started. Yet, we still try to develop more useful functions.

PS. The different between this package and [sdl-image](https://hackage.haskell.org/package/SDL-image) is that they use [SDL](https://hackage.haskell.org/package/SDL). This package, however, use package [sdl2](https://hackage.haskell.org/package/sdl2).

[^1]:
Error is a module of error information which may not be necessary. So I decide to skip this one for now.