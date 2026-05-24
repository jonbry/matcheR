# Check columns of two data frames match Easily check to make sure data frames have the same columns, no matter the order. `check_cols` returns nothing unless there is a mismatch, in which it throws an error. It does not check attributes or class.

Check columns of two data frames match Easily check to make sure data
frames have the same columns, no matter the order. `check_cols` returns
nothing unless there is a mismatch, in which it throws an error. It does
not check attributes or class.

## Usage

``` r
check_cols(df1, df2)
```

## Arguments

- df1:

  First data frame

- df2:

  Second data frame

## Value

Throws error if columns don't match

## Examples

``` r
if (FALSE) { # \dontrun{
check_cols(df1, df2)} # }
```
