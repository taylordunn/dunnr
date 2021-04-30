#' Add the base theme from dunnr to a ggplot
#'
#' A simple plotting theme with a half-open frame and no gridlines.
#' Heavily inspired by [cowplot::theme_half_open()]. It uses Roboto Condensed
#' as the default font, which may be changed with the `base_family` argument.
#'
#' @param base_size base font size in pts.
#' @param base_family base font family.
#' @param base_line_size base size for line elements.
#'
#' @return The complete theme.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(palmerpenguins)
#' library(dplyr)
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
#' p + theme_td()
#' @importFrom grid unit
#' @importFrom ggplot2 theme theme_bw element_line element_rect element_text
#'   element_blank margin rel %+replace%
theme_td <- function(base_size = 12, base_family = "Roboto Condensed",
                     base_line_size = base_size / 24) {
  half_line <- base_size / 2

  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      line = element_line(
        color = "black", size = base_line_size,
        linetype = 1, lineend = "butt"
      ),
      rect = element_rect(
        fill = NA, color = NA,
        size = base_line_size, linetype = 1
      ),
      text = element_text(
        family = base_family, face = "plain", color = "black",
        size = base_size, hjust = 0.5, vjust = 0.5, angle = 0,
        lineheight = 0.9, margin = margin(), debug = FALSE
      ),
      axis.line = element_line(
        color = "black", size = base_line_size,
        lineend = "square"
      ),
      axis.line.x = NULL,
      axis.line.y = NULL,
      axis.text = element_text(color = "black", size = rel(0.8)),
      axis.text.x = element_text(
        margin = margin(t = 0.8 * half_line / 2),
        vjust = 1
      ),
      axis.text.x.top = element_text(
        margin = margin(b = 0.8 * half_line / 2),
        vjust = 0
      ),
      axis.text.y = element_text(
        margin = margin(r = 0.8 * half_line / 2),
        hjust = 1
      ),
      axis.text.y.right = element_text(
        margin = margin(l = 0.8 * half_line / 2),
        hjust = 0
      ),
      axis.ticks = element_line(color = "black", size = base_line_size),
      axis.ticks.length = unit(half_line / 2, "pt"),
      axis.title.x = element_text(
        margin = margin(t = half_line / 2),
        vjust = 1
      ),
      axis.title.x.top = element_text(
        margin = margin(b = half_line / 2),
        vjust = 0
      ),
      axis.title.y = element_text(
        margin = margin(r = half_line / 2),
        angle = 90, vjust = 1
      ),
      axis.title.y.right = element_text(
        margin = margin(l = half_line / 2),
        angle = -90, vjust = 0
      ),
      legend.background = element_blank(),
      legend.spacing = unit(base_size, "pt"),
      legend.margin = margin(0, 0, 0, 0),
      legend.key = element_blank(),
      legend.key.size = unit(1.1 * base_size, "pt"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = rel(0.8)),
      legend.text.align = NULL,
      legend.title = element_text(hjust = 0),
      legend.title.align = NULL,
      legend.position = "right",
      legend.direction = NULL,
      legend.justification = c("left", "center"),
      legend.box = NULL,
      legend.box.margin = margin(0, 0, 0, 0, "cm"),
      legend.box.background = element_blank(),
      legend.box.spacing = unit(base_size, "pt"),
      panel.background = element_blank(),
      panel.border = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major = NULL,
      panel.grid.minor = NULL,
      panel.grid.major.x = NULL,
      panel.grid.major.y = NULL,
      panel.grid.minor.x = NULL,
      panel.grid.minor.y = NULL,
      panel.spacing = unit(half_line, "pt"),
      panel.spacing.x = NULL,
      panel.spacing.y = NULL,
      panel.ontop = FALSE,
      strip.background = element_rect(fill = "grey90", color = NA),
      strip.text = element_text(
        size = rel(0.9),
        margin = margin(
          half_line / 2, half_line / 2,
          half_line / 2, half_line / 2
        )
      ),
      strip.text.x = NULL,
      strip.text.y = element_text(angle = -90),
      strip.placement = "inside",
      strip.placement.x = NULL,
      strip.placement.y = NULL,
      strip.switch.pad.grid = unit(half_line / 2, "pt"),
      strip.switch.pad.wrap = unit(half_line / 2, "pt"),
      plot.background = element_blank(),
      plot.title = element_text(
        face = "bold", size = rel(1.2),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.subtitle = element_text(
        size = rel(1.0),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.caption = element_text(
        face = "italic", size = rel(0.8),
        hjust = 1, vjust = 1,
        margin = margin(t = half_line)
      ),
      plot.tag = element_text(
        face = "bold",
        hjust = 0, vjust = 0.7
      ),
      plot.tag.position = c(0, 1),
      plot.margin = margin(half_line, half_line, half_line, half_line),
      complete = TRUE
    )
}

#' Add the grid theme from dunnr to a ggplot
#'
#' This theme is just [theme_bw()] with some slight tweaks, like softer colors
#' and Droid Serif as the default font.
#'
#' @param base_size base font size in pts.
#' @param base_family base font family.
#' @param base_line_size base size for line elements.
#'
#' @return The complete theme.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(palmerpenguins)
#' library(dplyr)
#'
#' # Load the default font (Droid Serif)
#' extrafont::loadfonts(quiet = TRUE)
#'
#' p <- penguins %>%
#'   filter(!is.na(flipper_length_mm)) %>%
#'   ggplot(aes(x = flipper_length_mm, y = species)) +
#'   geom_violin(aes(fill = species), show.legend = FALSE) +
#'   labs(x = "Flipper length (mm)", y = NULL) +
#'   facet_wrap(~year) +
#'   scale_fill_brewer(palette = "Set1") +
#'   scale_x_continuous(breaks = seq(180, 220, 20))
#'
#' p + theme_td_grid()
#' @importFrom grid unit
#' @importFrom ggplot2 theme theme_bw element_line element_rect element_text
#'   element_blank margin rel %+replace%
theme_td_grid <- function(base_size = 14, base_family = "Droid Serif",
                          base_line_size = base_size / 24) {
  half_line <- base_size / 2

  th <-
    theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      line = element_line(color = "black", size = base_line_size,
                          linetype = 1, lineend = "butt"),
      rect = element_rect(fill = NA, color = NA, size = base_line_size, linetype = 1),
      text = element_text(
        family = base_family, face = "plain", color = "black",
        size = base_size, hjust = 0.5, vjust = 0.5, angle = 0,
        lineheight = 0.9, margin = margin(), debug = FALSE
      ),

      axis.line = element_line(color = "black", size = base_line_size,
                               lineend = "square"),
      axis.line.x = NULL,
      axis.line.y = NULL,

      axis.text = element_text(color = "black", size = rel(0.8)),
      axis.text.x = element_text(margin = margin(t = 0.8 * half_line / 2),
                                 vjust = 1),
      axis.text.x.top = element_text(margin = margin(b = 0.8 * half_line / 2),
                                     vjust = 0),
      axis.text.y = element_text(margin = margin(r = 0.8 * half_line / 2),
                                 hjust = 1),
      axis.text.y.right = element_text(margin = margin(l = 0.8 * half_line / 2),
                                       hjust = 0),

      axis.ticks = element_line(color = "black", size = base_line_size),
      axis.ticks.length = unit(half_line / 2, "pt"),

      axis.title.x = element_text(margin = margin(t = half_line / 2),
                                  vjust = 1),
      axis.title.x.top = element_text(margin = margin(b = half_line / 2),
                                      vjust = 0),
      axis.title.y = element_text(margin = margin(r = half_line / 2),
                                  angle = 90, vjust = 1),
      axis.title.y.right = element_text(margin = margin(l = half_line / 2),
                                        angle = -90, vjust = 0),

      legend.background = element_blank(),
      legend.spacing = unit(base_size, "pt"),
      legend.margin = margin(0, 0, 0, 0),
      legend.key = element_blank(),
      legend.key.size = unit(1.1 * base_size, "pt"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = rel(0.8)),
      legend.text.align = NULL,
      legend.title = element_text(hjust = 0),
      legend.title.align = NULL,
      legend.position = "right",
      legend.direction = NULL,
      legend.justification = c("left", "center"),
      legend.box = NULL,
      legend.box.margin = margin(0, 0, 0, 0, "cm"),
      legend.box.background = element_blank(),
      legend.box.spacing = unit(base_size, "pt"),

      panel.background = element_blank(),
      panel.border = element_rect(color = "black"),
      panel.grid = element_line(color = "#eff0f1"),
      panel.grid.major = NULL,
      panel.grid.minor = element_blank(),
      panel.grid.major.x = NULL,
      panel.grid.major.y = NULL,
      panel.grid.minor.x = NULL,
      panel.grid.minor.y = NULL,
      panel.spacing = unit(half_line, "pt"),
      panel.spacing.x = NULL,
      panel.spacing.y = NULL,
      panel.ontop = FALSE,

      strip.background = element_rect(fill = "#eff0f1", color = "black"),
      strip.text = element_text(
        size = rel(0.9),
        margin = margin(half_line / 2, half_line / 2,
                        half_line / 2, half_line / 2)
      ),
      strip.text.x = NULL,
      strip.text.y = element_text(angle = -90),
      strip.placement = "inside",
      strip.placement.x = NULL,
      strip.placement.y = NULL,
      strip.switch.pad.grid = unit(half_line / 2, "pt"),
      strip.switch.pad.wrap = unit(half_line / 2, "pt"),

      plot.background = element_blank(),
      plot.title = element_text(
        face = "bold", size = rel(1.2),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.subtitle = element_text(
        size = rel(1.0),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.caption = element_text(
        face = "italic", size = rel(0.8),
        hjust = 1, vjust = 1,
        margin = margin(t = half_line)
      ),
      plot.tag = element_text(
        face = "bold",
        hjust = 0, vjust = 0.7
      ),
      plot.tag.position = c(0, 1),
      plot.margin = margin(half_line, half_line, half_line, half_line),
      complete = TRUE
    )
}

#' Add the grey theme from dunnr to a ggplot
#'
#' This is a low contrast theme with a grey background that emphasizes title and
#' facet text. The default font is Inter.
#'
#' @param base_size base font size in pts.
#' @param base_family base font family.
#' @param base_line_size base size for line elements.
#' @param base_grey the specific grey to use throughout, default "grey92".
#'
#' @return The complete theme.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(palmerpenguins)
#' library(dplyr)
#'
#' # Load the default font (Inter)
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
#' p + theme_td_grey()
#' @importFrom grid unit
#' @importFrom ggplot2 theme theme_bw element_line element_rect element_text
#'   element_blank margin rel %+replace%
#' @importFrom colorspace darken
theme_td_grey <- function(base_size = 14, base_family = "Inter",
                          base_line_size = base_size / 24, base_grey = "grey92") {
  half_line <- base_size / 2

  th <-
    theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      line = element_line(color = "black", size = base_line_size,
                          linetype = 1, lineend = "butt"),
      rect = element_rect(fill = NA, color = NA, size = base_line_size, linetype = 1),
      text = element_text(
        family = base_family, face = "plain",
        # Text needs to be a bit darker then the default base_grey to show
        #  up on the white background
        color = colorspace::darken(base_grey, 0.3),
        size = base_size, hjust = 0.5, vjust = 0.5, angle = 0,
        lineheight = 0.9, margin = margin(), debug = FALSE
      ),

      axis.line = element_blank(),
      axis.line.x = NULL,
      axis.line.y = NULL,

      axis.text = element_text(size = rel(0.8)),
      axis.text.x = element_text(margin = margin(t = 0.8 * half_line / 2),
                                 vjust = 1),
      axis.text.x.top = element_text(margin = margin(b = 0.8 * half_line / 2),
                                     vjust = 0),
      axis.text.y = element_text(margin = margin(r = 0.8 * half_line / 2),
                                 hjust = 1),
      axis.text.y.right = element_text(margin = margin(l = 0.8 * half_line / 2),
                                       hjust = 0),

      axis.ticks = element_line(color = base_grey, size = base_line_size),
      axis.ticks.length = unit(half_line / 2, "pt"),

      axis.title.x = element_text(margin = margin(t = half_line / 2),
                                  vjust = 1),
      axis.title.x.top = element_text(margin = margin(b = half_line / 2),
                                      vjust = 0),
      axis.title.y = element_text(margin = margin(r = half_line / 2),
                                  angle = 90, vjust = 1),
      axis.title.y.right = element_text(margin = margin(l = half_line / 2),
                                        angle = -90, vjust = 0),

      legend.background = element_blank(),
      legend.spacing = unit(base_size, "pt"),
      legend.margin = margin(0, 0, 0, 0),
      legend.key = element_blank(),
      legend.key.size = unit(1.1 * base_size, "pt"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = rel(0.8)),
      legend.text.align = NULL,
      legend.title = element_text(hjust = 0),
      legend.title.align = NULL,
      legend.position = "right",
      legend.direction = NULL,
      legend.justification = c("left", "center"),
      legend.box = NULL,
      legend.box.margin = margin(0, 0, 0, 0, "cm"),
      legend.box.background = element_blank(),
      legend.box.spacing = unit(base_size, "pt"),

      panel.background = element_rect(fill = base_grey),
      panel.border = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major = NULL,
      panel.grid.minor = NULL,
      panel.grid.major.x = NULL,
      panel.grid.major.y = NULL,
      panel.grid.minor.x = NULL,
      panel.grid.minor.y = NULL,
      panel.spacing = unit(half_line, "pt"),
      panel.spacing.x = NULL,
      panel.spacing.y = NULL,
      panel.ontop = FALSE,

      strip.background = element_blank(),
      strip.text = element_text(
        color = "black", face = "bold", size = rel(1.1), hjust = 0,
        margin = margin(half_line / 2, half_line / 2,
                        half_line / 2, half_line / 2)
      ),
      strip.text.x = NULL,
      strip.text.y = element_text(angle = -90),
      strip.placement = "inside",
      strip.placement.x = NULL,
      strip.placement.y = NULL,
      strip.switch.pad.grid = unit(half_line / 2, "pt"),
      strip.switch.pad.wrap = unit(half_line / 2, "pt"),

      plot.background = element_blank(),
      plot.title = element_text(
        color = "black", face = "bold", size = rel(1.2),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.subtitle = element_text(
        color = "black", size = rel(1.1),
        hjust = 0, vjust = 1,
        margin = margin(b = half_line)
      ),
      plot.caption = element_text(
        face = "italic", size = rel(0.8),
        hjust = 1, vjust = 1,
        margin = margin(t = half_line)
      ),
      plot.tag = element_text(
        color = "black", face = "bold",
        hjust = 0, vjust = 0.7
      ),
      plot.tag.position = c(0, 1),
      plot.margin = margin(half_line, half_line, half_line, half_line),
      complete = TRUE
    )
}
