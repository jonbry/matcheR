# Write New Data to Database

Write New Data to Database

## Usage

``` r
newData(conn, schema, table, vals)
```

## Arguments

- conn:

  Database connection

- schema:

  Schema of the table writing to

- table:

  Table to write to

- vals:

  Val or data frame that will be written to the table

## Value

The number of rows affected

## Examples

``` r
if (FALSE) { # \dontrun{
newData(conn, data, "tbl_metrics", df)
} # }
```
