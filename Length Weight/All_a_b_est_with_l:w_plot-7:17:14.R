## estimating a and b for total length weight set

#mydata_2011 = read.csv("2011_Length_Weight.csv", header=TRUE)
#mydata_2012 = read.csv("2012_Length_Weight.csv", header=TRUE)
#mydata_2013 = read.csv("2013_Length_Weight.csv", header=TRUE)

mydata= read.csv("AgeLengthWeight_master.csv", header=TRUE)

#working= rbind(mydata_2011, mydata_2012, mydata_2013)
#working_df=data.frame(working)

xdata= mydata$Fork.Length..cm
ydata= mydata$Weight..kg
somatic=mydata$Somatic.Weight

data <- data.frame(xdata, ydata)
data_wk <- data[complete.cases(data),]

data_somatic <- data.frame(xdata, somatic)
data_wk_soma <- data_somatic[complete.cases(data_somatic),]

a=1
b=3.0

fit_all_total= nls(ydata ~ a*(xdata^b), start=list(a=a,b=b), data=data_wk)
fit_all_somatic = nls(somatic ~ a*(xdata^b), start=list(a=a,b=b), data=data_wk_soma)

library(nlstools)
boot_all<- nlsBoot(fit_all_total, niter=999) # method to get non parametric- bootstrapped- confidence intervals
#boot_all$coefboot- for parameter estimates
boot_all_CI<- boot_all$bootCI


boot_soma <- nlsBoot(fit_all_somatic, niter=999)
boot_soma_Coef<- boot_soma$coefboot
boot_soma_CI <- boot_soma$bootCI

#total
#        a         b 
#1.858e-05 2.979e+00 

#somatic
#        a         b 
#1.555e-05 3.011e+00 


seq= seq(25,95)
FL_sample = matrix(seq, ncol=1)
fitted_total <- (1.858*10^(-5))*FL_sample^(2.979)
fitted_somatic <- (1.555*10^(-5))*FL_sample^(3.011)


### with Wilson Data added### must check on this because its most likely in correct
seq2 = seq(250,950)
TLmm_sample= matrix(seq2, ncol=1)
adjustedFLcm <- ((TLmm_sample-.3868)/1.058)/10
wilson_weight = (1.17*10^(-8))*(adjustedFLcm)^(3.04)
adjusted_weight= wilson_weight*1000


wilson_label= rep("W 01", 701)
wilson_data= data.frame(wilson_label, adjustedFLcm, adjusted_weight)
colnames(wilson_data) <- c("Label", "x", "y")


fitted_wk <- data.frame(FL_sample, fitted_total)
fitted_soma <- data.frame(FL_sample, fitted_somatic)

fitted_label <- rep("Fitted", 71)

fitted_data <- data.frame(fitted_label, fitted_wk)
fitted_data_soma <- data.frame(fitted_label, fitted_soma)

colnames(fitted_data) <- c("Label", "x", "y")
colnames(fitted_data_soma) <- c("Label", "x", "y")


observed_label <- rep("Observed", 803)
observed_label_soma <- rep("Observed", 328)

observed_total <- data.frame(cbind(observed_label, data_wk))
observed_soma  <- data.frame(cbind(observed_label_soma, data_wk_soma))

colnames(observed_total) <- c("Label", "x", "y")
colnames(observed_soma) <- c("Label", "x", "y")

df_total<- data.frame(rbind(observed_total, fitted_data, wilson_data))
df_soma <- data.frame(rbind(observed_soma, fitted_data_soma))

library(ggplot2)

	
LW_total_All <-ggplot(data= subset(df_total, Label %in% c("Fitted", "W 01")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df_total, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,14), breaks=seq(0,14, 2))+
	#scale_x_continuous(limits=c(25,90), breaks=seq(25,90,10))+
	xlab("Fork Length (cm)")+
	ylab("Total Weight (kg)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', 		colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Fork Length- Total Weight Relationship")

ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Total_LengthWeight.pdf', plot=LW_total_All, width=7, height=4.5)

LW_Soma_All <-ggplot(data= subset(df_soma, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df_soma, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,14), breaks=seq(0,14, 2))+
	#scale_x_continuous(limits=c(25,90), breaks=seq(25,90,10))+
	xlab("Fork Length (cm)")+
	ylab("Somatic Weight (kg)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', 		colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Fork Length - Somatic Weight Relationship")

ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Somatic_LengthWeight.pdf', plot=LW_Soma_All, width=7, height=4.5)

pdf("Multiplot_Somatic_and_Total WeightLength.pdf", width=7, height=6)
multiplot(LW_Soma_All, LW_total_All, cols=1)
dev.off()


##http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
