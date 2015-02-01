

## estimating a and b for total length weight set but then seperated by sex
mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")  # raw_Age_length also has weight and sex data


logicalF <- (mydata$Sex =="F")
mydataF <-mydata[logicalF,]

LengthF=mydataF$Fork.Length..cm
WeightF=mydataF$Weight..kg.

working_F <- data.frame(LengthF, WeightF)
working_F <- working_F[complete.cases(working_F),]

aF=.001
bF=3

fitF = nls(WeightF ~ aF*LengthF^bF, start=list(aF=aF, bF=bF), data=working_F)
summary(fitF)
confint(fitF)

library(nlstools)
bootF <- nlsBoot(fitF, niter=999)
bootF_CI <- bootF$bootCI
bootFCoef <- data.frame(bootF$coefboot)
colnames(bootFCoef) <- c("aF", "bF")

### make a plot
fitted_yF <- data.frame(predict(fitF))

fitted_wkF <- data.frame(working_F$LengthF, fitted_yF)
fitted_labelF <- rep("Fitted", 399)
fitted_dataF <- data.frame(fitted_labelF, fitted_wkF)
colnames(fitted_dataF) <- c("Label", "x", "y")

observed_labelF <- rep("Observed", 399)
observedF <- data.frame(cbind(observed_labelF, working_F))
colnames(observedF) <- c("Label", "x", "y")

dfF<- data.frame(rbind(observedF, fitted_dataF))


library(ggplot2)

	
LW_F <-ggplot(data= subset(dfF, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(dfF, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,14), breaks=seq(0,14, 2))+
	#scale_x_continuous(limits=c(25,90), breaks=seq(25,90,10))+
	xlab("Fork Length (cm)")+
	ylab("Total Weight (kg)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Females")




logicalM <- (mydata$Sex =="M")
mydataM <-mydata[logicalM,]

LengthM=mydataM$Fork.Length..cm
WeightM=mydataM$Weight..kg.

working_M <- data.frame(LengthM, WeightM)
working_M <- working_M[complete.cases(working_M),]

aM=.001
bM=3

fitM = nls(WeightM ~ aM*LengthM^bM, start=list(aM=aM, bM=bM), data=working_M)
summary(fitM)
confint(fitM)

library(nlstools)
bootM <- nlsBoot(fitM, niter=999)
bootM_CI <- bootM$bootCI
bootMCoef <- data.frame(bootM$coefboot)
colnames(bootMCoef) <- c("aM", "bM")

fitted_yM <- data.frame(predict(fitM))

fitted_wkM <- data.frame(working_M$LengthM, fitted_yM)
fitted_labelM <- rep("Fitted", 383)
fitted_dataM <- data.frame(fitted_labelM, fitted_wkM)
colnames(fitted_dataM) <- c("Label", "x", "y")

observed_labelM <- rep("Observed", 383)
observedM <- data.frame(cbind(observed_labelM, working_M))
colnames(observedM) <- c("Label", "x", "y")


dfM<- data.frame(rbind(observedM, fitted_dataM))


library(ggplot2)

	
LW_M <-ggplot(data= subset(dfM, Label %in% c("Fitted")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(dfM, Label== "Observed"), size =1.5)+
	#scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	#scale_y_continuous(limits=c(0,14), breaks=seq(0,14, 2))+
	#scale_x_continuous(limits=c(25,90), breaks=seq(25,90,10))+
	xlab("Fork Length (cm)")+
	ylab("Total Weight (kg)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Males")
	
tiff("Multiplot_MF_LengthWeight.tiff", width=7, height=5, units="in", res=300)
multiplot(LW_M, LW_F, cols=1)
dev.off()

#### A #####

#formatting correctly for boxplots
AF <- data.frame(bootFCoef$aF)
colnames(AF) <- c("A")
AM<- data.frame(bootMCoef$aM)
colnames(AM) <- c("A")

AAll <- rbind(AF, AM)

Female <- data.frame(rep("Female", 999))
colnames(Female) <- c("Sex")
Male<- data.frame(rep("Male", 999))
colnames(Male) <- c("Sex")

Sex <- rbind(Female, Male)

working_A <- data.frame(Sex, AAll)
colnames(working_A) <- c("Sex", "A")

library(ggplot2)

boxplotA <- ggplot(working_A, aes(x=as.factor(Sex), y=A, colour=as.factor(Sex)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Sex")+  #changing the title of the legend
				 xlab("Sex")+
				 ylab("a")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																						panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped a Estimations")


#### B #####

#formatting correctly for boxplots
BF <- data.frame(bootFCoef$bF)
colnames(BF) <- c("B")
BM<- data.frame(bootMCoef$bM)
colnames(BM) <- c("B")

BAll <- rbind(BF, BM)

Female <- data.frame(rep("Female", 999))
colnames(Female) <- c("Sex")
Male<- data.frame(rep("Male", 999))
colnames(Male) <- c("Sex")

Sex <- rbind(Female, Male)

working_B <- data.frame(Sex, BAll)
colnames(working_B) <- c("Sex", "B")

library(ggplot2)

boxplotB <- ggplot(working_B, aes(x=as.factor(Sex), y=B, colour=as.factor(Sex)))+
				 geom_boxplot()+
				 scale_colour_discrete(name="Sex")+  #changing the title of the legend
				 xlab("Sex")+
				 ylab("b")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																						panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
				 ggtitle("Bootstrapped b Estimations")

tiff("Multiplot_Boxplots_lengthweight_Sex.tiff", width=7, height=7, units="in", res=300)
multiplot(boxplotA, boxplotB)
dev.off()