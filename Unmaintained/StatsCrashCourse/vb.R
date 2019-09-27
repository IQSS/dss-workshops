quincunx <-
function(n = 80, mp=8,sleep = 0.1, bins = NULL, cexball = 2.5, cexpin = 1.2, prn =FALSE, seed = NULL) {
    ball <-
    function(x, y, whipe = TRUE, sleep = 0.2) {
        points(x, y, pch = pchball, cex = cexball, bg = bgball, fg = fgball)
        Sys.sleep(sleep)
        if (whipe) points(x, y, pch = 16, cex = cexball, col = "white")
    }
    odd <-
    function (x){
        x != as.integer(x/2) * 2
    }
    even <-
    function (x){
        x == as.integer(x/2) * 2
    }
#
#
    if (is.null (seed))
    my.seed <- round(as.numeric(Sys.time ()))
    else my.seed = seed
    set.seed(my.seed)
    oldpar <- par (mar = c(1, 1, 1, 1))
    on.exit(par (oldpar))
    np <- 10
    dx <- .5
    uy <- 4
    ly <- 8
    colpin <- 1
    pchpin <- 21
    #cexpin <- 1
    bgball <- "yellow" #8
    fgball <- "blue" #3
    pchball <- 21
    #cexball <- 1.7
    coltrace <- "red"
    collwd <- 1
    const <- 1
    dy=0.5
    eps <- dy/4 # plotting offset, not to eat pins
    x1 <- seq(1, np, 2 * dx)
    y1 <- seq(mp, 1, - 1) * const
    xs <- rep(c(x1 + .5, x1), mp/2)
    ys <- rep(y1, each = length (x1))
    par (pty = "s")
    plot(xs, ys, type = "n", xlim = c(0, np + 1.5), ylim = c( -ly, mp * const + uy), axes = FALSE, xlab = "", ylab = "")
    box()
    #axis(1)
    #axis(2)
    rug(seq(0, np + 1, 1), .3, col = "orange", lwd = 2)
    points(xs, ys, pch = pchpin, cex = cexpin, bg = colpin, fg = colpin, ylim = c( -mp, mp))
    ###
    xd <- seq(0, np + 1, 0.1)
    yd <- dnorm(xd, mean(x1), sqrt(n/4)/3) * n/3.5 - ly - 1
    #lines(xd, yd, col = "black", lwd = 3)
    #sleep <- 0.1
    lines(5.5 - c(2, 0.3, 0.3), c(12.4, 9.9, 9), lwd = 2, col = "black")
    lines(5.5 + c(0.3, 0.3), c(12.5, 9), lwd = 2, col = "black")
    #lines(5.5 + c(2, 0.25, 0.25), c(12.5, 10, 9), lwd = 2, col = "grey")
    ball (5.5, 9.4, FALSE)
    for (j in 0:3)
    for (i in 0:j)
    ball (5.5 - i * 0.5, 10 + j * 0.7, FALSE)
    if (is.null (bins)) {
        bins <- numeric(np + 1)
        for (i in 1:n) {
            dy <- 0.5
            starty <- mp * const + dy
            midx <- mean(x1)
            x <- midx
            xt <- x
            yt <- starty + dy
            for (y in seq(starty, 1, - dy)) {
                if (y%%1 == 0) x = x + sign(runif (1, - 1, 1)) * dx
                xt <- c(xt, x)
                yt <- c(yt, y)
                ball (x, y + eps, sleep = sleep)
                lines(xt, yt, col = coltrace, lwd = collwd)
            }
            binx <- x + 0.5
            bins[binx] = bins[binx] + 1
            while (y > - ly - 1 + bins[binx] * dy) {
                ball (x, y, sleep = sleep)
                y <- y - dy
            }
            y <- -ly - 1 + bins[binx] * dy
            epsx <- sign(5 - x) * (odd(bins[binx]) - 0.5) * 0.5
            epsy <- even(bins[binx]) * 0.5
            epsy2 <- ((bins[binx] - 1)%/%2) * 0.35
            ball (x + epsx, y - epsy - epsy2, FALSE)
            lines(xt, yt, col = "white", lwd = collwd)

        }
    }
    else {
        for (binx in 1:length (bins)) {
            x <- binx - .5
            bins.old <- bins
            bins[binx] = 0
            while (bins[binx] < bins.old[binx]) {
                bins[binx] = bins[binx] + 1
                y <- -ly - 1 + bins[binx] * dy
                epsx <- sign(5 - x) * (odd(bins[binx]) - 0.5) * 0.5
                epsy <- even(bins[binx]) * 0.5
                epsy2 <- ((bins[binx] - 1)%/%2) * 0.35
                ball (x + epsx, y - epsy - epsy2, FALSE)
            }
        }
    }
    dy <- 0.5
    starty <- mp * const+ dy
    midx <- mean(x1)
    x <- midx
    xt <- x
    yt <- starty + dy
    X <- rep(1:length(bins), bins) - .5
    m <- mean(X)
    s <- sd(X)
    n <- sum(bins)
    #cat("Mean=",m,"\nSD=", s,"\n")
    #rug(m, 0.05, col = "red", lwd = 3)
    lines(xd, dnorm(xd, m, s) * n/3 - ly - 1, col = "limegreen", lwd = 4)
    ##
    x <- midx
    xt <- x
    yt <- starty + dy
    for (y in seq(starty, 4 - dy, - dy)) {
        if (y%%1 == 0) x = x + sign(runif (1, - 1, 1)) * dx
        xt <- c(xt, x)
        yt <- c(yt, y)
        ball (x, y + eps, sleep = sleep)
        lines(xt, yt, col = coltrace, lwd = collwd)
    }
    ball (x, y + eps, FALSE)
    #lfn <- paste ("Q", my.seed, ".WMF", sep = "", collapse = "")
    # saveWMF (lfn, prn = prn)
    #cat("Bins:\n",bins,"\n")
    #return(list(file = lfn, seed = my.seed, bins = bins))
}

multiplot <- function(row,col){
     par(mfrow=c(row,col),pty="s")
   }

binomial.probability <- function(k, n, p){
 choose(n,k)*p^k*(1-p)^(n-k)
}

compute.margins <- function(sample.size,p){
## create an empty vector for holding probabilities:	
##MBB   probs <- rep(NA,sample.size)

## If the number of balls is sample.size, compute
## probabilities of getting 1...40 white balls:
##MBB  for(k in 1:sample.size){
##MBB     current_prob <- binomial.probability(k,sample.size,p)
##MBB     probs[k] <- current_prob
##MBB     }

probs <- binomial.probability(0:sample.size,sample.size,p)

## figure out the expected number of white balls, given the probability:
## for example, when p=0.5, then for a draw of 40 balls we expect
## 40*0.5 white balls. Call this the mean index (we need this to compute the margins):
##MBB mean.index <- (sample.size*p)
mean.index <- (sample.size*p) + 1
## figure out the maximum possible margin:
## it has to be the total number of balls drawn times p, minus 1. 
## E.g., for 40 balls, and p-0.5, the expected mean is 20, and the margins can be at most
## 19 to the left of 20 and 19 to the right of 20, because the total number of possible 
## white balls is 41: 
## 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,...,40.
##MBB max.margin <- sample.size*p-1
max.margin <- sample.size*p
## create a vector to hold the different intervals, e.g. 1,19 in our example:
intervals <- rep(NA,max.margin)

## now for all margins, 1...19, compute the probabilities for each margin:
##MBB for(i in 1:max.margin){
#   indices <- seq(mean.index-i,mean.index+i,by=1)
#   range <- probs[indices]
#   intervals[i] <- sum(range)
# }
##

for(i in 1:max.margin){
  indices <- seq(mean.index-i,mean.index+i,by=1)
  intervals[i] <- sum(probs[indices])
}

conf.intervals <- data.frame(margin=rep(1:max.margin),probability=intervals)

return(conf.intervals)
}

plot.margins <- function(sample.size,p,color="black",margin,main,interval=TRUE){

probs <- binomial.probability(0:sample.size,sample.size,p)
proportions <- 0:sample.size/sample.size

plot(proportions,probs,type="l",col="black",xlab="Proportions",
     ylab="Probability",main=main)

if(interval==TRUE){
# draw 95% confidence intervals
segments(proportions[(sample.size/2+1)-margin],-0.5,
         proportions[(sample.size/2+1)-margin],.06,col=color,lty=1,lwd=2)
segments(proportions[(sample.size/2+1)+margin],-0.5,
         proportions[(sample.size/2+1)+margin],.06,col=color,lty=1,lwd=2)
}
}

new.function <- function(x,mu,sigma){
  1/(sqrt(2*pi)*sigma)*exp(1)^(-((x - mu)^2/(2*sigma^2)))}

se <- function(x)
      {
        y <- x[!is.na(x)] # remove the missing values, if any
        sqrt(var(as.vector(y))/length(y))
}

ci <- function (scores){
m <- mean(scores,na.rm=TRUE)
stderr <- se(scores)
len <- length(scores)
upper <- m + qt(.975, df=len-1) * stderr 
lower <- m + qt(.025, df=len-1) * stderr 
return(data.frame(lower=lower,upper=upper))
}

new.var <- function(x){
	sum((x-mean(x))^2) / length(x)
}

new.sd <- function(x){
	sqrt(new.var(x))
}

## function for plotting type 1 error.
plot.type1.error<-function(x,
                           x.min,
                           x.max,
                           qnts,
                           mean,
                           sd,
                           gray.level,main,show.legend=TRUE){

	    	plot(x,dnorm(x,mean,sd), 
	    	     type = "l",xlab="",ylab="",main=main)
        abline(h = 0)

## left side    
    x1 = seq(x.min, qnorm(qnts[1]), qnts[1]/5)
    y1 = dnorm(x1, mean, sd)

    polygon(c(x1, rev(x1)), 
            c(rep(0, length(x1)), rev(y1)), 
            col = gray.level)

## right side            
    x1 = seq(qnorm(qnts[2]), x.max, qnts[1]/5)
    y1 = dnorm(x1, mean, sd)
    polygon(c(x1, rev(x1)), 
            c(rep(0, length(x1)), rev(y1)), 
            col = gray.level)
if(show.legend==TRUE){legend(2,0.3, legend="Type I error",fill=gray.level,cex=1)}

	}

plot.type1type2.error<-function(x,
                           x.min,
                           x.max,
                           qnts,
                           mean.null,
                           mean.true,
                           sd,
                           gray1,
                           gray2,main,show.legend=TRUE){
    	## the reality:
    	plot(x, dnorm(x,mean.true,sd), type = "l",ylab="",xlab="",main=main)
    	## null hypothesis distribution:
      lines(x,dnorm(x,mean.null,sd),col="black") 
      abline(h = 0)
    
    ## plot Type II error region: 
 
    	x1 = seq(qnorm(qnts[1]), x.max, qnts[1]/5)
        y1 = dnorm(x1, mean.true, sd) 
 
      polygon(c(x1, rev(x1)), 
              c(rep(0, length(x1)), 
              rev(y1)), col = gray2)

    ## plot Type I error region assuming alpha 0.05:

    x1 = seq(x.min, qnorm(qnts[1]), qnts[1]/5)
    y1 = dnorm(x1, mean.null, sd)
    polygon(c(x1, rev(x1)), c(rep(0, length(x1)), rev(y1)), col = gray1)

    x1 = seq(qnorm(qnts[2]), x.max, qnts[1]/5)
    y1 = dnorm(x1, mean.null, sd) ## changed
    polygon(c(x1, rev(x1)), c(rep(0, length(x1)), rev(y1)), col = gray1)

if(show.legend==TRUE){
    legend(2,0.3, legend=c("Type I error","Type II error"),
    fill=c(gray1,gray2),cex=1)}
}   

shadenormal2<- 
function (plot.only.type1=TRUE,
          alpha=0.05,
          gray1=gray(0.3), ## type I shading
          gray2=gray(0.7), ## type II shading
          x.min=-6,
          x.max=abs(x.min),
          x = seq(x.min, x.max, 0.01),
          mean.null=0,
          mean.true=-2,
          sd=1,main="",show.legend=TRUE) 
{

    qnt.lower<-alpha/2
    qnt.upper<-1-qnt.lower
    qnts<-c(qnt.lower,qnt.upper)
 
    if(plot.only.type1==TRUE){

     plot.type1.error(x,x.min,x.max,qnts,mean.null,sd,
     gray1,main,show.legend)     

    } else { ## plot type I and type II error regions
      
   plot.type1type2.error(x,
                         x.min,
                         x.max,
                         qnts,
                         mean.null,
                         mean.true,
                         sd,
                         gray1,
                         gray2,main,show.legend)     
      
     }

}

TOST <- function(mean1,mean2,theta,n1,n2,sigma){

d <-  (mean2 - mean1)

t1 <-  (d-theta)/(sigma*(sqrt((1/n1)+(1/n2))))

t2 <-  (d+theta)/(sigma*(sqrt((1/n1)+(1/n2))))

tcrit <- qt(.95,(n1+n2 - 2))

if((t1 < -tcrit) && (t2 > tcrit)){print(t1)
                                  print(t2)
                                  print(tcrit)
                                  print(c("Equivalent"))}
else{print(c("Failed to show equivalence"))}}

drawfittedline <- function(x,y){
  panel.xyplot(x,y)
        panel.lmline(x,y,type="l",lwd=1)}

compute95CIpopulation <- function(populationsize,samplesize,p){
females <- rbinom(samplesize,1,.4)
samplesumfemales <- sum(females)
sdsample <- sqrt(samplesize*p*(1-p))
sample95CI <- c(samplesumfemales - 2*sdsample,  
                samplesumfemales + 2*sdsample)
population95CI <- populationsize/samplesize * sample95CI
print(population95CI)}


