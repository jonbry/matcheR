# Compare two data frames

Compare two data frames

## Usage

``` r
check_equal(df, df_new, df_names, ...)
```

## Arguments

- df:

  Data frame source or "old"

- df_new:

  New data frame

- df_names:

  Vector of names to rename df to match df_new

## Value

TRUE if they match, otherwise tibble of mismatched rows

## Examples

``` r
if (FALSE) { # \dontrun{
check_equal(df |> dplyr::arrange(id), df_source |> dplyr::arrnage(id), df_names = names(df))
} # }
```
