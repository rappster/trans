
# Packages ----------------------------------------------------------------

renv::activate()
renv::upgrade()

renv::install("magrittr")
renv::install("devtools")
renv::install("config")
renv::install("tidyverse")
renv::install("here")
renv::install("lifecycle")
renv::install("usethis")

# Additional files --------------------------------------------------------

usethis::use_readme_rmd()
usethis::use_news_md()
usethis::use_roxygen_md()
write(NULL, here::here("BACKLOG.md"))
write(NULL, here::here("config.yml"))

# DevOps ------------------------------------------------------------------

usethis::use_testthat()
usethis::use_travis()
usethis::use_coverage()
usethis::use_lifecycle()

# Run once:
if (FALSE) {
  renv::install("roxygen2md")
  roxygen2md::roxygen2md()
  renv::remove("roxygen2md")
}
