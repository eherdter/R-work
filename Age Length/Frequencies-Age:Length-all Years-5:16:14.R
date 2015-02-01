# Age and Length %frequencies for 2011,2012, 2013 catch with updated data 5-16-14

mydata= read.csv("Raw_Age_Length.csv", header=TRUE)

Age <- data.frame(mydata$Age, mydata$Year)
colnames(Age) <- c("Age", "Year")

Age_wk <- Age[complete.cases(Age$Age),]

#https://groups.google.com/forum/#!topic/ggplot2/uoirPdj-ZoU
## FACETED AGE FREQUENCY PLOT
library(plyr)
med.fac1 = ddply(Age_wk, .(Year), function(.d)
data.frame(x=mean(.d$Age)))


### borrowing the indexes made from down below to create confidence intervals
se <- function(x) sqrt(var(x)/length(x))

med.fac.LCI = ddply(Age_wk, .(Year), function(.d)
data.frame(x=mean(.d$Age) - (1.96*se(.d$Age))))

 med.fac.UCI = ddply(Age_wk, .(Year), function(.d)
data.frame(x=mean(.d$Age) + (1.96*se(.d$Age))))

mean_df <- data.frame(mean_11, mean_12, mean_13)

## creating faceted graphs with vertical median bars-- PROBLEM- this does not calculate frequency by individual group just the entire Age considered in facet


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
geom_vline(data=med.fac.LCI, aes(xintercept=LCI_age, color="Confidence.Interval", linetype="Confidence.Interval"), show_guide=TRUE)+
scale_colour_manual(name="Legend", values=c(Mean= "red", Confidence.Interval="blue"))+
scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval= "solid"), guide=FALSE)+
ggtitle ("Age Frequencies Across Catch Years")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), # removes both horizontal and vertical gridlines
	  panel.background=element_rect(colour="black", fill="white")) 
# this plot has 30 as a max but 2011 actually has 2 measurements around 40. 





structure(list(Age = c(6L, 7L, 5L, 6L, 7L, 9L,6L, 7L, 5L, 6L, 7L, 9L,6L, 7L, 5L, 6L, 7L, 9L), Year = c(2011, 
2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011 )), .Names = c("Age", "Year"), row.names = c(NA, 6L), class = "data.frame")



## plot each age frequency seperately 

log2011 = Age_wk$Year==2011
log2012 = Age_wk$Year==2012
log2013 = Age_wk$Year ==2013

Age_2011 = Age_wk[log2011,]
Age_2012 = Age_wk[log2012,]
Age_2013 = Age_wk[log2013,]
#from stack overflow

#http://stackoverflow.com/questions/4073223/how-do-you-use-hist-to-plot-relative-frequencies-in-r
#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/


#http://stackoverflow.com/questions/20528488/how-to-separate-geom-vline-and-geom-hline-legends-from-other-legends-in-ggpl

library(ggplot2)
library(scales)


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
	scale_x_continuous(name="Age (years)", limits=c(1,45), breaks=seq(1,45,1))+
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
		fill="white"))


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
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"))


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
	scale_x_continuous(limits=c(1,20), breaks=seq(1,20,1))+
	geom_vline(aes(xintercept=mean_13, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_13, color ="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_13, color="Confidence.Interval", linetype= "Confidence.Interval"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(Confidence.Interval="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", Confidence.Interval="solid"), guide=FALSE)+
	ggtitle("Age Frequency Histogram of 2013 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"))




## NOW FOR LENGTH

Length <- data.frame(mydata$Fork.Length..cm., mydata$Year)
colnames(Length) <- c("FL", "Year")

Length_wk <- Length[complete.cases(Length$FL),]

# FIRST, FACETED
#https://groups.google.com/forum/#!topic/ggplot2/uoirPdj-ZoU
library(plyr)
med.fac2 = ddply(Length_wk, .(Year), function(.d)
data.frame(x=mean(.d$FL)))

se <- function(x) sqrt(var(x)/length(x))
med.fac4 = ddply(Length_wk, .(Year), function(.d)
data.frame(x=se(.d$FL)))

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
scale_x_continuous(limits=c(20,100), breaks=seq(25,100,2)) + 
facet_grid(Year ~.)+ # making facet grid so  catch Year is vertical
geom_vline(data=med.fac2, aes(xintercept=x), linetype="dashed", colour="red", size=1)+
geom_vline(data=med.fac4, aes(xintercept=x), linetype="dashed", color="blue")+  # making vertical medians with faceted set up, size adjusts the thickness
ggtitle ("Length Frequency Histograms Across Catch Years")+
theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), # removes both horizontal and vertical gridlines
	  panel.background=element_rect(colour="black", fill="white")) 





## NOW, By Year
log2011 = Length_wk$Year==2011
log2012 = Length_wk$Year==2012
log2013 = Length_wk$Year==2013

Length_2011 = Length_wk[log2011,]
Length_2012 = Length_wk[log2012,]
Length_2013 = Length_wk[log2013,]



se_11_length <- se(Length_2011$FL)
mean_11_length <- mean(Length_2011$FL)
se_11_length_plus <- mean_11_length + se_11_length
se_11_length_minus <- mean_11_length - se_11_length
UCI_11_length <- mean_11_length + 1.96*(se_11_length)
LCI_11_length <- mean_11_length - 1.96*(se_11_length)
p11_len <- ggplot(Length_2011, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length(cm)")+
	geom_vline(aes(xintercept=mean_11_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_11_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_11_length, color ="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_11_length, color="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(95%.CI="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", 95%.CI="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2011 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"))





se_12_length <- se(Length_2012$FL)
mean_12_length <- mean(Length_2012$FL)
se_12_length_plus <- mean_12_length + se_12_length
se_12_length_plus < mean_12_length - se_12_length
UCI_12_length <- mean_12_length + 1.96*(se_12_length)
LCI_12_length <- mean_12_length - 1.96*(se_12_length)
p12_len <- ggplot(Length_2012, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length(cm)")+
	geom_vline(aes(xintercept=mean_12_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_12_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_12_length, color ="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_12_length, color="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(95%.CI="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", 95%.CI="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2012 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"))




se_13_length <- se(Length_2013$FL)

mean_13_length <- mean(Length_2013$FL)
se_13_length_plus <- mean_13_length + se_13_length
se_13_length_plus < mean_13_length - se_13_length
UCI_13_length <- mean_13_length + 1.96*(se_13_length)
LCI_13_length <- mean_13_length - 1.96*(se_13_length)
p13_len <- ggplot(Length_2013, aes(x=FL)) + 
	geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
	scale_y_continuous(labels=percent_format(), name="Frequency (%)")+
	scale_x_continuous(limits=c(30,90), breaks=seq(30,90,5), name="Fork Length(cm)")+
	geom_vline(aes(xintercept=mean_13_length, color="Mean", linetype="Mean"), size=1, show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_length_plus, color ="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	#geom_vline(aes(xintercept=se_13_length_minus, color="Standard_Error", linetype= "Standard_Error"), show_guide=TRUE)+
	geom_vline(aes(xintercept=UCI_13_length, color ="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	geom_vline(aes(xintercept=LCI_13_length, color="95%.CI", linetype= "95%.CI"), show_guide=TRUE)+
	scale_colour_manual(name="Units", values=c(95%.CI="blue", Mean= "red"))+
	scale_linetype_manual(name="Units", values=c(Mean="dashed", 95%.CI="solid"), guide=FALSE)+
	ggtitle("Length Frequency Histogram of 2013 Catch")+
	theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", fill="white"))


	
	# makes the outline of the plot black and the fill white ,http://#stackoverflow.com/questions/6736378/how-do-i-change-the-background-color-of-a-plot-made-with-ggplot2
#http://www.cookbook-r.com/Graphs/Facets_(ggplot2)/
