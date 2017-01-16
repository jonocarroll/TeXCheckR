#' Report errors to console and twitter
#' @name report_error
#' @param preamble Message to appear before other messages.
#' @param line_no The line number locating the source of the error.
#' @param context THe content of the file to provide context to the error.
#' @param error_message The error message to display beyond the console.
#' @param report_name Name of project whose errors are being reported.
#' @param build_status What should the build status be reported as?
#' @param authors Text to alert the authors (such as a twitter handle).
#' @importFrom twitteR updateStatus
#' @param ... Extra messages.

#' @rdname report_error
report2console <- function(line_no = NULL,
                           context = NULL,
                           error_message = NULL,
                           build_status = NULL,
                           authors = NULL,
                           report_name = NULL,
                           ...){
  # Printing requirements:
  ## 1. Cross
  ## 2. Line no (if applicable)
  ## 3. Context
  ## 4. Suggeston.
  cat(bgRed(symbol$cross), " ", line_no, ": ", context, ..., sep = "")
}


#' @rdname report_error
report2twitter <- function(preamble = NULL,
                           report_name,
                           build_status,
                           error_message,
                           line_no = NULL,
                           context = NULL,
                           authors,
                           ...){
  # Printing requirements:
  ## 1. Each author
  ## 2. "<Report title> build failed/still failed/fixed"
  ## 3. Error message
  ## 4. Line no + context

  longest_author <- authors[which.max(nchar(authors))]

  possible_tweet <- c(longest_author,
                      paste(build_status, report_name),
                      paste0("\u2718", " ", error_message),
                      paste0(line_no, ": ", context))

  .Twitter.statuses <- list(length(authors))
  if (sum(nchar(possible_tweet)) <= 140){
    for (j in seq_along(authors)){
      tweet <- paste0(c(authors[[j]],
                        paste(build_status, report_name),
                        paste0("\u2718", " ", error_message),
                        paste0(line_no, ": ", context)),
                      collapse = "\n")
      .Twitter.statuses[[j]] <- updateStatus(text = tweet)
    }
    assign(".last.Twitter.status", .Twitter.statuses, envir = .GlobalEnv)
    cat('.last.Twitter.status\n')
  } else {
    cat((possible_tweet))
    cat("######\n")
    tweet_nos <- (cumsum(nchar(possible_tweet)) %/% 140) + 1
  }
}

