###correlating age specific increment series to monthly averages of enviro variables

data= read.csv("BC_12_16.csv", header=TRUE)

idx3 <- data$Increment.Number==3 
idx4<- data$Increment.Number==4 
idx5 <- data$Increment.Number ==5 
idx6 <- data$Increment.Number ==6 
idx7 <- data$Increment.Number==7

data_3 <- data[idx3,]
data_4 <- data[idx4,]
data_5 <- data[idx5,]
data_6 <- data[idx6,]
data_7 <- data[idx7,]

data_wk= data.frame(rbind(data_3, data_4, data_5, data_6, data_7))

# http://stackoverflow.com/questions/3796266/change-the-class-of-many-columns-in-a-data-frame
## how to change all of the environmental variables to numeric values

for(i in c(24, 25:ncol(data_wk))) {
      data_wk[,i] <- as.numeric(as.character(data_wk[,i]))
}

idx3 <- data_wk$Increment.Number==3 
idx4<- data_wk$Increment.Number==4 
idx5 <- data_wk$Increment.Number ==5 
idx6 <- data_wk$Increment.Number ==6 
idx7 <- data_wk$Increment.Number==7


data_wk_3 <- data_wk[idx3,]
data_wkdf_3 <- data.frame(data_wk_3)
data_wk_4 <- data_wk[idx4,]
data_wk_5 <- data_wk[idx5,]
data_wk_6 <- data_wk[idx6,]
data_wk_7 <- data_wk[idx7,]


# if I wanted the average value of each increment number width over all the years
three <- ddply(data_wkdf_3, .(Year.of.Increment.Formation), summarise, N=length(Increment.Width), three.mean=mean(Increment.Width))
# four <- ddply(data_wkdf_4, .(Yr.Inc.Form), summarise, N=length(IncW), four.mean=mean(IncW))
# five <- ddply(data_wkdf_5, .(Yr.Inc.Form), summarise, N=length(IncW), five.mean=mean(IncW))
# six <- ddply(data_wkdf_6, .(Yr.Inc.Form), summarise, N=length(IncW), six.mean=mean(IncW))
# seven <- ddply(data_wkdf_7, .(Yr.Inc.Form), summarise, N=length(IncW), seven.mean=mean(IncW))
# 

# want to loop corr.test through columns of enviro data
#http://stackoverflow.com/questions/17348516/looping-over-set-of-columns-to-perform-spearman-correlation-analysis
# This lapply broke when I was trying to normalize my data so I used the source below. 

#http://www.inside-r.org/packages/cran/ltm/docs/rcor.test
IW3= data.frame(data_wk_3[,10])
IW3_Norm = scale(IW3)
time3= data_wk_3[,12]
VAR_WindU= data_wk_3[,24:40]
VAR_WindU_Norm = scale(VAR_WindU)
VAR_WindV = data_wk_3[,41:57]
VAR_WindV_Norm= scale(VAR_WindV)
VAR_Discharge = data_wk_3[,58:74]
VAR_Discharge_Norm = scale(VAR_Discharge)
VAR_MSLA = data_wk_3[,76:92]
VAR_MSLA_Norm= scale(VAR_MSLA)

df_WindU_3 <- cbind(IW3_Norm,VAR_WindU_Norm, time3)
df_WindV_3 = cbind(IW3_Norm, VAR_WindV_Norm, time3)
df_Discharge_3 =cbind(IW3_Norm, VAR_Discharge_Norm, time3)
df_MSLA_3 <- cbind(IW3_Norm, VAR_MSLA_Norm, time3)


# x <- df_WindU_3[[1]]
# mat <- lapply(df_WindU_3[-1], cor.test, x=x, method="pearson")
# cor(df_WindU_3)
library(ltm)
UW3 <- rcor.test(df_WindU_3, method = "pearson")
#Pmay.U, JuneU, JulyU, AugustU, OctoberU, NovemberU, JanuaryU, MarchU, AprilU
VW3 <- rcor.test(df_WindV_3, method = "pearson")
#PfebV, AugustV
Dis3 <- rcor.test(df_Discharge_3, method = "pearson")
#PMarch, PApril, May, June, August, September, October, March, April
SLA3 <- rcor.test(df_MSLA_3, method= "pearson")
#Pmar, June, September, October, November, December




# library(FactoMineR)
# pcaWindU3 = PCA(df_WindU_3red, graph=FALSE)



IW4_Norm <- scale(data_wk_4[,10])
time4= data_wk_4[,12]
VAR_WindU4= data_wk_4[,24:40]
VAR_WindU4_Norm= scale(VAR_WindU4)
VAR_WindV4 = data_wk_4[,41:57]
VAR_WindV4_Norm = scale(VAR_WindV4)
VAR_Discharge4 = data_wk_4[,58:74]
VAR_Discharge4_Norm= scale(VAR_Discharge4)
VAR_MSLA4 = data_wk_4[,76:92]
VAR_MSLA4_Norm = scale(VAR_MSLA4)

df_WindU_4 <- cbind(IW4_Norm,VAR_WindU4_Norm, time4)
colnames(df_WindU_4)[1] <- "IW_Norm"
df_WindV_4 = cbind(IW4_Norm, VAR_WindV4_Norm, time4)
df_Discharge_4 =cbind(IW4_Norm, VAR_Discharge4_Norm, time4)
df_MSLA_4 <- cbind(IW4_Norm, VAR_MSLA4_Norm, time4)


UW4 <- rcor.test(df_WindU_4, method = "pearson")
VW4 <- rcor.test(df_WindV_4, method = "pearson")
Dis4 <- rcor.test(df_Discharge_4, method = "pearson")
SLA4 <- rcor.test(df_MSLA_4, method= "pearson")





IW5_Norm <- scale(data_wk_5[,10])
time5= data_wk_5[,12]
VAR_WindU5= data_wk_5[,24:40]
VAR_WindU5_Norm = scale(VAR_WindU5)
VAR_WindV5 = data_wk_5[,41:57]
VAR_WindV5_Norm = scale(VAR_WindV5)
VAR_Discharge5 = data_wk_5[,58:74]
VAR_Discharge5_Norm = scale(VAR_Discharge5)
VAR_MSLA5 = data_wk_5[,76:92]
VAR_MSLA5_Norm = scale(VAR_MSLA5)

df_WindU_5 <- cbind(IW5_Norm,VAR_WindU5_Norm, time5)
df_WindV_5 = cbind(IW5_Norm, VAR_WindV5_Norm, time5)
df_Discharge_5 =cbind(IW5_Norm, VAR_Discharge5_Norm, time5)
df_MSLA_5 <- cbind(IW5_Norm, VAR_MSLA5_Norm, time5)

UW5 <- rcor.test(df_WindU_5, method = "pearson")
VW5 <- rcor.test(df_WindV_5, method = "pearson")
Dis5 <- rcor.test(df_Discharge_5, method = "pearson")
SLA5 <- rcor.test(df_MSLA_5, method= "pearson")


IW6_Norm <- scale(data_wk_6[,10])
time6= data_wk_6[,12]
VAR_WindU6= data_wk_6[,24:40]
VAR_WindU6_Norm = scale(VAR_WindU6)
VAR_WindV6 = data_wk_6[,41:57]
VAR_WindV6_Norm = scale(VAR_WindV6)
VAR_Discharge6 = data_wk_6[,58:74]
VAR_Discharge6_Norm = scale(VAR_Discharge6)
VAR_MSLA6 = data_wk_6[,76:92]
VAR_MSLA6_Norm= scale(VAR_MSLA6)

df_WindU_6 <- cbind(IW6_Norm,VAR_WindU6_Norm, time6)
df_WindV_6 = cbind(IW6_Norm, VAR_WindV6_Norm, time6)
df_Discharge_6 =cbind(IW6_Norm, VAR_Discharge6_Norm, time6)
df_MSLA_6 <- cbind(IW6_Norm, VAR_MSLA6_Norm, time6)

UW6 <- rcor.test(df_WindU_6, method = "pearson")
VW6 <- rcor.test(df_WindV_6, method = "pearson")
Dis6 <- rcor.test(df_Discharge_6, method = "pearson")
SLA6 <- rcor.test(df_MSLA_6, method= "pearson")




## Using manually made correlation matrices from above plots to make a correlation plot
#http://stackoverflow.com/questions/5453336/plot-correlation-matrix-into-a-graph
#http://stackoverflow.com/questions/12774210/how-do-you-specifically-order-ggplot2-x-axis-instead-of-alphabetical-order
#http://stackoverflow.com/questions/2805885/margin-adjustments-when-using-ggplots-geom-tile
#https://learnr.wordpress.com/2010/01/26/ggplot2-quick-heatmap-plotting/


# U winds
UW3df<- as.data.frame(UW3$cor.mat) 
UW4df<- as.data.frame(UW4$cor.mat)
UW5df<- as.data.frame(UW5$cor.mat)
UW6df <-as.data.frame(UW6$cor.mat)

cormatU<-cbind(UW3df[2:18,1],UW4df[2:18,1],UW5df[2:18,1],UW6df[2:18,1])  #combined correlation coefficients for U Winds for 3-6 increments and select only rows with enviro corr
colnames(cormatU) <- c("3", "4", "5", "6")
row.names(cormatU) <-c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May")

library(ggplot2)
library(reshape)

cormatU.m <- melt(cormatU)
cormatU.m$X1<- factor(cormatU.m$X1, levels=c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May"))
cormatU.m$X2 <- factor(cormatU.m$X2, levels=c("3", "4", "5", "6"))


Ucor<- ggplot(cormatU.m, aes(X1,X2, fill=value))+
  geom_tile()+
  scale_x_discrete(expand=c(0,0))+
  scale_y_discrete(expand=c(0,0))+
  scale_fill_continuous(limits=c(-0.75,0.75), breaks=seq(-0.75,0.75,0.25), low="white", high="red")+
  xlab("U winds")+
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 
        axis.title.y = element_blank(),
        axis.title.x = element_text(family="Times New Roman", colour="black"),
        axis.text.x=element_text(family= "Times New Roman", colour="black", angle=90, hjust=1), 
        axis.text.y=element_text(family= "Times New Roman", colour="black"),
        legend.text=element_text(family= "Times New Roman"))


# V Winds
VW3df<- as.data.frame(VW3$cor.mat) 
VW4df<- as.data.frame(VW4$cor.mat)
VW5df<- as.data.frame(VW5$cor.mat)
VW6df <-as.data.frame(VW6$cor.mat)


cormatV<-cbind(VW3df[2:18,1],VW4df[2:18,1],VW5df[2:18,1],VW6df[2:18,1])  #combined correlation coefficients for U Winds for 3-6 increments and select only rows with enviro corr
colnames(cormatV) <- c("3", "4", "5", "6")
row.names(cormatV) <-c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May")

cormatV.m <- melt(cormatV)
cormatV.m$X1<- factor(cormatV.m$X1, levels=c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May"))
cormatV.m$X2 <- factor(cormatV.m$X2, levels=c("3", "4", "5", "6"))


Vcor<-ggplot(cormatV.m, aes(X1,X2, fill=value))+
  geom_tile()+
  scale_x_discrete(expand=c(0,0))+
  scale_y_discrete(expand=c(0,0))+
  scale_fill_continuous(limits=c(-0.75,0.75), breaks=seq(-0.75,0.75,0.25), low="white", high="red")+
  xlab("V winds")+
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 
        axis.title.y = element_blank(),
        axis.title.x = element_text(family="Times New Roman", colour="black"),
        axis.text.x=element_text(family= "Times New Roman", colour="black",  angle=90, hjust=1), 
        axis.text.y=element_text(family= "Times New Roman", colour="black"),
        legend.text=element_text(family= "Times New Roman"))



## DIS
Dis3df<- as.data.frame(Dis3$cor.mat) 
Dis4df<- as.data.frame(Dis4$cor.mat)
Dis5df<- as.data.frame(Dis5$cor.mat)
Dis6df <-as.data.frame(Dis6$cor.mat)


cormatD<-cbind(Dis3df[2:18,1],Dis4df[2:18,1],Dis5df[2:18,1],Dis6df[2:18,1])  #combined correlation coefficients for U Winds for 3-6 increments and select only rows with enDisiro corr
colnames(cormatD) <- c("3", "4", "5", "6")
row.names(cormatD) <-c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May")

cormatD.m <- melt(cormatD)
cormatD.m$X1<- factor(cormatD.m$X1, levels=c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May"))
cormatD.m$X2 <- factor(cormatD.m$X2, levels=c("3", "4", "5", "6"))


Dcor<-ggplot(cormatD.m, aes(X1,X2, fill=value))+
  geom_tile()+
  scale_x_discrete(expand=c(0,0))+
  scale_y_discrete(expand=c(0,0))+
  scale_fill_continuous(limits=c(-0.75,0.75), breaks=seq(-0.75,0.75,0.25), low="white", high="red")+
  xlab("River Discharge")+
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 
        axis.title.y = element_blank(),
        axis.title.x = element_text(family="Times New Roman", colour="black"),
        axis.text.x=element_text(family= "Times New Roman", colour="black",  angle=90, hjust=1), 
        axis.text.y=element_text(family= "Times New Roman", colour="black"),
        legend.text=element_text(family= "Times New Roman"))




## SLA
SLA3df<- as.data.frame(SLA3$cor.mat) 
SLA4df<- as.data.frame(SLA4$cor.mat)
SLA5df<- as.data.frame(SLA5$cor.mat)
SLA6df <-as.data.frame(SLA6$cor.mat)


cormatSLA<-cbind(SLA3df[2:18,1],SLA4df[2:18,1],SLA5df[2:18,1],SLA6df[2:18,1])  #combined correlation coefficients for U Winds for 3-6 increments and select only rows with enSLAiro corr
colnames(cormatSLA) <- c("3", "4", "5", "6")
row.names(cormatSLA) <-c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May")

cormatSLA.m <- melt(cormatSLA)
cormatSLA.m$X1<- factor(cormatSLA.m$X1, levels=c("PJan", "PFeb", "PMar", "PApr", "PMay", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May"))
cormatSLA.m$X2 <- factor(cormatSLA.m$X2, levels=c("3", "4", "5", "6"))


SLAcor<- ggplot(cormatSLA.m, aes(X1,X2, fill=value))+
  geom_tile()+
  scale_x_discrete(expand=c(0,0))+
  scale_y_discrete(expand=c(0,0))+
  scale_fill_continuous(limits=c(-0.75,0.75), breaks=seq(-0.75,0.75,0.25), low="white", high="red")+
  xlab("SLA")+
  theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), 
        axis.title.y = element_blank(),
        axis.title.x = element_text(family="Times New Roman", colour="black"),
        axis.text.x=element_text(family= "Times New Roman", colour="black", angle=90, hjust=1), 
        axis.text.y=element_text(family= "Times New Roman", colour="black"),
        legend.text=element_text(family= "Times New Roman"))






library(gridExtra)
tiff(file="Correlation Plot.tiff", width=2175, height= 1449, units="px", res=300)
grid.arrange(Ucor,Vcor,Dcor,SLAcor, ncol=2)
dev.off()


