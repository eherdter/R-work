May 2, 2014
# script for loading csv and fitting vonB parameters to data with bootstrapping to determine confidence intervals#
#http://www.walkingrandomly.com/?p=5254#

mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")



x = data.frame(mydata$Fractional.Age)
y = data.frame(mydata$Fork.Length..cm)
data <- cbind(x, y)
idx_remove <- x>0.8
data_wk<-data.frame(data[idx_remove,])
data_wk <- data.frame(data_wk[complete.cases(data_wk),])
colnames(data_wk) <- c("x", "y")

data_wk$x <- as.numeric(as.character(data_wk$x))  # for some reason the above values were turned to characters so the below code was acting funny. by changing the x values to numeric values it seems to also change the y values to numeric values




# setting starting variables where P1= Linf, P2= K and P3= t0 where t0= age where organisms would have zero size

p1 = 80
p2 = .18
p3= 0


fit = nls(y ~ p1*(1-exp(-p2*(x-p3))), start=list(p1=p1, p2=p2,p3=p3), data=data_wk)

summary(fit)

#getting sum of squared residuals

sum(resid(fit)^2)

#parameter confidence intervals

confint(fit)


#     p1      p2      p3 
#82.9131  0.2043  0.4331 

seq= seq(1:44)
x_sample <- matrix(seq, ncol=1)

Liz_fit <- 82.9131 *(1-exp(-.2043*(x_sample-(.4331))))
w_fit <- 941 *(1-exp(-.18*(x_sample-(-0.53))))
w_fit_adjusted= ((w_fit-.3868)/1.058)/10 ## to convert to FL and then to centimeters

fitted_label <- rep("von Bertalanffy", 44)
fitted <- data.frame(fitted_label, x_sample, Liz_fit)
colnames(fitted) <- c("Label", "x", "y")

Wilson_label <- rep("Wilson", 44)
Wilson <- data.frame(Wilson_label, x_sample, w_fit_adjusted)
colnames(Wilson) <- c("Label", "x", "y")

observed_label <- rep("Observed",819)  # the data_wk data.frame did not adjust for the number of variables after I did an index and then complete.cases but the real number is 819 which was obtained by str(data_wk)
observed <- data.frame(cbind(observed_label, data_wk))
colnames(observed) <- c("Label", "x", "y")


df <- data.frame(rbind(fitted, Wilson, observed))




#http://www.cookbook-r.com/Graphs/Shapes_and_line_types/
# plot 2011 fit along with wilsons fit
library(ggplot2)

	
VonB_All <- ggplot(data= subset(df, Label %in% c("von Bertalanffy", "Wilson")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,100), breaks= seq(0,100,10))+
	#scale_x_continuous(limits=c(0,45), breaks=seq(0,45,5))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14), # changing size of plot title)+
		legend.text=element_text(size=10))+
	ggtitle("Length at Age for All Data with Fitted von Bertalanffy Regression Lines")
	
