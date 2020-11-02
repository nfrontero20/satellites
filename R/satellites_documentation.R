#' UCS Satellites
#'
#' This package contains information, collected by the Union of Concerned
#' Scientists (UCS) on the satellites in Earth's orbit as of March 31, 2020.
#' @docType package
#' @name satellites
#' @aliases satellites satellites-package
NULL

#' "satellites"
#'
#' A data set containing information on the 2670 satellites orbiting
#' Earth as of March 31, 2020.  The data in this package were obtained
#' from the Union of Concerned Scientists (UCS).
#'
#' @source \url{https://www.ucsusa.org/resources/satellite-database}
#' @format A dataframe with 2670 elements
#' \describe{
#'   \item{official_name}{Official name}
#'   \item{registered}{Country registered with the UN as responsible}
#'   \item{user_affiliation}{Affilitation of the primary users}
#'   \item{purpose}{Discipline of the primary users}
#'   \item{orbit_class}{Class of the orbit}
#'   \item{perigee}{Perigee (km)}
#'   \item{apogee}{Apogee (km)}
#'   \item{eccentricity}{Eccentricity)}
#'   \item{period}{Time required to complete one full orbit of Earth (minutes)}
#'   \item{launch_date}{Date of satellite launch}
#' }
"satellites"
