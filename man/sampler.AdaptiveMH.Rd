% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.R
\name{sampler.AdaptiveMH}
\alias{sampler.AdaptiveMH}
\title{Adaptive Metropolis Hastings as introduced in}
\usage{
sampler.AdaptiveMH(bnn, t0, sd, eps = 1e-06)
}
\arguments{
\item{bnn}{BNN obtained using \code{\link{BNN}}}

\item{t0}{Number of iterators before covariance adaptation will be started.
Also the lookback period for covariance adaptation.}

\item{sd}{Tuning parameter; See paper}

\item{eps}{Used for numerical reasons. Increase this if pos-def-error thrown.}
}
\value{
a list with `juliavar`, `juliacode`, and all given arguments
}
\description{
Haario, H., Saksman, E., & Tamminen, J. (2001). An adaptive Metropolis
algorithm. Bernoulli, 223-242.
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
  sampler <- sampler.AdaptiveMH(bnn, 10, 1)
  ch <- mcmc(bnn, 10, 1000, sampler)
}

}
