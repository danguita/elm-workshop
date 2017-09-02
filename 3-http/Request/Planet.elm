module Request.Planet exposing (get)

import Data.Planet as Planet exposing (Planet, decode)
import Http


get : Int -> Http.Request Planet
get id =
    let
        url =
            "https://swapi.co/api/planets/" ++ toString id ++ "/"
    in
        Http.get url Planet.decode
