module Data.Planet exposing (Planet, decode)

import Json.Decode as Decode


type alias Planet =
    { name : String
    , terrain : String
    }


decode : Decode.Decoder Planet
decode =
    Decode.map2 Planet
        (Decode.field "name" Decode.string)
        (Decode.field "terrain" Decode.string)
