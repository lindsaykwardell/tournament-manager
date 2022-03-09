module Player exposing (Player, createNew, getDraws, getLosses, getName, getWins)


type Player
    = Player String PlayerStats


type alias PlayerStats =
    { wins : Int
    , losses : Int
    , draws : Int
    }


createNew : String -> Player
createNew name =
    Player name
        { wins = 0
        , losses = 0
        , draws = 0
        }


getName : Player -> String
getName (Player name _) =
    name


getWins : Player -> Int
getWins (Player _ { wins }) =
    wins


getLosses : Player -> Int
getLosses (Player _ { losses }) =
    losses


getDraws : Player -> Int
getDraws (Player _ { draws }) =
    draws
