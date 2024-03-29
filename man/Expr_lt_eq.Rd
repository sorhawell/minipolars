% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr__expr.R
\docType{data}
\name{Expr_lt_eq}
\alias{Expr_lt_eq}
\alias{<=.Expr}
\title{Less Than Or Equal <=}
\format{
An object of class \code{character} of length 1.
}
\usage{
Expr_lt_eq

\method{<=}{Expr}(e1, e2)
}
\arguments{
\item{other}{literal or Robj which can become a literal}
}
\value{
Exprs
}
\description{
lt_eq method and operator
}
\details{
See Inf,NaN,NULL,Null/NA translations here \code{\link[minipolars]{docs_translations}}
}
\examples{
#' #three syntaxes same result
pl$lit(2) <= 2
pl$lit(2) <=  pl$lit(2)
pl$lit(2)$lt_eq(pl$lit(2))
}
\keyword{Expr}
\keyword{Expr_operators}
