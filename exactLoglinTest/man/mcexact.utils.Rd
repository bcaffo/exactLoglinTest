\name{mcexact.internals}
\alias{errorcheck}
\alias{rounded.tprob}
\title{Internal functions for mcexact}
\description{
  Internal functions used for mcexact.
}
\usage{
rounded.tprob(y, m, s, df)
errorcheck(y,
           x,
           stat,
           dens,
           nosim,
           method,
           savechain,
           tdf,
           maxiter,
           p,
           batchsize)
}
\arguments{
  \item{y}{counts}
  \item{m}{means}
  \item{s}{variances}
  \item{df}{degrees of freedom}
  \item{x}{model matrix}
  \item{stat}{function to be checked}
  \item{dens}{function to be checked}
  \item{nosim}{number of simulations to be checked}
  \item{method}{method to be checked}
  \item{savechain}{savechain flag to be checked}
  \item{tdf}{t degrees of freedom to be checked}
  \item{maxiter}{maximum number of iterations to be checked}
  \item{p}{prop of table entries left fixed to be checked}
  \item{batchsize}{batchsize to be checked}
}
\value{
  \code{rounded.tprob} returns rounded student's t probabilities for
  integers \code{y} with means \code{m} and variances
  \code{s}. \code{errorcheck} is a function containing most of the error
  checking that \code{mcexact} performs.
}
\seealso{\code{\link{mcexact}}}
\author{Brian S. Caffo}
\keyword{htest}
