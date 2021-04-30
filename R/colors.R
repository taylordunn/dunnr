#' Colors and palettes
#'
#' This list contains some nice colors and full palettes.
#'
#' @export
#'
#' @examples
#' library(scales)
#' show_col(unlist(td_colors$nice), ncol = 5)
#' show_col(td_colors$pastel6)
#' show_col(td_colors$div5)
td_colors <- list(
  # A helpful link for simulating color palettes for people who are colorblind
  colorblindness = "https://davidmathlogic.com/colorblind/",
  # Colors I like
  nice = list(
    day9_yellow = "#ffa71a",
    mellow_yellow = "#d5a235",
    emerald = "#449c76",
    light_coral = "#ee7674",
    spanish_blue = "#2d71ae",
    opera_mauve = "#c37ca6",
    ruby_red = "#8f2727",
    indigo_blue = "#083d77",
    charcoal = "#2f4858",
    strong_red = "#d7191c",
    strong_blue = "#2b83ba",
    soft_orange = "#fdae61",
    lime_green = "#abdda4"
  ),
  # A qualitative pastel palette
  pastel6 = c(
    "#d56062", # Indian red
    "#779ecb", # Grey-blue
    "#709b81", # Teal
    "#f4d58d", # Jasmine
    "#b57ba6", # Pearl purple
    "#536879" # Dark electric blue
  ),
  # A sunset inspired diverging color palette
  div5 = c(
    "#00486f",
    "#0f84a1",
    "#edd646",
    "#ed8a00",
    "#dd4125"
  )
)
