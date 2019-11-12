#' Left join with automatic column handling \lifecycle{experimental}
#'
#' TODO-20191112-1: add doc
#'
#' @param x [[tibble()]]
#' @param y [[tibble()]]
#' @param by [[character()]]
#'
#' @return [[tibble()]]
#' @export
trans_left_join_auto <- function(x, y, by = character()) {
  if (length(by)) {
    cols_x <- x %>% names()
    cols_y <- y %>% names()
    cols_shared <- intersect(cols_x, cols_y)
    cols_y_drop <- cols_shared[!cols_shared %in% by]
    y <- y %>%
      dplyr::select(-dplyr::one_of(cols_y_drop))
  } else {
    by <- NULL
  }

  dplyr::left_join(
    x,
    y,
    by = by
  )
}
