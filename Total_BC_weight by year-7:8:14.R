### plotting back calculated weight from the csv


mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Back.Calculated.Weight..W.aL.b., Increment.Number))


newdata$Increment.Number = factor(newdata$Increment.Number)

library(bear)
df <- data.frame(summarySE(newdata, measurevar="Back.Calculated.Weight..W.aL.b.", groupvars=c("Increment.Number", "Year.of.Increment.Formation")))

  # Increment.Number Year.of.Increment.Formation  N Back.Calculated.Weight..W.aL.b.        sd         se          ci
# 1                 3                        2006 20                       1.3795000 0.3750295 0.08385914  0.17551920
# 2                 3                        2007 32                       1.6134375 0.3599158 0.06362473  0.12976350
# 3                 3                        2008 71                       1.5123944 0.3396026 0.04030341  0.08038261
# 4                 3                        2009 43                       1.3348837 0.3743908 0.05709406  0.11522047
# 5                 3                        2010 17                       1.2182353 0.4253856 0.10317117  0.21871311
# 6                 3                        2011  6                       0.9583333 0.3222059 0.13154002  0.33813440
# 7                 4                        2007 20                       2.0930000 0.5483190 0.12260785  0.25662117
# 8                 4                        2008 32                       2.3875000 0.5797441 0.10248525  0.20902004
# 9                 4                        2009 71                       2.2721127 0.5057015 0.06001573  0.11969760
# 10                4                        2010 43                       1.9044186 0.5581402 0.08511558  0.17177020
# 11                4                        2011 12                       1.8758333 0.6287427 0.18150239  0.39948407
# 12                4                        2012  3                       1.2133333 0.4826317 0.27864753  1.19892354
# 13                5                        2008 20                       2.8510000 0.7075599 0.15821521  0.33114824
# 14                5                        2009 32                       3.3490625 0.8347932 0.14757199  0.30097505
# 15                5                        2010 71                       3.0367606 0.7024870 0.08336986  0.16627595
# 16                5                        2011 31                       2.5851613 0.5919058 0.10630942  0.21711280
# 17                5                        2012  2                       3.3150000 1.9445436 1.37500000 17.47103151
# 18                6                        2009 20                       3.7620000 0.8529367 0.19072245  0.39918667
# 19                6                        2010 32                       4.2231250 1.0239501 0.18101051  0.36917338
# 20                6                        2011 43                       3.7586047 0.8191476 0.12491884  0.25209642
# 21                6                        2012 10                       3.3190000 0.6919770 0.21882235  0.49501055
# 22                7                        2010 20                       4.5845000 1.0253958 0.22928547  0.47990001
# 23                7                        2011 17                       4.7211765 1.2316142 0.29871032  0.63323759
# 24                7                        2012 10                       4.6170000 1.2665092 0.40050538  0.90600610
# > 

## age 2+ (3) from 2006-2007
diff <- 1.613-1.379
percchange <- diff/1.379*100
#16.96882

#from 2008-2009
diff <- (1.512-1.334)/1.512*100

## age 3+ (4) from 2010-2011
diff <- 2.272-1.904
percchange <- diff/2.272*100
# 16.19718



##age 4+ (5) from 2008-2009
diff <- 3.34-2.85
percchange <- diff/2.85*100



# age 4+ (5) from 2009-2010
diff <- 3.03-3.34
percchange <- diff/3.34*100

# age 4+ (5) from 2010-2011
diff <- 2.58-3.03
perchange <- diff/3.03*100



#age 5+(6) from 2010-2011
diff <- 3.75-4.22
percchange <- diff/4.22*100

#14.68647

# # library(plyr)
# test<-ddply(newdata, c("Increment.Number", "Year.of.Increment.Formation"), summarise, N=length(Increment.Width), iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(N))

df$Increment.Number <- factor(df$Increment.Number)  # need to be treated as factor levels so that ggplot makes them correctly


library(ggplot2)
pd <- position_dodge(.05)
testBCweight <- ggplot(df, aes(x=Year.of.Increment.Formation, y=Back.Calculated.Weight..W.aL.b. , colour= Increment.Number))+ 												   geom_errorbar(aes(ymin=Back.Calculated.Weight..W.aL.b.-se, ymax=Back.Calculated.Weight..W.aL.b.+se), width=.15)+ # position=pd)+
					geom_line()+
					geom_point(size=3)+  # changing postion and size of points
					labs(color="Age")+  #changing name of legend
					ylab("Weight (kg)")+
					xlab("Year")+
					scale_colour_discrete(name="Age", breaks=c("3","4","5","6","7"), labels=c("2+","3+","4+","5+","6+"))+ 
					theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'),
					      legend.position=c(.925,.35),
					       axis.text.x=element_text(colour="black"), #changing  colour of x axis
						axis.text.y=element_text(colour="black"), #changing colour of y acis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
					scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
					scale_y_continuous(limits=c(0,5.5), breaks=seq(0,5.5,.5))+
					ggtitle("Mean Weight Through Years")
ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Total_BC_weight.pdf', plot=testBCweight, width=7, height=4)					