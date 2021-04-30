#' Sets the default font for `ggplot2` text and label geoms
#'
#' This is a helper function to quickly set the `geom_text()` and `geom_label`
#' default fonts to the given family. There is also the option to apply the
#' font to `geom_text_repel()` and `geom_label_repel()` if using the `ggrepel`
#' package.
#'
#' @param family the font family to use. If no family is supplied, it will take
#'   the default font from the current ggplot theme.
#' @param ggrepel a logical indicating whether to apply the font to text and
#'   label geoms from the `ggrepel` package.
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' library(glue)
#' library(palmerpenguins)
#'
#' # Load the default font (Roboto Condensed)
#' extrafont::loadfonts(quiet = TRUE)
#'
#' p <- penguins %>%
#'   count(species, island, name = "n_penguins") %>%
#'   ggplot(aes(y = species, x = n_penguins)) +
#'   geom_col(aes(fill = island)) +
#'   geom_label(
#'     aes(label = glue("{island}: n = {n_penguins}")),
#'     position = "stack", hjust = 1
#'   ) +
#'   scale_fill_brewer(palette = "Set1") +
#'   scale_x_continuous(expand = expansion(mult = c(0, 0.1))) +
#'   labs(
#'     title = "Number of penguins per island",
#'     subtitle = "Different font",
#'     x = "Number of penguins", y = NULL,
#'     caption = "Data from the palmerpenguins package"
#'   ) +
#'   theme(legend.position = "none")
#'
#' # Either set the font explicitly
#' set_geom_fonts(family = "Roboto Condensed")
#' # Or set the theme, then set_geom_fonts will use that base_family
#' theme_set(theme_td())
#' set_geom_fonts()
#'
#' p + theme_td()
#' @importFrom ggplot2 update_geom_defaults theme_get
#' @importFrom ggrepel GeomTextRepel GeomLabelRepel
#' @importFrom glue glue
set_geom_fonts <- function(family = NULL, ggrepel = FALSE) {
  if (is.null(family)) {
    family <- ggplot2::theme_get()$text$family
  }

  update_geom_defaults("text", list(family = family))
  update_geom_defaults("label", list(family = family))

  # Optional defaults for the ggrepel geoms
  if (ggrepel) {
    update_geom_defaults(ggrepel::GeomTextRepel, list(family = family))
    update_geom_defaults(ggrepel::GeomLabelRepel, list(family = family))
  }
}
