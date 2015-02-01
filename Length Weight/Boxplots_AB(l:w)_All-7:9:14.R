### 2011 ###

mydata11lw <- read.csv("2011_Length_weight.csv", header=TRUE,sep=",")

xdata11lw= mydata11lw$Fork.Length..cm
ydata11lw=mydata11lw$Weight..kg

small11lw=cbind(xdata11lw, ydata11lw)
smalldf11lw=data.frame(small11lw)
# setting starting variables W= aL^b, 

a11=1
b11=3.0

fit2011lw= nls(ydata11lw ~ a11*(xdata11lw^b11), start=list(a11=a11,b11=b11), data=smalldf11lw)

summary(fit2011lw)

RSS =sum(resid(fit2011lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2011lw)

# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2011lw<- nlsBoot(fit2011lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals

boot2011lwCoef <- data.frame(boot2011lw$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2011lwCoef) <- c("a11", "b11")


### 2012 ###

mydata12lw <- read.csv("2012_Length_weight.csv", header=TRUE,sep=",")

xdata12lw= mydata12lw$Fork.Length..cm
ydata12lw=mydata12lw$Weight..kg

small12lw=cbind(xdata12lw, ydata12lw)
smalldf12lw=data.frame(small12lw)
# setting starting variables W= aL^b, 

a12=1
b12=3.0

fit2012lw <-nls(ydata12lw ~ a12*(xdata12lw^b12), start=list(a12=a12,b12=b12), data=smalldf12lw)

summary(fit2012lw)

RSS =sum(resid(fit2012lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2012lw)
# library(nlstools)
# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2012lw = nlsBoot(fit2012lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals

boot2012lwCoef <- data.frame(boot2012lw$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2012lwCoef) <- c("a12", "b12")



### 2013 ###

mydata13lw <- read.csv("2013_Length_weight.csv", header=TRUE,sep=",")

xdata13lw= mydata13lw$Fork.Length..cm
ydata13lw=mydata13lw$Weight..kg

small13lw = cbind(xdata13lw, ydata13lw)
smalldf13lw= data.frame(small13lw)

# setting starting variables W= aL^b, 

a13=1
b13=3.0

fit2013lw= nls(ydata13lw ~ a13*(xdata13lw^b13), start=list(a13=a13,b13=b13), data=smalldf13lw)

summary(fit2013lw)

RSS =sum(resid(fit2013_lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2013lw)

#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2013lw <- nlsBoot(fit2013lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals

boot2013lwCoef <- data.frame(boot2013lw$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2013lwCoef) <- c("a13", "b13")


#### A #####

#formatting correctly for boxplots
A2011lw <- data.frame(boot2011lwCoef$a11)
colnames(A2011lw) <- c("A")
A2012lw<- data.frame(boot2012lwCoef$a12)
colnames(A2012lw) <- c("A")
A2013lw <- data.frame(boot2013lwCoef$a13)
colnames(A2013lw) <- c("A")
AAll <- rbind(A2011lw, A2012lw, A2013lw)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 999))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,999)) # for some reason this ran only 997 times unlike the two ones above that ran 999
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_A <- data.frame(YearLabelAll, AAll)
colnames(working_A) <- c("Year", "A")

library(ggplot2)

boxplotA <- ggplot(working_A, aes(x=as.factor(Year), y=A, colour=as.factor(Year)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Year")+  #changing the title of the legend
				 xlab("Year")+
				 ylab("a")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																						panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped a Estimations")


#### B ###

#formatting correctly for boxplots
B2011lw <- data.frame(boot2011lwCoef$b11)
colnames(B2011lw) <- c("B")
B2012lw<- data.frame(boot2012lwCoef$b12)
colnames(B2012lw) <- c("B")
B2013lw <- data.frame(boot2013lwCoef$b13)
colnames(B2013lw) <- c("B")
BAll <- rbind(B2011lw, B2012lw, B2013lw)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 999))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,999)) # for some reason this ran only 997 times unlike the two ones above that ran 999
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_B <- data.frame(YearLabelAll, BAll)
colnames(working_B) <- c("Year", "B")

library(ggplot2)

boxplotB <- ggplot(working_B, aes(x=as.factor(Year), y=B, colour=as.factor(Year)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Year")+  #changing the title of the legend
				 xlab("Year")+
				 ylab("b")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																						panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped b Estimations")


tiff("Multiplot_Boxplot_LengthWeight_All.tiff", width=7, height=7, units="in", res=300)
multiplot(boxplotA, boxplotB)
dev.off()