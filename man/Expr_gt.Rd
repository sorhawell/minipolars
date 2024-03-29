% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr__expr.R
\docType{data}
\name{Expr_gt}
\alias{Expr_gt}
\alias{>.Expr}
\title{GreaterThan <}
\format{
An object of class \code{character} of length 1.
}
\usage{
Expr_gt

\method{>}{Expr}(e1, e2)
}
\arguments{
\item{other}{literal or Robj which can become a literal}
}
\value{
Exprs
}
\description{
gt method and operator
}
\details{
See Inf,NaN,NULL,Null/NA translations here \code{\link[minipolars]{docs_translations}}
}
\examples{
#' #three syntaxes same result
pl$lit(2) > 1
pl$lit(2) > pl$lit(1)
pl$lit(2)$gt(pl$lit(1))
}
\keyword{Expr}
\keyword{Expr_operators}
