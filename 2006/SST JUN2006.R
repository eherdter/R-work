### June 2006 ### 152, 30


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJ2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,152), count=c(1,1,30))
meanJ2006_A=mean(tempsJ2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJ2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 152), count= c(1,1,30))
meanJ2006_B=mean(tempsJ2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJ2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 152), count= c(1,1,30))
meanJ2006_C=mean(tempsJ2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJ2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 152), count= c(1,1,30))
meanJ2006_D=mean(tempsJ2006_D)

# for station 58 ~ 475, 1073
tempsJ2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 152), count= c(1,1,30))
meanJ2006_E=mean(tempsJ2006_E)

# for station BR3440, (472, 1103)
tempsJ2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 152), count= c(1,1,30))
meanJ2006_F=mean(tempsJ2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsJ2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 152), count= c(1,1,30))
meanJ2006_G=mean(tempsJ2006_G)

# for PC1220, 33, 34, (476,1083)
tempsJ2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 152), count= c(1,1,30))
meanJ2006_H=mean(tempsJ2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsJ2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 152), count= c(1,1,30))
meanJ2006_I=mean(tempsJ2006_I)

# For PC1520 ~ (479, 1087)
tempsJ2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 152), count= c(1,1,30))
meanJ2006_J=mean(tempsJ2006_J)

#For PC81460 (479, 1091)
tempsJ2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 152), count= c(1,1,30))
meanJ2006_K=mean(tempsJ2006_K)

# For BOR0340 (471, 1104)
tempsJ2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 152), count= c(1,1,30))
meanJ2006_L=mean(tempsJ2006_L)

# for BR0320 (471, 1107)
tempsJ2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 152), count= c(1,1,30))
meanJ2006_M=mean(tempsJ2006_M)

#For 82 (472, 1102)
tempsJ2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 152), count= c(1,1,30))
meanJ2006_N=mean(tempsJ2006_N)

# For WB16150 (475, 1080)
tempsJ2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 152), count= c(1,1,30))
meanJ2006_O=mean(tempsJ2006_O)

For #51 (476, 1080)
tempsJ2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 152), count= c(1,1,30))
meanJ2006_P=mean(tempsJ2006_P)

# for 16 (476, 1100)
tempsJ2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 152), count= c(1,1,30))
meanJ2006_Q=mean(tempsJ2006_Q)

# For 15 (476,1101)
tempsJ2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 152), count= c(1,1,30))
meanJ2006_R=mean(tempsJ2006_R)

#For 28 (477, 1086)
tempsJ2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 152), count= c(1,1,30))
meanJ2006_S=mean(tempsJ2006_S)

# for 83 and BR0502 (477, 1102)
tempsJ2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 152), count= c(1,1,30))
meanJ2006_T=mean(tempsJ2006_T)

#for Br 4/5 10 (477 1105)
tempsJ2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 152), count= c(1,1,30))
meanJ2006_U=mean(tempsJ2006_U)

# for 27, PC1020 (478, 1086)
tempsJ2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 152), count= c(1,1,30))
meanJ2006_V=mean(tempsJ2006_V)

# for PC1010 (479,1086)
tempsJ2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 152), count= c(1,1,30))
meanJ2006_W=mean(tempsJ2006_W)

# for PC0920 (479, 1088)
tempsJ2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 152), count= c(1,1,30))
meanJ2006_X=mean(tempsJ2006_X)

# For PC0910 (480, 1088)
tempsJ2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 152), count= c(1,1,30))
meanJ2006_Y=mean(tempsJ2006_Y)

# for PC1420 (480,1091) 
tempsJ2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 152), count= c(1,1,30))
meanJ2006_Z=mean(tempsJ2006_Z)

# For WBSL840 (480, 1092)
tempsJ2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 152), count= c(1,1,30))
meanJ2006_AA=mean(tempsJ2006_AA)

# for PC0720 (481, 1095)
tempsJ2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 152), count= c(1,1,30))
meanJ2006_BB=mean(tempsJ2006_BB)

# for PC1510 (481, 1087)
tempsJ2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 152), count= c(1,1,30))
meanJ2006_CC=mean(tempsJ2006_CC)

#for PC0710 (482, 1096)
tempsJ2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 152), count= c(1,1,30))
meanJ2006_DD=mean(tempsJ2006_DD)



meansJ2006= c(meanJ2006_A, meanJ2006_B, meanJ2006_C, meanJ2006_D, meanJ2006_E, meanJ2006_F, meanJ2006_G, meanJ2006_H, meanJ2006_I, meanJ2006_J, meanJ2006_K, meanJ2006_L, meanJ2006_M, meanJ2006_N, meanJ2006_O, meanJ2006_P, meanJ2006_Q, meanJ2006_R, meanJ2006_S, meanJ2006_T, meanJ2006_U, meanJ2006_V, meanJ2006_W, meanJ2006_X, meanJ2006_Y, meanJ2006_Z, meanJ2006_AA, meanJ2006_BB, meanJ2006_CC, meanJ2006_DD)