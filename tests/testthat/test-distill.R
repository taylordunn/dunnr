test_that("get_distill_source works", {
  expect_equal(
    get_distill_source(html_tag = FALSE),
    "https://github.com/taylordunn/tdunn/tree/main/_posts/"
  )

  date <- "2021-05-18"
  slug <- "tidytuesday-week-21"

  expect_equal(
    get_distill_source(date = date, slug = slug, html_tag = FALSE),
    "https://github.com/taylordunn/tdunn/tree/main/_posts/2021-05-18-tidytuesday-week-21"
  )

  expect_s3_class(
    get_distill_source(date = date, slug = slug, html_tag = TRUE),
    "shiny.tag"
  )

  testthat::expect_equal(
    as.character(get_distill_source(date = date, slug = slug, html_tag = TRUE,
                                    html_label = "test label")),
    '<a href="https://github.com/taylordunn/tdunn/tree/main/_posts/2021-05-18-tidytuesday-week-21">test label</a>'
  )
})
