# Age and Length %frequencies for 2011,2012, 2013 catch with updated data 5-16-14
setwd("~/Desktop/R_workspace/Age Length")
mydata= read.csv("Raw_Age_Length.csv", header=TRUE)

Age <- data.frame(mydata$Age, mydata$Year)
Age2 <- data.frame(mydata$Age, mydata$Year, mydata$Fork.Length..cm.)
colnames(Age) <- c("Age", "Year")
colnames(Age2) <- c("Age", "Year", "FL")


Age_wk <- Age[complete.cases(Age$Age),]
Age2_wk <- Age2[complete.cases(Age2$FL),]

## plot each age frequency seperately 

log2011 = Age_wk$Year==2011
log2012 = Age_wk$Year==2012
log2013 = Age_wk$Year ==2013

log22011 = Age2_wk$Year==2011
log22012 = Age2_wk$Year==2012
log22013 = Age2_wk$Year ==2013


Age_2011 = Age_wk[log2011,]
Age_2012 = Age_wk[log2012,]
Age_2013 = Age_wk[log2013,]


Age2_2011 = Age2_wk[log22011,]
Age2_2012 = Age2_wk[log22012,]
Age2_2013 = Age2_wk[log22013,]

library(plyr)
agelength11 <- ddply(Age2_2011, c("Age"), summarise,  N= length(FL), FL.mean=median(FL))
  AL11up <-rbind(agelength11, c("10+", 8, NA)) #adding a 10+ group to make a histogram with a 10+ column
  AL11up <- AL11up[-c(9,10,11,12, 13,14,15),] # removing extra rows with info after 10

agelength12 <- ddply(Age2_2012, c("Age"), summarise, N= length(FL), FL.mean=median(FL))
  AL12up <- rbind(agelength12, c("10+",11, NA )) #adding a 10+ group to make a histogram with a 10+ column
  AL12up <- AL12up[-c(8,9,10,11,12,13,14,15),] #removing extra rows with info after 10

agelength13 <- ddply(Age2_2013, c("Age"), summarise, N=length(FL), FL.mean=median(FL))
  AL13up <- rbind(agelength13, c("10+",4, NA)) #adding a 10+ group to make a histogram with a 10+ column
  AL13up <- AL13up[-c(7,8,9,10),] #removing extra rows with info after 10


#from stack overflow

#http://stackoverflow.com/questions/4073223/how-do-you-use-hist-to-plot-relative-frequencies-in-r
#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

#http://stackoverflow.com/questions/20528488/how-to-separate-geom-vline-and-geom-hline-legends-from-other-legends-in-ggpl

library(ggplot2)
library(scales)

### 2011 ###

#http://stackoverflow.com/questions/24438462/creating-legend-in-geom-histogram-for-elements-created-from-geom-vline/
#24442529#24442529
se <- function(x) sqrt(var(x)/length(x))
se_11 <- se(Age_2011$Age)
mean_11 <- mean(Age_2011$Age)
se_11_plus <- mean_11 + se_11
se_11_minus <- mean_11 - se_11
UCI_11 <- mean_11 + 1.96*(se_11)
LCI_11 <- mean_11 - 1.96*(se_11)
p11_age <- ggplot(Age_2011, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     				
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	scale_x_continuous(name="Age (years)", limits=c(1,30), breaks=seq(1,30,1))+
	geom_vline(aes(xintercept=mean_11, color="Mean", linetype="Mean"), size=.75, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_11, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_11, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
		# theme(legend.key=element_rect(fill="white", color ="white"))+
		# theme(legend.background=element_blank())+
		# guides(colour=guide_legend(override.aes=list(linetype=0)), fill=guide_legend(override.aes=list(linetype=0)), 
		# shape=guide_legend(override.aes=list(linetype=0)),
		# linetype=guide_legend())+
		# scale_color_manual("Legend", values=c(mean_11="red", se_11_plus="blue"))+
		# scale_shape_manual("Legend", values=c(mean_11=19, se_11_plus=3))
	ggtitle("Age Frequency Histogram of 2011 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", 			
		fill="white"), axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14),
		axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14),
		legend.position=c(.85,.50),
		legend.title=element_blank()) # changing size of plot title)+) # changing size of plot title)+)
		
age_11_basic <- ggplot(Age_2011, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     				
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	scale_x_continuous(name="Age (years)", limits=c(1,10), breaks=seq(1,10,1))+
	#geom_vline(aes(xintercept=mean_11, color="Mean", linetype="Mean"), size=.75, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=UCI_11, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=LCI_11, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	#scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
		# theme(legend.key=element_rect(fill="white", color ="white"))+
		# theme(legend.background=element_blank())+
		# guides(colour=guide_legend(override.aes=list(linetype=0)), fill=guide_legend(override.aes=list(linetype=0)), 
		# shape=guide_legend(override.aes=list(linetype=0)),
		# linetype=guide_legend())+
		# scale_color_manual("Legend", values=c(mean_11="red", se_11_plus="blue"))+
		# scale_shape_manual("Legend", values=c(mean_11=19, se_11_plus=3))
	ggtitle("Age Frequency Histogram of 2011 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", 			
		fill="white"), axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14),
		axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))
		#legend.position=c(.85,.50),
		#legend.title=element_blank()) # changing size of plot title)+) # changing size of plot title)+)


## 2012
se_12 <- se(Age_2012$Age)
mean_12 <- mean(Age_2012$Age)
se_12_plus <- mean_12 + se_12
se_12_minus <- mean_12 - se_12
UCI_12 <- mean_12 + 1.96*(se_12)
LCI_12 <- mean_12 - 1.96*(se_12)
p12_age <- ggplot(Age_2012, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     		
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	scale_x_continuous(name="Age (years)", limits=c(1,30), breaks=seq(1,30,1))+
	geom_vline(aes(xintercept=mean_12, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_12, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_12, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Age Frequency Histogram of 2012 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.50),
			legend.title=element_blank())
			
age_12_basic <- ggplot(Age_2012, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     		
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	scale_x_continuous(name="Age (years)", limits=c(1,10), breaks=seq(1,10,1))+
	#geom_vline(aes(xintercept=mean_12, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=UCI_12, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=LCI_12, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	#scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Age Frequency Histogram of 2012 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14))
			#legend.position=c(.85,.50),
			#legend.title=element_blank())

## 2013
se_13 <- se(Age_2013$Age)
mean_13 <- mean(Age_2013$Age)
se_13_plus <- mean_13 + se_13
se_13_minus <- mean_13 - se_13
UCI_13 <- mean_13 + 1.96*(se_13)
LCI_13 <- mean_13 - 1.96*(se_13)		
p13_age <- ggplot(Age_2013, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     		
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	xlab("Age (years)")+
	scale_x_continuous(limits=c(1,30), breaks=seq(1,30,1))+
	geom_vline(aes(xintercept=mean_13, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_13, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_13, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Age Frequency Histogram of 2013 Catch")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.50),
			legend.title=element_blank())
			
age_13_basic <- ggplot(Age_2013, aes(x=Age))+ 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+     		
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+  ## plotting in percent frequency
	xlab("Age (years)")+
	scale_x_continuous(limits=c(1,10), breaks=seq(1,10,1))+
	#geom_vline(aes(xintercept=mean_13, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=UCI_13, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=LCI_13, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	#scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	#scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Age Frequency Histogram of 2013 Catch")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14))
			#legend.position=c(.85,.50),
			#legend.title=element_blank())

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



pdf("Multiplot_BASIC_Age_Freq.jpg", width=7, height=7)
multiplot(age_11_basic,  age_12_basic, age_13_basic)
dev.off()


tiff("Multiplot_Age_Freq.tiff",  width=7, height=7,unit="in", res=300) # saves to the working directory.. unable to give a file address for some reason
multiplot(p11_age, p12_age, p13_age, cols=1)
dev.off()




## FACETED AGE FREQUENCY PLOT   

### LOST SOME VARIABLES HERE## WILL HAVE TO RE DO IF NECESSARY
library(plyr)
med.fac1 = ddply(Age_wk, .(Year), function(.d)
data.frame(x=mean(.d$Age))) 


#https://groups.google.com/forum/#!topic/ggplot2/uoirPdj-ZoU

##http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

#http://stackoverflow.com/questions/19989235/align-bars-of-histogram-centered-on-labels

library(ggplot2)
library(scales)
total_age <- ggplot(Age_wk, aes(x= Age))+ 
geom_histogram(aes(y=(..ncount..)/sum(..ncount..)), binwidth=1, origin=-.5, fill="white", color="black")+
scale_y_continuous(labels=percent_format(), name="Frequency (%)")+ # origin alings bar in middle of dashed label
xlab("Age (yrs)")+ 
scale_x_continuous(limits=c(1,30), breaks=seq(1,30,1)) + 
facet_grid(Year ~.)+ # making facet grid so  catch Year is vertical
geom_vline(data=med.fac1, aes(xintercept=x, color="Mean", linetype="Mean"), show_guide=TRUE)+ # making vertical medians with faceted set up, size adjusts the thickness
geom_vline(data=med.fac.UCI, aes(xintercept=x, color="Confidence.Interval", linetype="Confidence.Interval"), show_guide=TRUE)+
geom_vline(data=med.fac.LCI, aes(xintercept=x, color="Confidence.Interval", linetype="Confidence.Interval"), show_guide=TRUE)+
scale_colour_manual(name="Legend", values=c(Mean= "red", Confidence.Interval="blue"))+
scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval= "solid"), guide=FALSE)+
ggtitle ("Age Frequencies Across Catch Years")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.15),
			legend.title=element_blank())# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 
			
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/Faceted_age.jpg", plot=total_age, width=7, height=4.5)







## LENGTHHHH ###

Length <- data.frame(mydata$Fork.Length..cm., mydata$Year)
colnames(Length) <- c("FL", "Year")

Length_wk <- Length[complete.cases(Length$FL),]

log2011 = Length_wk$Year==2011
log2012 = Length_wk$Year==2012
log2013 = Length_wk$Year==2013

Length_2011 = Length_wk[log2011,]
Length_2012 = Length_wk[log2012,]
Length_2013 = Length_wk[log2013,]



se_11_length <- se(Length_2011$FL)
mean_11_length <- median(Length_2011$FL)
se_11_length_plus <- mean_11_length + se_11_length
se_11_length_minus <- mean_11_length - se_11_length
UCI_11_length <- mean_11_length + 1.96*(se_11_length)
LCI_11_length <- mean_11_length - 1.96*(se_11_length)
p11_len <- ggplot(Length_2011, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length (cm)")+
	geom_vline(aes(xintercept=mean_11_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_11_length, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_11_length, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2011 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.60),
			legend.title=element_blank())# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 


se_12_length <- se(Length_2012$FL)
mean_12_length <- mean(Length_2012$FL)
se_12_length_plus <- mean_12_length + se_12_length
se_12_length_plus <- mean_12_length - se_12_length
UCI_12_length <- mean_12_length + 1.96*(se_12_length)
LCI_12_length <- mean_12_length - 1.96*(se_12_length)
p12_len <- ggplot(Length_2012, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length (cm)")+
	geom_vline(aes(xintercept=mean_12_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_12_length, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_12_length, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2012 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.60),
			legend.title=element_blank())# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 



se_13_length <- se(Length_2013$FL)

mean_13_length <- mean(Length_2013$FL)
se_13_length_plus <- mean_13_length + se_13_length
se_13_length_plus <- mean_13_length - se_13_length
UCI_13_length <- mean_13_length + 1.96*(se_13_length)
LCI_13_length <- mean_13_length - 1.96*(se_13_length)
p13_len <- ggplot(Length_2013, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length (cm)")+
	geom_vline(aes(xintercept=mean_13_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_13_length, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_13_length, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2013 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.85,.60),
			legend.title=element_blank())# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 
	
	# makes the outline of the plot black and the fill white ,http://#stackoverflow.com/questions/6736378/how-do-i-change-the-background-color-of-a-plot-made-with-ggplot2
#http://www.cookbook-r.com/Graphs/Facets_(ggplot2)/


tiff("Multiplot_Length_Freq.tiff",  width=7, height=7,unit="in", res=300) # saves to the working directory.. unable to give a file address for some reason
multiplot(p11_len, p12_len, p13_len, cols=1)
dev.off()


## FACETED LENGTH ##


#https://groups.google.com/forum/#!topic/ggplot2/uoirPdj-ZoU
library(plyr)
med.fac2 = ddply(Length_wk, .(Year), function(.d)
data.frame(x=mean(.d$FL)))


med.fac.LCI_length = ddply(Length_wk, .(Year), function(.d)
data.frame(x=mean(.d$FL) - (1.96*se(.d$FL))))

 med.fac.UCI_length = ddply(Length_wk, .(Year), function(.d)
data.frame(x=mean(.d$FL) + (1.96*se(.d$FL))))


## creating faceted graphs with vertical median bars-- PROBLEM- this does not calculate frequency by individual group just the entire Age considered in facet
#mydata_wk_age <- mydata[complete.cases(mydata$Age),] # removing NAs from data set

##http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

#http://stackoverflow.com/questions/19989235/align-bars-of-histogram-centered-on-labels

library(ggplot2)
library(scales)
total_length <- ggplot(Length_wk, aes(x= FL))+ 
geom_histogram(aes(y=(..ncount..)/sum(..ncount..)), binwidth=1, origin=-.5, fill="white", color="black")+
scale_y_continuous(labels=percent_format(), name="Frequency (%)")+ # origin alings bar in middle of dashed label
xlab("Fork Length (cm)")+ 
scale_x_continuous(limits=c(20,100), breaks=seq(25,100,4)) + 
facet_grid(Year ~.)+ # making facet grid so  catch Year is vertical
geom_vline(data=med.fac2, aes(xintercept=x, linetype="Mean", colour="Mean"), show_guide=TRUE)+
geom_vline(data=med.fac.UCI_length, aes(xintercept=x, color="Confidence.Interval", linetype="Confidence.Interval"), show_guide=TRUE)+
geom_vline(data=med.fac.LCI_length, aes(xintercept=x, color="Confidence.Interval", linetype="Confidence.Interval"), show_guide=TRUE)+
scale_colour_manual(name="Legend", values=c(Mean="red", Confidence.Interval="blue"))+
scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval= "solid"), guide=FALSE)+
ggtitle ("Length Frequency Histograms Across Catch Years")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"),
			axis.text.x=element_text(size=10, colour="black"), #changing  colour of x axis
			axis.text.y=element_text(colour="black"), #changing colour of y acis
			plot.title=element_text(size=14),
			legend.position=c(.80,.20),
			legend.title=element_blank())# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 
			
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/Faceted_Length.jpg", plot=total_length, width=7.75, height=4.5)

			
			
	
	
	
	
	
			
			
### Code for LaTeX tables ###
seq= seq(2011,2013)
year <- matrix(seq, ncol=1)
mean_age <- matrix(rbind(mean_11, mean_12, mean_13))
se_age <- matrix(rbind(se_11, se_12, se_13))
LCI_age <- matrix(rbind(LCI_11, LCI_12, LCI_13))
UCI_age <- matrix(rbind(UCI_11, UCI_12, UCI_13))
Range_age <- rbind(range(Age_2011$Age), range(Age_2012$Age), range(Age_2013$Age))

table_age <- data.frame(year, mean_age, se_age, LCI_age, UCI_age, Range_age)
colnames(table_age) <- c("Year", "Mean Age", "Standard Error", "Lower Confidence Interval", "Upper Confidence Interval", "Min Age", "Max Age")

library(xtable)
age_table <- xtable(table_age, floating=FALSE)


seq= seq(2011,2013)
year <- matrix(seq, ncol=1)
mean_length <- matrix(rbind(mean_11_length, mean_12_length, mean_13_length))
se_length <- matrix(rbind(se_11_length, se_12_length, se_13_length))
LCI_length <- matrix(rbind(LCI_11_length, LCI_12_length, LCI_13_length))
UCI_length <- matrix(rbind(UCI_11_length, UCI_12_length, UCI_13_length))
Range_length <- rbind(range(Length_2011$FL), range(Length_2012$FL), range(Length_2013$FL))

table_length <- data.frame(year, mean_length, se_length, LCI_length, UCI_length, Range_length)
colnames(table_length) <- c("Year", "Mean Length", "Standard Error", "Lower Confidence Interval", "Upper Confidence Interval", "Min Length", "Max Length")

library(xtable)
length_table <- xtable(table_length, floating=FALSE)


