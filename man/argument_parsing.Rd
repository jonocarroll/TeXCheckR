% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nth_arg_positions.R
\name{argument_parsing}
\alias{argument_parsing}
\alias{replace_nth_LaTeX_argument}
\alias{nth_arg_positions}
\title{Replace nth arguments}
\usage{
replace_nth_LaTeX_argument(tex_lines, command_name, n = 1L,
  replacement = "correct", optional = FALSE, warn = TRUE,
  .dummy_replacement = "Qq")

nth_arg_positions(tex_lines, command_name, n = 1L, optional = FALSE,
  star = TRUE, data.tables = TRUE)
}
\arguments{
\item{tex_lines}{A character vector of a LaTeX file (as read in from \code{readLines} or \code{readr::read_lines}).}

\item{command_name}{The command name, 
or the pattern of the command, without the initial backslash.}

\item{n}{Which argument of the command.}

\item{replacement}{What to replace the \code{n}th argument with.}

\item{optional}{If \code{FALSE}, the default, the \code{n}th mandatory argument is extracted.
If \code{TRUE}, the \code{n}th \emph{optional} argument is extracted.}

\item{warn}{If the nth argument is not present, emit a warning? Set to \code{FALSE} for n-ary commands.}

\item{.dummy_replacement}{An intermediate replacement value.
This value cannot be present in \code{tex_lines}.}

\item{star}{Assume the starred version of the command. That is, assume that the contents of 
the argument lies on a single line.}

\item{data.tables}{Should each element of the list be a \code{data.table}? Set to \code{FALSE} 
for performance.}
}
\description{
Replace nth arguments
}
\details{
\code{nth_arg_positions} reports the starts and stops of the command for every line.
This includes the braces (in order to accommodate instances where the argument is empty).

If the line is empty or does not contain the command the values of \code{starts} and \code{stops} are \code{NA_integer_}.
}
\examples{
nth_arg_positions("This is a \\\\textbf{strong} statement.", "textbf")
replace_nth_LaTeX_argument("This is a \\\\textbf{strong} statement.", "textbf")

}
