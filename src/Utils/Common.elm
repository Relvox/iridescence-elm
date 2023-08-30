module Utils.Common exposing (distinct, distinctKey, zip)

{-| A module providing utility functions for common operations.

This module contains functions that help with common operations such as finding distinct elements in a list, zipping two lists, etc.

@docs distinct, distinctKey, zip

-}

import Dict
import Set


{-| Zips two lists into a single list of pairs. If the lists have different lengths, the extra elements in the longer list are ignored.
-}
zip : List a -> List b -> List ( a, b )
zip =
    List.map2 Tuple.pair


{-| Removes duplicate elements from a list. The elements in the list must be comparable.
-}
distinct : List comparable -> List comparable
distinct =
    Set.fromList >> Set.toList


{-| Removes duplicate elements from a list based on a key extracted by the provided function.
The function `extractKey` is used to extract a key from each element, and only one element for each distinct key is retained in the output list.
-}
distinctKey : (a -> comparable) -> List a -> List a
distinctKey extractKey =
    List.map (\a -> ( extractKey a, a ))
        >> Dict.fromList
        >> Dict.values
