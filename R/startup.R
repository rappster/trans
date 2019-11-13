.onLoad <- function(libname, pkgname) {
  # options(digits.secs = 3)
  Sys.setenv(TZ = "UTC")
  Sys.setenv(language = "en")

  invisible(TRUE)
}

.onAttach <- function(libname, pkgname) {
  # Load configs -----
  # env_auto_load <- as.logical(Sys.getenv("CONFX_AUTO_LOAD", FALSE))
  # if (env_auto_load) {
  #   confx::conf_load()
  # }

  invisible(TRUE)
}
