\docType{methods}
\name{PCASamples}
\alias{PCASamples}
\alias{PCASamples,methylBase-method}
\title{Principal Components Analysis of Methylation data}
\usage{
  PCASamples(.Object, screeplot=FALSE,
    adj.lim=c(0.0004,0.1), scale=TRUE,
    center=TRUE,comp=c(1,2),transpose=TRUE,sd.filter=TRUE,
    sd.threshold=0.5,filterByQuantile=TRUE,obj.return=FALSE)
}
\arguments{
  \item{.Object}{a \code{methylBase} object}

  \item{screeplot}{a logical value indicating whether to
  plot the variances against the number of the principal
  component. (default: FALSE)}

  \item{adj.lim}{a vector indicating the propotional
  adjustment of xlim (adj.lim[1]) and ylim (adj.lim[2]).
  This is primarily used for adjusting the visibility of
  sample labels on the on the PCA plot. (default:
  c(0.0004,0.1))}

  \item{scale}{logical indicating if \code{prcomp} should
  scale the data to have unit variance or not (default:
  TRUE)}

  \item{center}{logical indicating if \code{prcomp} should
  center the data or not (default: TRUE)}

  \item{comp}{vector of integers with 2 elements specifying
  which components to be plotted.}

  \item{transpose}{if TRUE (default) percent methylation
  matrix will be transposed, this is equivalent to doing
  PCA on variables that are regions/bases. The resulting
  plot will location of samples in the new coordinate
  system if FALSE the variables for the matrix will be
  samples and the resulting plot whill show how each sample
  (variable) contributes to the principle component.the
  samples that are highly correlated should have similar
  contributions to the principal components.}

  \item{sd.filter}{If \code{TRUE}, the bases/regions with
  low variation will be discarded prior to PCA
  (default:TRUE)}

  \item{sd.threshold}{A numeric value. If
  \code{filterByQuantile} is \code{TRUE}, the value should
  be between 0 and 1 and the features whose standard
  deviations is less than the quantile denoted by
  \code{sd.threshold} will be removed. If
  \code{filterByQuantile} is \code{FALSE}, then features
  whose standard deviations is less than the value of
  \code{sd.threshold} will be removed.(default:0.5)}

  \item{filterByQuantile}{A logical determining if
  \code{sd.threshold} is to be interpreted as a quantile of
  all standard deviation values from bases/regions (the
  default), or as an absolute value}

  \item{obj.return}{if the result of \code{prcomp} function
  should be returned or not. (Default:FALSE)}
}
\value{
  The form of the value returned by \code{PCASamples} is
  the summary of principal component analysis by
  \code{prcomp}.
}
\description{
  The function does a PCA analysis using
  \code{\link[stats]{prcomp}} function using percent
  methylation matrix as an input.
}
\note{
  cor option is not in use anymore, since \code{prcomp} is
  used for PCA analysis instead of \code{princomp}
}
\examples{
data(methylKit)

# do PCA with filtering rows with low variation, filter rows with standard
# deviation lower than the 50th percentile of Standard deviation distribution
PCASamples(methylBase.obj,screeplot=FALSE, adj.lim=c(0.0004,0.1),
           scale=TRUE,center=TRUE,comp=c(1,2),transpose=TRUE,sd.filter=TRUE,
           sd.threshold=0.5,filterByQuantile=TRUE,obj.return=FALSE)
}

