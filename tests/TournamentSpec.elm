module TournamentSpec exposing (..)

import Expect
import Player exposing (Player)
import Test exposing (..)
import Tournament


suite : Test
suite =
    describe "Tournament"
        [ describe "Setup"
            [ test "initialize tournament in setup mode" <|
                \_ ->
                    Tournament.init
                        |> Expect.equal (Tournament.Setup "")
            , test "update name in setup mode" <|
                \_ ->
                    Tournament.init
                        |> Tournament.enterName "new name"
                        |> Expect.equal (Tournament.Setup "new name")
            , test "add player in setup mode resets the input field" <|
                \_ ->
                    Tournament.init
                        |> Tournament.addPlayer
                        |> Tuple.first
                        |> Expect.equal (Tournament.Setup "")
            , test "add player in setup mode returns a new player" <|
                \_ ->
                    Tournament.init
                        |> Tournament.enterName "new name"
                        |> Tournament.addPlayer
                        |> Tuple.second
                        |> Expect.equal (Player.createNew "new name")
            ]
        ]
