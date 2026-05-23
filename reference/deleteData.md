# Delete from DB

Delete from DB

## Usage

``` r
deleteData(conn, table, var, condition, operation = "=")
```

## Arguments

- conn:

  Connection

- table:

  Fully qualified table name

- var:

  Variable used to identify row

- condition:

  Condition to delete

- operation:

  Operation

  This function has been designed to be more restrictive since deleting
  is less common and more destructive. If you want to delete multiple
  rows, paste lookup values in the condition attribute or use functional

## Value

The number of rows affected

## Examples
