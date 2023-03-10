% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.R
\name{sampler.SGNHTS}
\alias{sampler.SGNHTS}
\title{Stochastic Gradient Nose-Hoover Thermostat as proposed in}
\usage{
sampler.SGNHTS(
  l,
  sigmaA = 1,
  xi = 1,
  mu = 1,
  madapter = madapter.FixedMassMatrix()
)
}
\arguments{
\item{l}{Stepsize}

\item{sigmaA}{Diffusion factor}

\item{xi}{Thermostat}

\item{mu}{Free parameter of thermostat}

\item{madapter}{Mass Adapter; Not used in original paper and thus
has no theoretical backing}
}
\value{
a list with `juliavar`, `juliacode` and all arguments provided
}
\description{
Proposed in Leimkuhler, B., & Shang, X. (2016). Adaptive thermostats for noisy
gradient systems. SIAM Journal on Scientific Computing, 38(2), A712-A736.
}
\details{
This is similar to SGNHT as proposed in
Ding, N., Fang, Y., Babbush, R., Chen, C., Skeel, R. D., & Neven, H. (2014).
Bayesian sampling using stochastic gradient thermostats. Advances in neural
information processing systems, 27.
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
  sampler <- sampler.SGNHTS(1e-3)
  ch <- mcmc(bnn, 10, 1000, sampler)
}

}
