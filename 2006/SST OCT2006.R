### October 2006 ### 274, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsO2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,274), count=c(1,1,31))
meanO2006_A=mean(tempsO2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsO2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 274), count= c(1,1,31))
meanO2006_B=mean(tempsO2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsO2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 274), count= c(1,1,31))
meanO2006_C=mean(tempsO2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsO2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 274), count= c(1,1,31))
meanO2006_D=mean(tempsO2006_D)

# for station 58 ~ 475, 1073
tempsO2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 274), count= c(1,1,31))
meanO2006_E=mean(tempsO2006_E)

# for station BR3440, (472, 1103)
tempsO2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 274), count= c(1,1,31))
meanO2006_F=mean(tempsO2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsO2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 274), count= c(1,1,31))
meanO2006_G=mean(tempsO2006_G)

# for PC1220, 33, 34, (476,1083)
tempsO2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 274), count= c(1,1,31))
meanO2006_H=mean(tempsO2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsO2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 274), count= c(1,1,31))
meanO2006_I=mean(tempsO2006_I)

# For PC1520 ~ (479, 1087)
tempsO2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 274), count= c(1,1,31))
meanO2006_J=mean(tempsO2006_J)

#For PC81460 (479, 1091)
tempsO2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 274), count= c(1,1,31))
meanO2006_K=mean(tempsO2006_K)

# For BOR0340 (471, 1104)
tempsO2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 274), count= c(1,1,31))
meanO2006_L=mean(tempsO2006_L)

# for BR0320 (471, 1107)
tempsO2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 274), count= c(1,1,31))
meanO2006_M=mean(tempsO2006_M)

#For 82 (472, 1102)
tempsO2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 274), count= c(1,1,31))
meanO2006_N=mean(tempsO2006_N)

# For WB16150 (475, 1080)
tempsO2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 274), count= c(1,1,31))
meanO2006_O=mean(tempsO2006_O)

For #51 (476, 1080)
tempsO2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 274), count= c(1,1,31))
meanO2006_P=mean(tempsO2006_P)

# for 16 (476, 1100)
tempsO2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 274), count= c(1,1,31))
meanO2006_Q=mean(tempsO2006_Q)

# For 15 (476,1101)
tempsO2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 274), count= c(1,1,31))
meanO2006_R=mean(tempsO2006_R)

#For 28 (477, 1086)
tempsO2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 274), count= c(1,1,31))
meanO2006_S=mean(tempsO2006_S)

# for 83 and BR0502 (477, 1102)
tempsO2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 274), count= c(1,1,31))
meanO2006_T=mean(tempsO2006_T)

#for Br 4/5 10 (477 1105)
tempsO2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 274), count= c(1,1,31))
meanO2006_U=mean(tempsO2006_U)

# for 27, PC1020 (478, 1086)
tempsO2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 274), count= c(1,1,31))
meanO2006_V=mean(tempsO2006_V)

# for PC1010 (479,1086)
tempsO2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 274), count= c(1,1,31))
meanO2006_W=mean(tempsO2006_W)

# for PC0920 (479, 1088)
tempsO2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 274), count= c(1,1,31))
meanO2006_X=mean(tempsO2006_X)

# For PC0910 (480, 1088)
tempsO2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 274), count= c(1,1,31))
meanO2006_Y=mean(tempsO2006_Y)

# for PC1420 (480,1091) 
tempsO2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 274), count= c(1,1,31))
meanO2006_Z=mean(tempsO2006_Z)

# For WBSL840 (480, 1092)
tempsO2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 274), count= c(1,1,31))
meanO2006_AA=mean(tempsO2006_AA)

# for PC0720 (481, 1095)
tempsO2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 274), count= c(1,1,31))
meanO2006_BB=mean(tempsO2006_BB)

# for PC1510 (481, 1087)
tempsO2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 274), count= c(1,1,31))
meanO2006_CC=mean(tempsO2006_CC)

#for PC0710 (482, 1096)
tempsO2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 274), count= c(1,1,31))
meanO2006_DD=mean(tempsO2006_DD)



meansO2006= c(meanO2006_A, meanO2006_B, meanO2006_C, meanO2006_D, meanO2006_E, meanO2006_F, meanO2006_G, meanO2006_H, meanO2006_I, meanO2006_J, meanO2006_K, meanO2006_L, meanO2006_M, meanO2006_N, meanO2006_O, meanO2006_P, meanO2006_Q, meanO2006_R, meanO2006_S, meanO2006_T, meanO2006_U, meanO2006_V, meanO2006_W, meanO2006_X, meanO2006_Y, meanO2006_Z, meanO2006_AA, meanO2006_BB, meanO2006_CC, meanO2006_DD)