% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BayesFluxR.R
\name{BNN.totparams}
\alias{BNN.totparams}
\title{Obtain the total parameters of the BNN}
\usage{
BNN.totparams(bnn)
}
\arguments{
\item{bnn}{A BNN formed using \code{\link{BNN}}}
}
\value{
The total number of parameters in the BNN
}
\description{
Obtain the total parameters of the BNN
}
\examples{
\dontrun{
  ## Needs previous call to `BayesFluxR_setup` which is time
  ## consuming and requires Julia and BayesFlux.jl
  BayesFluxR_setup(installJulia=TRUE, seed=123)
  net <- Chain(Dense(5, 1))
  like <- likelihood.feedforward_normal(net, Gamma(2.0, 0.5))
  prior <- prior.gaussian(net, 0.5)
  init <- initialise.allsame(Normal(0, 0.5), like, prior)
  x <- matrix(rnorm(5*100), nrow = 5)
  y <- rnorm(100)
  bnn <- BNN(x, y, like, prior, init)
  BNN.totparams(bnn)
}

}
