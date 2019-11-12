
# Packages ----------------------------------------------------------------

renv::install("rappster/confx")
usethis::use_package("confx")
usethis::use_package("devtools", type = "Suggests")
usethis::use_package("dplyr")

usethis::use_test("trans_add__generic")
usethis::use_test("trans_left_join_auto")
usethis::use_test("trans_bind_cols_auto")
