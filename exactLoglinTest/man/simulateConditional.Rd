\name{simulateConditional}
\alias{simulateConditional}
\alias{simtable.bab}
\alias{simtable.cab}

\title{Simulates from the conditional distribution of a log-linear model}
\description{
  Simulates from the conditional distribution of log-linear models given
  the sufficient statistics. 
}
\usage{
simulateConditional(formula,
                     data,
                     dens = hyper,
                     nosim = 10^3,
                     method = "bab",
                     tdf = 3,
                     maxiter = nosim,
                     p = NULL,
                     y.start = NULL)
simtable.bab(args, nosim = NULL, maxiter = NULL)
simtable.cab(args, nosim = NULL, p = NULL, y.start = NULL)
}
\arguments{
  \item{formula}{A formula for the log-linear model}
  \item{data}{A data frame}
  \item{dens}{The target density on the log scale up to a constant of
    proportionallity. A function of the form
    \code{function(y)}. Current default is (proportional to) the log of
    the generalized hypergeometric density.}
  \item{nosim}{Desired number of simulations.}
  \item{method}{Possibly two values, the importance sampling method of
    Booth and Butler, \code{method = "bab"} or the MCMC approach of
    Caffo and Booth \code{method = "cab"}.}
  \item{tdf}{A tuning parameter}
  \item{maxiter}{For \code{method = "bab"} number of iterations is
    different from the number of simulations. \code{maxiter} is a
    bound on the total number of iterations.}
  \item{p}{A tuning parameter for \code{method = "cab"}.}
  \item{y.start}{An optional starting value when \code{method = "cab"}}
  \item{args}{An object of class "bab" or "cab"}
}
\value{
  A matrix where each simulated table is a row.
}
\author{Brian Caffo}
\seealso{\code{\link{fisher.test}}}
\examples{
data(czech.dat)
chain2 <- simulateConditional(y ~ (A + B + C + D + E + F) ^ 2,
                               data = czech.dat,
                               method = "cab",
                               nosim = 10 ^ 3,
                               p = .4,
                               dens = function(y) 0)
}
\keyword{htest}% at least one, from doc/KEYWORDS
