
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rosettafish

[![Travis build
status](https://travis-ci.org/pbs-assess/rosettafish.svg?branch=master)](https://travis-ci.org/pbs-assess/rosettafish)

rosettafish is an R package to translate fish- and fisheries-related
words or short phrases between languages (e.g. French to English,
English to French).

This would apply to figure labels to produce separate figures in two
languages, or a single figure with labels in two languages. It can also
be used for other text (such as table headings), but is not intended for
translation of complete sentences.

In particular, it should be useful for automatically producing
translated technical figures to go into Research Documents and
presentations. This is done when building the figures (in R) and saves
someone having to manually edit the figure (in, say, Photoshop). This
preserves the quality and the output formats of figures in both
languages, and is especially time-saving when the same figure axes are
used for multiple figures (e.g. a time series of biomass estimates for
multiple model runs of a stock assessment).

The package has a built-in .csv file of English-French translations of
common technical fisheries terms (that are often incorrectly translated
by generic automatic translators). Users can add to this or use their
own file, and are encouraged to add to the ever-expanding list of common
terms using the instructions below.

This is currently implemented for French-English translations but could
be expanded to other languages (e.g. Inuktitut).

## Installation

You can install rosettafish with:

``` r
# install.packages("devtools")
devtools::install_github("pbs-assess/rosettafish")
```

## Examples

``` r
library(rosettafish)
library(ggplot2)
```

``` r
set.seed(1)
years <- seq(1980, 2018)
df <- data.frame(years, biomass = 2000 * rlnorm(length(years), 0, 1))
```

``` r
make_plot <- function(french = FALSE) {
  ggplot(df, aes(years, biomass)) + geom_line() +
    xlab(en2fr("year", french)) +
    ylab(en2fr("biomass", french))
}
```

``` r
make_plot()
```

<img src="man/figures/README-func-figs-1.png" width="70%" />

``` r
make_plot(french = TRUE)
```

<img src="man/figures/README-func-figs-2.png" width="70%" />

``` r
ggplot(df, aes(years, biomass)) + geom_line() +
  xlab(fr2en("année")) +
  ylab(fr2en("biomasse"))
```

<img src="man/figures/README-gg-figs-1.png" width="70%" />

## Instructions for updating the list of translated scientific terms

Fork and clone this repoisitory. Add the English and French terms to the
end of the file `inst/extdata/terms.csv`, push to GitHub and submit a
pull request. If you do not know what that means, just create an Issue
on the GitHub site and give us your new translated terms.

Please note that the ‘rosettafish’ project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.
