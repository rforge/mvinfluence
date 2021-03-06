\name{influencePlot.mlm}
\alias{influencePlot.mlm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Influence Plots for Multivariate Linear Models
}
\description{
This function creates various types of
 \dQuote{bubble} plots of influence measures with the areas of the circles representing the 
observations proportional to Cook's distances. 

\code{type="stres"} plots squared (internally) Studentized residuals against hat values;
\code{type="cookd"} plots Cook's distance against hat values;
\code{type="LR"} plots residual components against leverage components,
with the property that contours of constant Cook's distance fall on diagonal
lines with slope = -1.
}
\usage{
\method{influencePlot}{mlm}(model, scale = 12, type=c("stres", "LR", "cookd"), 
	infl = mlm.influence(model, do.coef = FALSE), FUN = det, 
	fill = TRUE, fill.col = "red", fill.alpha.max = 0.5, 
	labels, 
	id.method = "noteworthy", id.n = if (id.method[1] == "identify") Inf else 0, 
	id.cex = 1, id.col = palette()[1], 
	ref.col = "gray", ref.lty = 2, ref.lab = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
An \code{mlm} object, as returned by \code{\link[stats]{lm}} with a multivariate response.
}
  \item{scale}{a factor to adjust the radii of the circles, in relation to \code{sqrt(CookD)}
}
  \item{type}{
Type of plot: one of \code{c("stres", "cookd", "LR")}
}
  \item{infl}{
influence measure structure as returned by \code{\link{mlm.influence}}
}
  \item{FUN}{
For \code{m>1}, the function to be applied to the \eqn{H} and \eqn{Q}
matrices returning a scalar value.  \code{FUN=det} and \code{FUN=tr}
are possible choices, returning the \eqn{|H|} and \eqn{tr(H)}
respectively.
}
  \item{labels, id.method, id.n, id.cex, id.col}{settings for labelling
points; see \code{link{showLabels}} for details. To omit point labelling, set
\code{id.n=0}, the default.  The default \code{id.method="noteworthy"} is used
in this function to indicate setting labels for points with large
Studentized residuals, hat-values or Cook's distances. See Details below.  Set 
\code{id.method="identify"} for interactive point identification.
}
  \item{fill, fill.col, fill.alpha.max}{
\code{fill}: logical, specifying whether the circles should be filled.
When \code{fill=TRUE}, \code{fill.col} gives the base fill color
to which transparency specified by \code{fill.alpha.max} is applied.
}
  \item{ref.col, ref.lty, ref.lab}{
arguments for reference lines.  Incompletely implemented in this version
}
  \item{\dots}{
other arguments passed down
}
}
\details{
The \code{id.method="noteworthy"} setting 
also requires setting \code{id.n>0} to have any effect.
Using \code{id.method="noteworthy"}, and \code{id.n>0}, the number of points labeled
is the union of the largest \code{id.n} values on each of L, R, and CookD.
}
\value{
  If points are identified, returns a data frame with the hat values, 
Studentized residuals and Cook's distance of the identified points.  If
no points are identified, nothing is returned.  This function is primarily
used for its side-effect of drawing a plot.
}
\references{
Barrett, B. E. and Ling, R. F. (1992).
General Classes of Influence Measures for Multivariate Regression.
\emph{Journal of the American Statistical Association}, \bold{87}(417), 184-191.

Barrett, B. E. (2003).
Understanding Influence in Multivariate Regression 
\emph{Communications in Statistics - Theory and Methods}, \bold{32}, 667-680.

McCulloch, C. E. & Meeter, D. (1983).
Discussion of "Outliers..." by R. J. Beckman and R. D. Cook.
 \emph{Technometrics},  25, 152-155
}
\author{
Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{mlm.influence}}, \code{\link{lrPlot}}

\code{\link[car]{influencePlot}} in the car package
}
\examples{
data(Rohwer, package="heplots")
Rohwer2 <- subset(Rohwer, subset=group==2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)

influencePlot(Rohwer.mod, id.n=4, type="stres")
influencePlot(Rohwer.mod, id.n=4, type="LR")
influencePlot(Rohwer.mod, id.n=4, type="cookd")

# Sake data
data(Sake, package="heplots")
	Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)
	influencePlot(Sake.mod, id.n=3, type="stres")
	influencePlot(Sake.mod, id.n=3, type="LR")
	influencePlot(Sake.mod, id.n=3, type="cookd")

# Adopted data	
data(Adopted, package="heplots")
	Adopted.mod <- lm(cbind(Age2IQ, Age4IQ, Age8IQ, Age13IQ) ~ AMED + BMIQ, data=Adopted)
  influencePlot(Adopted.mod, id.n=3)
	influencePlot(Adopted.mod, id.n=3, type="LR", ylim=c(-4,-1.5))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{regression}% __ONLY ONE__ keyword per line
\keyword{multivariate}% __ONLY ONE__ keyword per line
