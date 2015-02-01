## Code for fitting a linear mixed model##
## Elizabeth Herdter, March 17, 2014#

new<-read.csv("new.csv")
new <-data.frame(new)

# Here, I will find the ideal transform for the response variable using the boxcox function
b<-boxcox(lm(Increment.Number~Increment.Width, data=new), lambda=seq(-2,2, by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]

# I obtain a lambda of -.707 so I will transform the data by raising to the (-.707)
IncW_trans<-(new$Increment.Width)^-.707

# Next, I'm going to make a new data frame with just the necessary variables of interest
fishID= new$Fish.ID
IncNum=new$Increment.Number
# I want to adjust the age at increment also called "Increment.Number" by finding mean of all and subtracting from each
colMeans(IncNum)
adjusted_IncNum = IncNum - 3.88

## Im calling the new matrix "working". This includes all of the variables of interest.
working<-cbind(IncW_noInf, new$Year.of.Growth, adjusted_IncNum, fishID)
colnames(working)[1]<- "IncWtrans"
colnames(working)[2]<-"GrowthYear"
colnames(working)[3]<-"IncNumadj"
colnames(working)[4]<-"FishID"

##Here, I am converting it to a data frame so that I can change the Inf to NA
working<- data.frame(working)

##remove Inf in order to run lme
 library(data.table)
 workingdt<- data.table(working)
 na_dat<- do.call(data.frame, lapply(workingdt,function(x) replace(x, is.infinite(x), NA)))
 
 ## using lme
library(nlme)
fm1<- lme(IncWtrans ~ IncNumadj + GrowthYear, random= ~1 | FishID, data=na_dat, method="REML", na.action=na.omit)
