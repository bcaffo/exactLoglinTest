\name{pathologist.dat}
\alias{pathologist.dat}
\title{Cross-classification of 118 tumor grades by two pathologists}
\description{
  Data frame of a 5x5 table of pathologists ratings of 118 tumors. Each
  pathologist, \code{A} and \code{B}, rated the tumors on a scale of 1
  to 5. \code{y} represents the counts of each combination of ratings.
}
\usage{
data(pathologist.dat)
}
\format{A list containing \code{y}-the counts and \code{x}-the design
  matrix for the uniform association model.
}
\references{Agresti (1990). \emph{Categorical Data
  Analysis}. Wiley-Interscience. Page 368.
}
\seealso{Page 263 of \emph{Categorical Data Analysis} for a description of the
  uniform assocation model.
}
\keyword{datasets}
