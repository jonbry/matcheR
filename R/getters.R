#' Get Table/View of data
#'
#' @param conn DB connection
#' @param tbl table name
#' @param vars column names
#' @param names vector of column names if they need to be replaced
#'
#' @returns tibble of database table
#' @export
#'
#' @examples
#' \dontrun{
#' get_table(conn, tbl_data, vars_vec)
#' }
get_table <- function(conn, tbl, vars, names = FALSE) {
  # Combine col names in table with query
  query <- sprintf("SELECT %s FROM %s",
                   paste(vars, collapse = ", "),
                   tbl)

  df <- DBI::dbGetQuery(conn, query)
  # Rename if vector is provided
  if (!(isFALSE(names))) {
    names(df) <- names
  }
  df <- tibble::as_tibble(df)
}
