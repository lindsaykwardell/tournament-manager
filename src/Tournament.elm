module Tournament exposing (Tournament(..), addPlayer, enterName, init)

import Player exposing (Player)


type Tournament
    = Setup String
    | InProgress (List ( Player, Player ))
    | Completed (List ( Player, Player ))


init : Tournament
init =
    Setup ""


enterName : String -> Tournament -> Tournament
enterName name tournament =
    case tournament of
        Setup _ ->
            Setup name

        _ ->
            tournament


addPlayer : Tournament -> ( Tournament, Player )
addPlayer tournament =
    case tournament of
        Setup name ->
            ( Setup "", Player.createNew name )

        _ ->
            ( tournament, Player.createNew "" )
