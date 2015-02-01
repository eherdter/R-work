### November 2007 ### 305, 30


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsN2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,305), count=c(1,1,30))
meanN2007_A=mean(tempsN2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsN2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 305), count= c(1,1,30))
meanN2007_B=mean(tempsN2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsN2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 305), count= c(1,1,30))
meanN2007_C=mean(tempsN2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsN2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 305), count= c(1,1,30))
meanN2007_D=mean(tempsN2007_D)

# for station 58 ~ 475, 1073
tempsN2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 305), count= c(1,1,30))
meanN2007_E=mean(tempsN2007_E)

# for station BR3440, (472, 1103)
tempsN2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 305), count= c(1,1,30))
meanN2007_F=mean(tempsN2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsN2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 305), count= c(1,1,30))
meanN2007_G=mean(tempsN2007_G)

# for PC1220, 33, 34, (476,1083)
tempsN2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 305), count= c(1,1,30))
meanN2007_H=mean(tempsN2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsN2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 305), count= c(1,1,30))
meanN2007_I=mean(tempsN2007_I)

# For PC1520 ~ (479, 1087)
tempsN2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 305), count= c(1,1,30))
meanN2007_J=mean(tempsN2007_J)

#For PC81460 (479, 1091)
tempsN2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 305), count= c(1,1,30))
meanN2007_K=mean(tempsN2007_K)

# For BOR0340 (471, 1104)
tempsN2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 305), count= c(1,1,30))
meanN2007_L=mean(tempsN2007_L)

# for BR0320 (471, 1107)
tempsN2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 305), count= c(1,1,30))
meanN2007_M=mean(tempsN2007_M)

#For 82 (472, 1102)
tempsN2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 305), count= c(1,1,30))
meanN2007_N=mean(tempsN2007_N)

# For WB16150 (475, 1080)
tempsN2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 305), count= c(1,1,30))
meanN2007_O=mean(tempsN2007_O)

For #51 (476, 1080)
tempsN2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 305), count= c(1,1,30))
meanN2007_P=mean(tempsN2007_P)

# for 16 (476, 1100)
tempsN2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 305), count= c(1,1,30))
meanN2007_Q=mean(tempsN2007_Q)

# For 15 (476,1101)
tempsN2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 305), count= c(1,1,30))
meanN2007_R=mean(tempsN2007_R)

#For 28 (477, 1086)
tempsN2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 305), count= c(1,1,30))
meanN2007_S=mean(tempsN2007_S)

# for 83 and BR0502 (477, 1102)
tempsN2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 305), count= c(1,1,30))
meanN2007_T=mean(tempsN2007_T)

#for Br 4/5 10 (477 1105)
tempsN2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 305), count= c(1,1,30))
meanN2007_U=mean(tempsN2007_U)

# for 27, PC1020 (478, 1086)
tempsN2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 305), count= c(1,1,30))
meanN2007_V=mean(tempsN2007_V)

# for PC1010 (479,1086)
tempsN2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 305), count= c(1,1,30))
meanN2007_W=mean(tempsN2007_W)

# for PC0920 (479, 1088)
tempsN2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 305), count= c(1,1,30))
meanN2007_X=mean(tempsN2007_X)

# For PC0910 (480, 1088)
tempsN2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 305), count= c(1,1,30))
meanN2007_Y=mean(tempsN2007_Y)

# for PC1420 (480,1091) 
tempsN2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 305), count= c(1,1,30))
meanN2007_Z=mean(tempsN2007_Z)

# For WBSL840 (480, 1092)
tempsN2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 305), count= c(1,1,30))
meanN2007_AA=mean(tempsN2007_AA)

# for PC0720 (481, 1095)
tempsN2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 305), count= c(1,1,30))
meanN2007_BB=mean(tempsN2007_BB)

# for PC1510 (481, 1087)
tempsN2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 305), count= c(1,1,30))
meanN2007_CC=mean(tempsN2007_CC)

#for PC0710 (482, 1096)
tempsN2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 305), count= c(1,1,30))
meanN2007_DD=mean(tempsN2007_DD)



meansN2007= c(meanN2007_A, meanN2007_B, meanN2007_C, meanN2007_D, meanN2007_E, meanN2007_F, meanN2007_G, meanN2007_H, meanN2007_I, meanN2007_J, meanN2007_K, meanN2007_L, meanN2007_M, meanN2007_N, meanN2007_O, meanN2007_P, meanN2007_Q, meanN2007_R, meanN2007_S, meanN2007_T, meanN2007_U, meanN2007_V, meanN2007_W, meanN2007_X, meanN2007_Y, meanN2007_Z, meanN2007_AA, meanN2007_BB, meanN2007_CC, meanN2007_DD)