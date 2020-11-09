library(mosaic)
library(tidyverse)
library(knitr)
library(readxl)

# READ IN THE SPREADSHEETS -----------------------------------------------------

# Primary spreadsheet
satellites_april_2020 <- read_excel("UCS-Satellite-Database-4-1-2020.xls")

# Spreadsheet with official names
satellites_official_names <- read_excel(
  "UCS-Satellite-Database-Officialname-4-1-2020.xls")

# MAKE ONE OVERALL DATA SET ----------------------------------------------------
# It will contain primary spreadsheet information and the official names

# Get the official names of the satellites
official_name_of_satellite <- satellites_official_names %>%
  select("Current Official Name of Satellite")

# Add the official names of the satellites to the other dataset
satellites_full <- cbind(official_name_of_satellite, satellites_april_2020)

# RENAME THE VARIABLES WE WANT TO USE ------------------------------------------

satellites_renamed <- satellites_full %>%
  rename(
    official_name = "Current Official Name of Satellite",
    registered = "Country/Org of UN Registry",
    user_affiliation = "Users",
    purpose = "Purpose",
    orbit_class = "Class of Orbit",
    perigee = "Perigee (km)",
    apogee = "Apogee (km)",
    eccentricity = "Eccentricity",
    period = "Period (minutes)",
    launch_date = "Date of Launch",
  )

# SELECT THE VARIABLES WE WANT TO USE ------------------------------------------

satellites_selected_vars <- satellites_renamed %>%
  select(
    official_name,
    registered,
    user_affiliation,
    purpose,
    orbit_class,
    perigee,
    apogee,
    eccentricity,
    period,
    launch_date
  )

# RENAME THE DATA SET ----------------------------------------------------------
satellites <- satellites_selected_vars

# MAKE THE PACKAGE -------------------------------------------------------------
usethis::use_data(satellites, overwrite = TRUE)
