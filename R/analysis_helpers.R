#' Load the AidData Global Chinese Development Finance 3.0 Dataset
#'
#' @description
#' `get_gcdf3_dataset()` makes it easy to load [AidData's Global Chinese Development Finance Dataset, Version 3.0](https://www.aiddata.org/data/aiddatas-global-chinese-development-finance-dataset-version-3-0)
#' (GCDF 3.0). By default, the function adds standardized country names that make it easier to merge it with other datasets.  The standardized country names are described in the documentation for [gcdf3_standardized_countrynames].
#' Setting `standardized_countrynames = FALSE` is equivalent to simply calling the [gcdf3_dataset] data object.  The data definitions are available in the [gcdf3_data_dictionary].
#'
#' @param standardized_countrynames set to `TRUE` by default, this argument attaches standardized country names to make it easier to join the dataset with other datasets.
#'
#' @return
#' `get_gcdf3_dataset()` returns a tibble with 20,985 observations.
#' @export
#'
#' @examples
#' # returns the GCDF 3.0 dataset, with standardized country names
#' get_gcdf3_dataset()
#'
#' # returns the GCDF 3.0 dataset as-is.
#' get_gcdf3_dataset(standardized_countrynames = FALSE)
#'
#' # the latter is equivalent to simply calling the [gcdf3_dataset] data object
#' gcdf3_dataset
get_gcdf3_dataset <- function(standardized_countrynames = TRUE) {
  if (standardized_countrynames) {
    gcdf3_dataset |>
      dplyr::left_join(gcdf3_standardized_countrynames, by = dplyr::join_by(recipient)) |>
      dplyr::select(country_name, iso3c, country_or_regional, tidyselect::everything())
  } else {
    gcdf3_dataset
  }
}
