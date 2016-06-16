library(ggExtra)
library(ggplot2)
library(devtools)
airquality
data <- airquality
data[4:10,3] <- rep(NA,7)
data[1:5,4] <- NA
data <- data[-c(5,6)]
summary(data)
pMiss <- function(x){sum(is.na(x))/length(x)*100}
apply(data,2,pMiss)
apply(data,1,pMiss)
library(mice)
md.pattern(data)
library(VIM)
aggr_plot <- aggr(data, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(data), cex.axis=.7, gap=3, ylab=c("Histogram of missing data","Pattern"))
##marginplot(Solar.R,Ozone)
tempData <- mice(data,m=5,maxit=50,meth='pmm',seed=500)
summary(tempData)
tempData$imp$Ozone
tempData$meth
##completedData <- complete(tempData,1)
xyplot(tempData,Ozone ~ Wind+Temp+Solar.R,pch=18,cex=1)
densityplot(tempData)
stripplot(tempData, pch = 20, cex = 1.2)
modelFit1 <- with(tempData,lm(Temp~ Ozone+Solar.R+Wind))
###summary(pool(modelFit1))
tempData2 <- mice(data,m=50,seed=245435)
modelFit2 <- with(tempData2,lm(Temp~ Ozone+Solar.R+Wind))
###summary(pool(modelFit2))
