

data= read.csv('Increments(-1st and last).csv', header=T, row.names=1)
col <- colnames(data)
row <- rownames(data)

# http://stackoverflow.com/questions/23420961/plotting-multiple-lines-from-a-data-frame-with-ggplot2
# want to plot the data so I'm going to melt the data into a "long-format"

# first I need to actually make a column that identifies the time variable even though time is listed in the rows.. I need to be able to use the time variable in order to melt the data by time


# make plot of raw data
time <- c(2004:2013)
new_data <- cbind(time, data)
library('reshape2')
library('ggplot2')
melted_raw = melt(new_data, id.vars="time")

plot_raw <- ggplot()+ geom_line(data=melted_raw, aes(x=time, y=value, group=variable))+
            ylab("Ring width (mm)")+
             xlab("Year")+
            theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
                          panel.background=element_rect(colour="black", fill="white"),
                          legend.key=element_blank(), 
                          axis.title.x =element_text(colour="black"),
                          axis.text.x = element_text(colour="black"),
                          axis.title.y =element_text(colour="black"),
                          axis.text.y = element_text(colour="black"),
                          legend.background=element_rect(fill='white', colour = 'black'),
                          axis.text.x=element_text(colour="black"), #changing  colour of x axis
                           axis.text.y=element_text(colour="black"))#changing colour of y acis
                


# detrend data and make chronology
library(dplR)
rwi <- detrend(data, method="ModNegExp")
rwi.crn <- chron(rwi) # creates mean chronology based on Tukeys biweight robust mean (an average unaffected by outliers)


# like above need to add a time column that is usable 
time <- c(2004:2013)
new_rwi <- cbind(time, rwi)
new_rwi.crn <- cbind(time, rwi.crn)


library('reshape2')
library('ggplot2')
melted = melt(new_rwi, id.vars="time")

plotA <- ggplot()+ geom_line(data=melted, aes(x=time, y=value, group=variable, colour="value"))+  #gives each of these a different color
                  geom_line(data=new_rwi.crn, aes(x=time, y= xxxstd, colour="xxxstd")) +
                  scale_colour_manual(values=c("#999999", "#000000"))+ #specifies color for each
                   ylab("Ring width index")+
                  xlab("Year")+
                  scale_x_continuous(limits=c(2004, 2012), breaks=seq(2004, 2012,1))+
                  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
                      panel.background=element_rect(colour="black", fill="white"),
                      legend.key=element_blank(), 
                      axis.title.x =element_text(colour="black"),
                      axis.text.x = element_text(colour="black"),
                      axis.title.y =element_text(colour="black"),
                      axis.text.y = element_text(colour="black"),
                      legend.position="none", # no legend
                      axis.text.x=element_text(colour="black"), #changing  colour of x axis
                      axis.text.y=element_text(colour="black"))#changing colour of y acis


