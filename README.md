
# satellites

<!-- badges: start -->
<!-- badges: end -->

The `satellites` package was created to provide a simple yet
information-filled research tool for those interested in learning about
the satellites in Earth’s orbit. The [Union for Concerned Scientists
(UCS)](https://www.ucsusa.org/) first published this data set in 2005
and has updated it multiple times since then. This package features the
data from the April 1, 2020 release (which includes launches through
March 31, 2020). The UCS states on a [webpage dedicated to this
database](https://www.ucsusa.org/resources/satellite-database) that
their intent in producing the database is to “create a research tool for
specialists and non-specialists alike by collecting open-source
information on operational satellites and presenting it in a format that
can be easily manipulated for research and analysis.” It is my belief
that the UCS has succeeded in their mission, and through this package I
aim to make the data even easier to work with.

The UCS “Satellite Database” contains two data files that together
contain 27 variables. There are also additional columns where references
for sources used for orbital data and other sources are stored. I
decided that I was interested in creating a data set that contained a
subset of the original variables from the UCS database so that I could
focus my analyses on those variables. In order to create this subset, I
shied away from retaining variables from the orOFiginal data that had
numerous NAs, and from retaining the columns that had links for sources.

After selecting the variables I wanted to include, I ended up with the
data set `satellites`, a dataframe with 2670 observations and 10
variables. The data set includes the official names of the satellites,
as well as categorical variables such as: the country registered as
responsible for the satellite; the affiliation of the user of the
satellite (e.g., “commercial,” “military,” etc.); the purpose of the
satellite (e.g., “earth observation”, “communications,” etc.); and the
satellite’s class of orbit. The data set also contains four numeric
variables pertaining to each satellite’s orbit, as well as the each
satellite’s launch date. To see a data dictionary for the data set,
refer to XXX.

Even though the `satellites` dataset found within this package only
incldues 10 out of the 27 variables that the UCS provide in their
database, there is still a tremendous amount of analysis that can be
performed. For an example of data exploration and analysis that can be
done with this data set, see below.

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

## Example of data exploration and data analysis

Here you will see three questions that can be answered using the
`satellites` data set. These three analyses only scratch the surface of
the computations and insights that can be extracted from this data set.

``` r
# Getting the packages we will need
library(satellites)
library(tidyverse)
library(kableExtra)
```

### Example 1: What are the top 5 purposes/uses for the satellites?

``` r
# Tally the number of satellites for each purpose
purposes_tally <- satellites %>% 
  group_by(purpose) %>% 
  summarise(n = n()) %>% 
  # Arrange in descending order
  arrange(desc(n)) 

# Take the top 5 rows
purposes_top_5 <- purposes_tally[1:5, ]

# Change column names for printing purposes
colnames(purposes_top_5) <- c("Purpose", "N")

# Print out the 5 most frequent purposes using kable
# kable(purposes_top_5, "html", booktabs = TRUE, align = c("l", "l"), escape = FALSE) %>%
#   kable_styling(latex_options = c("HOLD_position", "striped"), position="center") %>%
#   add_header_above(c("Five most common purposes for satellites\n currently in orbit" = 2))
```

The five most common purposes for satellites currently in orbit are
listed in the table above. We see that communications and earth
observation are the two most frequently cited purposes for the
satellites.

``` r
# Number of observations (satellites)
num_rows_satellites <- nrow(satellites)

# Proportion of satellites used for the top 5 purposes
round(sum(purposes_top_5$N)/num_rows_satellites * 100, 2)
[1] 96.7
```

All together, these five purposes are cited for 96.7% of the satellites
currently in orbit.

### Example 2: Describe the distribution of the satellites that have been launched for the most frequently cited purpose.

``` r
# Get the satellites that have been used for communications
communication_satellites <- satellites %>% 
  filter(purpose == "Communications")

# Make a histogram of those satellites with time on the x-axis
ggplot(communication_satellites, aes(launch_date)) + 
  geom_histogram(color = "black", fill = "lightblue") + 
  labs(
    title = "Distribution of satellites launched for communication\npurposes over time",
    x = "Launch date",
    y = "Count")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="60%" style="display: block; margin: auto;" />

The most common purpose for a satellite is communications. A histogram
over time of satellites used for communications shows a left skewed
distribution. There are very few satellites that were launched into
orbit before the year 1995. However, starting around 1995, the number of
satellites launched per year for this purpose has gradually increased
year after year. In the past two years, there has been a drastic
increase in the number of satellites launched for communications
purposes.

### Example 3: Among these same satellites, is there an association between eccentricity and period?

``` r
# Make a plot of period and eccentricity for the communication satellites
ggplot(communication_satellites, aes(x = period, y = eccentricity)) + 
  geom_jitter() + 
  labs(
    title = "Relationship between period and eccentricity among
satellites used for communication purposes",
    x = "Period (days)",
    y = "Eccentricity")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="60%" style="display: block; margin: auto;" />

The relationship between eccentricity and period appears somewhat
parabolic. As period increases from 0 days to about 900 days,
eccentricity increases. However, as period increases from around 900
days onwards to 1500 days, eccentricity decreases. The relationship
between period and eccentricity presents as roughly symmetric about 900
days.

### Summary of these analyses

96.7% of satellites in Earth’s orbit are used for five main purposes,
with the most common purpose being communication. Starting around 1995,
the number of satellites launched for communications generally started
to increase year after year, and the past two years have seen an
exceptional increase in satellites launched for communications purposes.
Among satellites used for communication, there seems to be a parabolic
relationship between their eccentricity and period length.

making a test edit so that I can commit a file when making my action.
