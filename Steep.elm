module Steep where

import Html exposing (..)

type alias Model = {
    steeps : List Steep
}

type alias Steep = {
    duration : Int
}
