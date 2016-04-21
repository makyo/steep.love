module Steep where

import Html exposing (..)

type alias Model = {
    steeps : List Steep,
    startDuration : Int,
    defaultIncrement : Int
}

type alias Steep = {
    duration : Int
}
