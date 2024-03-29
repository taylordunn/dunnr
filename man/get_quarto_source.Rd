% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quarto.R
\name{get_quarto_source}
\alias{get_quarto_source}
\title{Get the source URL for a Quarto post}
\usage{
get_quarto_source(
  repo = "taylordunn/tdunn-quarto",
  branch = "main",
  collection = "posts",
  date = NULL,
  slug = NULL,
  html_tag = TRUE,
  html_label = "Source code",
  renv_link = TRUE
)
}
\arguments{
\item{repo}{The GitHub repository, "user/repo-name".}

\item{branch}{Name of the GitHub branch, default "main".}

\item{collection}{Collection to which the post belongs to, default "posts".}

\item{date}{The date of the post. Typically this will be defined as a
notebook parameter via \code{params$date}.}

\item{slug}{The URL slug of the post. Typically this will be defined as a
notebook parameter via \code{params$slug}.}

\item{html_tag}{Logical. If \code{TRUE} (default), returns a HTML hyperlink tag.}

\item{html_label}{If returning a HTML hyperlink, the text label to display.}

\item{renv_link}{Logical. If \code{TRUE} (default), also returns a link to an
\code{renv.lock} file.}
}
\value{
A string of the source code URL, or an HTML hyperlink tag.
}
\description{
This is a utility function that I use to point to source code on GitHub for
posts on my personal website, located at https://tdunn.ca/.
Credit for the idea goes to Danielle Navarro (https://blog.djnavarro.net/).
}
\examples{

date <- "2021-05-18"
slug <- "tidytuesday-week-21"

get_quarto_source(date = date, slug = slug, html_tag = FALSE)
get_quarto_source(date = date, slug = slug, html_tag = TRUE)
get_quarto_source(date = date, slug = slug, html_tag = TRUE,
                   html_label = "Custom label")
}
