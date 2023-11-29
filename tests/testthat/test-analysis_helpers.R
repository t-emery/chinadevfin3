## Test get_gcdf3_dataset()

# test 1: check if the function returns a tibble with 20,985 rows and 73 columns when run with no input
test_that("get_gcdf3_dataset with no input returns tibble with 20,985 observations and 129 columns", {
  result <- get_gcdf3_dataset()
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 20985)
  expect_equal(ncol(result), 129)
})

# test 2: check if the function returns a tibble with 20,985 rows and 70 columns when run with standardized_countrynames = FALSE
test_that("get_gcdf2_dataset with standardized_countrynames = FALSE returns tibble with 20,985 observations and 126 columns", {
  result <- get_gcdf3_dataset(standardized_countrynames = FALSE)
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 20985)
  expect_equal(ncol(result), 126)
})
