library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

SSH_3_10 = open.ncdf("dt_global_allsat_msla_h_y2010_m03.nc")

lats = get.var.ncdf(SSH_3_10, "lat")
## the latsU correspond to the sla lats and longs 
lons = get.var.ncdf(SSH_3_10, "lon")


######  for June 2006 ####

# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
SSH_3_10_A =get.var.ncdf(SSH_3_10, "sla", start= c(1085,477,1), count=c(1,1,1))


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
SSH_3_10_B = get.var.ncdf(SSH_3_10, "sla", start=c(1103, 473, 1), count= c(1,1,1))


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
SSH_3_10_C = get.var.ncdf(SSH_3_10, "sla", start=c(1078, 475, 1), count= c(1,1,1))


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
SSH_3_10_D = get.var.ncdf(SSH_3_10, "sla", start=c(1078, 473, 1), count= c(1,1,1))


# for station 58 ~ 475, 1073
SSH_3_10_E = get.var.ncdf(SSH_3_10, "sla", start=c(1073, 475, 1), count= c(1,1,1))


# for station BR3440, (472, 1103)
SSH_3_10_F = get.var.ncdf(SSH_3_10, "sla", start=c(1103, 472, 1), count= c(1,1,1))

#for station PC0610 and PC0620, ~ (478, 1098)
SSH_3_10_G = get.var.ncdf(SSH_3_10, "sla", start=c(1098, 478, 1), count= c(1,1,1))


# for PC1220, 33, 34, (476,1083)
SSH_3_10_H = get.var.ncdf(SSH_3_10, "sla", start=c(1083, 476, 1), count= c(1,1,1))


#for PC1320, He265, 37 ~ (474, 1078)
SSH_3_10_I = get.var.ncdf(SSH_3_10, "sla", start=c(1078, 474, 1), count= c(1,1,1))


# For PC1520 ~ (479, 1087)
SSH_3_10_J = get.var.ncdf(SSH_3_10, "sla", start=c(1087, 479, 1), count= c(1,1,1))


#For PC81460 (479, 1091)
SSH_3_10_K = get.var.ncdf(SSH_3_10, "sla", start=c(1091, 479, 1), count= c(1,1,1))


# For BOR0340 (471, 1104)
SSH_3_10_L = get.var.ncdf(SSH_3_10, "sla", start=c(1104, 471, 1), count= c(1,1,1))


# for BR0320 (471, 1107)
SSH_3_10_M = get.var.ncdf(SSH_3_10, "sla", start=c(1107, 471, 1), count= c(1,1,1))


#For 82 (472, 1102)
SSH_3_10_N = get.var.ncdf(SSH_3_10, "sla", start=c(1102, 472, 1), count= c(1,1,1))


# For WB16150 (475, 1080)
SSH_3_10_O = get.var.ncdf(SSH_3_10, "sla", start=c(1080, 475, 1), count= c(1,1,1))


For #51 (476, 1080)
SSH_3_10_P = get.var.ncdf(SSH_3_10, "sla", start=c(1080, 476, 1), count= c(1,1,1))

# for 16 (476, 1100)
SSH_3_10_Q = get.var.ncdf(SSH_3_10, "sla", start=c(1100, 476, 1), count= c(1,1,1))

# For 15 (476,1101)
SSH_3_10_R = get.var.ncdf(SSH_3_10, "sla", start=c(1101, 476, 1), count= c(1,1,1))


#For 28 (477, 1086)
SSH_3_10_S = get.var.ncdf(SSH_3_10, "sla", start=c(1086, 477, 1), count= c(1,1,1))


SSH_3_10_T = get.var.ncdf(SSH_3_10, "sla", start=c(1102, 477, 1), count= c(1,1,1))


#for Br 4/5 10 (477 1105)
SSH_3_10_U = get.var.ncdf(SSH_3_10, "sla", start=c(1105, 477, 1), count= c(1,1,1))


# for 27, PC1020 (478, 1086)
SSH_3_10_V = get.var.ncdf(SSH_3_10, "sla", start=c(1086, 478, 1), count= c(1,1,1))


# for PC1010 (479,1086)
SSH_3_10_W = get.var.ncdf(SSH_3_10, "sla", start=c(1086, 479, 1), count= c(1,1,1))


# for PC0920 (479, 1088)
SSH_3_10_X = get.var.ncdf(SSH_3_10, "sla", start=c(1088, 479, 1), count= c(1,1,1))


# For PC0910 (480, 1088)
SSH_3_10_Y = get.var.ncdf(SSH_3_10, "sla", start=c(1088, 480, 1), count= c(1,1,1))


# for PC1420 (480,1091) 
SSH_3_10_Z = get.var.ncdf(SSH_3_10, "sla", start=c(1091, 480, 1), count= c(1,1,1))


# For WBSL840 (480, 1092)
SSH_3_10_AA = get.var.ncdf(SSH_3_10, "sla", start=c(1092, 480, 1), count= c(1,1,1))


# for PC0720 (481, 1095)
SSH_3_10_BB = get.var.ncdf(SSH_3_10, "sla", start=c(1095, 481, 1), count= c(1,1,1))


# for PC1510 (481, 1087)
SSH_3_10_CC = get.var.ncdf(SSH_3_10, "sla", start=c(1087, 481, 1), count= c(1,1,1))


#for PC0710 (482, 1096)
SSH_3_10_DD = get.var.ncdf(SSH_3_10, "sla", start=c(1096, 482, 1), count= c(1,1,1))


letters = c("A", "B", "C", "D","E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "BB", "CC", "DD")

mat_3_10= c(SSH_3_10_A, SSH_3_10_B, SSH_3_10_C, SSH_3_10_D, SSH_3_10_E, SSH_3_10_F, SSH_3_10_G, SSH_3_10_H, SSH_3_10_I, SSH_3_10_J, SSH_3_10_K, SSH_3_10_L, SSH_3_10_M, SSH_3_10_N, SSH_3_10_O, SSH_3_10_P, SSH_3_10_Q, SSH_3_10_R, SSH_3_10_S, SSH_3_10_T, SSH_3_10_U, SSH_3_10_V, SSH_3_10_W, SSH_3_10_X, SSH_3_10_Y, SSH_3_10_Z, SSH_3_10_AA, SSH_3_10_BB, SSH_3_10_CC, SSH_3_10_DD)

mat_3_10 <- data.frame(cbind(letters, mat_3_10))