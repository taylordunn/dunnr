#' Get the source URL for a Distill post
#'
#' This is a utility function that I use to point to source code on GitHub for
#' my Distill posts, located at https://tdunn.ca/.
#' Credit for the idea goes to Danielle Navarro (https://blog.djnavarro.net/).
#'
#' @param repo The GitHub repository, "user/repo-name".
#' @param branch Name of the GitHub branch, default "main".
#' @param collection Collection to which the post belongs to, default "_posts".
#' @param date The date of the post. Typically this will be defined as a
#'   RMarkdown parameter via `params$date`.
#' @param slug The URL slug of the post. Typically this will be defined as a
#'   RMarkdown parameter via `params$slug`.
#' @param html_tag Logical. If `TRUE`, returns a HTML hyperlink tag.
#' @param html_label If returning a HTML hyperlink, the text label to display.
#'
#' @return A string of the source code URL, or a HTML hyperlink tag.
#' @export
#'
#' @examples
#'
#' date <- "2021-05-18"
#' slug <- "tidytuesday-week-21"
#'
#' get_distill_source(date = date, slug = slug, html_tag = FALSE)
#' get_distill_source(date = date, slug = slug, html_tag = TRUE)
#' get_distill_source(date = date, slug = slug, html_tag = TRUE,
#'                    html_label = "Custom label")
#' @importFrom htmltools a
get_distill_source <- function(repo = "taylordunn/tdunn", branch = "main",
                               collection = "_posts",
                               date = NULL, slug = NULL,
                               html_tag = TRUE, html_label = "Source code") {
  if (is.null(date) | is.null(slug)) {
    # If a date and url slug aren't provided, just point to _posts/
    post_title <- ""
  } else {
    post_title <- paste0(date, "-", slug)
  }

  post_url <- paste(
    "https://github.com", repo, "tree", branch, collection, post_title,
    sep = "/"
  )

  if (html_tag) {
    htmltools::a(href = post_url, html_label)
  } else {
    post_url
  }
}
