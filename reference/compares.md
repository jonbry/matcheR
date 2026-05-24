# Changes between two data frames

When comparing two data frames, we designate them as `df_old` and
`df_new`. These functions were originally intended for syncing a remote
data source with a local one, but generally work for comparing any data
frames.

- `new_vals(df_old, df_new, key)` finds all of the rows with a value in
  the key column in `df_new` that is not in `df_old`

- `changed_vals(df_old, df_new, key)` finds all of the rows that have
  the same value in the key column but different data in the other
  columns

- `old_vals(df_old, df_new, key)` finds all of the rows with a value in
  the key column in `df_old` that is not in `df_new`

## Usage

``` r
new_vals(df_old, df_new, key)

changed_vals(df_old, df_new, key)

old_vals(df_old, df_new, key)
```

## Arguments

- df_old:

  Current data frame

- df_new:

  New date frame that is being checked for new values

- key:

  Name of column containing unique values similar to primary key

## Value

Data frame of values

## Examples

``` r
if (FALSE) { # \dontrun{
new_rows <- new_vals(df_old, df_new, "pk_col_name")
updated_rows <- changed_vals(df_old, df_new, "pk_col_name")
deleted_rows <- old_vals(df_old, df_new, "pk_col_name")
} # }
```
