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



## WEST FLORIDA SHELF

idxB<- data_wk$nConvertedLong >= -87 ## for samples on WEST FLORIDA SHELF 


data_wk_WFS <- data_wk[idxB,]
data_wk_WFS <- data_wk_WFS[complete.cases(data_wk_WFS$nConvertedLong),]









## calculating normalized data and trying to plot
# MeanIW3 <- ddply(data_wk_3, .(Year.of.Increment.Formation), summarise, N=length(Increment.Width), three.mean=mean(Increment.Width))
# MeanIW3$NormIW <- MeanIW3$three.mean- mean(MeanIW3$three.mean)
# 
# library(dplR)
# MeanAprilU = ddply(df_WindU_3, .(time), summarise, N=length(April.U), AprilU.mean= tbrm(April.U, C=6))
# MeanAprilU$Norm <- MeanAprilU$AprilU.mean- tbrm(MeanAprilU$AprilU.mean, C=6)
# 
# 
# 
# library(ggplot2)
# plotA <- ggplot()+ geom_line(data=MeanIW3, aes(x=MeanIW3$Year.of.Increment.Formation, y=MeanIW3$NormIW, colour="value"))+  #gives each of these a different color
#   geom_line(data=MeanAprilU, aes(x=MeanAprilU$time, y= MeanAprilU$Norm, colour="xxxstd")) +
#   scale_colour_manual(values=c("#999999", "#000000"))+ #specifies color for each
#   #ylab("Time")+
#   scale_x_continuous(limits=c(2004, 2012), breaks=seq(2004, 2012,1))+
#   theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
#         panel.background=element_rect(colour="black", fill="white"),
#         legend.key=element_blank(), 
#         axis.title.x =element_text(colour="black"),
#         axis.text.x = element_text(colour="black"),
#         axis.title.y =element_text(colour="black"),
#         axis.text.y = element_text(colour="black"),
#         legend.position="none", # no legend
#         axis.text.x=element_text(colour="black"), #changing  colour of x axis
#         axis.text.y=element_text(colour="black"))#changing colour of y acis
