module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Player exposing (Player)
import Tournament exposing (Tournament)


type alias Model =
    { tournament : Tournament
    , players : List Player
    }


init : () -> ( Model, Effect )
init _ =
    ( { tournament = Tournament.init, players = [] }, None )


type Msg
    = EnterName String
    | AddPlayer


update : Msg -> Model -> ( Model, Effect )
update msg model =
    case msg of
        EnterName name ->
            ( { model | tournament = Tournament.enterName model.tournament name }, None )

        AddPlayer ->
            Tournament.addPlayer model.tournament
                |> (\( tournament, player ) -> ( { model | tournament = tournament, players = player :: model.players }, None ))


type Effect
    = None


perform : Model -> Effect -> Cmd Msg
perform model effect =
    Cmd.none


view : Model -> Html Msg
view model =
    div [ class "w-screen h-screen bg-gray-200" ]
        [ div [ class "flex flex-col justify-center items-center" ]
            [ h1 [ class "text-4xl m-auto py-4" ] [ text "Tournament Manager" ]
            , case model.tournament of
                Tournament.Setup newPlayer ->
                    div []
                        [ Html.form [ onSubmit AddPlayer ]
                            [ label [ class "flex flex-col" ]
                                [ text "Enter new player"
                                , div [ class "flex rounded shadow-md overflow-hidden w-72" ]
                                    [ input [ class "p-1 w-full", value newPlayer, onInput EnterName ] []
                                    , button [ class "px-2 whitespace-nowrap bg-blue-600 text-white hover:bg-blue-700 transition duration-75" ] [ text "Add Player" ]
                                    ]
                                ]
                            ]
                        , ul [ class "list-disc" ]
                            (model.players
                                |> List.map
                                    (\player ->
                                        li [] [ text <| Player.getName player ]
                                    )
                            )
                        ]

                _ ->
                    div [] []
            ]
        ]


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
