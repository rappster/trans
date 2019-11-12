#' Bind columns with automatic column handling \lifecycle{experimental}
#'
#' TODO-20191112-2: add doc
#'
#' @param x [[tibble()]]
#' @param y [[tibble()]]
#'
#' @return [[tibble()]]
#' @export
trans_bind_cols_auto <- function(x, y) {
  cols_x <- x %>% names()
  cols_y <- y %>% names()
  cols_shared <- intersect(cols_x, cols_y)

  dplyr::bind_cols(
    x,
    y %>%
      dplyr::select(-dplyr::one_of(cols_shared))
  )
}
