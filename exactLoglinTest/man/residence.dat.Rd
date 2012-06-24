\name{residence.dat}
\alias{residence.dat}
\title{Residence in 1980 by residence in 1985.}
\description{
  A data frame of a 4x4 cross-classification of residences in 1980 by residence in
  1985. \code{residence$y} gives the counts, \code{res.1985} and
  \code{res.1980} give the 1980 and 1985 residences, \code{sym.pair} is
  used to fit the quasi-symmetry model.
}
\usage{data(residence.dat)
}
\format{A list containing \code{y}-the counts and \code{x}-the design
  matrix for the quasi-symmetry model.
}
\references{Agresti (1990). \emph{Categorical Data
  Analysis}. Wiley-Interscience. Page 357.
}
\seealso{Page 354 of \emph{Categorical Data Analysis} for a description of the
  quasi-symmetry model.
}
\keyword{datasets}
