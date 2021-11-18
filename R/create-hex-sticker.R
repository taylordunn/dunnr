create_dunnr_hex_sticker <- function() {
  library(hexSticker)
  library(tidyverse)
  library(dunnr)
  library(palmerpenguins)
  library(patchwork)

  # hexSticker currently supports showtext for fonts (not extrafont)
  library(showtext)
  font_add_google("Inter")
  font_add_google("Roboto Condensed")
  showtext_auto()

  p1 <- penguins %>%
    filter(!is.na(flipper_length_mm)) %>%
    ggplot(aes(x = flipper_length_mm)) +
    geom_density(aes(fill = species), alpha = 0.5) +
    scale_fill_manual(values = td_colors$pastel6[c(1, 2, 4)]) +
    scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
    labs(x = NULL) +
    theme_td() +
    remove_axis("y") +
    theme(legend.position = "none",
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0),
          axis.line.x = element_line(color = "white"),
          axis.ticks.x = element_line(color = "white"),
          axis.text.x = element_blank())

  p2 <- penguins %>%
    filter(!is.na(flipper_length_mm)) %>%
    ggplot(aes(y = species, x = flipper_length_mm)) +
    geom_boxplot(aes(fill = species), alpha = 0.5, outlier.shape = NA) +
    scale_fill_manual(values = td_colors$pastel6[c(1, 2, 4)]) +
    theme_td() +
    remove_axis("xy") +
    theme(legend.position = "none",
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0))

  p <- p2 / p1 +
    plot_layout(heights = c(1, 1.2)) +
    plot_annotation(
      theme = theme(plot.background = element_blank())
    )

  hex_sticker <- sticker(
    subplot = p, s_width = 1.3, s_height = 0.9, s_x = 1.0,
    package = "dunnr",
    p_family = "Inter", p_size = 45, p_color = "#e7cb8a",
    h_fill = "#546b7c", h_color = "#e7cb8a",
    filename = "dunnr-sticker.png", dpi = 500
  )

}
