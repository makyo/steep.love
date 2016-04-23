module SteepTimer where

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import List exposing (..)
import Signal
import Time exposing (fps)

main : Signal Element
main = Signal.foldp (+) 0 (fps 60) |> Signal.map scene

scene : Float -> Element
scene t = t / 40 |> shape |> collage 460 460

shape : Float -> List Form
shape t =
  let intervals = [1..19] |> map (\x -> (11*x, x*t, 360+x*t))
      style = { defaultLine | width = 8 }
      draw interval = interval |> arc |> path |> traced style
  in  intervals |> map draw

arc : (Float, Float, Float) -> List (Float, Float)
arc (radius, alpha, beta) =
  let circlePoint angle = (radius * sin angle, radius * cos angle)
  in  [alpha..beta] |> map (\x -> x / 100) |> map circlePoint
