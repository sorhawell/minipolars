% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr.R
\name{construct_ProtoRexprArray}
\alias{construct_ProtoRexprArray}
\title{construct proto Rexpr array from args}
\usage{
construct_ProtoRexprArray(...)
}
\arguments{
\item{...}{any Rexpr or string}
}
\value{
ProtoRexprArray object
}
\description{
construct proto Rexpr array from args
}
\examples{
construct_ProtoRexprArray(pl::col("Species"),"Sepal.Width")
}
