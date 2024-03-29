% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palettes.R
\name{set_palette}
\alias{set_palette}
\title{Sets the default ggplot2 palettes}
\usage{
set_palette(discrete_pal = "pastel6", continuous_pal = "div5")
}
\arguments{
\item{discrete_pal}{One of the palettes from \code{\link[=td_pal]{td_pal()}}.}

\item{continuous_pal}{One of the palettes from \code{\link[=td_pal]{td_pal()}}.}
}
\description{
This function sets the global \code{ggplot2} options for discrete
(\code{ggplot2.discrete.fill} and \code{ggplot2.discrete.colour}) and continuous
(\code{ggplot2.continuous.fill} and \code{ggplot2.continuous.colour}) palettes to
specified palettes from the \code{dunnr} package.
Use \code{help(scale_colour_discrete)} to see how these options work.
}
\examples{
# Sets pastel6 for discrete and div5 for continuous as the default palettes
set_palette()

library(ggplot2)
library(dplyr)

p <- diamonds \%>\%
  filter(carat >= 2.2) \%>\%
  ggplot(aes(x = price, y = cut, fill = cut)) +
  geom_boxplot() +
  theme(legend.position = "none")
p

p <- faithfuld \%>\%
  ggplot(aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0))
p
}
