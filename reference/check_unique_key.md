# Check if key is unique

Check if key is unique

## Usage

``` r
check_unique_key(id_col)
```

## Arguments

- id_col:

  Column believed to have unique values similar to a primary key

## Value

Throws error if id_col is not unique

## Examples

``` r
check_unique_key(c(1, 2, 3))
```
