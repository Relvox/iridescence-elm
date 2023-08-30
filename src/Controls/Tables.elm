module Controls.Tables exposing (TableData, viewTable)

{-| Module to create and manage tables in Elm.

@docs TableData, viewTable

-}

import Html exposing (Attribute, Html, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (style)


{-| The TableData type alias represents the structure of a table with various attributes such as headers, rows, styles, etc.
-}
type alias TableData msg =
    { headers : List String
    , rows : List (List String)
    , rowStyles : List (List (Attribute msg))
    , extras : List (Html msg)
    , height : Int
    , scrollable : Bool
    }


{-| Initializes the table style based on the given attributes (scrollable and height).
-}
initTableStyle : TableData msg -> ( List (Attribute msg), List (Attribute b) )
initTableStyle { scrollable, height } =
    if scrollable then
        ( [ ( "position", "sticky" )
          , ( "top", "0" )
          , ( "z-index", "1" )
          , ( "background-color", "white" )
          ]
            |> List.map (\( k, v ) -> style k v)
        , [ ( "display", "block" )
          , ( "max-height", String.fromInt height ++ "px" )
          , ( "overflow-y", "auto" )
          ]
            |> List.map (\( k, v ) -> style k v)
        )

    else
        ( []
        , [ ( "max-height", String.fromInt height ++ "px" ) ]
            |> List.map (\( k, v ) -> style k v)
        )


{-| Creates a table header with the specified styles and header labels.
-}
viewHeader : List (Attribute msg) -> List String -> Html msg
viewHeader headerStyle headers =
    thead
        headerStyle
        [ tr [] (List.map (\header -> th [ style "backgroundColor" "#44444444" ] [ text header ]) headers) ]


{-| Creates a table row with the specified styles, row data, and extra HTML elements.
-}
viewRow : List String -> List (Attribute msg) -> Html msg -> Html msg
viewRow row rowStyle extra =
    tr rowStyle
        (List.map (\cell -> td [] [ text cell ]) row
            ++ [ extra ]
        )


{-| Creates a table view with the specified table data attributes.
-}
viewTable : TableData msg -> Html msg
viewTable tableData =
    let
        ( headerStyle, tableStyle ) =
            initTableStyle tableData

        rowsToView =
            List.map3
                viewRow
                tableData.rows
                tableData.rowStyles
                tableData.extras
    in
    table
        tableStyle
        [ viewHeader headerStyle tableData.headers
        , tbody [] rowsToView
        ]
