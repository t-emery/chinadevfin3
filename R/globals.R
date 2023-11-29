# This is an attempt to fix notes coming up on R CMD Check about no bindings for global variables
# https://community.rstudio.com/t/how-to-solve-no-visible-binding-for-global-variable-note/28887


global_variables <- c("gcdf3_dataset",
               "gcdf3_standardized_countrynames",
               "recipient",
               "country_name",
               "iso3c",
               "country_or_regional")

utils::globalVariables(global_variables)

# Original Error message
# ❯ checking R code for possible problems ... NOTE
# get_gcdf3_dataset: no visible binding for global variable
# ‘gcdf3_dataset’
# get_gcdf3_dataset: no visible binding for global variable
# ‘gcdf3_standardized_countrynames’
# get_gcdf3_dataset: no visible binding for global variable ‘recipient’
# get_gcdf3_dataset: no visible binding for global variable
# ‘country_name’
# get_gcdf3_dataset: no visible binding for global variable ‘iso3c’
# get_gcdf3_dataset: no visible binding for global variable
# ‘country_or_regional’
# Undefined global functions or variables:
#   country_name country_or_regional gcdf3_dataset
# gcdf3_standardized_countrynames iso3c recipient
