# Get Table/View of data

Get Table/View of data

## Usage

``` r
get_table(conn, tbl, vars, names = FALSE)
```

## Arguments

- conn:

  DB connection

- tbl:

  table name

- vars:

  column names

- names:

  vector of column names if they need to be replaced

## Value

tibble of database table

## Examples

``` r
if (FALSE) { # \dontrun{
get_table(conn, tbl_data, vars_vec)
} # }
```
