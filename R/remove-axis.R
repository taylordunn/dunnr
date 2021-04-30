#' Removes one or both axes of a `ggplot2` plot
#'
#' A helper function to set axis.line, axis.ticks, axis.text and axis.title
#' elements to `element_blank()` for the specified axis.
#'
#' @param axis Specifies the axis to remove. One of "x", "y", "xy". Default is
#'   "y" because my most common use case is for density plots.
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' library(palmerpenguins)
#'
#' p <- penguins %>%
#'   filter(!is.na(flipper_length_mm)) %>%
#'   ggplot(aes(x = flipper_length_mm)) +
#'   geom_density(aes(fill = species), alpha = 0.5) +
#'   scale_fill_brewer(palette = "Set1") +
#'   scale_y_continuous(expand = expansion(c(0, 0.1))) +
#'   labs(x = "Flipper length (mm)")
#' p + theme_td() +
#'   remove_axis("y")
remove_axis <- function(axis = "y") {
  if (axis == "y") {
    theme(
      axis.line.y = element_blank(), # Removes the line itself
      axis.ticks.y = element_blank(), # Removes the tick marks
      axis.text.y = element_blank(), # Removes tick labels
      axis.title.y = element_blank() # Remove the axis label
    )
  } else if (axis == "x") {
    theme(
      axis.line.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.text.x = element_blank(),
      axis.title.x = element_blank()
    )
  } else if (axis == "xy" | axis == "yx") {
    theme(
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      axis.text = element_blank(),
      axis.title = element_blank()
    )
  }
}
