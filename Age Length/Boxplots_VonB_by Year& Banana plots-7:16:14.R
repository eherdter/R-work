## making boxplots of all bootstrapped parameters from 2011, 2012, and 2013 VonB parameter estimations


### 2011 Data ###
mydata11 <- read.csv("2011_Age_length.csv", header=TRUE,sep=",")
x11 = data.frame(mydata11$Fractional.Age) 
y11 = data.frame(mydata11$Fork.Length..cm.)

small11= cbind(x11, y11)
small11 <- small11[complete.cases(small11),]
smalldf11= data.frame(small11)
colnames(smalldf11) <- c("x11", "y11")

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
#boot2011$bootCI #contains the bootstrap medians and the bootstrap 95% CI


boot2011Coef <- data.frame(boot2011$coefboot) ## 999 Bootstrapped parameter estimates
colnames(boot2011Coef) <- c("p1_11", "p2_11", "p3_11")




### 2012 DATA ###
mydata12 <- read.csv("2012_Age_length.csv", header=TRUE,sep=",")


x12 = mydata12$Fractional.Age 

y12 = mydata12$Fork.Length..cm

small12=cbind(x12, y12)
smalldf12= data.frame(small12)

p1_12 = 80
p2_12 = .18
p3_12= .55


fit2012 = nls(y12 ~ p1_12*(1-exp(-p2_12*(x12-p3_12))), start=list(p1_12=p1_12, p2_12=p2_12,p3_12=p3_12), data=smalldf12)

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

p1_13= 80
p2_13 = .18
p3_13= .55

fit2013 = nls(y13 ~ p1_13*(1-exp(-p2_13*(x13-p3_13))), start=list(p1_13=p1_13, p2_13=p2_13, p3_13=p3_13), data=smalldf13)

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

#### LINF #####



#formatting correctly for boxplots
Linf2011 <- data.frame(boot2011Coef$p1)
colnames(Linf2011) <- c("Linf")
Linf2012<- data.frame(boot2012Coef$p1_12)
colnames(Linf2012) <- c("Linf")
Linf2013 <- data.frame(boot2013Coef$p1_13)
colnames(Linf2013) <- c("Linf")
LinfAll <- rbind(Linf2011, Linf2012, Linf2013)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 997))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,995)) # for some reason this ran only 997 times unlike the two ones above that ran 999
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_Linf <- data.frame(YearLabelAll, LinfAll)
colnames(working_Linf) <- c("Year", "Linf")

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
library(ggplot2)

boxplotLinf <- ggplot(working_Linf, aes(x=as.factor(Year), y=Linf, colour=as.factor(Year)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Year")+  #changing the title of the legend
				 xlab("Year")+
				 ylab("Linf")+
				 scale_y_continuous(limits=c(50,250), breaks=seq(80, 250, 50))+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"))+
				 ggtitle("Bootstrapped Linf Estimations")
				 
### K #####

#formatting correctly for boxplots
K2011 <- data.frame(boot2011Coef$p2)
colnames(K2011) <- c("K")
K2012<- data.frame(boot2012Coef$p2_12)
colnames(K2012) <- c("K")
K2013 <- data.frame(boot2013Coef$p2_13)
colnames(K2013) <- c("K")
KAll <- rbind(K2011, K2012, K2013)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 997))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,995))
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_K <- data.frame(YearLabelAll, KAll)
colnames(working_K) <- c("Year", "K")


boxplotK <- ggplot(working_K, aes(x=as.factor(Year), y=K, colour=as.factor(Year)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Year")+  #changing the title of the legend
				 xlab("Year")+
				 ylab("k")+
				 scale_y_continuous(limits=c(0,.8), breaks=seq(0,.9,.1))+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"))+
				 ggtitle("Bootstrapped k Estimation")
				 
				 
				 
### t0#####

#formatting correctly for boxplots
t2011 <- data.frame(boot2011Coef$p3)
colnames(t2011) <- c("t")
t2012 <- data.frame(boot2012Coef$p3_12)
colnames(t2012) <- c("t")
t2013 <- data.frame(boot2013Coef$p3_13)
colnames(t2013) <- c("t")
tAll <- rbind(t2011, t2012, t2013)

YearLabel2011 <- data.frame(rep(2011, 999))
colnames(YearLabel2011) <- c("Year")
YearLabel2012<- data.frame(rep(2012, 997))
colnames(YearLabel2012) <- c("Year")
YearLabel2013 <- data.frame(rep(2013,995))
colnames(YearLabel2013) <- c("Year")

YearLabelAll <- rbind(YearLabel2011, YearLabel2012, YearLabel2013)

working_t <- data.frame(YearLabelAll, tAll)
colnames(working_t) <- c("Year", "t")


boxplott0 <- ggplot(working_t, aes(x=as.factor(Year), y=t, colour=as.factor(Year)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Year")+  #changing the title of the legend
				 xlab("Year")+
				 ylab("t0")+
				 scale_y_continuous(breaks=seq(-8,3,1))+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"))+
				 ggtitle("Bootstrapped t0 Estimation")

tiff("Boxplots_VonB_by_Year.tiff", width= 7, height=9, unit="in", res=300)
multiplot(boxplotLinf, boxplotK, boxplott0, cols=1)
dev.off()
				 
## BANANA Plots of  L infinity and K for 2011, 2012 and 2013 ### 	

banana_2011 <- data.frame(Linf2011, K2011)
colnames(banana_2011) <- c("Linf11", "K11")	

banana_2012 <- data.frame(Linf2012, K2012)
colnames(banana_2012) <- c("Linf12", "K12")	

banana_2013 <- data.frame(Linf2013, K2013)
colnames(banana_2013) <- c("Linf13", "K13")	

bp_2011 <- ggplot(banana_2011, aes(x=K11, y=Linf11))+
				 geom_point()+
				 xlab("k")+
				 ylab("Linf")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		plot.title=element_text(size=14))+
				 ggtitle("Plot of 2011 bootstrapped Linf and k values")

bp_2012 <- ggplot(banana_2012, aes(x=K12, y=Linf12))+
				 geom_point()+
				 xlab("k")+
				 ylab("Linf")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		plot.title=element_text(size=14))+
				 ggtitle("Plot of 2012 bootstrapped Linf and k values")

bp_2013 <- ggplot(banana_2013, aes(x=K13, y=Linf13))+
				 geom_point()+
				 xlab("k")+
				 ylab("Linf")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		plot.title=element_text(size=14))+
				 ggtitle("Plot of 2013 bootstrapped Linf and k values")
tiff("Bananaplot_Years.tiff", width=7, height=7, res=300)
multiplot(bp_2011, bp_2012, bp_2013, cols=1)
dev.off()


		 