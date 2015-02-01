#JULY 2004
Start is 183, count is 31

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)


data2004= open.ncdf("sst.day.mean.2004.v2.nc")

JULY
# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJul2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,183), count=c(1,1,31))
mean(tempsJul2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJul2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 183), count= c(1,1,31))
mean(tempsJul2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJul2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 183), count= c(1,1,31))
mean(tempsJul2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJul2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 183), count= c(1,1,31))
mean(tempsJul2004_D)


# for station 58 ~ 475, 1073
tempsJul2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 183), count= c(1,1,31))
mean(tempsJul2004_E)



# for station BR3440, (472, 1103)
tempsJul2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 183), count= c(1,1,31))
mean(tempsJul2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsJul2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 183), count= c(1,1,31))
mean(tempsJul2004_G)


# for PC1220, 33, 34, (476,1083)
tempsJul2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 183), count= c(1,1,31))
mean(tempsJul2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsJul2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 183), count= c(1,1,31))
mean(tempsJul2004_I)


# For PC1520 ~ (479, 1087)
tempsJul2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 183), count= c(1,1,31))
mean(tempsJul2004_J)

#For PC81460 (479, 1091)
tempsJul2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 183), count= c(1,1,31))
mean(tempsJul2004_K)


################AUGUST###########################  #August 214-244, 31

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsA2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,214), count=c(1,1,31))
mean(tempsA2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsA2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 214), count= c(1,1,31))
mean(tempsA2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsA2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 214), count= c(1,1,31))
mean(tempsA2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsA2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 214), count= c(1,1,31))
mean(tempsA2004_D)


# for station 58 ~ 475, 1073
tempsA2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 214), count= c(1,1,31))
mean(tempsA2004_E)



# for station BR3440, (472, 1103)
tempsA2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 214), count= c(1,1,31))
mean(tempsA2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsA2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 214), count= c(1,1,31))
mean(tempsA2004_G)


# for PC1220, 33, 34, (476,1083)
tempsA2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 214), count= c(1,1,31))
mean(tempsA2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsA2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 214), count= c(1,1,31))
mean(tempsA2004_I)


# For PC1520 ~ (479, 1087)
tempsA2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 214), count= c(1,1,31))
mean(tempsA2004_J)

#For PC81460 (479, 1091)
tempsA2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 214), count= c(1,1,31))
mean(tempsA2004_K)


## SEPTEMBER## ## #September 245-274, 30

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsS2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,245), count=c(1,1,30))
mean(tempsS2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsS2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 245), count= c(1,1,30))
mean(tempsS2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsS2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 245), count= c(1,1,30))
mean(tempsS2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsS2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 245), count= c(1,1,30))
mean(tempsS2004_D)


# for station 58 ~ 475, 1073
tempsS2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 245), count= c(1,1,30))
mean(tempsS2004_E)



# for station BR3440, (472, 1103)
tempsS2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 245), count= c(1,1,30))
mean(tempsS2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsS2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 245), count= c(1,1,30))
mean(tempsS2004_G)


# for PC1220, 33, 34, (476,1083)
tempsS2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 245), count= c(1,1,30))
mean(tempsS2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsS2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 245), count= c(1,1,30))
mean(tempsS2004_I)


# For PC1520 ~ (479, 1087)
tempsS2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 245), count= c(1,1,30))
mean(tempsS2004_J)

#For PC81460 (479, 1091)
tempsS2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 245), count= c(1,1,30))
mean(tempsS2004_K)


##OCTOBER###  #October 274-305, 31

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsO2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,274), count=c(1,1,31))
mean(tempsO2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsO2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 274), count= c(1,1,31))
mean(tempsO2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsO2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 274), count= c(1,1,31))
mean(tempsO2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsO2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 274), count= c(1,1,31))
mean(tempsO2004_D)


# for station 58 ~ 475, 1073
tempsO2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 274), count= c(1,1,31))
mean(tempsO2004_E)



# for station BR3440, (472, 1103)
tempsO2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 274), count= c(1,1,31))
mean(tempsO2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsO2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 274), count= c(1,1,31))
mean(tempsO2004_G)


# for PC1220, 33, 34, (476,1083)
tempsO2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 274), count= c(1,1,31))
mean(tempsO2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsO2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 274), count= c(1,1,31))
mean(tempsO2004_I)


# For PC1520 ~ (479, 1087)
tempsO2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 274), count= c(1,1,31))
mean(tempsO2004_J)

#For PC81460 (479, 1091)
tempsO2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 274), count= c(1,1,31))
mean(tempsO2004_K)


##NOVEMBER ###  #November 306-335, 30


# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsN2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,306), count=c(1,1,30))
mean(tempsN2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsN2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 306), count= c(1,1,30))
mean(tempsN2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsN2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 306), count= c(1,1,30))
mean(tempsN2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsN2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 306), count= c(1,1,30))
mean(tempsN2004_D)


# for station 58 ~ 475, 1073
tempsN2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 306), count= c(1,1,30))
mean(tempsN2004_E)



# for station BR3440, (472, 1103)
tempsN2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 306), count= c(1,1,30))
mean(tempsN2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsN2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 306), count= c(1,1,30))
mean(tempsN2004_G)


# for PC1220, 33, 34, (476,1083)
tempsN2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 306), count= c(1,1,30))
mean(tempsN2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsN2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 306), count= c(1,1,30))
mean(tempsN2004_I)


# For PC1520 ~ (479, 1087)
tempsN2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 306), count= c(1,1,30))
mean(tempsN2004_J)

#For PC81460 (479, 1091)
tempsN2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 306), count= c(1,1,30))
mean(tempsO2004_K)



## DECEMBER ### #December 336-366, 31

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsD2004_A =get.var.ncdf(data2004, "sst", start= c(1085,477,336), count=c(1,1,31))
mean(tempsD2004_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsD2004_B = get.var.ncdf(data2004, "sst", start=c(1103, 473, 336), count= c(1,1,31))
mean(tempsD2004_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsD2004_C = get.var.ncdf(data2004, "sst", start=c(1078, 475, 336), count= c(1,1,31))
mean(tempsD2004_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsD2004_D = get.var.ncdf(data2004, "sst", start=c(1078, 473, 336), count= c(1,1,31))
mean(tempsD2004_D)


# for station 58 ~ 475, 1073
tempsD2004_E = get.var.ncdf(data2004, "sst", start=c(1073, 475, 336), count= c(1,1,31))
mean(tempsD2004_E)



# for station BR3440, (472, 1103)
tempsD2004_F = get.var.ncdf(data2004, "sst", start=c(1103, 472, 336), count= c(1,1,31))
mean(tempsD2004_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsD2004_G = get.var.ncdf(data2004, "sst", start=c(1098, 478, 336), count= c(1,1,31))
mean(tempsD2004_G)


# for PC1220, 33, 34, (476,1083)
tempsD2004_H = get.var.ncdf(data2004, "sst", start=c(1083, 476, 336), count= c(1,1,31))
mean(tempsD2004_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsD2004_I = get.var.ncdf(data2004, "sst", start=c(1078, 474, 336), count= c(1,1,31))
mean(tempsD2004_I)


# For PC1520 ~ (479, 1087)
tempsD2004_J = get.var.ncdf(data2004, "sst", start=c(1087, 479, 336), count= c(1,1,31))
mean(tempsD2004_J)

#For PC81460 (479, 1091)
tempsD2004_K = get.var.ncdf(data2004, "sst", start=c(1091, 479, 336), count= c(1,1,31))
mean(tempsD2004_K)
