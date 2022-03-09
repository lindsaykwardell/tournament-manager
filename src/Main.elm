module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    {}


init : () -> ( Model, Effect )
init _ =
    ( {}, None )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect )
update msg model =
    ( model, None )


type Effect
    = None


perform : Model -> Effect -> Cmd Msg
perform model effect =
    Cmd.none


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Tournament Manager" ] ]


main : Program () Model Msg
main =
    Browser.element
        { init =
            \_ ->
                init ()
                    |> (\( model, effect ) -> ( model, perform model effect ))
        , update =
            \msg model ->
                update msg model
                    |> (\( newModel, effect ) -> ( newModel, perform newModel effect ))
        , view = view
        , subscriptions = \_ -> Sub.none
        }
