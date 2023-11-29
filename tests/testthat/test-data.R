
# test 1: check if the data object is a tibble
test_that("Data object is a tibble", {
  expect_s3_class(gcdf3_dataset, "tbl_df")
})

# test 2: check if the number of rows is 13,427
test_that("Number of rows is 20,985", {
  expect_equal(nrow(gcdf3_dataset), 20985)
})

# test 3: check if the number of columns is 70
test_that("Number of columns is 126", {
  expect_equal(ncol(gcdf3_dataset), 126)
})

column_names_doubles <- c("amount_constant_usd_2021",
                          "amount_nominal_usd",
                          "adjusted_amount_original_currency",
                          "adjusted_amount_constant_usd_2021",
                          "adjusted_amount_nominal_usd",
                          "deviation_from_planned_completion_date",
                          "maturity",
                          "interest_rate",
                          "grace_period",
                          "management_fee",
                          "commitment_fee",
                          "insurance_fee_percent",
                          "insurance_fee_nominal_usd",
                          "default_interest_rate",
                          "grant_element_oecd_cash_flow",
                          "grant_element_oecd_grant_equiv",
                          "grant_element_imf",
                          "source_quality_score",
                          "data_completeness_score",
                          "loan_detail_score")

test_that("columns are doubles in gcdf3_dataset", {
  for (col_name in column_names_doubles) {
    expect_type(gcdf3_dataset[[col_name]], "double")
  }
})



column_names_integer <- c("aid_data_record_id",
                          "commitment_year",
                          "implementation_start_year",
                          "completion_year",
                          "sector_code",
                          "total_source_count",
                          "official_source_count")

test_that("columns are integers in gcdf3_dataset", {
  for (col_name in column_names_integer) {
    expect_type(gcdf3_dataset[[col_name]], "integer")
  }
})



column_names_date <- c("commitment_date_mm_dd_yyyy",
                       "planned_implementation_start_date_mm_dd_yyyy",
                       "actual_implementation_start_date_mm_dd_yyyy",
                       "planned_completion_date_mm_dd_yyyy",
                       "actual_completion_date_mm_dd_yyyy",
                       "first_loan_repayment_date",
                       "last_loan_repayment_date")

test_that("specified columns are of Date type in dataset", {
  for (col_name in column_names_date) {
    # Check if the column is a Date type
    expect_s3_class(gcdf3_dataset[[col_name]], "Date")
  }
})


############# gcdf3_data_dictionary tests #############

# test 1: check if the data object is a tibble
test_that("Data object is a tibble", {
  expect_s3_class(gcdf3_data_dictionary, "tbl_df")
})

# test 2: check if the number of rows is 126
test_that("Number of rows is 126", {
  expect_equal(nrow(gcdf3_data_dictionary), 126)
})

# test 3: check if the number of columns is 4
test_that("Number of columns is 4", {
  expect_equal(ncol(gcdf3_data_dictionary), 4)
})

############# gcdf2_standardized_countrynames #############

# test 1: check if the data object is a tibble
test_that("Data object is a tibble", {
  expect_s3_class(gcdf3_standardized_countrynames, "tbl_df")
})

# test 2: check if the number of rows is 154
test_that("Number of rows is 154", {
  expect_equal(nrow(gcdf3_standardized_countrynames), 154)
})

# test 3: check if the number of columns is 4
test_that("Number of columns is 4", {
  expect_equal(ncol(gcdf3_standardized_countrynames), 4)
})
