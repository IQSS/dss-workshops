###################################################
### chunk number 1: 
###################################################
## customize
options(prompt="> ", continue="   ",width=59,
show.signif.stars=FALSE)

options(SweaveHooks=list(fig=function() par(bg="white", fg="black")))

#set.seed(987654321)



###################################################
### chunk number 2: 
###################################################
scores <- c(99,97,72,56,88,80,74,95,66,57,89) # create data set


###################################################
### chunk number 3: 
###################################################

max(scores)
min(scores)


###################################################
### chunk number 4: 
###################################################
mean(scores)


###################################################
### chunk number 5: 
###################################################
var(scores)


###################################################
### chunk number 6: 
###################################################
sd(scores)
sqrt(var(scores))


###################################################
### chunk number 7: 
###################################################
median(scores)


###################################################
### chunk number 8: 
###################################################
quantile(scores,.25)
IQR(scores)
fivenum(scores)
summary(scores)


###################################################
### chunk number 9: scoresboxplot
###################################################
boxplot(scores)


###################################################
### chunk number 10: 
###################################################
boxplot(scores)


###################################################
### chunk number 11: scoreshist
###################################################
hist(scores)


###################################################
### chunk number 12: 
###################################################
hist(scores)


###################################################
### chunk number 13: 
###################################################
rbinom(1, 1, 0.5)



###################################################
### chunk number 14: 
###################################################
rbinom(10, 1, 0.5)


###################################################
### chunk number 15: 
###################################################
rbinom(10, 1, 0.5)


###################################################
### chunk number 16: 
###################################################
sum(rbinom(10, 1, 0.5)) / 10


###################################################
### chunk number 17: 
###################################################
sum(rbinom(100, 1, 0.5)) / 100
sum(rbinom(1000, 1, 0.5)) / 1000
sum(rbinom(1000000, 1, 0.5)) / 1000000


###################################################
### chunk number 18: 
###################################################
rbinom(1, 40, 0.5)


###################################################
### chunk number 19: 
###################################################
rbinom(10, 40, 0.5)


###################################################
### chunk number 20: 
###################################################
results <- rbinom(1000, 40, 0.5)


###################################################
### chunk number 21: fortydrops1000times
###################################################
##MBB modified histogram to bin by individual counts
hist(results, breaks=0:40)


###################################################
### chunk number 22: 
###################################################
##MBB modified histogram to bin by individual counts
hist(results, breaks=0:40)


###################################################
### chunk number 23: rstonehits
###################################################
multiplot(2,2)

p <- 0.5
drops <- 40
replicates <- c(15,25,100,1000)

for(i in replicates){
	results<-rbinom(i,drops,p)
	title <- paste(c("No. Obs.",i,sep=" ")) 
    # plot histogram:
    hist(results,
		breaks=0:40,
       ylab="Frequency", 
       xlab="No. of R-stone hits",      
       main=title)
}



###################################################
### chunk number 24: 
###################################################
par(mfrow=c(2,2),pty="s")


###################################################
### chunk number 25: 
###################################################

multiplot <- function(row,col){
     par(mfrow=c(row,col),pty="s")
   }



###################################################
### chunk number 26: 
###################################################
p <- 0.5
drops <- 40
replicates <- c(15,25,100,1000)


###################################################
### chunk number 27: 
###################################################
multiplot(2,2)

p <- 0.5
drops <- 40
replicates <- c(15,25,100,1000)

for(i in replicates){
	results<-rbinom(i,drops,p)
	title <- paste(c("No. Obs.",i,sep=" ")) 
    # plot histogram:
    hist(results,
		breaks=0:40,
       ylab="Frequency", 
       xlab="No. of R-stone hits",      
       main=title)
}



###################################################
### chunk number 28: fortydrops1000timesRelFreq
###################################################
hist(results, breaks=0:40, freq=FALSE)


###################################################
### chunk number 29: 
###################################################
hist(results, breaks=0:40, freq=FALSE)


###################################################
### chunk number 30: 
###################################################
choose(4, 3)


###################################################
### chunk number 31: 
###################################################
choose(4, 0:4)


###################################################
### chunk number 32: 
###################################################
choose(40, 13)


###################################################
### chunk number 33: zeroto40Rs
###################################################
num.outcomes <- choose(40, 0:40)
plot(num.outcomes)


###################################################
### chunk number 34: 
###################################################
num.outcomes <- choose(40, 0:40)
plot(num.outcomes)


###################################################
### chunk number 35: 
###################################################
#modified this to print out result:
p <- (0.5^40)


###################################################
### chunk number 36: binomdist
###################################################
binom.distr.40 <- choose(40, 0:40) * p
plot(binom.distr.40)


###################################################
### chunk number 37: 
###################################################
binom.distr.40 <- choose(40, 0:40) * p
plot(binom.distr.40)


###################################################
### chunk number 38: 
###################################################
sum(binom.distr.40)


###################################################
### chunk number 39: 
###################################################
choose(40, 20) * p


###################################################
### chunk number 40: 
###################################################
mean(results)


###################################################
### chunk number 41: boxOfBalls
###################################################
box <- c(rep(1, 9000), rep(0, 3000))					
sample.counts <- rep(NA, 1000)						

for(i in 1:1000){										
  a.sample <- sample(box, 100)							
  sample.counts[i] <- sum(a.sample)					
}

multiplot(1, 2)
hist(sample.counts, breaks=50:100)
hist(sample.counts, breaks=50:100, freq=FALSE)			


###################################################
### chunk number 42: 
###################################################
box <- c(rep(1, 9000), rep(0, 3000))					
sample.counts <- rep(NA, 1000)						

for(i in 1:1000){										
  a.sample <- sample(box, 100)							
  sample.counts[i] <- sum(a.sample)					
}

multiplot(1, 2)
hist(sample.counts, breaks=50:100)
hist(sample.counts, breaks=50:100, freq=FALSE)			


###################################################
### chunk number 43: 
###################################################
# reordered arguments to be congruent with dbinom()
binomial.probability <- function(k, n, p){
 choose(n,k)*p^k*(1-p)^(n-k)
}


###################################################
### chunk number 44: 
###################################################
binomial.probability(75,100,3/4)


###################################################
### chunk number 45: 
###################################################
dbinom(75,100,3/4)


###################################################
### chunk number 46: 
###################################################
binomial.probability(750,1000,3/4)


###################################################
### chunk number 47: 
###################################################
n <- 40;  p <- 0.5;
probs <- binomial.probability(0:n, n, p)


###################################################
### chunk number 48: 
###################################################
probs[20:22]


###################################################
### chunk number 49: 
###################################################

sum(probs[20:22])



###################################################
### chunk number 50: 
###################################################

sum(probs[19:23])



###################################################
### chunk number 51: 
###################################################
# The 95% CI:
# Looking at probabilities around a mean value:

##MBB simplified code slightly
# mean.index <- 20
# intervals <- rep(NA,19)
# 
# for(i in 1:19){
#   indices <- seq(mean.index-i,mean.index+i,by=1)
#   range <- probs[indices]
#   intervals[i] <- sum(range)
# }
# 
# conf.intervals <- data.frame(margin=rep(1:19),probability=intervals)
# 
# conf.intervals40 <- conf.intervals
# 
# print(head(conf.intervals))

mean.index <- 21
intervals <- rep(NA,20)

for(i in 1:20){
  indices <- seq(mean.index-i,mean.index+i,by=1)
  intervals[i] <- sum(probs[indices])
}

conf.intervals <- data.frame(margin=rep(1:20),probability=intervals)

head(conf.intervals)



###################################################
### chunk number 52: marginoferror40
###################################################
main.title<-"Sample size 40"
plot(conf.intervals$margin,
     conf.intervals$probability,type="b",xlab="Margins",ylab="Probability",main=main.title)

segments(0,.95,5.7,.95)
segments(5.7,0,5.7,.95)



###################################################
### chunk number 53: 
###################################################
main.title<-"Sample size 40"
plot(conf.intervals$margin,
     conf.intervals$probability,type="b",xlab="Margins",ylab="Probability",main=main.title)

segments(0,.95,5.7,.95)
segments(5.7,0,5.7,.95)



###################################################
### chunk number 54: 
###################################################
box = c(rep(1, 6000), rep(0, 6000))	
sum(sample(box, 40))


###################################################
### chunk number 55: 
###################################################
n <- 400 
p <- 0.5      
probs <- binomial.probability(0:n,n,p)
  
mean.index <- 201
intervals <- rep(NA,200)

for(i in 1:200){
  indices <- seq(mean.index-i,mean.index+i,by=1)
  intervals[i] <- sum(probs[indices])
}

conf.intervals <- data.frame(margin=rep(1:200),probability=intervals)

head(conf.intervals)


###################################################
### chunk number 56: marginoferror400
###################################################
 main.title<-"Sample size 400"
plot(conf.intervals$margin,conf.intervals$probability,type="b",xlab="Margins",ylab="Probability",main=main.title)

segments(-6,.95,19,.95)
segments(19,0,19,.95)



###################################################
### chunk number 57: 
###################################################
 main.title<-"Sample size 400"
plot(conf.intervals$margin,conf.intervals$probability,type="b",xlab="Margins",ylab="Probability",main=main.title)

segments(-6,.95,19,.95)
segments(19,0,19,.95)



###################################################
### chunk number 58: 
###################################################
##MBB edited this to be consistent with previous changes
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
  


###################################################
### chunk number 59: 
###################################################
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




###################################################
### chunk number 60: margin40and400
###################################################
multiplot(1,2)

main.title.40<-"Sample size 40"
main.title.400<-"Sample size 400"
plot.margins(40,.5,margin=5,main=main.title)
plot.margins(400,.5,margin=19,main=main.title)



###################################################
### chunk number 61: 
###################################################
multiplot(1,2)

main.title.40<-"Sample size 40"
main.title.400<-"Sample size 400"
plot.margins(40,.5,margin=5,main=main.title)
plot.margins(400,.5,margin=19,main=main.title)



###################################################
### chunk number 62: 
###################################################

sums<-rep(NA,21)

for(i in 0:20){
  sums[i+1]<-dbinom(i,40,0.5)
}

sum(sums)
  


###################################################
### chunk number 63: 
###################################################

sum(dbinom(0:20,40,0.5))



###################################################
### chunk number 64: 
###################################################

pbinom(20,40,0.5)



###################################################
### chunk number 65: stones4000
###################################################
p <- 0.5
sample.sizes <- c(4,40,400,4000)

multiplot(2,2)

xlabel<-"Number of R-stone hits"

for(n in sample.sizes) {
	results <- rbinom(100, n, p)	
	maintitle <- paste(n,"drops",sep=" ")
	hist(results,
     xlim=range(c(0:n)),
     xlab=xlabel,main=maintitle)
}




###################################################
### chunk number 66: 
###################################################
p <- 0.5
sample.sizes <- c(4,40,400,4000)

multiplot(2,2)

xlabel<-"Number of R-stone hits"

for(n in sample.sizes) {
	results <- rbinom(100, n, p)	
	maintitle <- paste(n,"drops",sep=" ")
	hist(results,
     xlim=range(c(0:n)),
     xlab=xlabel,main=maintitle)
}




###################################################
### chunk number 67: sdincreasing
###################################################
sample.sizes <- 1:400
p <- 0.5
standard.deviations <- rep(NA, 400)

for (n in sample.sizes){
       binomial.distribution.count <- rbinom(100, n, p)
       standard.deviations[n] <- sd(binomial.distribution.count)
}

plot(sample.sizes, standard.deviations,
    xlim=c(1,400),
    xlab="Sample size",
    ylab="Standard deviation")



###################################################
### chunk number 68: 
###################################################
sample.sizes <- 1:400
p <- 0.5
standard.deviations <- rep(NA, 400)

for (n in sample.sizes){
       binomial.distribution.count <- rbinom(100, n, p)
       standard.deviations[n] <- sd(binomial.distribution.count)
}

plot(sample.sizes, standard.deviations,
    xlim=c(1,400),
    xlab="Sample size",
    ylab="Standard deviation")



###################################################
### chunk number 69: prophits
###################################################
p <- 0.5
sample.sizes <- c(4,40,400,4000)

multiplot(2,2)

for(n in sample.sizes) {
	results <- rbinom(100, n, p)/n
	
	maintitle <- paste(n,"drops",sep=" ")

xlabel<-"Proportion of R-stone hits"

	hist(results,
     xlim=range(c(0:1)),
     xlab=xlabel,main=maintitle)
}



###################################################
### chunk number 70: sddecreasing
###################################################
sample.sizes <- 1:400
p <- 0.5
standard.deviations <- rep(NA, 400)

for (n in sample.sizes){
       ## binomial distribution proportion:
       binomial.distribution.prop <- rbinom(100, n, p)/n
       standard.deviations[n] <- sd(binomial.distribution.prop)
}

plot(sample.sizes, standard.deviations,
    xlim=c(1,400),
    xlab="Sample size",
    ylab="Standard deviation")





###################################################
### chunk number 71: 
###################################################
p <- 0.5
sample.sizes <- c(4,40,400,4000)

multiplot(2,2)

for(n in sample.sizes) {
	results <- rbinom(100, n, p)/n
	
	maintitle <- paste(n,"drops",sep=" ")

xlabel<-"Proportion of R-stone hits"

	hist(results,
     xlim=range(c(0:1)),
     xlab=xlabel,main=maintitle)
}



###################################################
### chunk number 72: 
###################################################
sample.sizes <- 1:400
p <- 0.5
standard.deviations <- rep(NA, 400)

for (n in sample.sizes){
       ## binomial distribution proportion:
       binomial.distribution.prop <- rbinom(100, n, p)/n
       standard.deviations[n] <- sd(binomial.distribution.prop)
}

plot(sample.sizes, standard.deviations,
    xlim=c(1,400),
    xlab="Sample size",
    ylab="Standard deviation")





###################################################
### chunk number 73: 
###################################################
vector<-1:10


###################################################
### chunk number 74: 
###################################################
vector.mean<-mean(vector)


###################################################
### chunk number 75: 
###################################################
sum((vector-vector.mean)^2)


###################################################
### chunk number 76: 
###################################################
size <- 1; p <- 0.5; num.drops <- 4000; results <- rep(NA,100)
for (i in 1:100){
  results[i] <- sum(rbinom(num.drops,size,p))  
  }
mean.results<-mean(results); n<-floor(mean.results-1); m<-floor(mean.results+1)

# candidates we can subtract deviations from:
xvalues <- c(1:n,mean.results,m:4000)

all.sq.deviations <- rep(NA,length(xvalues))

for(i in xvalues){
  vector.i <- rep(i,100) 
  deviations <- results - vector.i 

  sq.deviations <- sum(deviations^2) 
  all.sq.deviations[i] <- sq.deviations
}



###################################################
### chunk number 77: meanmin
###################################################
xlabel<-"Potential minimizers of sum of squared deviation"
plot(xvalues,all.sq.deviations,
     xlab=xlabel,
     ylab="Squared Deviation")
lines(xvalues,all.sq.deviations)


###################################################
### chunk number 78: 
###################################################
xlabel<-"Potential minimizers of sum of squared deviation"
plot(xvalues,all.sq.deviations,
     xlab=xlabel,
     ylab="Squared Deviation")
lines(xvalues,all.sq.deviations)


###################################################
### chunk number 79: 
###################################################
new.function <- function(x,mu,sigma){
  1/(sqrt(2*pi)*sigma)*exp(1)^(-((x - mu)^2/(2*sigma^2)))}


###################################################
### chunk number 80: binomialvsnormal
###################################################
main.title<-"Comparing the binomial and normal distributions"

plot.margins(40,.5,40,margin=20,main=main.title,interval=FALSE)
lines(c(1:40)/40,new.function(c(1:40),20,3),col="black",lty=2)


###################################################
### chunk number 81: 
###################################################
main.title<-"Comparing the binomial and normal distributions"

plot.margins(40,.5,40,margin=20,main=main.title,interval=FALSE)
lines(c(1:40)/40,new.function(c(1:40),20,3),col="black",lty=2)


###################################################
### chunk number 82: 
###################################################

integrate(function(x) dnorm(x, mean = 0, sd = 1), -2, 2)
integrate(function(x) dnorm(x, mean = 0, sd = 4), -8, 8)



###################################################
### chunk number 83: normal2SD
###################################################
main.title<-"Area within 2 SD of the mean"

multiplot(1, 2)
plot(function(x) dnorm(x, mean = 0, sd = 1), xlim=c(-3, 3),main="SD 1",xlab="x",ylab="",cex=2)
segments(-2, 0, -2, 0.4)
segments(2, 0, 2, 0.4)

plot(function(x) dnorm(x, mean = 0, sd = 4), xlim=c(-12, 12),main="SD 4",xlab="x",ylab="",cex=2)
segments(-8, 0, -8, 0.1)
segments(8, 0, 8, 0.1)


###################################################
### chunk number 84: 
###################################################
main.title<-"Area within 2 SD of the mean"

multiplot(1, 2)
plot(function(x) dnorm(x, mean = 0, sd = 1), xlim=c(-3, 3),main="SD 1",xlab="x",ylab="",cex=2)
segments(-2, 0, -2, 0.4)
segments(2, 0, 2, 0.4)

plot(function(x) dnorm(x, mean = 0, sd = 4), xlim=c(-12, 12),main="SD 4",xlab="x",ylab="",cex=2)
segments(-8, 0, -8, 0.1)
segments(8, 0, 8, 0.1)


###################################################
### chunk number 85: 
###################################################
#1000 samples of 40 taken repeatedly:
sample.means <- rep(NA,1000)
for(i in 1:1000){
  sample.40 <- rnorm(40,mean=60,sd=4)
  sample.means[i] <- mean(sample.40)
}



###################################################
### chunk number 86: 
###################################################
means40<-mean(sample.means)
sd40<-sd(sample.means)



###################################################
### chunk number 87: sdsmplot40
###################################################
hist(sample.means)


###################################################
### chunk number 88: 
###################################################
hist(sample.means)


###################################################
### chunk number 89: 
###################################################

##MBB changed variable names, simplified range of i

sample.means <- rep(NA,1000)

for(i in 1:1000){
  sample.100 <- rnorm(100,mean=60,sd=4)
  sample.means[i] <- mean(sample.100)
}



###################################################
### chunk number 90: 
###################################################
means100 <- mean(sample.means)
sd100 <- sd(sample.means)



###################################################
### chunk number 91: sdsmplot100
###################################################
hist(sample.means)


###################################################
### chunk number 92: 
###################################################
hist(sample.means)


###################################################
### chunk number 93: 
###################################################

4/sqrt(40)

4/sqrt(100)



###################################################
### chunk number 94: exppopulation
###################################################
sample.100 <- rexp(100, 1/60)
hist(sample.100)


###################################################
### chunk number 95: 
###################################################
sample.100 <- rexp(100, 1/60)
hist(sample.100)


###################################################
### chunk number 96: exponentialsdsm
###################################################
##MBB changed variable names, simplified, range of i, changed caption, changed mean
sample.means <- rep(NA,1000)

for(i in 1:1000){ 
	sample.100 <- rexp(100, 1/60)
	sample.means[i] <- mean(sample.100)
}

hist(sample.means)


###################################################
### chunk number 97: 
###################################################
##MBB changed variable names, simplified, range of i, changed caption, changed mean
sample.means <- rep(NA,1000)

for(i in 1:1000){ 
	sample.100 <- rexp(100, 1/60)
	sample.means[i] <- mean(sample.100)
}

hist(sample.means)


###################################################
### chunk number 98: 
###################################################

sample.11 <- rnorm(11,mean=60,sd=4)



###################################################
### chunk number 99: 
###################################################
estimated.mean <- mean(sample.11)
SD.population <- 4 
n <- length(sample.11)
SD.distribution <- SD.population/sqrt(n)


###################################################
### chunk number 100: 
###################################################
##MBB changed variable names
sample.44 <- rnorm(44,mean=60,sd=4)
estimated.mean <- mean(sample.44)
n <- length(sample.44)
(SD.distribution <- 4/sqrt(n))



###################################################
### chunk number 101: sdsample
###################################################
sample.sds <- rep(NA,1000)
for(i in c(1:1000)){
  sample.40 <- rnorm(40,mean=60,sd=4)
  sample.sds[i] <- sd(sample.40)
}
hist(sample.sds)


###################################################
### chunk number 102: 
###################################################
sample.sds <- rep(NA,1000)
for(i in c(1:1000)){
  sample.40 <- rnorm(40,mean=60,sd=4)
  sample.sds[i] <- sd(sample.40)
}
hist(sample.sds)


###################################################
### chunk number 103: sdsampleexp
###################################################
sample.sds <- rep(NA,1000)
for(i in c(1:1000)){
  sample.sds[i] <- sd(rexp(40))
}
hist(sample.sds)


###################################################
### chunk number 104: 
###################################################
sample.sds <- rep(NA,1000)
for(i in c(1:1000)){
  sample.sds[i] <- sd(rexp(40))
}
hist(sample.sds)


###################################################
### chunk number 105: tversusnorm
###################################################
range <- seq(-4,4,.01)  
 
multiplot(2,2)

 for(i in c(2,5,15,20)){
   plot(range,dnorm(range),lty=1,col=gray(0.5),xlab="",ylab="",cex.axis=1.5)
   lines(range,dt(range,df=i),lty=2,lwd=2)
   mtext(paste("df=",i),cex=1.2)
 }



###################################################
### chunk number 106: 
###################################################
range <- seq(-4,4,.01)  
 
multiplot(2,2)

 for(i in c(2,5,15,20)){
   plot(range,dnorm(range),lty=1,col=gray(0.5),xlab="",ylab="",cex.axis=1.5)
   lines(range,dt(range,df=i),lty=2,lwd=2)
   mtext(paste("df=",i),cex=1.2)
 }




###################################################
### chunk number 107: 
###################################################
sample <- rnorm(11,mean=60,sd=4)


###################################################
### chunk number 108: 
###################################################

t.test(sample)$conf.int



###################################################
### chunk number 109: 
###################################################

sample <- rnorm(100,mean=60,sd=4)



###################################################
### chunk number 110: 
###################################################
t.test(sample)$conf.int



###################################################
### chunk number 111: 
###################################################

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



###################################################
### chunk number 112: 
###################################################

lower <- rep(NA,100)
upper <- rep(NA,100)

for(i in 1:100){ 
  sample <- rnorm(100,mean=60,sd=4)
  lower[i] <- ci(sample)$lower
  upper[i] <- ci(sample)$upper
}
  
cis <- cbind(lower,upper)

head(cis)



###################################################
### chunk number 113: 
###################################################

store <- rep(NA,100)

pop.mean<-60
pop.sd<-4

for(i in 1:100){ 
  sample <- rnorm(100,mean=pop.mean,sd=pop.sd)
  lower[i] <- ci(sample)$lower
  upper[i] <- ci(sample)$upper
  if(lower[i]<pop.mean & upper[i]>pop.mean){
    store[i] <- TRUE} else {
      store[i] <- FALSE}
}

## need this for the plot below:
cis <- cbind(lower,upper)


## convert store to factor:
store<-factor(store)

summary(store)



###################################################
### chunk number 114: repeatedCIsplot
###################################################

main.title<-"95% CIs in 100 repeated samples"

line.width<-ifelse(store==FALSE,2,1)
cis<-cbind(cis,line.width)
x<-0:100
y<-seq(55,65,by=1/10)
plot(x,y,type="n",xlab="i-th repeated sample",ylab="Scores",main=main.title)
abline(60,0,lwd=2)
x0<-x
x1<-x
arrows(x0,y0=cis[,1],
       x1,y1=cis[,2],length=0,lwd=cis[,3])


###################################################
### chunk number 115: 
###################################################

main.title<-"95% CIs in 100 repeated samples"

line.width<-ifelse(store==FALSE,2,1)
cis<-cbind(cis,line.width)
x<-0:100
y<-seq(55,65,by=1/10)
plot(x,y,type="n",xlab="i-th repeated sample",ylab="Scores",main=main.title)
abline(60,0,lwd=2)
x0<-x
x1<-x
arrows(x0,y0=cis[,1],
       x1,y1=cis[,2],length=0,lwd=cis[,3])


###################################################
### chunk number 116: 
###################################################
# re-define variance to see whether it is an unbiased estimator 

##MBB edited and simplified code, and expressed it in terms of sd
new.var <- function(x){
	sum((x-mean(x))^2) / length(x)
}

new.sd <- function(x){
	sqrt(new.var(x))
}

correct <- rep(NA,1000)
incorrect <- rep(NA,1000)

for(i in 1:1000){
  sample.10 <- rnorm(10, mean=0, sd=1)
  correct[i] <- sd(sample.10)
  incorrect[i] <- new.sd(sample.10)
}
       


###################################################
### chunk number 117: nminus1
###################################################
multiplot(1,2)
hist(correct,main=paste("Mean ",round(mean(correct),digits=2),sep=" "))
hist(incorrect,main=paste("Mean ",round(mean(incorrect),digits=2),sep=" "))



###################################################
### chunk number 118: 
###################################################
multiplot(1,2)
hist(correct,main=paste("Mean ",round(mean(correct),digits=2),sep=" "))
hist(incorrect,main=paste("Mean ",round(mean(incorrect),digits=2),sep=" "))



###################################################
### chunk number 119: 
###################################################
SD.distribution = 4/sqrt(11)


###################################################
### chunk number 120: nullhypexample
###################################################
range <- seq(55,85,0.01)

plot(range,dnorm(range,mean=70,
     sd=SD.distribution),type="l",ylab="",main="The null hypothesis")


###################################################
### chunk number 121: 
###################################################
range <- seq(55,85,0.01)

plot(range,dnorm(range,mean=70,
     sd=SD.distribution),type="l",ylab="",main="The null hypothesis")


###################################################
### chunk number 122: 
###################################################

sample <- rnorm(11,mean=60,sd=4)



###################################################
### chunk number 123: 
###################################################

sample.mean <- mean(sample)



###################################################
### chunk number 124: sampleMeanVsZ
###################################################

sample.means <- rep(NA, 1000)
zs <- rep(NA, 1000)

for(i in 1:1000){
  sample.11 <- rnorm(11,mean=70,sd=4)
  sample.means[i] <- mean(sample.11)
  zs[i] <- ( mean(sample.11) - 70 ) / (4/sqrt(11))	  
}


multiplot(2, 2)
sd.dist <- 4/sqrt(11)
plot(density(sample.means),xlim=range(70-(4*sd.dist), 70+(4*sd.dist)),xlab="",ylab="",main="")	
plot(density(zs),xlim=range(-4, 4),xlab="",ylab="",main="")
plot(function(x) dnorm(x, 70, 4/sqrt(11)), 70-(4*sd.dist), 70+(4*sd.dist),xlab="",ylab="",main="")	
plot(function(x) dnorm(x, 0, 1), -4, 4,xlab="",ylab="",main="")



###################################################
### chunk number 125: 
###################################################

sample.means <- rep(NA, 1000)
zs <- rep(NA, 1000)

for(i in 1:1000){
  sample.11 <- rnorm(11,mean=70,sd=4)
  sample.means[i] <- mean(sample.11)
  zs[i] <- ( mean(sample.11) - 70 ) / (4/sqrt(11))	  
}


multiplot(2, 2)
sd.dist <- 4/sqrt(11)
plot(density(sample.means),xlim=range(70-(4*sd.dist), 70+(4*sd.dist)),xlab="",ylab="",main="")	
plot(density(zs),xlim=range(-4, 4),xlab="",ylab="",main="")
plot(function(x) dnorm(x, 70, 4/sqrt(11)), 70-(4*sd.dist), 70+(4*sd.dist),xlab="",ylab="",main="")	
plot(function(x) dnorm(x, 0, 1), -4, 4,xlab="",ylab="",main="")



###################################################
### chunk number 126: 
###################################################
integrate(function(x) dnorm(x, mean = 0, sd = 1), -Inf, -8.291562)


###################################################
### chunk number 127: 
###################################################
integrate(function(x) dnorm(x, mean = 70, sd = 4/sqrt(11)), -Inf, 60)


###################################################
### chunk number 128: 
###################################################
(67.58-70)/(4/sqrt(11))


###################################################
### chunk number 129: 
###################################################
integrate(function(x) dnorm(x, 0, 1), -Inf, -2.0)


###################################################
### chunk number 130: tVsZ
###################################################
zs <- rep(NA,10000)
ts <- rep(NA,10000)
for(i in 1:10000){
  sample.4 <- rnorm(4,mean=70,sd=4)
  zs[i] <- ( mean(sample.4) - 70) / (4/sqrt(4) )
  ts[i] <- ( mean(sample.4) - 70) / (sd(sample.4)/sqrt(4) )
}

multiplot(2, 2)

plot(density(zs),xlim=range(-4, 4),xlab="z-scores",ylab="",main="Sampling distribution of z")	
plot(density(ts),xlim=range(-4, 4),xlab="t-scores",ylab="",main="Sampling distribution of t")
plot(function(x) dnorm(x, 0, 1), -4, 4,xlab="x",ylab="",main="Limiting case: normal distribution")	
plot(function(x) dt(x, 3), -4, 4,xlab="x",ylab="",main="Limiting case: t-distribution")



###################################################
### chunk number 131: 
###################################################
zs <- rep(NA,10000)
ts <- rep(NA,10000)
for(i in 1:10000){
  sample.4 <- rnorm(4,mean=70,sd=4)
  zs[i] <- ( mean(sample.4) - 70) / (4/sqrt(4) )
  ts[i] <- ( mean(sample.4) - 70) / (sd(sample.4)/sqrt(4) )
}

multiplot(2, 2)

plot(density(zs),xlim=range(-4, 4),xlab="z-scores",ylab="",main="Sampling distribution of z")	
plot(density(ts),xlim=range(-4, 4),xlab="t-scores",ylab="",main="Sampling distribution of t")
plot(function(x) dnorm(x, 0, 1), -4, 4,xlab="x",ylab="",main="Limiting case: normal distribution")	
plot(function(x) dt(x, 3), -4, 4,xlab="x",ylab="",main="Limiting case: t-distribution")



###################################################
### chunk number 132: 
###################################################
(67.58-70)/(4/sqrt(11))


###################################################
### chunk number 133: 
###################################################
integrate(function(x) dt(x, 10), -Inf, -2.006558)


###################################################
### chunk number 134: 
###################################################
integrate(function(x) dt(x, 20), -Inf, -2.006558)


###################################################
### chunk number 135: 
###################################################

sample.11 <- rnorm(11,mean=60,sd=4)

t.test(sample.11,
       alternative = "two.sided",
       mu = 70, 
       conf.level = 0.95)



###################################################
### chunk number 136: 
###################################################

(mean(sample.11)-70)/se(sample.11)



###################################################
### chunk number 137: 
###################################################
d <- rep(NA,1000)

for(i in 1:1000){
  sample1 <- rnorm(10,mean=30,sd=43)
  sample2 <- rnorm(20,mean=7,sd=25)
  d[i] <- mean(sample1) - mean(sample2)
}


###################################################
### chunk number 138: 
###################################################

30-7

mean(d)


###################################################
### chunk number 139: diff
###################################################
hist(d)


###################################################
### chunk number 140: 
###################################################
hist(d)


###################################################
### chunk number 141: 
###################################################
newsigma<-round(sqrt((43^2/10)+(25^2/20)),digits=4)


###################################################
### chunk number 142: 
###################################################
newsigma<-round(sqrt((43^2/10)+(25^2/20)),digits=4)


###################################################
### chunk number 143: 
###################################################

t.test.result<-t.test(sample1,sample2,
       mu=0,
       alternative = "two.sided",
        conf.level = 0.95,var.equal=FALSE)


###################################################
### chunk number 144: 
###################################################

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




###################################################
### chunk number 145: 
###################################################

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





###################################################
### chunk number 146: 
###################################################

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



###################################################
### chunk number 147: nullhyprejectionregion
###################################################
shadenormal2(plot.only.type1=TRUE)


###################################################
### chunk number 148: 
###################################################
shadenormal2(plot.only.type1=TRUE)


###################################################
### chunk number 149: nullvstrue
###################################################
shadenormal2(plot.only.type1=TRUE)
xvals <- seq(-6,6,.1)
lines(xvals,dnorm(xvals,mean=-2,sd=1),lwd=2)


###################################################
### chunk number 150: 
###################################################
shadenormal2(plot.only.type1=TRUE)
xvals <- seq(-6,6,.1)
lines(xvals,dnorm(xvals,mean=-2,sd=1),lwd=2)


###################################################
### chunk number 151: nullvstrue2
###################################################
shadenormal2(plot.only.type1=FALSE)


###################################################
### chunk number 152: 
###################################################
shadenormal2(plot.only.type1=FALSE)


###################################################
### chunk number 153: nullvstrue3
###################################################
shadenormal2(plot.only.type1=FALSE,mean.true=-4)


###################################################
### chunk number 154: 
###################################################
shadenormal2(plot.only.type1=FALSE,mean.true=-4)


###################################################
### chunk number 155: nullvstrue4
###################################################
shadenormal2(plot.only.type1=FALSE,alpha=0.01,main="alpha=.01")


###################################################
### chunk number 156: 
###################################################
shadenormal2(plot.only.type1=FALSE,alpha=0.01,main="alpha=.01")


###################################################
### chunk number 157: nullvstrue5
###################################################
## simulating larger sample size by decreasing SD to 0.75 from 1:
shadenormal2(plot.only.type1=FALSE,sd=0.75,main="Larger sample size")


###################################################
### chunk number 158: 
###################################################
## simulating larger sample size by decreasing SD to 0.75 from 1:
shadenormal2(plot.only.type1=FALSE,sd=0.75,main="Larger sample size")


###################################################
### chunk number 159: 
###################################################
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


###################################################
### chunk number 160: pvalspower
###################################################
multiplot(1,2)
shadenormal2(plot.only.type1=FALSE,mean.true=-1.9,main="Lower p,\n higher observed power",show.legend=FALSE)
shadenormal2(plot.only.type1=FALSE,mean.true=-1,main="Higher p, \n lower observed power",show.legend=FALSE)


###################################################
### chunk number 161: 
###################################################
multiplot(1,2)
shadenormal2(plot.only.type1=FALSE,mean.true=-1.9,main="Lower p,\n higher observed power",show.legend=FALSE)
shadenormal2(plot.only.type1=FALSE,mean.true=-1,main="Higher p, \n lower observed power",show.legend=FALSE)


###################################################
### chunk number 162: erroraboutzero
###################################################
errors <- rep(NA,1000)

for(i in 1:1000){
  sample <- rnorm(10,mean=60,sd=1)
  errors[i] <- mean(sample) - 60
}
hist(errors)
#plot(density(errors),xlab="",ylab="",main="")


###################################################
### chunk number 163: 
###################################################
errors <- rep(NA,1000)

for(i in 1:1000){
  sample <- rnorm(10,mean=60,sd=1)
  errors[i] <- mean(sample) - 60
}
hist(errors)
#plot(density(errors),xlab="",ylab="",main="")


###################################################
### chunk number 164: 
###################################################
var(c(60,62,64))

var(c(50,60,70))

var(c(60,60,60))



###################################################
### chunk number 165: 
###################################################
variances <- rep(NA, 1000)

for (i in 1:1000){
	sample1 <- rnorm(11, mean = 60, sd = 4)
	sample2 <- rnorm(11, mean = 60, sd = 4)
	sample3 <- rnorm(11, mean = 60, sd = 4)
	
	variances[i] <- var(c(mean(sample1), mean(sample2), mean(sample3)))
}

mean(variances)



###################################################
### chunk number 166: samplemeanvar
###################################################
plot(density(variances),main="",xlab="",ylab="")


###################################################
### chunk number 167: 
###################################################
plot(density(variances),main="",xlab="",ylab="")


###################################################
### chunk number 168: 
###################################################
rvh <- matrix(c(9, 1, 2, 10, 2, 6, 1, 5, 0), 3, 3)


###################################################
### chunk number 169: 
###################################################
total <- matrix(rep(NA, 9), 3, 3)
for (j in 1:3){
	for (i in 1:3){
		total[i, j] <- rvh[i, j] - mean(rvh)
	}
}
print(total)



###################################################
### chunk number 170: 
###################################################
total<-rvh-mean(rvh)


###################################################
### chunk number 171: 
###################################################
within <- matrix(rep(NA, 9), 3, 3)
for (j in 1:3){
	for (i in 1:3){
		within[i, j] <- rvh[i, j] - mean(rvh[,j])
	}
}
print(within)


###################################################
### chunk number 172: 
###################################################
between <- matrix(rep(NA, 9), 3, 3)
for (j in 1:3){
	for (i in 1:3){
		between[i, j] <- mean(rvh[,j]) - mean(rvh)
	}
}
print(between)


###################################################
### chunk number 173: 
###################################################
total
within + between


###################################################
### chunk number 174: 
###################################################
sum(total)
sum(between)
sum(within)


###################################################
### chunk number 175: 
###################################################
sum(total^2)
sum(between^2, within^2)


###################################################
### chunk number 176: 
###################################################
sum(total^2)
sum(between^2) + sum(within^2)


###################################################
### chunk number 177: 
###################################################
ms.total <- sum(total^2) / (9 - 1)
ms.between <- sum(between^2) / (3 - 1)
ms.within <- sum(within^2) / (9 - 3)


###################################################
### chunk number 178: 
###################################################
ms.withins <- rep(NA, 1000)
ms.betweens <- rep(NA, 1000)
fs <- rep(NA, 100)

for (n in 1:1000) {
	sample1 <- rnorm(11, 60, 4)
	sample2 <- rnorm(11, 60, 4)
	sample3 <- rnorm(11, 60, 4)
	
	m = matrix(c(sample1, sample2, sample3), 11, 3)
	
	
	within <- matrix(rep(NA, 33), 11, 3)
	for (j in 1:3) {
		for (i in 1:11) {
			within[i, j] <- m[i, j] - mean(m[, j])
		}
	}
	ms.withins[n] <- sum(within^2)/(33 - 3)
	
	between <- matrix(rep(NA, 33), 11, 3)
	for (j in 1:3) {
		for (i in 1:11) {
			between[i, j] <- mean(m[, j]) - mean(m)
		}
	}
	ms.betweens[n] <- sum(between^2)/(3 - 1)
	
	fs[n] <- (sum(between^2)/(3 - 1)) / (sum(within^2)/(33 - 3))
}



###################################################
### chunk number 179: mswithinsamples
###################################################
plot(density(ms.withins),main="",xlab="",ylab="")


###################################################
### chunk number 180: 
###################################################
plot(density(ms.withins),main="",xlab="",ylab="")


###################################################
### chunk number 181: msbetweensamples
###################################################
plot(density(ms.betweens),main="",xlab="",ylab="")


###################################################
### chunk number 182: 
###################################################
plot(density(ms.betweens),main="",xlab="",ylab="")


###################################################
### chunk number 183: Fratiosidentical
###################################################
plot(density(fs),xlim=range(0,8),main="",xlab="",ylab="")


###################################################
### chunk number 184: 
###################################################
plot(density(fs),xlim=range(0,8),main="",xlab="",ylab="")


###################################################
### chunk number 185: 
###################################################
mean(fs)


###################################################
### chunk number 186: Fratiossimulatedexact
###################################################
multiplot(1,2)
title<-"Simulated"
plot(density(fs),xlim=range(0,8),main=title,xlab="",ylab="")
title<-"Exact"
plot(function(x) df(x, 2, 6), -0.1, 8,main=title,xlab="",ylab="")


###################################################
### chunk number 187: 
###################################################
multiplot(1,2)
title<-"Simulated"
plot(density(fs),xlim=range(0,8),main=title,xlab="",ylab="")
title<-"Exact"
plot(function(x) df(x, 2, 6), -0.1, 8,main=title,xlab="",ylab="")


###################################################
### chunk number 188: 
###################################################
ms.between
ms.within
ms.between / ms.within


###################################################
### chunk number 189: 
###################################################
integrate(function(x) df(x, 2, 6), 0.8571, Inf)


###################################################
### chunk number 190: 
###################################################

scores <- c(9,1,2,10,2,6,1,5,0)
subj <- paste("s",rep(c(1:9),1),sep="")
group <- paste("g",rep(c(1:3),1,each=3),sep="")

data1 <- data.frame(scores,group,subj)



###################################################
### chunk number 191: 
###################################################
aov.fm <- aov(scores ~ group+Error(subj),data1)
summary(aov.fm)


###################################################
### chunk number 192: 
###################################################
ms.withins <- rep(NA, 1000)
ms.betweens <- rep(NA, 1000)

for (n in 1:1000) {
	sample1 <- rnorm(11, 58, 4)
	sample2 <- rnorm(11, 60, 4)
	sample3 <- rnorm(11, 62, 4)
	
	m = matrix(c(sample1, sample2, sample3), 11, 3)
	
	within <- matrix(rep(NA, 33), 11, 3)
	for (j in 1:3) {
		for (i in 1:11) {
			within[i, j] <- m[i, j] - mean(m[, j])
		}
	}
	ms.withins[n] <- sum(within^2)/(33 - 3)
	
	between <- matrix(rep(NA, 33), 11, 3)
	for (j in 1:3) {
		for (i in 1:11) {
			between[i, j] <- mean(m[, j]) - mean(m)
		}
	}
	ms.betweens[n] <- sum(between^2)/(3 - 1)
}

mean(ms.withins)


###################################################
### chunk number 193: mswithinsamples2
###################################################
multiplot(1,2)
plot(density(ms.withins),main="MS-within",xlab="")
plot(density(ms.betweens),main="MS-between",xlab="")


###################################################
### chunk number 194: 
###################################################
multiplot(1,2)
plot(density(ms.withins),main="MS-within",xlab="")
plot(density(ms.betweens),main="MS-between",xlab="")


###################################################
### chunk number 195: 
###################################################
(aov.fm)


###################################################
### chunk number 196: 
###################################################

lm.fm <- lm(scores~group,data=data1)
(mm.fm <- model.matrix(lm.fm))[1:8,]
(cf.fm <- coefficients(lm.fm))
(res.fm <- residuals(lm.fm))

(cbind(mm.fm,res.fm))



###################################################
### chunk number 197: 
###################################################
(data1$scores)


###################################################
### chunk number 198: 
###################################################
(mm.fm[,1])


###################################################
### chunk number 199: 
###################################################
(mm.fm[,2:3])


###################################################
### chunk number 200: 
###################################################
(cf.fm[1])


###################################################
### chunk number 201: 
###################################################
(cf.fm[2])


###################################################
### chunk number 202: 
###################################################
(cf.fm[3])


###################################################
### chunk number 203: 
###################################################

(mm.fm)[,2:3]



###################################################
### chunk number 204: 
###################################################
anova(lm.fm)
summary(aov.fm)


###################################################
### chunk number 205: 
###################################################

scores <- c(3,4,5,7,6,5,1,2,3)
subj <- paste("s",rep(c(1:9),1),sep="")
group <- paste("g",rep(c(1:3),1,each=3),sep="")
data2 <- data.frame(scores,group,subj)



###################################################
### chunk number 206: 
###################################################
library(faraway) 

data(stat500)

head(stat500,n=2)



###################################################
### chunk number 207: 
###################################################
# a "perfect" relationship:
final<-stat500$final
midterm<-stat500$midterm


###################################################
### chunk number 208: bivariate1
###################################################
final2 <- final
plot(final ~ final2,xlab="final")
abline(0,1)


###################################################
### chunk number 209: 
###################################################
final2 <- final
plot(final ~ final2,xlab="final")
abline(0,1)


###################################################
### chunk number 210: bivariate2
###################################################
plot(final ~ midterm,xlim=c(0,35),ylim=c(0,35))
abline(0,1)


###################################################
### chunk number 211: 
###################################################
plot(final ~ midterm,xlim=c(0,35),ylim=c(0,35))
abline(0,1)


###################################################
### chunk number 212: bivariate3
###################################################

x <- mean(midterm)
sdx <- sd(midterm)
y <- mean(final)
sdy <- sd(final)

plot(final ~ midterm)
arrows(x,min(final),
       x,max(final),code=0)
arrows(min(midterm),y,
       max(midterm),y,code=0)


###################################################
### chunk number 213: 
###################################################

x <- mean(midterm)
sdx <- sd(midterm)
y <- mean(final)
sdy <- sd(final)

plot(final ~ midterm)
arrows(x,min(final),
       x,max(final),code=0)
arrows(min(midterm),y,
       max(midterm),y,code=0)


###################################################
### chunk number 214: 
###################################################
scaledstat500 <- data.frame(scale(stat500))


###################################################
### chunk number 215: 
###################################################

final.original<-final
midterm.original<-midterm

final<-scaledstat500$final
midterm<-scaledstat500$midterm



###################################################
### chunk number 216: bivariate4
###################################################

plot(final ~ midterm)
arrows(mean(midterm),min(final),
       mean(midterm),max(final),code=0)
arrows(min(midterm),mean(final),
       max(midterm),mean(final),code=0)
text(1,2,labels=expression(x[i]%*%y[i]),cex=1.2)
text(1.5,2,labels=c("  = +ve"),cex=1.2)

text(1,-2,labels=expression(x[i]%*%-y[i]),cex=1.2)
text(1.55,-2,labels=c(" = -ve"),cex=1.2)

text(-1.1,-2,labels=expression(-x[i]%*%-y[i]),cex=1.2)
text(-.5,-2,labels=c("  = +ve"),cex=1.2)

text(-1,2,labels=expression(-x[i]%*%y[i]),cex=1.2)
text(-.5,2,labels=c("  = -ve"),cex=1.2)



###################################################
### chunk number 217: 
###################################################

plot(final ~ midterm)
arrows(mean(midterm),min(final),
       mean(midterm),max(final),code=0)
arrows(min(midterm),mean(final),
       max(midterm),mean(final),code=0)
text(1,2,labels=expression(x[i]%*%y[i]),cex=1.2)
text(1.5,2,labels=c("  = +ve"),cex=1.2)

text(1,-2,labels=expression(x[i]%*%-y[i]),cex=1.2)
text(1.55,-2,labels=c(" = -ve"),cex=1.2)

text(-1.1,-2,labels=expression(-x[i]%*%-y[i]),cex=1.2)
text(-.5,-2,labels=c("  = +ve"),cex=1.2)

text(-1,2,labels=expression(-x[i]%*%y[i]),cex=1.2)
text(-.5,2,labels=c("  = -ve"),cex=1.2)



###################################################
### chunk number 218: 
###################################################
sum(final*midterm)/(length(final)-1)

cor(midterm,final)



###################################################
### chunk number 219: bivariate5
###################################################
library(UsingR)

data(galton)

parent<-galton$parent
child<-galton$child


gx <- mean(parent)
gsdx <- sd(parent)
gy <- mean(child)
gsdy <- sd(child)

plot(child ~ parent)
arrows(gx,min(child),
       gx,max(child),code=0)
arrows(min(parent),gy,
       max(parent),gy,code=0)



###################################################
### chunk number 220: 
###################################################
library(UsingR)

data(galton)

parent<-galton$parent
child<-galton$child


gx <- mean(parent)
gsdx <- sd(parent)
gy <- mean(child)
gsdy <- sd(child)

plot(child ~ parent)
arrows(gx,min(child),
       gx,max(child),code=0)
arrows(min(parent),gy,
       max(parent),gy,code=0)



###################################################
### chunk number 221: 
###################################################
##MBB simplified strip edges
(one.SD.above <- subset(scaledstat500, 
						0.9 < midterm & midterm < 1.1))
mean(one.SD.above$final)



###################################################
### chunk number 222: 
###################################################
(one.SD.below <- subset(scaledstat500,
                        -0.9 > midterm & midterm > -1.1)) 

mean(one.SD.below$final)



###################################################
### chunk number 223: bivariate6
###################################################

plot(final ~ midterm)
arrows(mean(midterm),min(final),
       mean(midterm),max(final),code=0)
arrows(min(midterm),mean(final),
       max(midterm),mean(final),code=0)
abline(0,1,col="black")
abline(0,.5452,col="black",lty=2)
text(1.5,2,labels=c("1:1 ratio of change"),col="black")
text(1.45,.3,labels=c("0.5:1 ratio of change"),col="black")



###################################################
### chunk number 224: 
###################################################

plot(final ~ midterm)
arrows(mean(midterm),min(final),
       mean(midterm),max(final),code=0)
arrows(min(midterm),mean(final),
       max(midterm),mean(final),code=0)
abline(0,1,col="black")
abline(0,.5452,col="black",lty=2)
text(1.5,2,labels=c("1:1 ratio of change"),col="black")
text(1.45,.3,labels=c("0.5:1 ratio of change"),col="black")



###################################################
### chunk number 225: 
###################################################

summary(lm(final~midterm))



###################################################
### chunk number 226: bivariate6a
###################################################

final<-final.original
midterm<-midterm.original

# fitting by least squares
lm.stat500 <- lm(final ~ midterm)
plot(final ~ midterm)
abline(lm.stat500)
text(15,24,labels=c("y = 15.0462 + 0.5633x"),cex=1.2)



###################################################
### chunk number 227: 
###################################################

final<-final.original
midterm<-midterm.original

# fitting by least squares
lm.stat500 <- lm(final ~ midterm)
plot(final ~ midterm)
abline(lm.stat500)
text(15,24,labels=c("y = 15.0462 + 0.5633x"),cex=1.2)



###################################################
### chunk number 228: 
###################################################

residuals <- residuals(lm(final~midterm))
tail(residuals,n=5)



###################################################
### chunk number 229: 
###################################################
sum(residuals^2)
ms.residuals <- sum(residuals^2)/53
ms.residuals 


###################################################
### chunk number 230: 
###################################################
fitted.values <- fitted.values(lm(final~midterm))
tail(fitted.values)


###################################################
### chunk number 231: 
###################################################
mean(final)
ms.fitted  <- sum((fitted.values - mean(final))^2)/1


###################################################
### chunk number 232: Ftheoreticalsimulated2
###################################################
f.ratios <- rep(NA, 1000)
for (i in 1:1000){
       final.rand <- sample(final)
       lm <- lm(final.rand  ~ midterm)
       residuals <- residuals(lm)
       ms.residuals <- sum(residuals^2)/53
       fitted.values <- fitted.values(lm)
       ms.fitted  <- sum((fitted.values - mean(final))^2)/1
       f.ratios[i] <- ms.fitted / ms.residuals
}

multiplot(1,2)

main.title<-"Distribution of \n simulated F-ratios"
plot(density(f.ratios),xlim=range(0,8),main=main.title,xlab="",ylab="")

main.title<-"Distribution of \n theoretical F-ratios"
plot(function(x) df(x, 1, 53), -0.1, 8,main=main.title,xlab="",ylab="")



###################################################
### chunk number 233: 
###################################################
f.ratios <- rep(NA, 1000)
for (i in 1:1000){
       final.rand <- sample(final)
       lm <- lm(final.rand  ~ midterm)
       residuals <- residuals(lm)
       ms.residuals <- sum(residuals^2)/53
       fitted.values <- fitted.values(lm)
       ms.fitted  <- sum((fitted.values - mean(final))^2)/1
       f.ratios[i] <- ms.fitted / ms.residuals
}

multiplot(1,2)

main.title<-"Distribution of \n simulated F-ratios"
plot(density(f.ratios),xlim=range(0,8),main=main.title,xlab="",ylab="")

main.title<-"Distribution of \n theoretical F-ratios"
plot(function(x) df(x, 1, 53), -0.1, 8,main=main.title,xlab="",ylab="")



###################################################
### chunk number 234: 
###################################################
summary(lm.stat500)

anova(lm.stat500)


###################################################
### chunk number 235: 
###################################################

summary(aov(final~midterm,stat500))



###################################################
### chunk number 236: 
###################################################
4.735^2


###################################################
### chunk number 237: 
###################################################

MathAchieve<-read.table("mathachieve.txt")
colnames(MathAchieve) <- c("School","Minority","Sex","SES","MathAch","MEANSES")

head(MathAchieve,n=3)


###################################################
### chunk number 238: 
###################################################

beauty<-read.table("beauty.txt",header=TRUE)

head(beauty)



###################################################
### chunk number 239: 
###################################################

MathAchieve<-read.table("mathachieve.txt")
colnames(MathAchieve) <- c("School","Minority","Sex","SES","MathAch","MEANSES")

head(MathAchieve,n=3)


###################################################
### chunk number 240: 
###################################################

lm0 <- lm(MathAch ~ SES, data=MathAchieve)
summary(lm0)

coefficients(lm0)




###################################################
### chunk number 241: 
###################################################
MathAchieve.1224<-subset(MathAchieve,School==1224)

lm1 <- lm(MathAch ~ SES, data=MathAchieve.1224)
summary(lm1)
coef(lm1)



###################################################
### chunk number 242: 
###################################################
MathAchieve.1288<-subset(MathAchieve,School==1288)

lm2 <- lm(MathAch ~ SES, data=MathAchieve.1288)
summary(lm2)
coef(lm2)



###################################################
### chunk number 243: lmm1
###################################################
multiplot(1,2)
plot(MathAch ~ SES,data=subset(MathAchieve,School==1224),main="School 1224")
abline(lm1$coefficients)

plot(MathAch ~ SES,data=subset(MathAchieve,School==1288),main="School 1228")
abline(lm2$coefficients)


###################################################
### chunk number 244: 
###################################################
multiplot(1,2)
plot(MathAch ~ SES,data=subset(MathAchieve,School==1224),main="School 1224")
abline(lm1$coefficients)

plot(MathAch ~ SES,data=subset(MathAchieve,School==1288),main="School 1228")
abline(lm2$coefficients)


###################################################
### chunk number 245: 
###################################################

#Lattice plots: some sensible defaults for scales:
scalelist <- list(x=list(alternating=1),
                   y=list(alternating=1),
                   tck=c(.5))



###################################################
### chunk number 246: 
###################################################
#function for plotting the regression lines:
drawfittedline <- function(x,y){
  panel.xyplot(x,y)
        panel.lmline(x,y,type="l",lwd=1)}


###################################################
### chunk number 247: lmm2
###################################################
library(lattice)


nine.schools<-unique(MathAchieve$School)[1:9]

print(xyplot(MathAch~SES|factor(School),
        subset(MathAchieve,School%in%nine.schools),
        layout=c(3,3),
        cex.axis=2,
       xlab="Student SES",
       ylab="Math Achievement",
       panel=drawfittedline,
       scales=scalelist))


###################################################
### chunk number 248: 
###################################################
library(lattice)


nine.schools<-unique(MathAchieve$School)[1:9]

print(xyplot(MathAch~SES|factor(School),
        subset(MathAchieve,School%in%nine.schools),
        layout=c(3,3),
        cex.axis=2,
       xlab="Student SES",
       ylab="Math Achievement",
       panel=drawfittedline,
       scales=scalelist))


###################################################
### chunk number 249: 
###################################################
library(lme4)
lmm1 <- lmList(MathAch ~ SES|School, MathAchieve)
## equivalent way (i.e., the intercept is implicit in the command above):
# lmm1a <- lmList(MathAch ~ 1+SES|School, MathAchieve)
## Aside: you can drop the intercept as follows
## lme1 <- lmList(MathAch ~ SES-1|School, MathAchieve)

lmm1$"1224"
lmm1$"1288"



###################################################
### chunk number 250: 
###################################################

t.test(coef(lmm1)[1])
t.test(coef(lmm1)[2])



###################################################
### chunk number 251: 
###################################################

lme1 <- lmList(MathAch ~ SES|School, MathAchieve)
intercepts <- coef(lme1)[1]
slopes <- coef(lme1)[2]

(cov(intercepts,slopes))

(cov(intercepts,slopes)/sqrt(var(intercepts)*var(slopes)))

(cor(intercepts,slopes))



###################################################
### chunk number 252: lmm3
###################################################
intslopes<-data.frame(intercepts,slopes)
colnames(intslopes) <- c("Intercepts","Slopes")

plot(Intercepts~Slopes,intslopes)
lm.intslopes <- lm(Intercepts~Slopes,data=intslopes)
abline(coefficients(lm.intslopes))


###################################################
### chunk number 253: 
###################################################
intslopes<-data.frame(intercepts,slopes)
colnames(intslopes) <- c("Intercepts","Slopes")

plot(Intercepts~Slopes,intslopes)
lm.intslopes <- lm(Intercepts~Slopes,data=intslopes)
abline(coefficients(lm.intslopes))


###################################################
### chunk number 254: 
###################################################

MathAchSchool <- read.table("mathachschool.txt")
colnames(MathAchSchool) <- c("School",
                             "Size","Sector",
                             "PRACAD","DISCLIM","HIMINTY","MEANSES")

MathScores <- merge(MathAchieve,MathAchSchool,by="School")



###################################################
### chunk number 255: 
###################################################

(contrasts(MathScores$Sector))



###################################################
### chunk number 256: 
###################################################

lme1.fm <- lmer(MathAch~SES+Sector+(1+SES|School),MathScores)
summary(lme1.fm)



###################################################
### chunk number 257: 
###################################################

fixef(lme1.fm)



###################################################
### chunk number 258: 
###################################################

lme0.fm <- lmer(MathAch~SES+Sector+(1|School),MathScores)
summary(lme0.fm)



###################################################
### chunk number 259: 
###################################################

anova(lme0.fm,lme1.fm)



###################################################
### chunk number 260: 
###################################################
x<-c(0,2,2,1,2,3,0,1,2,1)
mean(x)


###################################################
### chunk number 261: 
###################################################
females <- rbinom(40,1,.4)
females
sum(females)


###################################################
### chunk number 262: 
###################################################
populationsize <- 1000
samplesize <- 40
p <- .4 # probability of females
compute95CIpopulation <- function(populationsize,samplesize,p){
females <- rbinom(samplesize,1,.4)
samplesumfemales <- sum(females)
sdsample <- sqrt(samplesize*p*(1-p))
sample95CI <- c(samplesumfemales - 2*sdsample,  
                samplesumfemales + 2*sdsample)
population95CI <- populationsize/samplesize * sample95CI
print(population95CI)}


###################################################
### chunk number 263: 
###################################################
compute95CIpopulation(1000,40,.4)


###################################################
### chunk number 264: 
###################################################
10 * 3


###################################################
### chunk number 265: 
###################################################
n  <- 10


###################################################
### chunk number 266: 
###################################################
v <- c(1, 15, 4, 27, 5)


###################################################
### chunk number 267: 
###################################################
v <- 1:5



###################################################
### chunk number 268: 
###################################################
w <- v * 3


###################################################
### chunk number 269: 
###################################################
abs(-2:2)


###################################################
### chunk number 270: 
###################################################
sum(-2:2)


###################################################
### chunk number 271: 
###################################################
w[3]


###################################################
### chunk number 272: 
###################################################
for (i in 1:5){print(w[i])}


###################################################
### chunk number 273: 
###################################################
v <- rep(3, 5)


###################################################
### chunk number 274: 
###################################################
v <- rep(NA, 5)
for(i in 1:5){v[i] <- i * 3}



###################################################
### chunk number 275: 
###################################################
v <- rep(NA, 5)
print(v)
for (i in 1:5){
	square <- i^2
	v[i] <- square - 1
}
print(v)



###################################################
### chunk number 276: 
###################################################
m  <- matrix(1:6, ncol = 2, nrow = 3)


###################################################
### chunk number 277: 
###################################################
m[3, 2]


###################################################
### chunk number 278: 
###################################################
m[,2]
m[2,]


###################################################
### chunk number 279: 
###################################################
m[,2] * 3


###################################################
### chunk number 280: 
###################################################
m * 3
sum(m)


###################################################
### chunk number 281: 
###################################################
for (j in 1:2){ 
	for (i in 1:3){
		print(m[i, j])
	}
}


###################################################
### chunk number 282: 
###################################################
d  <- data.frame(smaller=1:3, larger=4:6)



###################################################
### chunk number 283: 
###################################################
d[[1]]
d$smaller


