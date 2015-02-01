mydata12 <- read.csv("2012_Age_length.csv", header=TRUE,sep=",")


x12 = mydata12$Fractional.Age 

y12 = mydata12$Fork.Length..cm

small12=cbind(x12, y12)
smalldf12= data.frame(small12)

Linf = 80
K = .18
t0= .55


fit2012 = nls(y12 ~ Linf*(1-exp(-K*(x12-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf12)



summary(fit2012)

RSS =sum(resid(fit2012)^2)
TSS= sum((ydata-mean(ydata))^2))
Rsq <- 1-(RSS/TSS)
confint(fit2012)

# # library(nlstools)
# #http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
# boot2012 <- nlsBoot(fit2012, niter=999)
# boot2012$bootCI #contains the bootstrap medians and the bootstrap 95% CI
# plot(boot2012, type="boxplot")
# title("2012")
# boot2012$coefboot # contains the bootstrap parameter estimates 


# # plot(xdata,ydata)
# lines(xdata, predict(fit2012)) 


#   Linf       K      t0 
#81.1250  0.2031  0.0406 


seq= seq(1:44)
x_sample <- matrix(seq, ncol=1)

Liz_fit12 <- 81.1250 *(1-exp(-.2031*(x_sample-(.0406))))
w_fit <- 941 *(1-exp(-.18*(x_sample-(-0.53))))
w_fit_adjusted= ((w_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters

fitted_label <- rep("This Study", 44)
fitted12 <- data.frame(fitted_label, x_sample, Liz_fit12)
colnames(fitted12) <- c("Label", "x", "y")

Wilson_label <- rep("Wilson et al. 2001", 44)
Wilson <- data.frame(Wilson_label, x_sample, w_fit_adjusted)
colnames(Wilson) <- c("Label", "x", "y")

observed_label12 <- rep("Observed",311)
observed12 <- data.frame(cbind(observed_label12, smalldf12))
colnames(observed12) <- c("Label", "x", "y")





df12<- data.frame(rbind(observed12, fitted12, Wilson))


#http://www.cookbook-r.com/Graphs/Shapes_and_line_types/
# plot 2011 fit along with wilsons fit
library(ggplot2)

	
VonB_2012 <-ggplot(data= subset(df12, Label %in% c("This Study", "Wilson et al. 2001")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df12, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	scale_y_continuous(limits=c(0,90), breaks=seq(0,90, 10))+
	#scale_x_continuous(limits=c(0,25), breaks=seq(0,25,5))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.30),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title
	ggtitle("Length at Age for 2012 Data with Fitted von Bertalanffy Regression Lines")
	
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/2012_VonB.tiff", plot=VonB_2012, width=7, height=4.5, dpi=300)
	

