### JULY 2006 ### 182, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJu2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,182), count=c(1,1,31))
meanJu2006_A=mean(tempsJu2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJu2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 182), count= c(1,1,31))
meanJu2006_B=mean(tempsJu2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJu2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 182), count= c(1,1,31))
meanJu2006_C=mean(tempsJu2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJu2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 182), count= c(1,1,31))
meanJu2006_D=mean(tempsJu2006_D)

# for station 58 ~ 475, 1073
tempsJu2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 182), count= c(1,1,31))
meanJu2006_E=mean(tempsJu2006_E)

# for station BR3440, (472, 1103)
tempsJu2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 182), count= c(1,1,31))
meanJu2006_F=mean(tempsJu2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsJu2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 182), count= c(1,1,31))
meanJu2006_G=mean(tempsJu2006_G)

# for PC1220, 33, 34, (476,1083)
tempsJu2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 182), count= c(1,1,31))
meanJu2006_H=mean(tempsJu2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsJu2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 182), count= c(1,1,31))
meanJu2006_I=mean(tempsJu2006_I)

# For PC1520 ~ (479, 1087)
tempsJu2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 182), count= c(1,1,31))
meanJu2006_J=mean(tempsJu2006_J)

#For PC81460 (479, 1091)
tempsJu2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 182), count= c(1,1,31))
meanJu2006_K=mean(tempsJu2006_K)

# For BOR0340 (471, 1104)
tempsJu2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 182), count= c(1,1,31))
meanJu2006_L=mean(tempsJu2006_L)

# for BR0320 (471, 1107)
tempsJu2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 182), count= c(1,1,31))
meanJu2006_M=mean(tempsJu2006_M)

#For 82 (472, 1102)
tempsJu2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 182), count= c(1,1,31))
meanJu2006_N=mean(tempsJu2006_N)

# For WB16150 (475, 1080)
tempsJu2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 182), count= c(1,1,31))
meanJu2006_O=mean(tempsJu2006_O)

For #51 (476, 1080)
tempsJu2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 182), count= c(1,1,31))
meanJu2006_P=mean(tempsJu2006_P)

# for 16 (476, 1100)
tempsJu2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 182), count= c(1,1,31))
meanJu2006_Q=mean(tempsJu2006_Q)

# For 15 (476,1101)
tempsJu2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 182), count= c(1,1,31))
meanJu2006_R=mean(tempsJu2006_R)

#For 28 (477, 1086)
tempsJu2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 182), count= c(1,1,31))
meanJu2006_S=mean(tempsJu2006_S)

# for 83 and BR0502 (477, 1102)
tempsJu2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 182), count= c(1,1,31))
meanJu2006_T=mean(tempsJu2006_T)

#for Br 4/5 10 (477 1105)
tempsJu2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 182), count= c(1,1,31))
meanJu2006_U=mean(tempsJu2006_U)

# for 27, PC1020 (478, 1086)
tempsJu2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 182), count= c(1,1,31))
meanJu2006_V=mean(tempsJu2006_V)

# for PC1010 (479,1086)
tempsJu2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 182), count= c(1,1,31))
meanJu2006_W=mean(tempsJu2006_W)

# for PC0920 (479, 1088)
tempsJu2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 182), count= c(1,1,31))
meanJu2006_X=mean(tempsJu2006_X)

# For PC0910 (480, 1088)
tempsJu2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 182), count= c(1,1,31))
meanJu2006_Y=mean(tempsJu2006_Y)

# for PC1420 (480,1091) 
tempsJu2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 182), count= c(1,1,31))
meanJu2006_Z=mean(tempsJu2006_Z)

# For WBSL840 (480, 1092)
tempsJu2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 182), count= c(1,1,31))
meanJu2006_AA=mean(tempsJu2006_AA)

# for PC0720 (481, 1095)
tempsJu2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 182), count= c(1,1,31))
meanJu2006_BB=mean(tempsJu2006_BB)

# for PC1510 (481, 1087)
tempsJu2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 182), count= c(1,1,31))
meanJu2006_CC=mean(tempsJu2006_CC)

#for PC0710 (482, 1096)
tempsJu2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 182), count= c(1,1,31))
meanJu2006_DD=mean(tempsJu2006_DD)



meansJu2006= c(meanJu2006_A, meanJu2006_B, meanJu2006_C, meanJu2006_D, meanJu2006_E, meanJu2006_F, meanJu2006_G, meanJu2006_H, meanJu2006_I, meanJu2006_J, meanJu2006_K, meanJu2006_L, meanJu2006_M, meanJu2006_N, meanJu2006_O, meanJu2006_P, meanJu2006_Q, meanJu2006_R, meanJu2006_S, meanJu2006_T, meanJu2006_U, meanJu2006_V, meanJu2006_W, meanJu2006_X, meanJu2006_Y, meanJu2006_Z, meanJu2006_AA, meanJu2006_BB, meanJu2006_CC, meanJu2006_DD)
