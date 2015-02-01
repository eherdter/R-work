### OCTOBER ### 274, 31

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsO2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,274), count=c(1,1,31))
meanO2005_A=mean(tempsO2005_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsO2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 274), count= c(1,1,31))
meanO2005_B=mean(tempsO2005_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsO2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 274), count= c(1,1,31))
meanO2005_C=mean(tempsO2005_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsO2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 274), count= c(1,1,31))
meanO2005_D=mean(tempsO2005_D)


# for station 58 ~ 475, 1073
tempsO2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 274), count= c(1,1,31))
meanO2005_E=mean(tempsO2005_E)



# for station BR3440, (472, 1103)
tempsO2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 274), count= c(1,1,31))
meanO2005_F=mean(tempsO2005_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsO2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 274), count= c(1,1,31))
meanO2005_G=mean(tempsO2005_G)


# for PC1220, 33, 34, (476,1083)
tempsO2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 274), count= c(1,1,31))
meanO2005_H=mean(tempsO2005_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsO2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 274), count= c(1,1,31))
meanO2005_I=mean(tempsO2005_I)


# For PC1520 ~ (479, 1087)
tempsO2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 274), count= c(1,1,31))
meanO2005_J=mean(tempsO2005_J)

#For PC81460 (479, 1091)
tempsO2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 274), count= c(1,1,31))
meanO2005_K=mean(tempsO2005_K)

# For 15 (476,1101)
tempsO2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 274), count= c(1,1,31))
meanO2005_R=mean(tempsO2005_R)

#For 28 (477, 1086)
tempsO2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 274), count= c(1,1,31))
meanO2005_S=mean(tempsO2005_S)



For #51 (476, 1080)
tempsO2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 274), count= c(1,1,31))
meanO2005_P=mean(tempsO2005_P)


#For 82 (472, 1102)
tempsO2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 274), count= c(1,1,31))
meanO2005_N=mean(tempsO2005_N)


# For BOR0340 (471, 1104)
tempsO2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 274), count= c(1,1,31))
meanO2005_L=mean(tempsO2005_L)


# For PC0910 (480, 1088)
tempsO2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 274), count= c(1,1,31))
meanO2005_Y=mean(tempsO2005_Y)

# For WB16150 (475, 1080)
tempsO2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 274), count= c(1,1,31))
meanO2005_O=mean(tempsO2005_O)


# For WBSL840 (480, 1092)
tempsO2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 274), count= c(1,1,31))
meanO2005_AA=mean(tempsO2005_AA)

meansO2005= c(meanO2005_A, meanO2005_B,meanO2005_C,meanO2005_D,meanO2005_E,meanO2005_F,meanO2005_G,meanO2005_H,meanO2005_I,meanO2005_J,meanO2005_K, meanO2005_L, meanO2005_N,meanO2005_O,meanO2005_P, meanO2005_R,meanO2005_S, meanO2005_Y,meanO2005_AA)