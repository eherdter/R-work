data <- read.csv("Fork_chord Length.csv", header=TRUE, sep=",")

data_new <- cbind(data$Otolith.Radius.at.Capture, data$Fork.Length.at.Capture)
data_new <- data_new[-c(170,171,172),]  ## removes the last NA values

model <- lm(Otolith.Radius.at.Capture ~ Fork.Length.at.Capture, data= data_new)
str(model)
summary(model)

fittedvalues <- fitted(model)

data_new <- data.frame(cbind(data_new, fittedvalues))
colnames(data_new) <-c( "X", "Y", "FittedY")


# http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/
library(ggplot2)

plot <- ggplot(data_new, aes(x=Y, y= X)) + geom_point()+
        geom_smooth(method=lm)+
        xlab("Fork Length (cm")+
        ylab("Otolith Radius (mm)")+
        theme(panel.grid.minor=element_blank(), 
                panel.grid.major=element_blank(),
                panel.background=element_rect(fill='white', colour='black'))
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/FL_ChordLength_plot.tiff", plot=plot, width=7, height=4.5, dpi=300)


        
        