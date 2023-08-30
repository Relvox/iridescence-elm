module Utils.Matrix exposing (transpose)

{-| Module to perform operations on matrices.

@docs transpose

-}


{-| Transposes a matrix represented as a list of lists.
If the input matrix is empty or contains empty rows, the function returns an empty list.
-}
transpose : List (List a) -> List (List a)
transpose matrix =
    case List.head matrix of
        Nothing ->
            []

        Just firstRow ->
            if List.isEmpty firstRow then
                []

            else
                (List.map List.head matrix |> List.filterMap identity)
                    :: transpose (List.map List.tail matrix |> List.filterMap identity)
