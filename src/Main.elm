module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model = 
    Grid.container []
        [ CDN.stylesheet
        , Grid.row []
            [ Grid.col [] [ text "One"]
            , Grid.col [] [ text "Two"]
            , Grid.col [] [ text "Three"]
            ]
        , Grid.row []
            [ Grid.col [] [ text "Four"]
            , Grid.col [] [ text "Five"]
            , Grid.col [] [ text "Six"]
            ]
        , Grid.row []
            [ Grid.col [] [ text "Seven"]
            , Grid.col [] [ text "Eight"]
            , Grid.col [] [ text "Nine"]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
