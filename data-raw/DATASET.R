## code to prepare `DATASET` dataset goes here

# File folder downloaded and unzipped from  https://docs.aiddata.org/ad4/datasets/AidDatas_Global_Chinese_Development_Finance_Dataset_Version_3_0.zip

# define file path
file_path <- here::here("data-raw",
           "AidDatas_Global_Chinese_Development_Finance_Dataset_Version_3_0",
           "AidDatasGlobalChineseDevelopmentFinanceDataset_v3.0.xlsx")


# import full dataset

## define column types to ensure they are imported correctly
column_names_double <- c("amount_constant_usd_2021",
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


column_names_integer <- c("aid_data_record_id",
                          "commitment_year",
                          "implementation_start_year",
                          "completion_year",
                          "sector_code",
                          "total_source_count",
                          "official_source_count")



gcdf3_dataset <- readxl::read_excel(file_path, sheet = "GCDF_3.0",
                                    # there are a lot columns with empty cells until a long way down the sheet
                                    # so guess_max is set to 21000 to avoid errors
                                    guess_max = 21000) |>
  # make column names snake_case
  janitor::clean_names() |>
  # coerce date columns into correct data type
  dplyr::mutate(dplyr::across(.cols = tidyselect::contains(c("date_mm", "repayment_date")), .fns = as.Date)) |>
  dplyr::mutate(dplyr::across(.cols = all_of(column_names_double), .fns = as.double)) |>
  dplyr::mutate(dplyr::across(.cols = all_of(column_names_integer), .fns = as.integer))

# save data object
usethis::use_data(gcdf3_dataset, overwrite = TRUE, compress = "xz")


##### Make the Data Dictionary

# Define a function to get the column classes
get_column_classes <- function(.data) {
  .data |>
    # use map_df to get a dataframe with the column name and its class
    purrr::map_df(class) |>
    # it gives two rows with the same data
    head(1) |>
    # pivot it longer so that they are both columns
    tidyr::pivot_longer(dplyr::everything(), names_to = "column_name", values_to = "column_class")
}

# Get the dataset column data types
col_data_types <- gcdf3_dataset |>
  get_column_classes()

# import data dictionary
gcdf3_data_dictionary <- readxl::read_excel(file_path,
                                            sheet = "Definitions",
                                            "A4:B130") |>
  # make column names snake_case
  janitor::clean_names() |>
  # make a column with the field name in snake case, like the column names
  dplyr::mutate(column_name = janitor::make_clean_names(field_name)) |>
  # join the column data type tibble
  dplyr::left_join(col_data_types, by = dplyr::join_by(column_name)) |>
  # adjust the column orders
  dplyr::select(column_name, column_class, field_name, description)

# save data object
usethis::use_data(gcdf3_data_dictionary, overwrite = TRUE, compress = "xz")


############################ Create Standardized Countrynames using `countrycode`

gcdf3_standardized_countrynames <- gcdf3_dataset |>
  # select the column with country names
  dplyr::select(recipient) |>
  #filter for unique values
  unique() |>
  # use countrycode::country_name to get standardized countrynames
  dplyr::mutate(country_name = countrycode::countryname(recipient),
                # All NAs are regions (I checked), so fill in the recipient name (of the region)
                country_name = dplyr::if_else(is.na(country_name), true = recipient, false = country_name),
                # get iso3cs
                iso3c = countrycode::countryname(recipient, destination = "iso3c"),
                # create a column to filter by country or regional projects
                country_or_regional = dplyr::if_else(is.na(iso3c), true = "regional", false = "country"))

# save data object
usethis::use_data(gcdf3_standardized_countrynames, overwrite = TRUE, compress = "xz")
