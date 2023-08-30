module Utils.Http exposing (ErrorModel, handleResult)

{-| A module providing utility functions for handling HTTP requests and responses.

This module contains types and functions to help handle HTTP results in a more convenient way, including a custom error model and a function to handle results of HTTP requests.

@docs ErrorModel, handleResult

-}

import Http
import Maybe exposing (Maybe(..))


{-| The ErrorModel type alias extends a model with an error field to handle HTTP errors.
-}
type alias ErrorModel m =
    { m | error : Maybe String }


{-| Handles the result of an HTTP request.
If the result is Ok, it updates the model using the provided updater function.
If the result is an error, it updates the error field in the model with the error message.
-}
handleResult : Result Http.Error a -> ErrorModel m -> (a -> ErrorModel m) -> ErrorModel m
handleResult result model updater =
    case result of
        Ok res ->
            updater res
                |> (\m -> { m | error = Nothing })

        Err err ->
            { model | error = Just <| Debug.toString err }
