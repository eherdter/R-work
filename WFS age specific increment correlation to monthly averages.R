### WEST FLORIDA SHELF AGE SPECIFIC INCREMENT CORRELATION TO MONTHLY AVERAGES OF ENVIRO VARIABLES ###

## SAMPLE SIZE IS TOOO SMALL FOR THIS####

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
data_wk$Converted.Long = as.numeric(as.character(data_wk$Converted.Long))
idxB<- data_wk$Converted.Long >= -87 ## for samples on WEST FLORIDA SHELF 


data_wk_WFS <- data_wk[idxB,]
data_wk_WFS <- data_wk_WFS[complete.cases(data_wk_WFS$Converted.Long),]

for(i in c(24, 25:ncol(data_wk_WFS))) {
  data_wk_WFS[,i] <- as.numeric(as.character(data_wk_WFS[,i]))
}

idx3 <- data_wk_WFS$Increment.Number==3 
idx4<- data_wk_WFS$Increment.Number==4 
idx5 <- data_wk_WFS$Increment.Number ==5 
idx6 <- data_wk_WFS$Increment.Number ==6 
idx7 <- data_wk_WFS$Increment.Number==7


data_wk_3 <- data_wk_WFS[idx3,]
#data_wkdf_3 <- data.frame(data_wk_3)
data_wk_4 <- data_wk_WFS[idx4,]
data_wk_5 <- data_wk_WFS[idx5,]
data_wk_6 <- data_wk_WFS[idx6,]
data_wk_7 <- data_wk_WFS[idx7,]

IW3= data_wk_3[,10]
time3= data_wk_3[,12]
VAR_WindU= data_wk_3[,24:40]
VAR_WindV = data_wk_3[,41:57]
VAR_Discharge = data_wk_3[,58:74]
VAR_MSLA = data_wk_3[,76:92]

df_WindU_3 <- cbind(IW3,VAR_WindU, time3)
df_WindV_3 = cbind(IW3, VAR_WindV, time3)
df_Discharge_3 =cbind(IW3, VAR_Discharge, time3)
df_MSLA_3 <- cbind(IW3, VAR_MSLA, time3)


x <- df_WindU_3[[1]]
mat <- lapply(df_WindU_3[-1], cor.test, x=x, method="pearson")


x <- df_WindV_3[[1]]
mat <- lapply(df_WindV_3[-1], cor.test, x=x, method="pearson")

x <- df_Discharge_3[[1]]
mat <- lapply(df_Discharge_3[-1], cor.test, x=x, method="pearson")

x <- df_MSLA_3[[1]]
mat <- lapply(df_MSLA_3[-1], cor.test, x=x, method="pearson")


IW4 <- data_wk_4[,10]
time4= data_wk_4[,12]
VAR_WindU4= data_wk_4[,24:40]
VAR_WindV4 = data_wk_4[,41:57]
VAR_Discharge4 = data_wk_4[,58:74]
VAR_MSLA4 = data_wk_4[,76:92]

df_WindU_4 <- cbind(IW4,VAR_WindU4, time4)
df_WindV_4 = cbind(IW4, VAR_WindV4, time4)
df_Discharge_4 =cbind(IW4, VAR_Discharge4, time4)
df_MSLA_4 <- cbind(IW4, VAR_MSLA4, time4)

x <- df_WindU_4[[1]]
mat4 <- lapply(df_WindU_4[-1], cor.test, x=x, method="pearson")

x <- df_WindV_4[[1]]
mat4 <- lapply(df_WindV_4[-1], cor.test, x=x, method="pearson")

x <- df_Discharge_4[[1]]
mat4 <- lapply(df_Discharge_4[-1], cor.test, x=x, method="pearson")

x<- df_MSLA_4[[1]]
mat4 <- lapply(df_MSLA_4[-1], cor.test, x=x, method="pearson")



IW5 <- data_wk_5[,10]
time5= data_wk_5[,12]
VAR_WindU5= data_wk_5[,24:40]
VAR_WindV5 = data_wk_5[,41:57]
VAR_Discharge5 = data_wk_5[,58:74]
VAR_MSLA5 = data_wk_5[,76:92]

df_WindU_5 <- cbind(IW5,VAR_WindU5, time5)
df_WindV_5 = cbind(IW5, VAR_WindV5, time5)
df_Discharge_5 =cbind(IW5, VAR_Discharge5, time5)
df_MSLA_5 <- cbind(IW5, VAR_MSLA5, time5)

x <- df_WindU_5[[1]]
mat5 <- lapply(df_WindU_5[-1], cor.test, x=x, method="pearson")

x <- df_WindV_5[[1]]
mat5 <- lapply(df_WindV_5[-1], cor.test, x=x, method="pearson")

x <- df_Discharge_5[[1]]
mat5 <- lapply(df_Discharge_5[-1], cor.test, x=x, method="pearson")

x<- df_MSLA_5[[1]]
mat5 <- lapply(df_MSLA_5[-1], cor.test, x=x, method="pearson")



IW6 <- data_wk_6[,10]
time6= data_wk_6[,12]
VAR_WindU6= data_wk_6[,24:40]
VAR_WindV6 = data_wk_6[,41:57]
VAR_Discharge6 = data_wk_6[,58:74]
VAR_MSLA6 = data_wk_6[,76:92]

df_WindU_6 <- cbind(IW6,VAR_WindU6, time6)
df_WindV_6 = cbind(IW6, VAR_WindV6, time6)
df_Discharge_6 =cbind(IW6, VAR_Discharge6, time6)
df_MSLA_6 <- cbind(IW6, VAR_MSLA6, time6)

x <- df_WindU_6[[1]]
mat6 <- lapply(df_WindU_6[-1], cor.test, x=x, method="pearson")

x <- df_WindV_6[[1]]
mat6 <- lapply(df_WindV_6[-1], cor.test, x=x, method="pearson")

x <- df_Discharge_6[[1]]
mat6 <- lapply(df_Discharge_6[-1], cor.test, x=x, method="pearson")

x<- df_MSLA_6[[1]]
mat6 <- lapply(df_MSLA_6[-1], cor.test, x=x, method="pearson")





