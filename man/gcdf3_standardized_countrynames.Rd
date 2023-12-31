% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{gcdf3_standardized_countrynames}
\alias{gcdf3_standardized_countrynames}
\title{Standardized Country Names}
\format{
A tibble with 154 rows and 4 variables:
\describe{
\item{recipient}{chr The loan recipient listed in the \code{recipient} column of the \code{gcdf3_dataset}. See the \code{gcdf3_data_dictionary} for more details.}
\item{country_name}{chr The standardized country name provided by \code{countrycode::countryname()}. When the project is regional, the region listed in \code{recipient} is used.}
\item{iso3c}{chr The \href{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3}{iso3c country code} This can be helpful for joining other country features. Projects where the \code{recipient} is a region have \code{NA} values.}
\item{country_or_regional}{chr A column to allow filtering between country-based lending and regional lending.}

}
}
\usage{
gcdf3_standardized_countrynames
}
\description{
A tibble providing standardized country names, iso3c codes, and a column to filter between country-specific and regional projects. Country names are standardized using \href{https://vincentarelbundock.github.io/countrycode/reference/countryname.html}{countrycode::countryname()}.
}
\keyword{datasets}
