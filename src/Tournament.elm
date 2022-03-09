module Tournament exposing (Tournament(..), addPlayer, enterName, init)

import Player exposing (Player)


type Tournament
    = Setup String (List Player)
    | InProgress (List ( Player, Player ))
    | Completed (List ( Player, Player ))


init : Tournament
init =
    Setup "" []


enterName : Tournament -> String -> Tournament
enterName tournament name =
    case tournament of
        Setup _ players ->
            Setup name players

        _ ->
            tournament


addPlayer : Tournament -> Tournament
addPlayer tournament =
    case tournament of
        Setup name players ->
            Setup "" (Player.createNew name :: players)

        _ ->
            tournament
