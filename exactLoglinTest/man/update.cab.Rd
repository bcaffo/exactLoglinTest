\name{update.cab}
\alias{update.cab}
\alias{cab}
\title{Update method for objects of class cab}
\description{
  An update method for objects created by \code{mcexact} when
  \code{method = 'cab'}.
}
\usage{
\method{update}{cab}(object, ...)
cab(args,
    nosim = NULL,
    batchsize = NULL,
    savechain = FALSE,
    p = NULL,
    flush = FALSE)
}
\arguments{
  \item{object}{Output from \code{mcexact}}
  \item{\dots}{Alternative arguments for the update}
  \item{args}{Output from \code{mcexact}}
  \item{nosim}{The number of simulations to be performed in the update}
  \item{batchsize}{A new batchsize}
  \item{savechain}{Saves the chain of goodness-of-fit statistics}
  \item{p}{An updated proportion of simulated tables left fixed.}
  \item{flush}{Should the previous information be discarded?
    \code{flush} should be set to \code{true} if the batchsize is changed.}
}
\details{
  The method \code{update.cab} calls the function \code{cab}, which is the
  engine for \code{mcexact} when \code{method = 'cab'}.
}
\value{
  A list of the form outputted from \code{mcexact}
}
\author{Brian S. Caffo}
\seealso{\code{\link{mcexact}}}

\examples{
data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair),
               data = residence.dat,
               method = "cab",
               p = .5,
               batchsize = 100) 
summary(mcx)
mcx <- update(mcx, nosim = 10 ^ 4)
summary(mcx)
}
\keyword{htest}
