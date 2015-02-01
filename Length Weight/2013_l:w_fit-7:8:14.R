mydata13 <- read.csv("2013_Length_weight.csv", header=TRUE,sep=",")



xdata13= mydata13$Fork.Length..cm
ydata13=mydata13$Weight..kg


small13 = cbind(xdata13, ydata13)
colnames(small13) <- c("x13", "y13")
data.frame(small13)

plot(xdata13 ~ ydata13, data=small13)
## remove the outlier existing in row 76

smalldf13 <- data.frame(small13[-76,])



# setting starting variables W= aL^b, 

a=1
b=3.0

fit2013_lw= nls(y13 ~ a*(x13^b), start=list(a=a,b=b), data=smalldf13)

summary(fit2013_lw)

RSS =sum(resid(fit2013_lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2013_lw)

#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
 boot2013_lw <- nlsBoot(fit2013_lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals
boot2013_lw$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2013_ab, type="boxplot")
# title("2013")

# boot$coefboot # contains the bootstrap parameter estimates 


# plot(xdata,ydata)
# lines(xdata, predict(fit2013))  

fitted_y13<- data.frame(predict(fit2013_lw))

fitted_wk13 <- data.frame(smalldf13$x, fitted_y13)
fitted_label13 <- rep("Fitted", 105)
fitted_data13 <- data.frame(fitted_label13, fitted_wk13)
colnames(fitted_data13) <- c("Label", "x", "y")

observed_label13 <- rep("Observed", 105)
observed13 <- data.frame(cbind(observed_label13, smalldf13))
colnames(observed13) <- c("Label", "x", "y")

df13<- data.frame(rbind(observed13, fitted_data13))

library(ggplot2)

	
LW_2013 <-ggplot(data= subset(df13, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df13, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,14), breaks=seq(0,14, 2))+
	#scale_x_continuous(limits=c(25,90), breaks=seq(25,90,10))+
	xlab("Fork Length (cm)")+
	ylab("Weight (kg)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+
	ggtitle("2013")
	

tiff("Multiplot_LengthWeight_Years.tiff", width=7, height=7, units="in", res=300)
multiplot(LW_2011, LW_2012, LW_2013, cols=1)
dev.off()