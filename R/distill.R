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

#' Create a new post with the tdunn.ca template
#'
#' This function wraps [distill::create_post()] to create a template post for my
#' website https://tdunn.ca.
#'
#' Credit goes to Erik Ekholm:
#' EE (2021, April 5). Eric Ekholm: Personalizing the Distill Template.
#' Retrieved from
#' https://www.ericekholm.com/posts/2021-04-02-personalizing-the-distill-template/
#'
#' @param ... Arguments passed to [distill::create_post()].
#' @param open Logical. If `TRUE` (default), opens the created file.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_post_tdunn("Post title", date = Sys.Date(), date_prefix = TRUE,
#'                   draft = TRUE, open = FALSE)
#' }
#' @inheritDotParams distill::create_post
#' @importFrom distill create_post
#' @importFrom xfun write_utf8
#' @importFrom usethis edit_file
create_post_tdunn <- function(..., open = TRUE) {
  tmp <- distill::create_post(..., edit = FALSE)

  yaml <- readLines(tmp, n = 13)
  # Slight edits to the default YAML
  output_idx <- grep("output:", yaml) # Index of output
  end_idx <- grep("---", yaml)[2] # Index of the end of the YAML block
  yaml_edit <-
    c(yaml[c(1:6, 8)],
      # Add params
      c("params:", paste0("  ", yaml[8]), "  slug: "),
      # Add placeholder categories
      c("categories:", "  - category 1", "  - category 2"),
      # Output arguments
      c(yaml[output_idx:(output_idx + 2)], "    toc: true"),
      # Include draft argument if it exists
      yaml[grepl("draft:", yaml)],
      # Optional bibliography
      "#bibliography: references.bib",
      yaml[end_idx], ""
    )

  con <- file(tmp, open = "w")

  on.exit(close(con), add = TRUE)

  body <- '

```{r setup, include=TRUE, code_folding="Setup"}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(dunnr)

extrafont::loadfonts(device = "win", quiet = TRUE)
theme_set(theme_td())
set_geom_fonts()
set_palette()
```

# Reproducibility {.appendix}

<details><summary>Session info</summary>

```{r echo=FALSE}
devtools::session_info()$platform
devtools::session_info()$packages %>%
  rmarkdown::paged_table()
```

</details>

<details><summary>Git repository</summary>

```{r echo=FALSE}
git2r::repository()
```

</details>

```{r echo=FALSE}
get_distill_source(date = params$date, slug = params$slug)
```

'

  xfun::write_utf8(yaml_edit, con)
  xfun::write_utf8(body, con)

  if (open == TRUE) usethis::edit_file(tmp)

}
