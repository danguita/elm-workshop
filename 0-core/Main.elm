module Main exposing (..)

-- Lists


names : List String
names =
    [ "Tatooine", "Hoth", "Naboo", "Geonosis" ]


sortedNames : List String -> List String
sortedNames names =
    List.sort names


joinedNames : List String -> String
joinedNames names =
    String.join ", " names


joinedAndSortedNames : List String -> String
joinedAndSortedNames names =
    String.join ", " (List.sort names)


joinedAndSortedNamesWithSugar : List String -> String
joinedAndSortedNamesWithSugar names =
    names
        |> List.sort
        |> String.join ", "



-- Records


point : { x : Int, y : Int }
point =
    { x = 3, y = 4 }


pointX : Int
pointX =
    point.x


pointXAsFunction : Int
pointXAsFunction =
    .x point



-- Type aliases


type alias Planet =
    { id : Int
    , name : String
    }


planetId : Planet -> Int
planetId planet =
    planet.id


updatedPlanet : Planet -> Planet
updatedPlanet planet =
    { planet | name = "Coruscant" }



-- Functions


square : Int -> Int
square n =
    n ^ 2


squareAnonymous : Int -> Int
squareAnonymous =
    \n -> n ^ 2



-- if Expressions


isMember : List String -> String -> String
isMember names name =
    if List.member name names then
        "Yeah"
    else
        "Nope"



-- Tuples


isMemberWithState : List String -> String -> ( Bool, String )
isMemberWithState names name =
    if List.member name names then
        ( True, "Yeah" )
    else
        ( False, "Nope" )



-- Let expressions


greet : String -> String
greet name =
    let
        firstOfNames =
            List.take 1 names
    in
        "Hey, " ++ toString firstOfNames
