module Utils.Dict exposing (keyedValues)

{-| A module providing utility functions for working with dictionaries.

This module contains a function to retrieve values associated with a list of keys from a dictionary.

@docs keyedValues

-}

import Dict


{-| Retrieves the values associated with a list of keys from a dictionary.
If a key does not exist in the dictionary, it is ignored.
-}
keyedValues : List comparable -> Dict.Dict comparable v -> List v
keyedValues keys dict =
    List.filterMap (\key -> Dict.get key dict) keys
