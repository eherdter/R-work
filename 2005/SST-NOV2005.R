### NOVEMBER ### 305, 30


# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsN2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,305), count=c(1,1,30))
meanN2005_A=mean(tempsN2005_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsN2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 305), count= c(1,1,30))
meanN2005_B=mean(tempsN2005_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsN2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 305), count= c(1,1,30))
meanN2005_C=mean(tempsN2005_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsN2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 305), count= c(1,1,30))
meanN2005_D=mean(tempsN2005_D)


# for station 58 ~ 475, 1073
tempsN2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 305), count= c(1,1,30))
meanN2005_E=mean(tempsN2005_E)



# for station BR3440, (472, 1103)
tempsN2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 305), count= c(1,1,30))
meanN2005_F=mean(tempsN2005_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsN2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 305), count= c(1,1,30))
meanN2005_G=mean(tempsN2005_G)


# for PC1220, 33, 34, (476,1083)
tempsN2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 305), count= c(1,1,30))
meanN2005_H=mean(tempsN2005_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsN2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 305), count= c(1,1,30))
meanN2005_I=mean(tempsN2005_I)


# For PC1520 ~ (479, 1087)
tempsN2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 305), count= c(1,1,30))
meanN2005_J=mean(tempsN2005_J)

#For PC81460 (479, 1091)
tempsN2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 305), count= c(1,1,30))
meanN2005_K=mean(tempsN2005_K)

# For 15 (476,1101)
tempsN2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 305), count= c(1,1,30))
meanN2005_R=mean(tempsN2005_R)

#For 28 (477, 1086)
tempsN2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 305), count= c(1,1,30))
meanN2005_S=mean(tempsN2005_S)



For #51 (476, 1080)
tempsN2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 305), count= c(1,1,30))
meanN2005_P=mean(tempsN2005_P)


#For 82 (472, 1102)
tempsN2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 305), count= c(1,1,30))
meanN2005_N=mean(tempsN2005_N)


# For BOR0340 (471, 1104)
tempsN2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 305), count= c(1,1,30))
meanN2005_L=mean(tempsN2005_L)


# For PC0910 (480, 1088)
tempsN2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 305), count= c(1,1,30))
meanN2005_Y=mean(tempsN2005_Y)

# For WB16150 (475, 1080)
tempsN2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 305), count= c(1,1,30))
meanN2005_O=mean(tempsN2005_O)


# For WBSL840 (480, 1092)
tempsN2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 305), count= c(1,1,30))
meanN2005_AA=mean(tempsN2005_AA)

meansN2005= c(meanN2005_A, meanN2005_B,meanN2005_C,meanN2005_D,meanN2005_E,meanN2005_F,meanN2005_G,meanN2005_H,meanN2005_I,meanN2005_J,meanN2005_K, meanN2005_L, meanN2005_N,meanN2005_O,meanN2005_P, meanN2005_R,meanN2005_S, meanN2005_Y,meanN2005_AA)