module MainSpec exposing (..)

import Main
import ProgramTest
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Html


start : ProgramTest.ProgramTest Main.Model Main.Msg Main.Effect
start =
    ProgramTest.createElement
        { init = Main.init
        , update = Main.update
        , view = Main.view
        }
        |> ProgramTest.start ()


suite : Test
suite =
    describe "tournament-manager"
        [ test "renders the app" <|
            \_ ->
                start
                    |> ProgramTest.expectViewHas [ Html.text "Tournament Manager" ]
        , describe "setup"
            [ test "Allows text entry for new name" <|
                \_ ->
                    start
                        |> ProgramTest.fillIn "" "Enter new player" "Player 1"
                        |> ProgramTest.clickButton "Add Player"
                        |> ProgramTest.expectViewHas [ Html.text "Player 1" ]
            ]
        ]
