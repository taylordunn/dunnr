#' Get the source URL for a Quarto post
#'
#' This is a utility function that I use to point to source code on GitHub for
#' posts on my personal website, located at https://tdunn.ca/.
#' Credit for the idea goes to Danielle Navarro (https://blog.djnavarro.net/).
#'
#' @param repo The GitHub repository, "user/repo-name".
#' @param branch Name of the GitHub branch, default "main".
#' @param collection Collection to which the post belongs to, default "posts".
#' @param date The date of the post. Typically this will be defined as a
#'   notebook parameter via `params$date`.
#' @param slug The URL slug of the post. Typically this will be defined as a
#'   notebook parameter via `params$slug`.
#' @param html_tag Logical. If `TRUE` (default), returns a HTML hyperlink tag.
#' @param html_label If returning a HTML hyperlink, the text label to display.
#' @param renv_link Logical. If `TRUE` (default), also returns a link to an
#'   `renv.lock` file.
#'
#' @return A string of the source code URL, or an HTML hyperlink tag.
#' @export
#'
#' @examples
#'
#' date <- "2021-05-18"
#' slug <- "tidytuesday-week-21"
#'
#' get_quarto_source(date = date, slug = slug, html_tag = FALSE)
#' get_quarto_source(date = date, slug = slug, html_tag = TRUE)
#' get_quarto_source(date = date, slug = slug, html_tag = TRUE,
#'                    html_label = "Custom label")
#' @importFrom htmltools a
get_quarto_source <- function(
    repo = "taylordunn/tdunn-quarto", branch = "main",
    collection = "posts",
    date = NULL, slug = NULL,
    html_tag = TRUE, html_label = "Source code", renv_link = TRUE
) {
  if (is.null(date) | is.null(slug)) {
    # If a date and url slug aren't provided, just point to posts/
    post_title <- ""
  } else {
    post_title <- paste0(date, "-", slug)
  }

  post_url <- paste(
    "https://github.com", repo, "tree", branch, collection, post_title,
    sep = "/"
  )

  if (html_tag) {
    res <- htmltools::a(href = post_url, html_label)
  } else {
    res <- post_url
  }

  if (renv_link) {
    renv_url <- paste(post_url, "renv.lock", sep = "/")
    if (html_tag) {
      res <- paste0(res, ", ", htmltools::a(href = renv_url, "R environment"))
    } else {
      res <- paste0(res, ", ", renv_url)
    }
  }

  return(res)
}
