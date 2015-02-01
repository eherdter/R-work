## making boxplots of all bootstrapped parameters from 2011, 2012, and 2013 VonB parameter estimations


### 2011 Data ###
mydata11 <- read.csv("2011_Age_length.csv", header=TRUE,sep=",")
x11 = data.frame(mydata11$Fractional.Age) 
y11 = data.frame(mydata11$Fork.Length..cm.)

small11= cbind(x11, y11)
small11 <- small11[complete.cases(small11),]
smalldf11= data.frame(small11)
colnames(smalldf11) <- c("x", "y")

# setting starting variables where P1= Linf, P2= K and P3= t0
p1_11 = 100
p2_11 = .18
p3_11= -5

fit2011 = nls(y11 ~ p1_11*(1-exp(-p2_11*(x11-p3_11))), start=list(p1_11=p1_11, p2_11=p2_11,p3_11=p3_11), data=smalldf11)

summary(fit2011)
RSS <-sum(resid(fit2011)^2)
TSS <-sum((ydata-mean(ydata))^2))
Rsq <- 1- (RSS/TSS)   ## R square fit to data! not sure if this works with non linear data... 
confint(fit2011)  # parametric Confidence Intervals

library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2011 <- nlsBoot(fit2011, niter=999) # method to get non parametric- bootstrapped- confidence intervals
boot2011$bootCI #contains the bootstrap medians and the bootstrap 95% CI


boot2011Coef <- data.frame(boot2011$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2011Coef) <- c("p1_11", "p2_11", "p3_11")




### 2012 DATA ###
mydata12 <- read.csv("2012_Age_length.csv", header=TRUE,sep=",")


x12 = mydata12$Fractional.Age 

y12 = mydata12$Fork.Length..cm

small12=cbind(x12, y12)
smalldf12= data.frame(small12)

Linf = 80
K = .18
t0= .55


fit2012 = nls(y ~ Linf*(1-exp(-K*(x-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf)

summary(fit2012)

RSS =sum(resid(fit2012)^2)
TSS= sum((ydata-mean(ydata))^2))
Rsq <- 1-(RSS/TSS)
confint(fit2012)

# # library(nlstools)
# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2012 <- nlsBoot(fit2012, niter=999)
# boot2012$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2012, type="boxplot")
# title("2012")
# boot2012$coefboot # contains the bootstrap parameter estimates 



boot2012Coef <- data.frame(boot2012$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2012Coef) <- c("p1_12", "p2_12", "p3_12")

#### 2013 DATA #####

mydata13 <- read.csv("2013_Age_length.csv", header=TRUE,sep=",")



x13 = mydata13$Fractional.Age
y13 = mydata13$Fork.Length..cm
small13= cbind(x13, y13)
smalldf13= data.frame(small13)

plot(x13, y13)

# setting starting variables where P1= Linf, P2= K and P3= t0

Linf= 80
K = .18
t0= .55

fit2013 = nls(y ~ Linf*(1-exp(-K*(x-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf)

summary(fit2013)

#getting sum of squared residuals

RSS =sum(resid(fit2013)^2)
TSS= sum((ydata-mean(ydata))^2))
Rsq <- 1-(RSS/TSS)

#parameter confidence intervals

confint(fit2013)

#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2013 <- nlsBoot(fit2013, niter=999)
# boot2013$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2013, type="boxplot")
# boot2013$coefboot # contains the bootstrap parameter estimates 

# plot(xdata,ydata)
# lines(xdata, predict(fit2013)) 

boot2013Coef <- data.frame(boot2013$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2013Coef) <- c("p1_13", "p2_13", "p3_13")


## NOW JOINING TOGETHER ###


#formatting correctly for boxplots
Linf2011 <- data.frame(boot2011Coef$p1_11)
colnames(Linf2011) <- c("Linf")
Linf2012<- data.frame(boot2012Coef$p1_12)
colnames(Linf2012) <- c("Linf")
Linf2013 <- data.frame(boot2013Coef$p1_13)
colnames(Linf2013) <- c("Linf")
LinfAll <- rbind(Linf2011, Linf2012, Linf2013)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 999))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,999))
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_Linf <- data.frame(YearLabelAll, LinfAll)
colnames(working_Linf) <- c("Year", "Linf")

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
library(ggplot2)
boxplotLinf <- ggplot(working_Linf, aes(x=as.factor(Year), y=Linf, fill=as.factor(Year))) + geom_boxplot()
