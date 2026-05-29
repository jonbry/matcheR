if (interactive()  & requireNamespace("duckdb", quietly = TRUE)) {

test_that("get_table works correctly", {
   # In-memory database
  conn <- DBI::dbConnect(duckdb::duckdb(), dbdir = ":memory:")
  # Ensure connection is closed even if test fails
  on.exit(DBI::dbDisconnect(conn, shutdown = TRUE), add = TRUE)
  table <- tibble::tibble(x = 1:10,
                          y = letters[1:10],
                          z = sample(c(TRUE, FALSE), 10, replace = TRUE))
  DBI::dbWriteTable(conn, "tbl", table)
  from_db <- get_table(conn, "tbl", c("x", "y", "z"))
  expect_equal(table, from_db)


})
}
