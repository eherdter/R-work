mydata11 <- read.csv("2011_Length_weight.csv", header=TRUE,sep=",")



xdata11= mydata11$Fork.Length..cm
ydata11=mydata11$Weight..kg

small11=cbind(xdata11, ydata11)
smalldf11=data.frame(small11)

plot(ydata11 ~ xdata11, data=small11)
## remove the outlier existing in row 213


smalldf11 <- data.frame(small11[-213,])




# setting starting variables W= aL^b, 

a=1
b=3.0

fit2011_lw= nls(ydata11 ~ a*(xdata11^b), start=list(a=a,b=b), data=smalldf11)

summary(fit2011_lw)

RSS =sum(resid(fit2011_lw)^2)
TSS= sum((ydata-mean(ydata)^2))
Rsq <- 1-(RSS/TSS)

confint(fit2011_lw)

# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
 boot2011_lw<- nlsBoot(fit2011_lw, niter=999) # method to get non parametric- bootstrapped- confidence intervals
 boot2011_lw$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2011_lw, type="boxplot")
# title(2011)
# boot2011_lw$coefboot # contains the bootstrap parameter estimates 
# plot(xdata,ydata)
# lines(xdata, predict(2011_lw))  


fitted_y11 <- data.frame(predict(fit2011_lw))

fitted_wk11 <- data.frame(smalldf11$xdata11, fitted_y11)
fitted_label11 <- rep("Fitted", 308)
fitted_data11 <- data.frame(fitted_label11, fitted_wk11)
colnames(fitted_data11) <- c("Label", "x", "y")

observed_label11 <- rep("Observed", 308)
observed11<- data.frame(cbind(observed_label11, smalldf11))
colnames(observed11) <- c("Label", "x", "y")

df11<- data.frame(rbind(observed11, fitted_data11))

library(ggplot2)


LW_2011 <-ggplot(data= subset(df11, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df11, Label== "Observed"), size =1.5)+
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
	ggtitle("2011")
	