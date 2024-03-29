% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{pcase}
\alias{pcase}
\title{Simple SQL CASE WHEN implementation for R}
\usage{
pcase(..., or_else = NULL)
}
\arguments{
\item{...}{odd arugments are bool statements, a next even is returned if prior bool statement is the first true}

\item{or_else}{return this if no bool statements were true}
}
\value{
any return given first true bool statement otherwise value of or_else
}
\description{
Inspired by data.table::fcase + dplyr::case_when. Used instead of base::switch internally.
}
\examples{
n = 7
pcase(
 n<5,"nope",
 n>6,"yeah",
 or_else = abort(paste("failed to have a case for n=",n))
)
}
