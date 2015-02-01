### DECEMBER ### 335, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsD2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,335), count=c(1,1,31))
meanD2005_A=mean(tempsD2005_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsD2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 335), count= c(1,1,31))
meanD2005_B=mean(tempsD2005_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsD2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 335), count= c(1,1,31))
meanD2005_C=mean(tempsD2005_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsD2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 335), count= c(1,1,31))
meanD2005_D=mean(tempsD2005_D)


# for station 58 ~ 475, 1073
tempsD2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 335), count= c(1,1,31))
meanD2005_E=mean(tempsD2005_E)



# for station BR3440, (472, 1103)
tempsD2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 335), count= c(1,1,31))
meanD2005_F=mean(tempsD2005_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsD2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 335), count= c(1,1,31))
meanD2005_G=mean(tempsD2005_G)


# for PC1220, 33, 34, (476,1083)
tempsD2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 335), count= c(1,1,31))
meanD2005_H=mean(tempsD2005_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsD2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 335), count= c(1,1,31))
meanD2005_I=mean(tempsD2005_I)


# For PC1520 ~ (479, 1087)
tempsD2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 335), count= c(1,1,31))
meanD2005_J=mean(tempsD2005_J)

#For PC81460 (479, 1091)
tempsD2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 335), count= c(1,1,31))
meanD2005_K=mean(tempsD2005_K)

# For 15 (476,1101)
tempsD2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 335), count= c(1,1,31))
meanD2005_R=mean(tempsD2005_R)

#For 28 (477, 1086)
tempsD2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 335), count= c(1,1,31))
meanD2005_S=mean(tempsD2005_S)



For #51 (476, 1080)
tempsD2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 335), count= c(1,1,31))
meanD2005_P=mean(tempsD2005_P)


#For 82 (472, 1102)
tempsD2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 335), count= c(1,1,31))
meanD2005_N=mean(tempsD2005_N)


# For BOR0340 (471, 1104)
tempsD2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 335), count= c(1,1,31))
meanD2005_L=mean(tempsD2005_L)


# For PC0910 (480, 1088)
tempsD2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 335), count= c(1,1,31))
meanD2005_Y=mean(tempsD2005_Y)

# For WB16150 (475, 1080)
tempsD2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 335), count= c(1,1,31))
meanD2005_O=mean(tempsD2005_O)


# For WBSL840 (480, 1092)
tempsD2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 335), count= c(1,1,31))
meanD2005_AA=mean(tempsD2005_AA)

meansD2005= c(meanD2005_A, meanD2005_B,meanD2005_C,meanD2005_D,meanD2005_E,meanD2005_F,meanD2005_G,meanD2005_H,meanD2005_I,meanD2005_J,meanD2005_K, meanD2005_L, meanD2005_N,meanD2005_O,meanD2005_P, meanD2005_R,meanD2005_S, meanD2005_Y,meanD2005_AA)