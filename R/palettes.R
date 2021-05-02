#' TD palettes
#'
#' Returns a function for a discrete TD color palette, or for interpolating a
#' continuous one via `grDevices::colorRampPalette()`.
#'
#' @param palette Character name of palette:
#'   - "pastel6" (default)
#'   - "div5"
#' @param type One of "discrete" (default) or "continuous".
#' @param reverse Boolean to reverse palette order.
#'
#' @export
#'
#' @examples
#' library(scales)
#' show_col(td_pal("pastel6")(6))
#' show_col(td_pal("pastel6", reverse = TRUE)(3))
#' show_col(td_pal("div5")(5))
#' show_col(td_pal("div5")(10))
#' @importFrom grDevices colorRampPalette
td_pal <- function(palette = "pastel6", type = "discrete", reverse = FALSE) {
  stopifnot(tolower(palette) %in% names(td_colors))
  stopifnot(type %in% c("discrete", "continuous"))

  pal <- td_colors[[tolower(palette)]]

  if (type == "discrete") {
    function(n = NULL) {
      # If no argument is supplied, set to the number of colors in the palette
      if (is.null(n)) n <- length(pal)

      if (n > length(pal)) {
        warning(paste("This pallete has only ", length(pal), " colors."))
      }
      if (reverse) {
        rev(pal[1:n])
      } else {
        pal[1:n]
      }
    }
  } else if (type == "continuous") {
    if (reverse) pal <- rev(pal)
    grDevices::colorRampPalette(pal)
  }
}

#' TD color and fill scales for `ggplot2` plots
#'
#' The `scale_color_td()` and `scale_fill_td()` functions provide quick access
#' to my frequently used palettes for `ggplot2`.
#'
#' @param palette Character name of palette:
#'   - "pastel6" (default)
#'   - "div5"
#' @param type One of "discrete" (default) or "continuous".
#' @param reverse Boolean to reverse palette order.
#' @param ... Additional parameters passed on to the scale type.
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' p <- diamonds %>%
#'   filter(carat >= 2.2) %>%
#'   ggplot(aes(x = price, y = cut, fill = cut)) +
#'   geom_boxplot() +
#'   theme(legend.position = "none")
#' p + scale_fill_td()
#'
#' p <- faithfuld %>%
#'   ggplot(aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_x_continuous(expand = c(0, 0)) +
#'   scale_y_continuous(expand = c(0, 0))
#' p +
#'   scale_fill_td(palette = "div5", type = "continuous")
#' @rdname scale_color_td
#' @inheritDotParams ggplot2::discrete_scale
#' @aliases scale_colour_td
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_color_td <- function(palette = "pastel6", type = "discrete",
                           reverse = FALSE, ...) {
  pal <- td_pal(palette = palette, type = type, reverse = reverse)

  if (type == "discrete") {
    ggplot2::discrete_scale("color",
      scale_name = paste("td_pal: ", palette),
      palette = pal, ...
    )
  } else {
    ggplot2::scale_color_gradientn(colors = pal(256), ...)
  }
}

#' @rdname scale_color_td
#' @export
#'
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_fill_td <- function(palette = "pastel6", type = "discrete",
                          reverse = FALSE, ...) {
  pal <- td_pal(palette = palette, type = type, reverse = reverse)

  if (type == "discrete") {
    ggplot2::discrete_scale("fill",
      scale_name = paste("td_pal: ", palette),
      palette = pal, ...
    )
  } else {
    ggplot2::scale_fill_gradientn(colors = pal(256), ...)
  }
}

#' Sets the default ggplot2 palettes
#'
#' This function sets the global `ggplot2` options for discrete
#' (`ggplot2.discrete.fill` and `ggplot2.discrete.colour`) and continuous
#' (`ggplot2.continuous.fill` and `ggplot2.continuous.colour`) palettes to
#' specified palettes from the `dunnr` package.
#' Use `help(scale_colour_discrete)` to see how these options work.
#'
#' @param discrete_pal One of the palettes from [td_pal()].
#' @param continuous_pal One of the palettes from [td_pal()].
#'
#' @export
#'
#' @examples
#' # Sets pastel6 for discrete and div5 for continuous as the default palettes
#' set_palette()
#'
#' library(ggplot2)
#' library(dplyr)
#'
#' p <- diamonds %>%
#'   filter(carat >= 2.2) %>%
#'   ggplot(aes(x = price, y = cut, fill = cut)) +
#'   geom_boxplot() +
#'   theme(legend.position = "none")
#' p
#'
#' p <- faithfuld %>%
#'   ggplot(aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_x_continuous(expand = c(0, 0)) +
#'   scale_y_continuous(expand = c(0, 0))
#' p
set_palette <- function(discrete_pal = "pastel6", continuous_pal = "div5") {
  options(
    ggplot2.discrete.fill = function() {
      scale_fill_td(palette = discrete_pal, type = "discrete")
    }
  )
  options(
    ggplot2.discrete.colour = function() {
      scale_color_td(palette = discrete_pal, type = "discrete")
    }
  )
  options(
    ggplot2.continuous.fill = function() {
      scale_fill_td(palette = continuous_pal, type = "continuous")
    }
  )
  options(
    ggplot2.continuous.colour = function() {
      scale_color_td(palette = continuous_pal, type = "continuous")
    }
  )
}
