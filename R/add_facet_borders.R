#' Adds borders around panels and strips
#'
#' This is a convenience function to add borders around panels and strips in
#' ggplot2. All it does it modify the panel.border and strip.background theme
#' elements to have the same specified color.
#' Credit to the `cowplot` package back for the idea. I only added the extra
#' strip.background border because I think it looks better.
#'
#' @param color,colour The color of the border.
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' library(palmerpenguins)
#'
#' # Load the default font (Roboto Condensed)
#' extrafont::loadfonts(quiet = TRUE)
#'
#' p <- penguins %>%
#'   filter(!is.na(bill_length_mm)) %>%
#'   ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
#'   geom_point(aes(shape = species), size = 3, alpha = 0.7) +
#'   geom_smooth(method = "lm", formula = "y ~ x", se = FALSE) +
#'   scale_color_brewer(palette = "Set1") +
#'   labs(
#'     title = "Penguin bill dimensions",
#'     subtitle = "Bill length and depth for different penguin species",
#'     x = "Bill length (mm)", y = "Bill depth (mm)",
#'     color = "Penguin species", shape = "Penguin species",
#'     caption = "Data from the palmerpenguins package"
#'   ) +
#'   facet_wrap(~species, nrow = 1)
#'
#' p + theme_td() + add_facet_borders()
add_facet_borders <- function(color = "grey70", colour) {
  if (!missing(colour)) color <- colour

  theme(
    panel.border = element_rect(color = color),
    strip.background = element_rect(color = color)
  )
}
