module Main exposing (..)

import Html exposing (Html, h1, div, p, text, button)
import Html.Events exposing (onClick)
import Http
import Data.Planet as Planet exposing (Planet)
import Request.Planet exposing (get)


initialPlanetId : Int
initialPlanetId =
    1


main : Program Never Model Msg
main =
    Html.program
        { init = init initialPlanetId
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { planetId : Int
    , planet : Planet
    , status : String
    }


initialPlanet : Planet
initialPlanet =
    Planet "" ""


initialModel : Model
initialModel =
    { planetId = initialPlanetId
    , planet = initialPlanet
    , status = ""
    }


init : Int -> ( Model, Cmd Msg )
init planetId =
    ( initialModel, fetchPlanet planetId )



-- UPDATE


type Msg
    = LoadPlanet Int
    | PlanetLoaded (Result Http.Error Planet)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadPlanet planetId ->
            ( { model | planetId = planetId, planet = initialPlanet, status = "Fetching data..." }, fetchPlanet planetId )

        PlanetLoaded (Ok planet) ->
            ( { model | planet = planet, status = "" }, Cmd.none )

        PlanetLoaded (Err error) ->
            ( { model | status = (toString error) }, Cmd.none )


fetchPlanet : Int -> Cmd Msg
fetchPlanet planetId =
    Http.send PlanetLoaded (Request.Planet.get planetId)



-- VIEW


view : Model -> Html Msg
view model =
    let
        planet =
            model.planet

        status =
            model.status

        nextPlanetId =
            model.planetId + 1
    in
        div []
            [ h1 [] [ text "Elm demo" ]
            , div [] [ text status ]
            , div [] [ text planet.name ]
            , div [] [ text planet.terrain ]
            , div [] [ loadPlanetButton nextPlanetId ]
            ]


loadPlanetButton : Int -> Html Msg
loadPlanetButton planetId =
    button [ onClick (LoadPlanet planetId) ] [ text "Next planet" ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
