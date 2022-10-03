
##all minipolars sessions options saved to here
minipolars_optenv = new.env(parent = emptyenv())
minipolars_optreq = list() #all requirement functions put in here

# WRITE ALL DEFINED OPTIONS BELOW HERE



#' @rdname minipolars_options
#' @name strictly_immutable
#' @aliases strictly_immutable
#' @param strictly_immutable bool, default = TRUE, keep minipolars strictly immutable.
#' Polars/arrow is in general pro "immutable objects". However pypolars API has some minor exceptions.
#' All settable property elements of classes are mutable.
#' Why?, I guess python just do not have strong stance on immutability.
#' R strongly suggests immutable objects, so why not make polars strictly immutable where little performance costs?
#' However, if to mimic pypolars as much as possible, set this to FALSE.
#'
minipolars_optenv$strictly_immutable = TRUE #set default value
minipolars_optreq$strictly_immutable = list( #set requirement functions of default value
  is_bool = rlang::is_bool
)




## END OF DEFINED OPTIONS


#' minipolars options
#' @description  get, set, reset minipolars options
#' @rdname minipolars_options
#' @name get_minipolars_options
#' @aliases  minipolars_options
#'
#'
#' @return current settings as list
#' @details modifing list takes no effect, pass it to set_minipolars_options
#' @export
#'
#' @examples  get_minipolars_options()
get_minipolars_options = function() {
  as.list(minipolars_optenv)
}


#' @rdname minipolars_options
#' @name set_minipolars_options
#'
#'
#' @importFrom  rlang is_bool is_function
#'
#' @return current settings as list
#' @export
#' @examples
#' set_minipolars_options(strictly_immutable = FALSE)
#' get_minipolars_options()
#'
set_minipolars_options = function(
  ...
) {

  #check opts
  opts = list(...)
  if(is.null(names(opts)) || !all(nzchar(names(opts)))) abort("all options passed must be named")
  unknown_opts = setdiff(names(opts),names(minipolars_optenv))
  if(length(unknown_opts)) {
    abort(paste("unknown option(s) was passed:",paste(unknown_opts,collapse=", ")))
  }

  #update options
  for(i in names(opts)) {
    opt_requirements = minipolars_optreq[[i]]
    stopifnot(
      !is.null(opt_requirements),
      is.list(opt_requirements),
      all(sapply(opt_requirements,is_function)),
      all(nzchar(names(opt_requirements)))
    )

    for (j in  names(opt_requirements)) {
      opt_check = opt_requirements[[j]]
      opt_value = opts[[i]]
      opt_result = opt_check(opt_value)
      if(!isTRUE(opt_result)) {
        abort(paste(
          "option:",i," must satisfy requirement named",j,
          "with function\n", paste(capture.output(print(opt_check)),collapse="\n")
        ))
      }
    }

    minipolars_optenv[[i]] = opts[[i]]
  }

  #return current option set invisibly
  invisible(get_minipolars_options())
}



minipolars_opts_defaults = as.list(minipolars_optenv)
#' @rdname minipolars_options
#' @name reset_minipolars_options
#'
#' @export
#'
#' @examples
#' reset_minipolars_options()
#' get_minipolars_options()
reset_minipolars_options = function() {
  rm(list=ls(envir = minipolars_optenv),envir = minipolars_optenv)
  for(i in names(minipolars_opts_defaults)) {
    minipolars_optenv[[i]] = minipolars_opts_defaults[[i]]
  }
  invisible(NULL)
}


#' @rdname minipolars_options
#' @name reset_minipolars_options
#'
#'
#' @return list named by options of requirement function input must satisfy
#' @export
#'
#' @examples
#' get_minipolars_opt_requirements()
get_minipolars_opt_requirements = function() {
  minipolars_optreq
}