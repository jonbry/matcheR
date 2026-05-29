test_that("new_, changed_, and old_vals work corrrectly", {
  # Test data frames
  df_old <- tibble::tibble(x = 1:10,
                           y = letters[1:10],
                           z = seq(as.POSIXct("2026-01-01 01:00:00",
                                              tz = "America/New_York"),
                                   as.POSIXct("2026-01-01 10:00:00",
                                              tz = "America/New_York"),
                                   by = "1 hours"))
  df_new <- tibble::tibble(x = 2:11,
                           y = letters[2:11],
                           z = seq(as.POSIXct("2026-01-01 02:00:00",
                                              tz = "America/New_York"),
                                   as.POSIXct("2026-01-01 11:00:00",
                                              tz = "America/New_York"),
                                   by = "1 hours"))
  # Change row 3 of df_new (row 4 df_old)
  df_new[3, "y"] <- "50"
  # Test basic function
  expect_equal(new_vals(df_old, df_new, "x"),
               tibble::tibble_row(x = 11,
                                  y = "k",
                                  z = as.POSIXct("2026-01-01 11:00:00",
                                                 tz = "America/New_York")))
  expect_equal(changed_vals(df_old, df_new, "x"),
               tibble::tibble_row(x = 4,
                                  y = "50",
                                  z = as.POSIXct("2026-01-01 4:00:00",
                                                 tz = "America/New_York")))
  expect_equal(old_vals(df_old, df_new, "x"),
               tibble::tibble_row(x = 1,
                                  y = "a",
                                  z = as.POSIXct("2026-01-01 01:00:00",
                                                 tz = "America/New_York")))
  # Extra column
  expect_error(new_vals(df_old, df_new |>
                          tibble::add_column("abc" = 100:110), "x"))
  # Missing key_val
  expect_error(new_vals(df_old, df_new, "test"))
  # Non-unique keys
  df_not_distict <- df_old |> dplyr::mutate(x = c(1:5, 1, 7:10))
  expect_error(new_vals(df_not_distict, df_new, "x"))
  # Switch key fixes
  expect_no_error(new_vals(df_not_distict, df_new, "y"))
  # Change time zone means all updated values
  df_tz_est <- df_old |> dplyr::mutate(z = lubridate::force_tz(z, "GMT"))
  expect_equal(nrow(changed_vals(df_old, df_tz_est, "x")), 10)
})

test_that("check_equal works correctly", {

})
