module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Table as Table


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
    div [ class "bingo-table" ]
        [ CDN.stylesheet
        , Table.simpleTable
            ( Table.simpleThead []
            , Table.tbody []
                [ Table.tr []
                    [ Table.td [] [ text "1" ]
                    , Table.td [] [ text "2" ]
                    , Table.td [] [ text "3" ]
                    ]
                , Table.tr []
                    [ Table.td [] [ text "4" ]
                    , Table.td [] [ text "5" ]
                    , Table.td [] [ text "6" ]
                    ]
                , Table.tr []
                    [ Table.td [] [ text "7" ]
                    , Table.td [] [ text "8" ]
                    , Table.td [] [ text "9" ]
                    ]
                ]
            )
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
