mydata12 <- read.csv("2012_Length_weight.csv", header=TRUE,sep=",")



xdata12= mydata12$Fork.Length..cm
ydata12=mydata12$Weight..kg

small12=cbind(xdata12, ydata12)
smalldf12=data.frame(small12)
# setting starting variables W= aL^b, 

a=1
b=3.0

fit2012_lw <-nls(ydata12 ~ a*(xdata12^b), start=list(a=a,b=b), data=smalldf12)

summary(fit2012_lw)

RSS =sum(resid(fit2012_lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2012_lw)
 library(nlstools)
# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
boot2012_lw = nlsBoot(fit2012_lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals
boot2012_lw$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2012_lw, type ="boxplot")
# title("2012")
# boot$coefboot # contains the bootstrap parameter estimates 

# plot(xdata,ydata)
# lines(xdata, predict(fit2012))  

fitted_y12 <- data.frame(predict(fit2012_lw))

fitted_wk12 <- data.frame(xdata12, fitted_y12)
fitted_label12 <- rep("Fitted",388)
fitted_data12 <- data.frame(fitted_label12, fitted_wk12)
colnames(fitted_data12) <- c("Label", "x", "y")

observed_label12 <- rep("Observed", 388)
observed12 <- data.frame(cbind(observed_label12, smalldf12))
colnames(observed12) <- c("Label", "x", "y")

df12<- data.frame(rbind(observed12, fitted_data12))

library(ggplot2)

	
LW_2012 <-ggplot(data= subset(df12, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df12, Label== "Observed"), size =1.5)+
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
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("2012")
	
