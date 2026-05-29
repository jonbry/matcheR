#' Changes between two data frames
#'
#' @description
#' Compares two data frames `df_old` and `df_new`.These functions were originally
#' intended for syncing a remote data source with a local one, but generally
#' work for comparing any data frames.
#'
#' * `new_vals(df_old, df_new, key)` finds all of the rows with a value in the
#'  key column in `df_new` that is not in `df_old`
#'
#' * `changed_vals(df_old, df_new, key)` finds all of the rows that have the same
#'  value in the key column but different data in the other columns
#'
#' * `old_vals(df_old, df_new, key)` finds all of the rows with a value in the
#'  key column in `df_old` that is not in `df_new`
#'
#' @param df_old Current data frame
#' @param df_new New date frame that is being checked for new values
#' @param key Name of column containing unique values similar to primary key
#'
#' @returns Data frame of values
#'
#' @examples
#' \dontrun{
#' new_rows <- new_vals(df_old, df_new, "pk_col_name")
#' updated_rows <- changed_vals(df_old, df_new, "pk_col_name")
#' deleted_rows <- old_vals(df_old, df_new, "pk_col_name")
#' }
#' @name compares
#' @usage new_vals(df_old, df_new, key)
#' @export new_vals
new_vals <- function(df_old, df_new, key) {
  # Check if key is both data frames
  if (!(key %in% names(df_old)) | !(key %in% names(df_new))) {
    rlang::abort("Key argument is not in both data frames")
  }
  # Check that columns in both data frames are the same
  check_cols(df_old, df_new)
  # Check that key column is unique
  check_unique_key(df_old[[key]])
  check_unique_key(df_new[[key]])
  # Store value of key
  key_val <- rlang::ensym(key)
  # Key values that are only in df_new
  diffs <- dplyr::setdiff(df_new[[key]], df_old[[key]])

  new_vals <- df_new |>
    dplyr::filter(!!key_val %in% diffs)
}

#' @name compares
#' @usage changed_vals(df_old, df_new, key)
#' @export changed_vals
changed_vals <- function(df_old, df_new, key) {
  # Check that key is in dfs
  if (!(key %in% names(df_old)) | !(key %in% names(df_new))) {
    rlang::abort("Key argument is not in both data frames")
  }
  # Check to make sure the columns are the same
  check_cols(df_old, df_new)

  # Check to make sure key values are unique
  check_unique_key(df_old[[key]])
  check_unique_key(df_new[[key]])

  # Only use columns that are in df_old
  df_new <- df_new |> dplyr::select(names(df_old))

  # Find union of key values
  df_union <- df_new[df_new[[key]] %in% df_old[[key]], ]
  # Return rows that are different in df_new but have the same key val
  diffs <- dplyr::setdiff(df_union, df_old)

}
#' @name compares
#' @usage old_vals(df_old, df_new, key)
#' @export old_vals
old_vals <- function(df_old, df_new, key) {
  # Check that key value is in dfs
  if (!(key %in% names(df_old)) | !(key %in% names(df_new))) {
    rlang::abort("Key argument is not in both data frames")
  }
  # Check to make sure the columns are the same
  check_cols(df_old, df_new)
  # Check that key vars are distinct
  check_unique_key(df_old[[key]])
  check_unique_key(df_new[[key]])

  # Quasiquote key
  key_val <- rlang::ensym(key)

  # Find new keys
  diffs <- dplyr::setdiff(df_old[[key]], df_new[[key]])

  # Return rows from df_new that are in diffs
  remove_vals <- df_old |>
    dplyr::filter(!!key_val %in% diffs)
}
