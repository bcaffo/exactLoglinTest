\name{update.bab}
\alias{update.bab}
\alias{bab}
\title{Update method for objects of class bab}
\description{
  An update method for objects created by \code{mcexact} when
  \code{method = 'bab'}.
}
\usage{
\method{update}{bab}(object, ...)
bab(args, nosim = NULL, maxiter = NULL, savechain = FALSE)
}
\arguments{
  \item{object}{Output from \code{mcexact}}
  \item{\dots}{Alternative arguments for the update}
  \item{args}{Output from \code{mcexact}}
  \item{nosim}{The desired number of simulations to be performed in the
    update}
  \item{maxiter}{The maximum number of iterations allowed.}
  \item{savechain}{Saves the chain of goodness-of-fit statistics and
    their importance weights}
}
\details{
  The method \code{update.bab} calls the function \code{bab}, which is the
  engine for \code{mcexact} when \code{method = 'bab'}.
}
\value{
  A list of the form outputted from \code{mcexact}
}
\author{Brian S. Caffo}
\seealso{\code{\link{mcexact}}}

\examples{
data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair), data = residence.dat) 
summary(mcx)
mcx <- update(mcx, nosim = 10 ^ 4, maxiter = 10 ^ 6)
summary(mcx)
}
\keyword{htest}
