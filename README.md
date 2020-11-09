
# satellites

<!-- badges: start -->
<!-- badges: end -->

The `satellites` package was created to provide a simple research tool
for those interested in learning about the satellites in Earth’s orbit
(as of March 31, 2020). The data, which comes from the [Union of
Concerned
Scientists](https://www.ucsusa.org/resources/satellite-database),
represents the

-   what kind of data is there
-   how they update it
-   how long they’ve had it for
-   how this can be used
-   why I took those variables and pushed the two data sets together

The goal of \`satellites is to

Provide one data set altogether with a sampling of X vars. Y
observations. Total vars = …

## Installation

You can install the released version of satellites from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("satellites")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nfrontero20/satellites")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(satellites)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub!
