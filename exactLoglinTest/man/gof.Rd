\name{gof}
\alias{gof}
\title{Goodness-of-fit function for Poisson log-linear models}
\description{
  A goodness-of-fit function for Poisson log-linear models as required
  by \code{mcexact}.
}
\usage{
gof(y = NULL, mu = NULL, rowlabels = FALSE)
}
\arguments{
  \item{y}{counts}
  \item{mu}{mean}
  \item{rowlabels}{labels of returned goodness-of-fit statistics}
}
\details{
  This function is a useful shell for writing alternative goodness-of-fit
  statistics for \code{mcexact}.
}
\value{
  If \code{rowlabels = TRUE}, then \code{gof} returns only the labels of the
  goodness of fit statistics. Otherwise it returns the actual values as
  a vector. 
}
\references{}
\author{Brian S. Caffo}
\note{}
\seealso{\code{\link{mcexact}}}

\examples{
#data(residence)
#get fitted values
#mu <- glm(residence$y ~ residence$x, family = poisson)$fit
#gof(residence$y, mu)
#gof(rowlabels = TRUE)
}
\keyword{htest}
