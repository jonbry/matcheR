#' Write New Data to Database
#'
#' @param conn Database connection
#' @param schema Schema of the table writing to
#' @param table Table to write to
#' @param vals Val or data frame that will be written to the table
#'
#' @returns The number of rows affected
#' @export
#'
#' @examples
#' \dontrun{
#' newData(conn, data, "tbl_metrics", df)
#' }
newData <- function(conn, schema, table, vals) {
  DBI::dbAppendTable(
    conn,
    DBI::Id(
      schema = schema,
      table = table
    ),
    vals)
}

#' Update Data in Database
#'
#' @param conn Conection to Db
#' @param table Fully qualified table name to write to
#' @param df Dataframe or tibble of data to update
#' @param var Variable to condition on
#' @param condition Condition
#' @param operation Operation for condition
#'
#' @returns The number of rows affected
#' @export
#'
#' @examples
#' \dontrun{
#' updateData(conn, data.tbl_metrics, df, id, 261, "=")
#' }
updateData <- function(conn, table, df, var, condition, operation = "=") {
  # Clean data for db
  df <- df |>
    dplyr::mutate(
      dplyr::across(where(is.character), quote_sql))

  set_cols <- dplyr::setdiff(names(df), var)
  # Create set string col1 = $1, col2 = $2, etc
  set_str <- paste0(set_cols, " = $", seq_along(set_cols), collapse = ", ")
  # Condition string
  cond_str <- paste0(var, operation, "$", ncol(df))

  # Build query
  query <- sprintf("UPDATE %s SET %s WHERE %s", table, set_str, cond_str)
  # Create unnamed list of parameters
  params <- unname(c(as.list(df[set_cols]), as.list(df[var])))
  # Execute Query
  DBI::dbExecute(conn, query, params = params)
}

#' Delete from DB
#'
#' @param conn Connection
#' @param table Fully qualified table name
#' @param var Variable used to identify row
#' @param condition Condition to delete
#' @param operation Operation
#'
#' This function has been designed to be more restrictive since deleting is less common
#' and more destructive. If you want to delete multiple rows, paste lookup values in the condition
#' attribute or use functional
#'
#' @returns The number of rows affected
#' @export
#'
#' @examples
#' \dontrun{
#' deleteData(conn, "data.tbl_metrics, "id", "234")
#' deleteData(conn, "data.tbl_metrics, "id", paste("(", paste(df$id, collapse = ","), ")"))
#' }
deleteData <- function(conn, table, var, condition, operation = "=") {
  query <- sprintf("DELETE FROM %s WHERE %s %s %s",
                   table,
                   var,
                   operation,
                   condition)

  DBI::dbExecute(conn, query)
}
