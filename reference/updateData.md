# Update Data in Database

Update Data in Database

## Usage

``` r
updateData(conn, table, df, var, condition, operation = "=")
```

## Arguments

- conn:

  Conection to Db

- table:

  Fully qualified table name to write to

- df:

  Dataframe or tibble of data to update

- var:

  Variable to condition on

- condition:

  Condition

- operation:

  Operation for condition

## Value

The number of rows affected

## Examples

``` r
if (FALSE) { # \dontrun{
updateData(conn, data.tbl_metrics, df, id, 261, "=")
} # }
```
