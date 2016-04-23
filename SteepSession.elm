module SteepSession where

{-| Steep.♡ - a steep timer for tea of all kinds (and I guess coffee too)

Author(s):
* Madison Scott-Clary - http://github.com/makyo

License:
MIT
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (..)
import Result exposing (..)
import Signal exposing (Address, Signal)
import String exposing (..)
import Time exposing (..)

maybeParseInt : String -> Maybe Int
maybeParseInt s =
    toMaybe (toInt s)

type alias SessionStub =
    { uid : Int
    , name : String
    }

type alias Session =
    { uid : Int
    , steepMaterial : String
    , steepStartDate : String
    , steeps : List Steep
    , startDuration : Int
    , defaultIncrement : Int
    , nextSteepDuration : Int
    , isSteeping : Bool
    }

type alias Steep =
    { duration : Int
    , notes : String
    , notesVisible : Bool
    , isActive : Bool
    }

newSession : Int -> Int -> Session
newSession duration increment =
    { uid = 0 --getNextId
    , steepMaterial = ""
    , steepStartDate = "today" --toString currentDate
    , steeps = []
    , startDuration = duration
    , defaultIncrement = increment
    , nextSteepDuration = increment
    , isSteeping = False
    }

newSteep : Int -> Steep
newSteep duration =
    { duration = duration
    , notes = ""
    , notesVisible = True
    , isActive = True
    }

type Action
    = NoOp
    | UpdateNextSteepDuration String
    | AddSteep

update : Action -> Session -> Session
update action session =
    case action of
        NoOp -> session

        UpdateNextSteepDuration duration ->
            { session
            | nextSteepDuration = Maybe.withDefault 0 (maybeParseInt duration) }

        AddSteep ->
            { session
            | steeps = session.steeps ++ [newSteep session.nextSteepDuration]
            , nextSteepDuration = session.nextSteepDuration + session.defaultIncrement
            }

view : Address Action -> Session -> Html
view address session =
    div
        [ class "steep-wrapper" ]
        [ lazy2 defaults address session
        , lazy2 steepList address session.steeps
        , lazy2 addSteep address session
        ]

defaults : Address Action -> Session -> Html
defaults address session =
    div
        [ class "steep-defaults" ]
        []

steepList : Address Action -> List Steep -> Html
steepList address steeps =
    ul
        [ class "steep-list" ]
        (List.map (steepItem address) steeps)

steepItem : Address Action -> Steep -> Html
steepItem address steep =
    li
        [ class "steep-item" ]
        [ text <| toString <| steep.duration ]

addSteep : Address Action -> Session -> Html
addSteep address session =
    div
        [ class "add-steep" ]
        [ text "Steep duration (in seconds): "
        , input
            [ value <| toString <| session.nextSteepDuration
            , on "input" targetValue (Signal.message address << UpdateNextSteepDuration) ]
            []
        , button
            [ onClick address AddSteep ]
            [ text "Start Steeping!" ]
        ]

main : Signal Html
main =
    Signal.map (view actions.address) session

session : Signal Session
session =
    Signal.foldp update (newSession 10 10) actions.signal

actions : Signal.Mailbox Action
actions =
    Signal.mailbox NoOp

-- port currentDate : Signal String
--
-- port getNextId : Maybe Int
--
-- port getSession : Int
--
-- port recvSession : Maybe Session
--
-- port getSessions : List SessionStub
--
-- port setSession : Signal Session
-- port setSession =
--     session
--
-- port deleteSession : Int
-- port deleteSession =
--     session.uid
