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


fit2011 = nls(y11 ~ p1_11*(1-exp(-p2_11*(x11-p3_11))), start=list(p1_11=p1_11, p2_11=p2_11, p3_11=p3_11), data=smalldf11)

summary(fit2011)
RSS <-sum(resid(fit2011)^2)
TSS <-sum((ydata-mean(ydata))^2))
Rsq <- 1- (RSS/TSS)   ## R square fit to data! not sure if this works with non linear data... 
confint(fit2011)  # parametric Confidence Intervals


library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2011 <- nlsBoot(fit2011, niter=999) # method to get non parametric- bootstrapped- confidence intervals
boot2011$bootCI #contains the bootstrap medians and the bootstrap 95% CI


plot(boot2011, type='boxplot')
title("2011")
#boot2011$coefboot # contains the bootstrap parameter estimates 


###  Linf= 84.93, k=.216, t0=.8683

seq= seq(1:44)
x_sample <- matrix(seq, ncol=1)

Liz_fit11 <- 84.93 *(1-exp(-.21*(x_sample-(.86))))
w_fit <- 941 *(1-exp(-.18*(x_sample-(-0.53))))
w_fit_adjusted= ((w_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters


fitted_label <- rep("This Study", 44)
fitted11 <- data.frame(fitted_label, x_sample, Liz_fit11)
colnames(fitted11) <- c("Label", "x", "y")

Wilson_label <- rep("Wilson et al. 2001", 44)
Wilson <- data.frame(Wilson_label, x_sample, w_fit_adjusted)
colnames(Wilson) <- c("Label", "x", "y")

observed_label11 <- rep("Observed",325)
observed11 <- data.frame(cbind(observed_label11, smalldf11))
colnames(observed11) <- c("Label", "x", "y")


df11 <- data.frame(rbind(observed11, fitted11, Wilson))

library(ggplot2)

VonB_2011 <-ggplot(data= subset(df11, Label %in% c("This Study", "Wilson et al. 2001")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df11, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	scale_y_continuous(limits=c(0,100), breaks= seq(0,100,10))+
	scale_x_continuous(limits=c(0,40), breaks=seq(0,40,5))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.30),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+
	ggtitle("Length at Age for 2011 Catch with Fitted von Bertalanffy Regression Lines")
	
	ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/2011_VonB_fits.tiff", plot=VonB_2011, width=7, height=4.5, dpi=300)

