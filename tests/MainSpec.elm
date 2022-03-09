module MainSpec exposing (..)

import Main
import ProgramTest
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Html


suite : Test
suite =
    describe "tournament-manager"
        [ test "renders the app" <|
            \_ ->
                ProgramTest.createElement
                    { init = Main.init
                    , update = Main.update
                    , view = Main.view
                    }
                    |> ProgramTest.start ()
                    |> ProgramTest.expectViewHas [ Html.text "Tournament Manager" ]
        ]
