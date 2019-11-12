test_that("trans_bind_cols_auto() works", {
  x <- tibble::tibble(id = letters[1:2], value_x = 1:2)
  y <- tibble::tibble(value_y = 11:12)

  res <- trans_bind_cols_auto(x, y)
  target <- dplyr::bind_cols(x, y)
  expect_identical(res, target)
})
