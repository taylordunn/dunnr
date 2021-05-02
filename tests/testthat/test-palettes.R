test_that("set_palette works", {
  set_palette()

  expect_true(is.function(getOption("ggplot2.discrete.fill")))
  expect_true(is.function(getOption("ggplot2.discrete.colour")))
  expect_true(is.function(getOption("ggplot2.continuous.fill")))
  expect_true(is.function(getOption("ggplot2.continuous.colour")))
})
