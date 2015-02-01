### October 2007 ### 274, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsO2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,274), count=c(1,1,31))
meanO2007_A=mean(tempsO2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsO2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 274), count= c(1,1,31))
meanO2007_B=mean(tempsO2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsO2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 274), count= c(1,1,31))
meanO2007_C=mean(tempsO2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsO2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 274), count= c(1,1,31))
meanO2007_D=mean(tempsO2007_D)

# for station 58 ~ 475, 1073
tempsO2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 274), count= c(1,1,31))
meanO2007_E=mean(tempsO2007_E)

# for station BR3440, (472, 1103)
tempsO2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 274), count= c(1,1,31))
meanO2007_F=mean(tempsO2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsO2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 274), count= c(1,1,31))
meanO2007_G=mean(tempsO2007_G)

# for PC1220, 33, 34, (476,1083)
tempsO2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 274), count= c(1,1,31))
meanO2007_H=mean(tempsO2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsO2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 274), count= c(1,1,31))
meanO2007_I=mean(tempsO2007_I)

# For PC1520 ~ (479, 1087)
tempsO2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 274), count= c(1,1,31))
meanO2007_J=mean(tempsO2007_J)

#For PC81460 (479, 1091)
tempsO2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 274), count= c(1,1,31))
meanO2007_K=mean(tempsO2007_K)

# For BOR0340 (471, 1104)
tempsO2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 274), count= c(1,1,31))
meanO2007_L=mean(tempsO2007_L)

# for BR0320 (471, 1107)
tempsO2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 274), count= c(1,1,31))
meanO2007_M=mean(tempsO2007_M)

#For 82 (472, 1102)
tempsO2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 274), count= c(1,1,31))
meanO2007_N=mean(tempsO2007_N)

# For WB16150 (475, 1080)
tempsO2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 274), count= c(1,1,31))
meanO2007_O=mean(tempsO2007_O)

For #51 (476, 1080)
tempsO2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 274), count= c(1,1,31))
meanO2007_P=mean(tempsO2007_P)

# for 16 (476, 1100)
tempsO2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 274), count= c(1,1,31))
meanO2007_Q=mean(tempsO2007_Q)

# For 15 (476,1101)
tempsO2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 274), count= c(1,1,31))
meanO2007_R=mean(tempsO2007_R)

#For 28 (477, 1086)
tempsO2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 274), count= c(1,1,31))
meanO2007_S=mean(tempsO2007_S)

# for 83 and BR0502 (477, 1102)
tempsO2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 274), count= c(1,1,31))
meanO2007_T=mean(tempsO2007_T)

#for Br 4/5 10 (477 1105)
tempsO2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 274), count= c(1,1,31))
meanO2007_U=mean(tempsO2007_U)

# for 27, PC1020 (478, 1086)
tempsO2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 274), count= c(1,1,31))
meanO2007_V=mean(tempsO2007_V)

# for PC1010 (479,1086)
tempsO2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 274), count= c(1,1,31))
meanO2007_W=mean(tempsO2007_W)

# for PC0920 (479, 1088)
tempsO2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 274), count= c(1,1,31))
meanO2007_X=mean(tempsO2007_X)

# For PC0910 (480, 1088)
tempsO2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 274), count= c(1,1,31))
meanO2007_Y=mean(tempsO2007_Y)

# for PC1420 (480,1091) 
tempsO2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 274), count= c(1,1,31))
meanO2007_Z=mean(tempsO2007_Z)

# For WBSL840 (480, 1092)
tempsO2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 274), count= c(1,1,31))
meanO2007_AA=mean(tempsO2007_AA)

# for PC0720 (481, 1095)
tempsO2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 274), count= c(1,1,31))
meanO2007_BB=mean(tempsO2007_BB)

# for PC1510 (481, 1087)
tempsO2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 274), count= c(1,1,31))
meanO2007_CC=mean(tempsO2007_CC)

#for PC0710 (482, 1096)
tempsO2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 274), count= c(1,1,31))
meanO2007_DD=mean(tempsO2007_DD)



meansO2007= c(meanO2007_A, meanO2007_B, meanO2007_C, meanO2007_D, meanO2007_E, meanO2007_F, meanO2007_G, meanO2007_H, meanO2007_I, meanO2007_J, meanO2007_K, meanO2007_L, meanO2007_M, meanO2007_N, meanO2007_O, meanO2007_P, meanO2007_Q, meanO2007_R, meanO2007_S, meanO2007_T, meanO2007_U, meanO2007_V, meanO2007_W, meanO2007_X, meanO2007_Y, meanO2007_Z, meanO2007_AA, meanO2007_BB, meanO2007_CC, meanO2007_DD)