mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")


logicalF <- (mydata$Sex =="F")
mydataF <-mydata[logicalF,]


FemaleAge = mydataF$Fractional.Age
FemaleLength=mydataF$Fork.Length..cm

small= cbind(FemaleAge, FemaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$FemaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wk <- data.frame(smalldf2$FemaleAge, smalldf2$FemaleLength)
colnames(smalldf_wk) <- c("FemaleAge", "FemaleLength")

Linf=80
K=.18
t0=0

fitF= nls(FemaleLength ~  Linf*(1-exp(-K*(FemaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wk)


summary(fitF)
confint(fitF)

  

library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootF <- nlsBoot(fitF, niter=999)
bootF$bootCI #contains the bootstrap medians and the bootstrap 95% CI
plot(bootF, type="boxplot")
bootF$coefboot # contains the bootstrap parameter estimates 

newrow <- c(.2554,0) 
fitted_y <- data.frame(predict(fitF))

fitted_wk <- data.frame(smalldf_wk$FemaleAge, fitted_y)
fitted_bind <- rbind(fitted_wk, newrow)

fitted_label <- rep("von Bertalanffy Fit", 408)
fitted_data <- data.frame(fitted_label, fitted_bind)
colnames(fitted_data) <- c("Label", "x", "y")

observed_label <- rep("Observed", 407)
observed <- data.frame(cbind(observed_label, smalldf_wk))
colnames(observed) <- c("Label", "x", "y")


df<- data.frame(rbind(observed, fitted_data))


library(ggplot2)
VonB_Female <-ggplot(data= subset(df, Label %in% c("von Bertalanffy Fit")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df, Label== "Observed"), size =1.5)+
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

MaleAge = mydataM$Fractional.Age
MaleLength=mydataM$Fork.Length..cm

small= cbind(MaleAge, MaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$MaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wk <- data.frame(smalldf2$MaleAge, smalldf2$MaleLength)
colnames(smalldf_wk) <- c("MaleAge", "MaleLength")

Linf=80
K=.18
t0=0

fitM= nls(MaleLength ~  Linf*(1-exp(-K*(MaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wk)

summary(fitM)
confint(fitM)


library(nlstools)
#http://cran.r-project.org/web/packages/nlstools/nlstools.pdf#
bootM <- nlsBoot(fitM, niter=999)
bootM$bootCI #contains the bootstrap medians and the bootstrap 95% CI
plot(bootM, type="boxplot")
boot$coefboot # contains the bootstrap parameter estimates 


plot(MaleAge,MaleLength)
lines(MaleAge, predict(fitM))  

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

newrow <- c(.696,0) 
fitted_y <- data.frame(predict(fitM))

fitted_wk <- data.frame(smalldf_wk$MaleAge, fitted_y)
fitted_bind <- rbind(fitted_wk, newrow)

fitted_label <- rep("von Bertalanffy Fit", 392)
fitted_data <- data.frame(fitted_label, fitted_bind)
colnames(fitted_data) <- c("Label", "x", "y")

observed_label <- rep("Observed", 391)
observed <- data.frame(cbind(observed_label, smalldf_wk))
colnames(observed) <- c("Label", "x", "y")


df<- data.frame(rbind(observed, fitted_data))

library(ggplot2)
VonB_Male<-ggplot(data= subset(df, Label %in% c("von Bertalanffy Fit")), aes(x=x, y=y))+ 
		#colour=Label, group=Label))+ #group calls tells which points to connect with lines 
	 geom_line(aes(group=Label, colour= Label))+ # make line types based on the different labels- this will be our workaround because in a few stps we will specify the first label (obserseved) be a blank line (therefore a scatter plot)
	geom_point(data=subset(df, Label== "Observed"), size =1.5)+
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
	


