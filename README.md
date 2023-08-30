# Iridescence Elm Package

## Overview

The Iridescence Elm package is a collection of utility modules and helpers designed to streamline Elm development. It provides a set of commonly used functions and data structures that can assist developers in building robust and efficient Elm applications.

## Features

- **Common Utilities**: A set of functions that provide common utility operations such as zipping lists and removing duplicates from a list.
- **Dictionary Utilities**: Functions to facilitate operations on Elm dictionaries.
- **HTTP Utilities**: A module that helps in handling HTTP results more efficiently by updating the error model accordingly.
- **Matrix Utilities**: Functions to perform operations on matrices, including transposing a matrix.
- **Table Controls**: A module that provides functions to create and manage tables in Elm.

## Installation

To install the Iridescence Elm package, add it to your `elm.json` file under the dependencies section:

```json
"dependencies": {
    "relvox/iridescence-elm": "0.0.1"
}
```

Then, run the following command to install the package:

```sh
elm install relvox/iridescence-elm
```

## Usage

Here is a brief overview of how to use the modules in this package:

### Utils.Common

```elm
import Utils.Common exposing (distinct, distinctKey, zip)

-- Example usage
zip [1, 2, 3] ["a", "b", "c"]
-- Result: [(1, "a"), (2, "b"), (3, "c")]

distinct [1, 2, 2, 3, 3, 4]
-- Result: [1, 2, 3, 4]
```

### Utils.Dict

```elm
import Utils.Dict exposing (keyedValues)

-- Example usage

-- Creating a dictionary
let
    dict = Dict.fromList [(1, "one"), (2, "two"), (3, "three")]
in

-- Retrieving values associated with a list of keys from the dictionary
keyedValues [1, 2, 4] dict
-- Result: ["one", "two"]

```

### Utils.Http

```elm
import Utils.Http exposing (ErrorModel, handleResult)

-- Example usage
type alias MyModel =
    { error : Maybe String
    , data : Maybe String
    }

-- Example usage of handleResult function
let
    result = Ok "Response Data"
    initialModel = { error = Nothing, data = Nothing }
in
handleResult result initialModel updater
-- Result: { error = Nothing, data = Just "Response Data" }
```

### Utils.Matrix

```elm
import Utils.Matrix exposing (transpose)

-- Example usage
transpose [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
-- Result: [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

### Controls.Tables

```elm
import Controls.Tables exposing (TableData, viewTable, viewRow, viewHeader, initTableStyle)
import Html exposing (text)
import Html.Attributes exposing (style)

-- Example usage

-- Initializing TableData
let
    tableData : TableData msg
    tableData =
        { headers = [ "Name", "Age", "City" ]
        , rows = 
            [ [ "Alice", "30", "New York" ]
            , [ "Bob", "25", "Los Angeles" ]
            , [ "Charlie", "35", "Chicago" ]
            ]
        , rowStyles = 
            [ [ style "background-color" "lightblue" ]
            , [ style "background-color" "lightgreen" ]
            , [ style "background-color" "lightcoral" ]
            ]
        , extras = [ text "", text "", text "" ]
        , height = 300
        , scrollable = True
        }

    -- Initializing table styles
    (headerStyle, tableStyle) = initTableStyle tableData

    -- Creating table header
    tableHeader = viewHeader headerStyle tableData.headers

    -- Creating table rows
    tableRows = 
        List.map3 viewRow tableData.rows tableData.rowStyles tableData.extras

    -- Creating table view
    tableView = viewTable tableData
in
-- The tableView can now be used in your view function to display the table
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
