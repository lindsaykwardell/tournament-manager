module PlayerSpec exposing (..)

import Expect
import Player
import Test exposing (..)


suite : Test
suite =
    describe "Player"
        [ describe "create new player"
            [ test "should create with provided name" <|
                \_ ->
                    Player.createNew "new player"
                        |> Player.getName
                        |> Expect.equal "new player"
            , test "should have no wins, losses, or draws" <|
                \_ ->
                    Player.createNew "new player"
                        |> (\player ->
                                ( Player.getWins player
                                , Player.getLosses player
                                , Player.getDraws player
                                )
                           )
                        |> Expect.equal ( 0, 0, 0 )
            ]
        ]
