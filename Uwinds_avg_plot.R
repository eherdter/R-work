## plotting 

mydata= read.csv('BC_10_20_14.csv',header=TRUE)

newdata <- data.frame(subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation,June.U, July.U, August.U, September.U, October.U, November.U, December.U)))

newdata <- newdata[complete.cases(newdata),]

newdata$June.U <- as.numeric(as.character(newdata$June.U))
newdata$July.U <- as.numeric(as.character(newdata$July.U))
newdata$August.U <- as.numeric(as.character(newdata$August.U))
newdata$September.U <- as.numeric(as.character(newdata$September.U))
newdata$October.U <- as.numeric(as.character(newdata$October.U))
newdata$November.U <- as.numeric(as.character(newdata$November.U))
newdata$December.U <- as.numeric(as.character(newdata$December.U))

newdata$meanU <- rowMeans(subset(newdata, select = c(June.U, July.U, August.U, September.U, October.U, November.U, December.U))) #, na.rm=TRUE) # "August.U", "September.U", "October.U", "November.U", "December.U")), na.rm=TRUE)
newdata$medianU <- apply(newdata[,c("June.U", "July.U", "August.U", "September.U", "October.U", "November.U", "December.U")],1, median, na.rm=TRUE) ## to create a MSLA over the growing season

newdata$medianU_zc <- newdata$medianU -mean(newdata$medianU, na.rm=TRUE)



library(plyr)

df_U <- ddply(newdata, c("Year.of.Increment.Formation"), summarise, N=length(medianU_zc), U.mean=mean(medianU_zc), sd=sd(medianU_zc), se=sd/sqrt(N))

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
testU <- ggplot(df_U, aes(x=Year.of.Increment.Formation, y=U.mean))+ 											
  geom_errorbar(aes(ymin=U.mean-se, ymax=U.mean+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			ylab("U winds (m/s)")+
			xlab("Year")+
			
			scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
			#scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
			theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					  
					      axis.title.x =element_text(colour="black", size=10),
					      axis.text.x = element_text(colour="black", size=8),
					      axis.title.y =element_text(colour="black", size=10),
					      axis.text.y = element_text(colour="black", size=8),
					      plot.title=element_text(size=12))+ # changing size of plot title)+)+
					      #legend.background=element_rect(fill='white', colour = 'black'),
					      #legend.position=c(.92,.25))+
					ggtitle("Zero Centered Mean U winds")
					
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

pdf("Environmental_Variables_plot.pdf", width=7, height=7)
multiplot(testU, testV, testMSLA, testWSC, testRiv, cols=2)
dev.off()