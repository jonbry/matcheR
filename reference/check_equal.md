# Compare two data frames

Compare two data frames

## Usage

``` r
check_equal(df, df_source, df_names)
```

## Arguments

- df:

  Data frame to compare to

- df_source:

  Data frame source

- df_names:

  Vector of names to rename df_source to match df

  Note: You can use dplyr functions in the arguments to make sure the
  data frames will match correctly. This is especially important when
  data is pulled from a db since order is not guaranteed. This function
  is a wrapper for testthat::expect_equal which will check class and
  values

## Value

pass/fail from testthat::test_that

## Examples

``` r
if (FALSE) { # \dontrun{
check_equal(df |> dplyr::arrange(id), df_source |> dplyr::arrnage(id), df_names = names(df))
} # }
```
