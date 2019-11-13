test_that("trans_add__generic() works: 1", {
  skip_on_covr()
  x <- tibble::tibble(x = 1)
  target <- x %>%
    dplyr::mutate(y = 100)
  res <- x %>% trans_add__generic(
    .col_source = "x",
    .col_target = "y",
    .fun = function(.x) .x * 100
  )
  expect_identical(res, target)
})

test_that("trans_add__generic() works: 2", {
  skip_on_covr()
  x <- tibble::tibble(x = 1)
  target <- x %>%
    dplyr::mutate(y = TRUE)
  res <- x %>% trans_add__generic(.col_target = "y", .value = TRUE)
  expect_identical(res, target)
})
