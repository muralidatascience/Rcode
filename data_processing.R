a<-datasets::airquality
library(MASS)
library(AID)
#http://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/
###Imputing missing values
library(Hmisc)
impute_arg <- aregImpute(~ Ozone + Solar.R + Wind + Temp +Month+Day, data = a, n.impute = 5)
impute_arg$imputed$Ozone
rownames_ozone<-row.names(a[is.na(a$Ozone),])
rownames_ozone_imputed<-row.names(impute_arg$imputed$Ozone)
for(i in 1:length(rownames_ozone)){
  if (rownames_ozone[i]== rownames_ozone_imputed[i]){
    sam<-as.numeric(rownames_ozone[i])
    a[sam,1]=impute_arg$imputed$Ozone[i,1]}
}
impute_arg$imputed$Solar.R
rownames_solar<-row.names(a[is.na(a$Solar.R),])
rownames_solar_imputed<-row.names(impute_arg$imputed$Solar.R)
for(i in 1:length(rownames_solar)){
  if (rownames_solar[i]== rownames_solar_imputed[i]){
    sam<-as.numeric(rownames_solar[i])
    a[sam,2]=impute_arg$imputed$Solar.R[i,1]}
}
impute_arg$imputed$Wind
rownames_Wind<-row.names(a[is.na(a$Wind),])
rownames_Wind_imputed<-row.names(impute_arg$imputed$Wind)
for(i in 1:length(rownames_Wind)){
  if (rownames_Wind[i]== rownames_Wind_imputed[i]){
    sam<-as.numeric(rownames_Wind[i])
    a[sam,3]=impute_arg$imputed$Wind[i,1]}
}
##omiiting 
a1<-na.omit(a)
a1

#####outlier detection

library(FitAR)
library(e1071)   
skewness(a$Ozone)
x<-a$Ozone
bc<-boxcox(lm(x~.,data=a))
lam1<-bc$x[which.max(bc$y)]
truehist(bxcx(a$Ozone,lam1))
a$Ozone1 = bxcx(a$Ozone,lam1)
skewness(a$Ozone1)


library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(sqrt(a$Ozone)), main="Density Plot: Speed", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(sqrt((a$Ozone))), 2)))  # density plot for 'speed'
polygon(density(a$Ozone), col="red")

