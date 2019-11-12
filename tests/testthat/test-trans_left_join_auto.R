test_that("trans_left_join_auto() works", {
  x <- tibble::tibble(id = letters[1:2], value_x = 1:2)
  y <- tibble::tibble(id = letters[1:2], value_x = 1:2, value_y = 11:12)

  res <- trans_left_join_auto(x, y, by = "id")
  target <- dplyr::left_join(
    x,
    y %>%
      dplyr::select(
        -value_x
      ),
    by = "id"
  )
  expect_identical(res, target)
})

test_that("trans_left_join_auto() works", {
  x <- tibble::tibble(id = letters[1:2], value_x = 1:2)
  y <- tibble::tibble(id = letters[1:2], value_x = 1:2, value_y = 11:12)

  res <- trans_left_join_auto(x, y)
  target <- dplyr::left_join(
    x,
    y %>%
      dplyr::select(
        -value_x
      ),
    by = "id"
  )
  expect_identical(res, target)
})
