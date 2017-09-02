module Main exposing (..)

import Html exposing (Html, h1, div, text)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Page
    = Blank
    | Home
    | About


type alias Model =
    { page : Page
    }


initialPage : Page
initialPage =
    Home


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( Model initialPage, Cmd.none )



-- UPDATE


type Msg
    = UrlChange Navigation.Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | page = getPage location.hash }
            , Cmd.none
            )


getPage : String -> Page
getPage hash =
    case hash of
        "#home" ->
            Home

        "#about" ->
            About

        _ ->
            Blank



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Elm demo" ]
        , text (pageContent model.page)
        ]


pageContent : Page -> String
pageContent page =
    case page of
        Home ->
            "Home page"

        About ->
            "About page"

        Blank ->
            "Blank page"



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
