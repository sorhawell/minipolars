% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataframe.R
\name{polar_frame}
\alias{polar_frame}
\title{R6 Class polar_rame}
\description{
R6 Class polar_rame

R6 Class polar_rame
}
\details{
It's real
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-polar_frame-print}{\code{polar_frame$print()}}
\item \href{#method-polar_frame-new}{\code{polar_frame$new()}}
\item \href{#method-polar_frame-select}{\code{polar_frame$select()}}
\item \href{#method-polar_frame-as_data_frame}{\code{polar_frame$as_data_frame()}}
\item \href{#method-polar_frame-clone}{\code{polar_frame$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-polar_frame-print"></a>}}
\if{latex}{\out{\hypertarget{method-polar_frame-print}{}}}
\subsection{Method \code{print()}}{
print
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{polar_frame$print()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
self \code{polar_frame} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-polar_frame-new"></a>}}
\if{latex}{\out{\hypertarget{method-polar_frame-new}{}}}
\subsection{Method \code{new()}}{
Create a new polar_frame
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{polar_frame$new(data)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{data}}{obj inheriting data.frame or list of vectors or Rseries}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{polar_frame} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-polar_frame-select"></a>}}
\if{latex}{\out{\hypertarget{method-polar_frame-select}{}}}
\subsection{Method \code{select()}}{
select on polar_Frame.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{polar_frame$select(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{any Rexpr or any strings naming any_column (translated into Rexpr col(any_colum)))}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{polar_frame} object with applied selection.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-polar_frame-as_data_frame"></a>}}
\if{latex}{\out{\hypertarget{method-polar_frame-as_data_frame}{}}}
\subsection{Method \code{as_data_frame()}}{
return polar_frame as data.frame.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{polar_frame$as_data_frame(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{any arg passed to as.data.frame, x and col.names are fixed}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{data.frame} object .
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-polar_frame-clone"></a>}}
\if{latex}{\out{\hypertarget{method-polar_frame-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{polar_frame$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
