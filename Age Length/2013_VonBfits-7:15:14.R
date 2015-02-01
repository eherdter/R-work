mydata13 <- read.csv("2013_Age_length.csv", header=TRUE,sep=",")



x13 = mydata13$Fractional.Age
y13 = mydata13$Fork.Length..cm
small13= cbind(x13, y13)
smalldf13= data.frame(small13)

#plot(x13, y13)

# setting starting variables where P1= Linf, P2= K and P3= t0

Linf= 80
K = .18
t0= .55

fit2013 = nls(y13 ~ Linf*(1-exp(-K*(x13-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf13)

summary(fit2013)

#getting sum of squared residuals

RSS =sum(resid(fit2013)^2)
TSS= sum((ydata-mean(ydata))^2))
Rsq <- 1-(RSS/TSS)

#parameter confidence intervals

confint(fit2013)

#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
# boot2013 <- nlsBoot(fit2013, niter=999)
# boot2013$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2013, type="boxplot")
# boot2013$coefboot # contains the bootstrap parameter estimates 

# plot(xdata,ydata)
# lines(xdata, predict(fit2013))  


#   Linf       K      t0 
# 80.1163  0.2341  1.1513 

seq= seq(1:44)
x_sample <- matrix(seq, ncol=1)

Liz_fit13 <- 80.1163 *(1-exp(-.2341*(x_sample-(1.1513))))
w_fit <- 941 *(1-exp(-.18*(x_sample-(-0.53))))
w_fit_adjusted= ((w_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters

fitted_label <- rep("This Study", 44)
fitted13 <- data.frame(fitted_label, x_sample, Liz_fit13)
colnames(fitted13) <- c("Label", "x", "y")

Wilson_label <- rep("Wilson et al. 2001", 44)
Wilson <- data.frame(Wilson_label, x_sample, w_fit_adjusted)
colnames(Wilson) <- c("Label", "x", "y")

observed_label13 <- rep("Observed",107)
observed13 <- data.frame(cbind(observed_label13, smalldf13))
colnames(observed13) <- c("Label", "x", "y")




df13<- data.frame(rbind(observed13, fitted13, Wilson))


#http://www.cookbook-r.com/Graphs/Shapes_and_line_types/
# plot 2011 fit along with wilsons fit
library(ggplot2)

	
VonB_2013 <-ggplot(data= subset(df13, Label %in% c("This Study", "Wilson et al. 2001")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df13, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	scale_y_continuous(limits=c(0,90), breaks=seq(0,90, 10))+
	#scale_x_continuous(limits=c(0,16), breaks=seq(0,16,2))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.30),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title
	ggtitle("Length at Age for 2013 Data with Fitted von Bertalanffy Regression Lines")

ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/2013_VonB.tiff", plot=VonB_2013, width=7, unit="in", height=4.5, dpi=300)


tiff("Multiplot_VonB.tiff", width=7, height=7, unit="in", res=300)
multiplot(VonB_2011, VonB_2012, VonB_2013, cols=1)
dev.off()
VonB_2011
