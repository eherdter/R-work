mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")

### FEMALE #####
logicalF <- (mydata$Sex =="F")
mydataF <-mydata[logicalF,]


FemaleAge = mydataF$Fractional.Age
FemaleLength=mydataF$Fork.Length..cm

small= cbind(FemaleAge, FemaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$FemaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wkF <- data.frame(smalldf2$FemaleAge, smalldf2$FemaleLength)
colnames(smalldf_wkF) <- c("FemaleAge", "FemaleLength")

Linf_F=80
K_F=.18
t0_F=0

fitF= nls(FemaleLength ~  Linf_F*(1-exp(-K_F*(FemaleAge-t0_F))), start=list(Linf_F=Linf_F, K_F=K_F,t0_F=t0_F), data=smalldf_wkF)


summary(fitF)
confint(fitF)

  

library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootF <- nlsBoot(fitF, niter=999)
bootF$bootCI #contains the bootstrap medians and the bootstrap 95% CI
plot(bootF, type="boxplot")
bootF$coefboot # contains the bootstrap parameter estimates 

bootFCoef <- data.frame(bootF$coefboot) ## 999 Bootstrapped parameter estimates
colnames(bootFCoef) <- c("p1_F", "p2_F", "p3_F")

#### MALE ####

logicalM<- (mydata$Sex =="M")
mydataM <-mydata[logicalM,]

MaleAge = mydataM$Fractional.Age
MaleLength=mydataM$Fork.Length..cm

small= cbind(MaleAge, MaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$MaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wkM <- data.frame(smalldf2$MaleAge, smalldf2$MaleLength)
colnames(smalldf_wkM) <- c("MaleAge", "MaleLength")

Linf_M=80
K_M=.18
t0_M=0

fitM= nls(MaleLength ~  Linf_M*(1-exp(-K_M*(MaleAge-t0_M))), start=list(Linf_M=Linf_M, K_M=K_M,t0_M=t0_M), data=smalldf_wkM)

summary(fitM)
confint(fitM)


library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootM <- nlsBoot(fitM, niter=999)
bootM$bootCI #contains the bootstrap medians and the bootstrap 95% CI
plot(bootM, type="boxplot")
boot$coefboot # contains the bootstrap parameter estimates 


bootMCoef <- data.frame(bootM$coefboot) ## 999 Bootstrapped parameter estimates
colnames(bootMCoef) <- c("p1_M", "p2_M", "p3_M")

## NOW JOINING TOGETHER ###

#### LINF #####



#formatting correctly for boxplots
LinfF <- data.frame(bootFCoef$p1_F)
colnames(LinfF) <- c("Linf")
LinfM<- data.frame(bootMCoef$p1_M)
colnames(LinfM) <- c("Linf")
LinfAll <- rbind(LinfF, LinfM)

Female <- data.frame(rep("Female", 998))
colnames(Female) <- c("Sex")
Male <- data.frame(rep("Male", 998))
colnames(Male) <- c("Sex")

SexLabel <- rbind(Female, Male)

working_Linf <- data.frame(SexLabel, LinfAll)
colnames(working_Linf) <- c("Sex", "Linf")

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
library(ggplot2)

boxplotLinf_Sex <- ggplot(working_Linf, aes(x=as.factor(Sex), y=Linf, colour=as.factor(Sex)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Sex")+  #changing the title of the legend
				 xlab("Sex")+
				 ylab("Linf")+
				 scale_y_continuous(breaks=seq(70,100,5))+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																																panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped Linf Estimations")
				 
### K #####

#formatting correctly for boxplots
kF <- data.frame(bootFCoef$p2_F)
colnames(kF) <- c("k")
kM<- data.frame(bootMCoef$p2_M)
colnames(kM) <- c("k")
kAll <- rbind(kF, kM)

Female <- data.frame(rep("Female", 998))
colnames(Female) <- c("Sex")
Male <- data.frame(rep("Male", 998))
colnames(Male) <- c("Sex")

SexLabel <- rbind(Female, Male)

working_k <- data.frame(SexLabel, kAll)
colnames(working_k) <- c("Sex", "k")

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
library(ggplot2)

boxplotk_Sex <- ggplot(working_k, aes(x=as.factor(Sex), y=k, colour=as.factor(Sex)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Sex")+  #changing the title of the legend
				 xlab("Sex")+
				 ylab("k")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped k Estimations")				 
				 
				 
### t0#####

#formatting correctly for boxplots
t0F <- data.frame(bootFCoef$p3_F)
colnames(t0F) <- c("t0")
t0M<- data.frame(bootMCoef$p3_M)
colnames(t0M) <- c("t0")
t0All <- rbind(t0F, t0M)

Female <- data.frame(rep("Female", 998))
colnames(Female) <- c("Sex")
Male <- data.frame(rep("Male", 998))
colnames(Male) <- c("Sex")

SexLabel <- rbind(Female, Male)

working_t0 <- data.frame(SexLabel, t0All)
colnames(working_t0) <- c("Sex", "t0")

#http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
library(ggplot2)

boxplott0_Sex <- ggplot(working_t0, aes(x=as.factor(Sex), y=t0, colour=as.factor(Sex)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Sex")+  #changing the title of the legend
				 xlab("Sex")+
				 ylab("t0")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped t0 Estimations")				 

pdf("Multiplot_VonBboxplots_bysex.pdf", width=7, height=7)
multiplot(boxplotLinf_Sex, boxplotk_Sex, boxplott0_Sex, cols=1)
dev.off()