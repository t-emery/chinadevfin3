#' AidData Global Chinese Development Finance Dataset, Version 3.0
#'
#' The dataset captures 20,985 projects across 165 low- and middle-income countries supported by loans and grants from official sector institutions in China worth $1.34 trillion. It tracks projects over 22 commitment years (2000-2021) and provides details on the timing of project implementation over a 24-year period (2000-2023).
#'
#' @format A tibble with 20,985 rows and 126 variables:
#' \describe{
#'   \item{Dataset}{`gcdf2_data_dictionary` contains definitions of all 126 variables.}
#'
#' }
#' @source \url{https://www.aiddata.org/data/aiddatas-global-chinese-development-finance-dataset-version-3-0}
"gcdf3_dataset"

#' Data Dictionary for the AidData Global Chinese Development Finance 3.0 Dataset
#'
#' A data dictionary for the `gcdf3_dataset`
#'
#' @format A tibble with 126 rows and 4 variables:
#' \describe{
#'   \item{column_name}{chr The name of the column in the `gcdf3_dataset`. It is the `snake_case` version of the AidData variable name shown in `field_name`, used because it is easier to work with in R.}
#'   \item{column_class}{chr The column's data type.}
#'   \item{field_name}{chr The name of the variable from the AidData dataset.}
#'   \item{description}{chr The variable's definition.}
#'
#' }
#' @source \url{https://www.aiddata.org/data/aiddatas-global-chinese-development-finance-dataset-version-3-0}
"gcdf3_data_dictionary"

#' Standardized Country Names
#'
#' A tibble providing standardized country names, iso3c codes, and a column to filter between country-specific and regional projects. Country names are standardized using [countrycode::countryname()](https://vincentarelbundock.github.io/countrycode/reference/countryname.html).
#'
#' @format A tibble with 154 rows and 4 variables:
#' \describe{
#'   \item{recipient}{chr The loan recipient listed in the `recipient` column of the `gcdf3_dataset`. See the `gcdf3_data_dictionary` for more details.}
#'   \item{country_name}{chr The standardized country name provided by `countrycode::countryname()`. When the project is regional, the region listed in `recipient` is used.}
#'   \item{iso3c}{chr The [iso3c country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) This can be helpful for joining other country features. Projects where the `recipient` is a region have `NA` values.}
#'   \item{country_or_regional}{chr A column to allow filtering between country-based lending and regional lending.}
#'
#' }
"gcdf3_standardized_countrynames"
