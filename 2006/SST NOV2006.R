### November 2006 ### 305, 30


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsN2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,305), count=c(1,1,30))
meanN2006_A=mean(tempsN2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsN2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 305), count= c(1,1,30))
meanN2006_B=mean(tempsN2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsN2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 305), count= c(1,1,30))
meanN2006_C=mean(tempsN2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsN2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 305), count= c(1,1,30))
meanN2006_D=mean(tempsN2006_D)

# for station 58 ~ 475, 1073
tempsN2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 305), count= c(1,1,30))
meanN2006_E=mean(tempsN2006_E)

# for station BR3440, (472, 1103)
tempsN2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 305), count= c(1,1,30))
meanN2006_F=mean(tempsN2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsN2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 305), count= c(1,1,30))
meanN2006_G=mean(tempsN2006_G)

# for PC1220, 33, 34, (476,1083)
tempsN2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 305), count= c(1,1,30))
meanN2006_H=mean(tempsN2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsN2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 305), count= c(1,1,30))
meanN2006_I=mean(tempsN2006_I)

# For PC1520 ~ (479, 1087)
tempsN2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 305), count= c(1,1,30))
meanN2006_J=mean(tempsN2006_J)

#For PC81460 (479, 1091)
tempsN2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 305), count= c(1,1,30))
meanN2006_K=mean(tempsN2006_K)

# For BOR0340 (471, 1104)
tempsN2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 305), count= c(1,1,30))
meanN2006_L=mean(tempsN2006_L)

# for BR0320 (471, 1107)
tempsN2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 305), count= c(1,1,30))
meanN2006_M=mean(tempsN2006_M)

#For 82 (472, 1102)
tempsN2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 305), count= c(1,1,30))
meanN2006_N=mean(tempsN2006_N)

# For WB16150 (475, 1080)
tempsN2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 305), count= c(1,1,30))
meanN2006_O=mean(tempsN2006_O)

For #51 (476, 1080)
tempsN2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 305), count= c(1,1,30))
meanN2006_P=mean(tempsN2006_P)

# for 16 (476, 1100)
tempsN2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 305), count= c(1,1,30))
meanN2006_Q=mean(tempsN2006_Q)

# For 15 (476,1101)
tempsN2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 305), count= c(1,1,30))
meanN2006_R=mean(tempsN2006_R)

#For 28 (477, 1086)
tempsN2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 305), count= c(1,1,30))
meanN2006_S=mean(tempsN2006_S)

# for 83 and BR0502 (477, 1102)
tempsN2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 305), count= c(1,1,30))
meanN2006_T=mean(tempsN2006_T)

#for Br 4/5 10 (477 1105)
tempsN2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 305), count= c(1,1,30))
meanN2006_U=mean(tempsN2006_U)

# for 27, PC1020 (478, 1086)
tempsN2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 305), count= c(1,1,30))
meanN2006_V=mean(tempsN2006_V)

# for PC1010 (479,1086)
tempsN2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 305), count= c(1,1,30))
meanN2006_W=mean(tempsN2006_W)

# for PC0920 (479, 1088)
tempsN2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 305), count= c(1,1,30))
meanN2006_X=mean(tempsN2006_X)

# For PC0910 (480, 1088)
tempsN2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 305), count= c(1,1,30))
meanN2006_Y=mean(tempsN2006_Y)

# for PC1420 (480,1091) 
tempsN2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 305), count= c(1,1,30))
meanN2006_Z=mean(tempsN2006_Z)

# For WBSL840 (480, 1092)
tempsN2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 305), count= c(1,1,30))
meanN2006_AA=mean(tempsN2006_AA)

# for PC0720 (481, 1095)
tempsN2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 305), count= c(1,1,30))
meanN2006_BB=mean(tempsN2006_BB)

# for PC1510 (481, 1087)
tempsN2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 305), count= c(1,1,30))
meanN2006_CC=mean(tempsN2006_CC)

#for PC0710 (482, 1096)
tempsN2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 305), count= c(1,1,30))
meanN2006_DD=mean(tempsN2006_DD)



meansN2006= rbind(meanN2006_A, meanN2006_B, meanN2006_C, meanN2006_D, meanN2006_E, meanN2006_F, meanN2006_G, meanN2006_H, meanN2006_I, meanN2006_J, meanN2006_K, meanN2006_L, meanN2006_M, meanN2006_N, meanN2006_O, meanN2006_P, meanN2006_Q, meanN2006_R, meanN2006_S, meanN2006_T, meanN2006_U, meanN2006_V, meanN2006_W, meanN2006_X, meanN2006_Y, meanN2006_Z, meanN2006_AA, meanN2006_BB, meanN2006_CC, meanN2006_DD)