
# Packages ----------------------------------------------------------------

renv::install("rappster/confx")
usethis::use_package("confx")
usethis::use_package("devtools", type = "Suggests")

usethis::use_test("trans_add__generic")
