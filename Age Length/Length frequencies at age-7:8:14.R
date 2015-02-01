#Length frequencies at age based on the Lowerre Barbiereie et al. Age and growth of C. relagis, Figure 6



mydata= read.csv("Raw_Age_Length.csv", header=TRUE)


Length <- data.frame(mydata$Age, mydata$Fork.Length..cm.)

colnames(Length) <- c("Age", "FL")

remove_idx <- Length$Age < 10  # remove ages 10 and up because there aren't very many of them

Length_wk <- data.frame(Length[remove_idx,])
Length_wk<- data.frame(Length_wk[complete.cases(Length_wk),])
Length_wk$Age.f <- as.factor(Length_wk$Age)
# if I want to plot the mean of each group and the N values associated
# http://www.cookbook-r.com/Manipulating_data/Summarizing_data/ 
library(plyr)

working <- ddply(Length_wk, "Age.f", summarise, length.mean=mean(FL),sd=sd(FL), N= length(FL), se=sd/sqrt(N), Min= min(FL), Max=max(FL), N= length(FL))


library(ggplot2)

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
#http://stackoverflow.com/questions/16569489/when-using-geom-histogram-there-is-error-unittic-pos-c-mm-x-and-uni
plot <- ggplot(Length_wk, aes(x=FL, fill= as.factor(Age)))+ 
		geom_density(alpha=.25, colour="grey")+
		#geom_density(alpha=.3, colour="black", show_guide=FALSE)+ # alpha adjusts the amount of fill color
		geom_vline(data=working, aes(xintercept=length.mean, colour=Age.f), linetype= "dashed", size=.5)+
		scale_fill_discrete(name="Age")+
		theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), panel.background=element_rect(colour="black", 					fill="white"), legend.key=element_blank(),
				axis.title.x =element_text(colour="black"),
				axis.text.x = element_text(colour="black"),
				axis.title.y =element_text(colour="black"),
				axis.text.y = element_text(colour="black"),
				legend.background=element_rect(fill='white', colour = 'black'),
				legend.position=c(.925,.65),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
		ggtitle("Kernal Density Plot of Fork Length at Age")+
		xlab("Fork Length (cm)")+
		ylab("Relative Density")
		
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/Kernal_Density_plot.tiff", plot=plot, width=7, height=4.5,unit="in", dpi=300)

# ppi <- 300
# png("plot.png", width=6*ppi, height=3*ppi, res=ppi)
# plot(plot)
# dev.off()

# pdfFile <- c("/Users/elizabethherdter/Desktop/testplot.pdf")
# pdf(pdfFile)



		
## LATEX TABLE ##

## can use the working table above that was achieved by using ddply

workingdf <- data.frame(working)
colnames(workingdf) <- c("Age", "Mean Fork Length (cm)", "Standard Error", "Min Fork Length (cm)", "Max Fork Length (cm)", "N" )

library(xtable)
latex_table <- xtable(workingdf, floating=FALSE)