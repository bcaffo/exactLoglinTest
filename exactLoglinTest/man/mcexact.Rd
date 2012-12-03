\name{mcexact}
\alias{mcexact}
\alias{build.mcx.obj}
\title{Computes Monte Carlo exact P-values for general log-linear models. }
\description{
  This function computes Monte Carlo estimates of conditional P-values
  for goodness of fit tests for general log-linear models.
}
\usage{
mcexact(formula,
        data,
        stat = gof,
        dens = hyper,
        nosim = 10 ^ 3,
        method = "bab",
        savechain = FALSE,
        tdf = 3,
        maxiter = nosim,
        p = NULL,
        batchsize = NULL)

build.mcx.obj(formula,
        data,
        stat = gof,
        dens = hyper,
        nosim = 10 ^ 3,
        method = "bab",
        savechain = FALSE,
        tdf = 3,
        maxiter = nosim,
        p = NULL,
        batchsize = NULL)
}
\arguments{
  \item{formula}{Null model formula specified as in \code{glm}}
  \item{data}{Data frame}
  \item{stat}{The test statistic, a function of the form \code{function(y, mu.hat)}
    where \code{y} is the observed and \code{mu.hat} are the fitted
    values. Current default \code{gof} is a bivariate function of the
    deviance and the Pearson chi-squared.}
  \item{dens}{The target density on the log scale up to a constant of
    proportionallity. A function of the form
    \code{function(y)}. Current default is (proportional to) the log of
    the generalized hypergeometric density.}
  \item{nosim}{Desired number of simulations.}
  \item{method}{Possibly two values, the importance sampling method of
    Booth and Butler, \code{method = "bab"} or the MCMC approach of
    Caffo and Booth \code{method = "cab"}.}
  \item{savechain}{If \code{TRUE} saves the values of the chain.}
  \item{tdf}{A tuning parameter}
  \item{maxiter}{For \code{method = "bab"} number of iterations is
    different from the number of simulations. \code{maxiter} is a
    bound on the total number of iterations.}
  \item{p}{A tuning parameter for \code{method = "cab"}.}
  \item{batchsize}{Required batchsizes for \code{method = "cab"}.}
}
\value{
  Returns a list of class either \code{"bab"} or \code{"cab"} depending
  on \code{method}. The list contains all of the inputs plus all
  required information to resume the simulation. Generic functions
  \code{print} and \code{summary} format the output while \code{update}
  can be used to resume simulations. \code{mcexact} is the front end while
  \code{build.mcx.obj} simply builds the basic object that \code{mcexact} applies to.
  \code{simulate.conditional} generates a matrix of simulated tables.
}
\references{
  Booth and Butler (1999), "An importance sampling algorithm for exact conditional tests in log-linear models", Biometrika 86: 321-332. 
  
  Caffo and Booth (2001). "A Markov Chain Monte Carlo Algorithm for Approximating Exact Conditional Probabilities", The Journal of Computational and Graphical Statistics 10: 730-45.

  http://www.biostat.jhsph.edu/~bcaffo/downloads.htm
}
\author{Brian Caffo }
 
\seealso{\code{\link{fisher.test}}}

\examples{
#library(mcexact)
set.seed(1)

#importance sampling
data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair), data = residence.dat) 
summary(mcx)

#mcmc
data(pathologist.dat)
mcx <- mcexact(y ~ factor(A) + factor(B) + I(A * B),
               data = pathologist.dat,
               method = "cab",
               p = .5,
               nosim = 10 ^ 4,
               batchsize = 100)
summary(mcx)
}
\keyword{htest}
