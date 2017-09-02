module Main exposing (..)

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = Increment Int
    | Decrement Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment value ->
            ( { model | count = model.count + value }, Cmd.none )

        Decrement value ->
            ( { model | count = model.count - value }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ decrementButton
        , text (toString model.count)
        , incrementButton
        ]


decrementButton : Html Msg
decrementButton =
    button [ onClick (Decrement 1) ] [ text "Decrement" ]


incrementButton : Html Msg
incrementButton =
    button [ onClick (Increment 1) ] [ text "Increment" ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
