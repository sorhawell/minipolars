% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataframe.R
\name{DataFrame}
\alias{DataFrame}
\alias{lazy}
\alias{select}
\alias{DataFrame_select}
\alias{filter}
\alias{DataFrame_filter}
\title{Polars DataFrame}
\usage{
DataFrame(data) -> DataFrame

x$lazy() -> LazyFrame

x$select(...) -> DataFrame

x$filter(...) -> DataFrame
}
\arguments{
\item{...}{any expressions or strings}

\item{bool_expr}{Polars expression which will evaluate to a bool series}

\item{data}{object inheriting data.frame or list of equal length vectors and/or Series.}
}
\description{
\code{DataFrame}-object is an \code{externalptr} to rust polars DataFrame with $methods() exposed.
Most methods return another \code{DataFrame}-class instance or similar which allows for method chaining.
\href{http://commonmark.org/help}{Commonmark web site}
}
\details{
is_polar_frame = function(x) {
identical(class(x), c("polar_frame","R6"))
}

#' @export
as.data.frame.polar_frame <- function(x) x$as_data_frame()

#' @export
plot.polar_frame <- function(x,...) {
plot(x$as_data_frame(),...)
}

as_polar_frame = function(x) {

#pass through
if (is_polar_frame(x)) {
return(x)
}

#any class initialization
if (is_polar_data_input(x)) {
return(polar_frame$new(x))
}

#sub class conversion
if (inherits(x,"polar_frame")) {
if (class(x)\link{1}=="lazy_polar_frame") {
abort("lazy to eager, not implemented yet")
}
abort(paste("subclass of polar_frame: ",class(x)), "cannot be converted to polar_frame yet")
}

#hmm dunno what to do with that x, give up.
abort(paste("class:",class(x)), "cannot be converted to polar_frame")
}

#' create new DataFrame (DEPRECATED use DataFrame instead)
#'
#' @param data a data.frame or list of mixed vectors and Series of equal length.
#'
#' @return DataFrame
#' @importFrom xptr xptr_address
#' @importFrom rlang abort
#'
#' @examples
#' minipolars:::new_pf(iris)
#' #with namespace
#' pl::pf(iris)
#' pl::pf(list(some_column_name = c(1,2,3,4,5)))
#' new_pf = function(data) {
#'   if(is_polar_frame(data)) {
#'     abort("assertion failed, this function should never handle polar_frame")
#'   }
#'
#'   #input guard
#'   if(!is_polar_data_input(data)) {
#'     abort("input must inherit data.frame or be a list of vectors and/or  Series")
#'   }
#'
#'   if (inherits(data,"data.frame")) {
#'     data = as.data.frame(data)
#'   }
#'
#'   #closure to generate new names
#'   make_column_name_gen = function() {
#'     col_counter = 0
#'     column_name_gen = function(x) {
#'       col_counter <<- col_counter +1
#'       paste0("newcolumn_",col_counter)
#'     }
#'   }
#'   name_generator = make_column_name_gen()
#'
#'   #step 0, downcast any polars_series to Series
#'   data = lapply(data, function(x) {
#'     if(inherits(x,"polars_series")) x$private else x
#'   })
#'
#'   ##step1 handle column names
#'   #keys are tentative new column names
#'   #fetch keys from names, if missing set as NA
#'   keys = names(data)
#'   if(length(keys)==0) keys = rep(NA_character_, length(data))
#'
#'   ##step2
#'   #if missing key use series name or generate new
#'   keys = mapply(data,keys, FUN = function(column,key) {
#'
#'     if(is.na(key) || nchar(key)==0) {
#'       if(inherits(column, "Series")) {
#'         key = column$name()
#'       } else {
#'         key = name_generator()
#'       }
#'     }
#'     return(key)
#'   })
#'
#'   ##step 3
#'   #check for conflicting names, to avoid silent overwrite
#'   if(any(duplicated(keys))) {
#'     abort(
#'       paste(
#'         "conflicting column names not allowed:",
#'         paste(unique(keys\link{duplicated(keys)}),collapse=", ")
#'       )
#'     )
#'   }
#'
#'   ##step 4
#'   #build polar_frame one column at the time
#'   pf = minipolars:::DataFrame$new_with_capacity(length(data));
#'   mapply(data,keys, FUN = function(column, key) {
#'     if(inherits(column, "Series")) {
#'       column$rename_mut(key)
#'       pf$set_column_from_rseries(column)
#'     } else {
#'       pf$set_column_from_robj(column,key)
#'     }
#'     return(NULL)
#'   })
#'
#'   return(pf)
#' }
42
}
\examples{
df$lazy()$lazy()$filter(pl::col("Sepal.Length") > 5)$collect()

pl$DataFrame(iris)$lazy()$filter(pl$col("Sepal.Length") >= 7.7)$collect()
}