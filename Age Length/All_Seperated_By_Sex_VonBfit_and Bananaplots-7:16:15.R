mydata <- read.csv("AgeLengthWeight_master.csv", header=TRUE,sep=",")


logicalF <- (mydata$Sex =="F")
mydataF <-mydata[logicalF,]


FemaleAge = mydataF$Age
FemaleLength=mydataF$Fork.Length..cm

small= cbind(FemaleAge, FemaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

#remove_idx <- smalldf1$FemaleAge > 0.8

#smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wkF <- data.frame(smalldf1$FemaleAge, smalldf1$FemaleLength)
colnames(smalldf_wkF) <- c("FemaleAge", "FemaleLength")

Linf=80
K=.18
t0=0

fitF= nls(FemaleLength ~  Linf*(1-exp(-K*(FemaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wkF)


summary(fitF)
confint(fitF)

  

library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootF <- nlsBoot(fitF, niter=999)
#bootF$bootCI #contains the bootstrap medians and the bootstrap 95% CIplot(bootF, type="boxplot")

bootFCoef <- data.frame(bootF$coefboot) ## 999 Bootstrapped parameter estimates
colnames(bootFCoef) <- c("p1F", "p2F", "p3F")
LinfF <- data.frame(bootFCoef$p1)
KF <- data.frame(bootFCoef$p2)
t0F <- data.frame(bootFCoef$p3)
  
  

newrowF <- c(.2554,0) 
fitted_yF <- data.frame(predict(fitF))

fitted_wkF <- data.frame(smalldf_wkF$FemaleAge, fitted_yF)
fitted_bindF <- rbind(fitted_wkF, newrowF)

fitted_labelF <- rep("von Bertalanffy Fit", 408)
fitted_dataF <- data.frame(fitted_labelF, fitted_bindF)
colnames(fitted_dataF) <- c("Label", "x", "y")

observed_labelF <- rep("Observed", 407)
observedF <- data.frame(cbind(observed_labelF, smalldf_wkF))
colnames(observedF) <- c("Label", "x", "y")


dfF<- data.frame(rbind(observedF, fitted_dataF))


library(ggplot2)
VonB_Female <-ggplot(data= subset(dfF, Label %in% c("von Bertalanffy Fit")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(dfF, Label== "Observed"), size =1.5)+
	scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	scale_y_continuous(limits=c(0,100), breaks= seq(0,100,10))+
	scale_x_continuous(limits=c(0, 45), breaks=seq(0,45,5))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Length at Age for Females with Fitted von Bertalanffy Regression Line")
	












logicalM<- (mydata$Sex =="M")
mydataM <-mydata[logicalM,]

MaleAge = mydataM$Age
MaleLength=mydataM$Fork.Length..cm

small= cbind(MaleAge, MaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

#remove_idx <- smalldf1$MaleAge > 0.8

#smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wkM <- data.frame(smalldf1$MaleAge, smalldf1$MaleLength)
colnames(smalldf_wkM) <- c("MaleAge", "MaleLength")

Linf=80
K=.18
t0=0

fitM= nls(MaleLength ~  Linf*(1-exp(-K*(MaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wkM)

summary(fitM)
confint(fitM)


library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootM <- nlsBoot(fitM, niter=999)
bootM$bootCI #contains the bootstrap medians and the bootstrap 95% CI

bootMCoef <- data.frame(bootM$coefboot) ## 999 Bootstrapped parameter estimates
colnames(bootMCoef) <- c("p1M", "p2M", "p3M")
LinfM <- data.frame(bootMCoef$p1)
KM <- data.frame(bootMCoef$p2)
t0M <- data.frame(bootMCoef$p3)
  

# Formula: MaleLength ~ p1 * (1 - exp(-p2 * (MaleAge - p3)))

# Parameters:
   # Estimate Std. Error t value Pr(>|t|)    
# p1 78.50774    2.07776  37.785   <2e-16 ***
# p2  0.23865    0.02492   9.575   <2e-16 ***
# p3  0.69614    0.30516   2.281   0.0231 *  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 5.619 on 393 degrees of freedom

# Number of iterations to convergence: 3 
# Achieved convergence tolerance: 1.007e-06

          # 2.5%      97.5%
# p1 74.77597204 82.9422418
# p2  0.19331637  0.2907186
# p3  0.02397114  1.2283155

newrowM <- c(.696,0) 
fitted_yM <- data.frame(predict(fitM))

fitted_wkM <- data.frame(smalldf_wkM$MaleAge, fitted_yM)
fitted_bindM <- rbind(fitted_wkM, newrowM)

fitted_labelM <- rep("von Bertalanffy Fit", 392)
fitted_dataM <- data.frame(fitted_labelM, fitted_bindM)
colnames(fitted_dataM) <- c("Label", "x", "y")

observed_labelM <- rep("Observed", 391)
observedM <- data.frame(cbind(observed_labelM, smalldf_wkM))
colnames(observedM) <- c("Label", "x", "y")


dfM<- data.frame(rbind(observedM, fitted_dataM))

library(ggplot2)
VonB_Male<-ggplot(data= subset(dfM, Label %in% c("von Bertalanffy Fit")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(dfM, Label== "Observed"), size =1.5)+
	scale_shape_manual(values=c(16,20,20))+
	#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
	scale_y_continuous(limits=c(0,90), breaks= seq(0,90,10))+
	scale_x_continuous(limits=c(0, 25), breaks=seq(0,25,5))+
	xlab("Age (yrs)")+
	ylab("Fork Length (cm)")+
theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 									panel.background=element_rect(fill='white', colour='black'),
		legend.key=element_blank(), legend.title=element_blank(),
		legend.background=element_rect(fill='white', size=.5),
		legend.position=c(.85,.20),
		legend.text=element_text(size=10),
		axis.text.x=element_text(colour="black"), #changing  colour of x axis
		axis.text.y=element_text(colour="black"), #changing colour of y acis
		plot.title=element_text(size=14))+ # changing size of plot title)+)+
	ggtitle("Length at Age for Males with Fitted von Bertalanffy Regression Line")
	
	
pdf("Multiplot_MaleFemale_VonB.pdf", width=7, height=5)
multiplot(VonB_Female, VonB_Male, cols=1)
dev.off()


#### plot Male and Female Fit on top of each other without the observations
###

FitM_label <- rep("Male", 392)
FitF_label <- rep("Female", 408)

fitted_bindM
fitted_bindF

master_male <- data.frame(FitM_label, fitted_bindM)
colnames(master_male) <- c("Label", "x", "y")

master_female <- data.frame(FitF_label, fitted_bindF)
colnames(master_female) <- c("Label", "x", "y")




df_master <- data.frame(rbind(master_female, master_male))

VonB_Sex_Comparative<-ggplot(data=df_master, aes(x=x, y=y), group=Label)+
			 			geom_line(aes(group=Label))+ # connects the lines	 
						geom_point(aes(shape=Label, group=Label))+
						#scale_shape_manual(values=c(16,20))+
						#scale_linetype_manual(values=c('blank', 'solid', 'solid'))+
						#scale_y_continuous(limits=c(0,90), breaks= seq(0,90,10))+
						#scale_x_continuous(limits=c(0, 25), breaks=seq(0,25,5))+
						xlab("Age (yrs)")+
						ylab("Fork Length (cm)")+
						theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
								legend.key=element_blank(), legend.title=element_blank(),
								legend.background=element_rect(fill='white', size=.5),
								legend.position=c(.85,.20),
								legend.text=element_text(size=10),
								axis.text.x=element_text(colour="black"), #changing  colour of x axis
								axis.text.y=element_text(colour="black"), #changing colour of y acis
								plot.title=element_text(size=14))+ # changing size of plot title)+)+
						ggtitle("Comparative von Bertalanffy Growth Models for Males and Females")

ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/VonB_Sex_Comparative.tiff", plot=VonB_Sex_Comparative, width=7, height=4.5, units="in", dpi=300)


	

### BANANA PLOTS ####


banana_Male <- data.frame(LinfM, KM)
colnames(banana_Male) <- c("LinfM", "KM")	

banana_Female <- data.frame(LinfF, KF)
colnames(banana_Female) <- c("LinfF", "KF")	

bp_M <- ggplot(banana_Male, aes(x=KM, y=LinfM))+
				 geom_point()+
				 xlab("k")+
				 ylab("Linf")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		plot.title=element_text(size=14))+
				 ggtitle("Plot of Male bootstrapped Linf and k values")
				 
				 
bp_F <- ggplot(banana_Female, aes(x=KF, y=LinfF))+
				 geom_point()+
				 xlab("k")+
				 ylab("Linf")+
				 theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 																	panel.background=element_rect(fill='white', colour='black'),
				 		legend.position="none", axis.text.x=element_text(colour="black"),
				 		axis.text.y=element_text(colour="black"),
				 		plot.title=element_text(size=14))+
				 ggtitle("Plot of Female bootstrapped Linf and k values")				 

pdf("BananaPlot_MF.pdf", width=7, height=4.5)
multiplot(bp_M, bp_F, cols=1)
dev.off()