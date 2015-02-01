### JULY 2007 ### 182, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJu2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,182), count=c(1,1,31))
meanJu2007_A=mean(tempsJu2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJu2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 182), count= c(1,1,31))
meanJu2007_B=mean(tempsJu2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJu2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 182), count= c(1,1,31))
meanJu2007_C=mean(tempsJu2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJu2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 182), count= c(1,1,31))
meanJu2007_D=mean(tempsJu2007_D)

# for station 58 ~ 475, 1073
tempsJu2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 182), count= c(1,1,31))
meanJu2007_E=mean(tempsJu2007_E)

# for station BR3440, (472, 1103)
tempsJu2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 182), count= c(1,1,31))
meanJu2007_F=mean(tempsJu2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsJu2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 182), count= c(1,1,31))
meanJu2007_G=mean(tempsJu2007_G)

# for PC1220, 33, 34, (476,1083)
tempsJu2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 182), count= c(1,1,31))
meanJu2007_H=mean(tempsJu2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsJu2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 182), count= c(1,1,31))
meanJu2007_I=mean(tempsJu2007_I)

# For PC1520 ~ (479, 1087)
tempsJu2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 182), count= c(1,1,31))
meanJu2007_J=mean(tempsJu2007_J)

#For PC81460 (479, 1091)
tempsJu2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 182), count= c(1,1,31))
meanJu2007_K=mean(tempsJu2007_K)

# For BOR0340 (471, 1104)
tempsJu2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 182), count= c(1,1,31))
meanJu2007_L=mean(tempsJu2007_L)

# for BR0320 (471, 1107)
tempsJu2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 182), count= c(1,1,31))
meanJu2007_M=mean(tempsJu2007_M)

#For 82 (472, 1102)
tempsJu2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 182), count= c(1,1,31))
meanJu2007_N=mean(tempsJu2007_N)

# For WB16150 (475, 1080)
tempsJu2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 182), count= c(1,1,31))
meanJu2007_O=mean(tempsJu2007_O)

For #51 (476, 1080)
tempsJu2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 182), count= c(1,1,31))
meanJu2007_P=mean(tempsJu2007_P)

# for 16 (476, 1100)
tempsJu2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 182), count= c(1,1,31))
meanJu2007_Q=mean(tempsJu2007_Q)

# For 15 (476,1101)
tempsJu2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 182), count= c(1,1,31))
meanJu2007_R=mean(tempsJu2007_R)

#For 28 (477, 1086)
tempsJu2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 182), count= c(1,1,31))
meanJu2007_S=mean(tempsJu2007_S)

# for 83 and BR0502 (477, 1102)
tempsJu2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 182), count= c(1,1,31))
meanJu2007_T=mean(tempsJu2007_T)

#for Br 4/5 10 (477 1105)
tempsJu2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 182), count= c(1,1,31))
meanJu2007_U=mean(tempsJu2007_U)

# for 27, PC1020 (478, 1086)
tempsJu2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 182), count= c(1,1,31))
meanJu2007_V=mean(tempsJu2007_V)

# for PC1010 (479,1086)
tempsJu2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 182), count= c(1,1,31))
meanJu2007_W=mean(tempsJu2007_W)

# for PC0920 (479, 1088)
tempsJu2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 182), count= c(1,1,31))
meanJu2007_X=mean(tempsJu2007_X)

# For PC0910 (480, 1088)
tempsJu2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 182), count= c(1,1,31))
meanJu2007_Y=mean(tempsJu2007_Y)

# for PC1420 (480,1091) 
tempsJu2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 182), count= c(1,1,31))
meanJu2007_Z=mean(tempsJu2007_Z)

# For WBSL840 (480, 1092)
tempsJu2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 182), count= c(1,1,31))
meanJu2007_AA=mean(tempsJu2007_AA)

# for PC0720 (481, 1095)
tempsJu2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 182), count= c(1,1,31))
meanJu2007_BB=mean(tempsJu2007_BB)

# for PC1510 (481, 1087)
tempsJu2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 182), count= c(1,1,31))
meanJu2007_CC=mean(tempsJu2007_CC)

#for PC0710 (482, 1096)
tempsJu2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 182), count= c(1,1,31))
meanJu2007_DD=mean(tempsJu2007_DD)



meansJu2007= c(meanJu2007_A, meanJu2007_B, meanJu2007_C, meanJu2007_D, meanJu2007_E, meanJu2007_F, meanJu2007_G, meanJu2007_H, meanJu2007_I, meanJu2007_J, meanJu2007_K, meanJu2007_L, meanJu2007_M, meanJu2007_N, meanJu2007_O, meanJu2007_P, meanJu2007_Q, meanJu2007_R, meanJu2007_S, meanJu2007_T, meanJu2007_U, meanJu2007_V, meanJu2007_W, meanJu2007_X, meanJu2007_Y, meanJu2007_Z, meanJu2007_AA, meanJu2007_BB, meanJu2007_CC, meanJu2007_DD)
