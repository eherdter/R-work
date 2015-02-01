#######JULY#########  182, count 31
# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJul2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,182), count=c(1,1,31))
meanJul2005_A = mean(tempsJul2005_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJul2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 182), count= c(1,1,31))
meanJul2005_B=mean(tempsJul2005_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJul2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 182), count= c(1,1,31))
meanJul2005_C=mean(tempsJul2005_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJul2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 182), count= c(1,1,31))
meanJul2005_D=mean(tempsJul2005_D)


# for station 58 ~ 475, 1073
tempsJul2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 182), count= c(1,1,31))
meanJul2005_E=mean(tempsJul2005_E)



# for station BR3440, (472, 1103)
tempsJul2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 182), count= c(1,1,31))
meanJul2005_F=mean(tempsJul2005_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsJul2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 182), count= c(1,1,31))
meanJul2005_G=mean(tempsJul2005_G)


# for PC1220, 33, 34, (476,1083)
tempsJul2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 182), count= c(1,1,31))
meanJul2005_H=mean(tempsJul2005_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsJul2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 182), count= c(1,1,31))
meanJul2005_I=mean(tempsJul2005_I)


# For PC1520 ~ (479, 1087)
tempsJul2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 182), count= c(1,1,31))
meanJul2005_J=mean(tempsJul2005_J)

#For PC81460 (479, 1091)
tempsJul2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 182), count= c(1,1,31))
meanJul2005_K=mean(tempsJul2005_K)

# For 15 (476,1101)
tempsJul2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 182), count= c(1,1,31))
meanJul2005_R=mean(tempsJul2005_R)

#For 28 (477, 1086)
tempsJul2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 182), count= c(1,1,31))
meanJul2005_S=mean(tempsJul2005_S)




For #51 (476, 1080)
tempsJul2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 182), count= c(1,1,31))
meanJul2005_P=mean(tempsJul2005_P)


#For 82 (472, 1102)
tempsJul2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 182), count= c(1,1,31))
meanJul2005_N=mean(tempsJul2005_N)


# For BOR0340 (471, 1104)
tempsJul2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 182), count= c(1,1,31))
meanJul2005_L=mean(tempsJul2005_L)


# For PC0910 (480, 1088)
tempsJul2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 182), count= c(1,1,31))
meanJul2005_Y=mean(tempsJul2005_Y)

# For WB16150 (475, 1080)
tempsJul2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 182), count= c(1,1,31))
meanJul2005_O=mean(tempsJul2005_O)


# For WBSL840 (480, 1092)
tempsJul2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 182), count= c(1,1,31))
meanJul2005_AA=mean(tempsJul2005_AA)

meansJul2005= c(meanJul2005_A, meanJul2005_B,meanJul2005_C,meanJul2005_D,meanJul2005_E,meanJul2005_F,meanJul2005_G,meanJul2005_H,meanJul2005_I,meanJul2005_J,meanJul2005_K,meanJul2005_L,meanJul2005_N, meanJul2005_O, meanJul2005_P, meanJul2005_R, meanJul2005_S,meanJul2005_Y, meanJul2005_AA)