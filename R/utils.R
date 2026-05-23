#'  Replace single quote with two single quotes
#'
#' @param text Text value that needs to be cleaned
#'
#' @returns Character value with SQL-escaped '
#' @export
#'
#' @examples
#' \dontrun{
#' val <- quote_sql(\"Jon\'s)
#' }
quote_sql <- function(text) {
  # Replace single quote with two single quotes
  fixed = stringr::str_replace_all(text, "'", "''")
}

#' Check if key is unique
#'
#' @param id_col Column believed to have unique values similar to a primary key
#'
#' @returns Throws error if id_col is not unique
#' @export
#'
#' @examples
#' check_unique_key(c(1, 2, 3))
check_unique_key <- function(id_col) {
  if (!(length(unique(id_col)) == length(id_col))) {
    rlang::abort("Key column is not unique")
  }
}

check_cols <- function(df1, df2) {
  df1_names <- names(df1) |> sort()
  df2_names <- names(df2) |> sort()

  if (!identical(df1_names, df2_names)) {
    rlang::abort("The columns differ between data frames")
  }
}
