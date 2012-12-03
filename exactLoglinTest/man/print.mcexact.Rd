\name{print.mcexact}
\alias{print.bab}
\alias{print.cab}
\alias{summary.bab}
\alias{summary.cab}
\alias{print.babSummary}
\alias{print.cabSummary}
\title{Print utilities for mcexact}
\description{
  Generic print methods for objects of class \code{cab} and \code{bab}
  outputted from \code{mcexact}.
}
\usage{
\method{print}{bab}(x,...)
\method{summary}{bab}(object,...)
}
\arguments{
  \item{x}{An object of class \code{bab} or \code{cab}}
  \item{object}{An object of class \code{bab} or \code{cab}}
  \item{...}{Unused, retained for generic method consistency}
}
\value{
  \code{print.bab} and \code{print.cab} prints the P-value estimates
  obtained from \code{mcexact}. \code{summary.bab} and
  \code{summary.cab} prints extra information and returns a matrix
  of the P-value estimates.
}
\seealso{\code{\link{mcexact}}}
\examples{
#data(residence)
#resid.mcx <- mcexact(residence$y ~ residence$x, nosim = 10 ^ 2, maxiter = 10 ^ 4)
#resid.mcx #calls print.bab
#print(resid.mcx) #calls print.bab
#summary(resid.mcx) #calls summary.bab
}
\author{Brian S. Caffo}
\keyword{htest}
