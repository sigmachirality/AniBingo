module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Table as Table

import JsonApi
import JsonApi.Decode as Decode
import JsonApi.Decode exposing ((:=))
import JsonApi.Encode as Encode
import JsonApi.Resources as Resource
import JsonApi.Documents as Document
import Json.Encode exposing (Value)

import Task exposing (..)


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


---- CONSTANTS ----


root = "https://graphql.anilist.co"
query = 
"""
query ($id: Int, $page: Int, $perPage: Int, $search: String) {
  Page (page: $page, perPage: $perPage) {
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
      perPage
    }
    media (id: $id, search: $search) {
      id
      romaji
    }
  }
}
"""


---- HELPERS ----


type alias Anime = 
    { id : String
    , name : String
    }


type alias Animes = [ Anime ]


encodeSearch : String -> Int -> Value
encodeSearch query pageNum = 
    Resources.build "variables"
        |> Resources.withAttributes
            [ ( "search", query )
            , ( "page", pageNum )
            ]
        |> Result.map Encode.clientResource


animeDecoder : Json.Decode.Decoder -> Anime
    Json.Decode.object2 Anime
        ("id" := Json.Decode.string)
        ("name" := Json.Decode.string)


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
