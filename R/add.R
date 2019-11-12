#' Adds a generic column based on an arbitrary mutation function \lifecycle{experimental}
#'
#' Adds a generic column based on an arbitrary mutation function.
#'
#' @param dat [[tbl]] A `tibble` containing the data which should be transformed
#' @param .col_source [[character()]] Name of the source column that the
#'   mutation function uses. Could also be a [`name`] and soon also
#'   [`quosures`].
#' @param .col_target [[character()]] Name of the target column that the output
#'   of the mutation function is assigned to. Could also be a [`name`] and soon
#'   also [`quosures`].
#' @param .fun [[function()]] The mutation function to be used
#' @param .value [[ANY()]] The assignment value in case no function is provided
#' @return [[tbl]] Tibble with additional column
#' @md
trans_add__generic <- function(
  dat,
  .col_source,
  .col_target,
  .fun,
  .value,
  .verbose = confx::conf_get("tracing/verbose", "config.yml")
) {
  if (!missing(.col_source)) {
    col_source <- if (length(.col_source) > 1) {
      tmp <- dplyr::syms(.col_source)
      names(tmp) <- letters[1:length(tmp)]
      tmp
    } else {
      dplyr::sym(.col_source)
    }
  }
  col_target <- dplyr::sym(.col_target)

  if(!.col_target %in% names(dat)) {
    if (.verbose ) message(stringr::str_glue("Adding column {.col_target}"))
    if (!missing(.fun)) {
      # Execute function in case any was provided
      if (!missing(.col_source)) {
        # dplyr::mutate(dat,
        #   {{ col_target }} := .fun({{ col_source }})
        # )
        if (length(.col_source) > 1) {
          dplyr::mutate(dat,
            {{ col_target }} := rlang::invoke(.fun, .args = col_source)
          )
        } else {
          dplyr::mutate(dat,
            {{ col_target }} := .fun({{ col_source }})
          )
        }
      } else {
        dplyr::mutate(dat,
          {{ col_target }} := .fun()
        )
      }
    } else {
      # Use value in case provided and no function provided
      dplyr::mutate(dat,
        {{ col_target }} := .value
      )
    }
  } else {
    dat
  }
}
