Tata2 <- read.csv("C:/Users/murali.kommanaboina/Desktop/Murali/Tata2.csv",stringsAsFactors <- T)
View(Tata2)
Tata2<-Tata2[,-c(1,2,3,4,5,10,12,14,15,16)]
summary(Tata2)
str(Tata2)
pairs(Tata2)
cor(Tata2) 

library(caret)
set.seed(500)   ### how many times u ran the code it makes the samples
inTrain1<-createDataPartition(Tata2$Car.Age,p=0.60,list=F)
dataTrain1<-Tata2[inTrain1,]
dataTest1<-Tata2[-inTrain1,]

##Linear Regression

plot(Car.Model ~ Car.Age,data=dataTrain1,main="Scatterplot")
Lin<-lm(Car.Age~.,data=dataTrain1)
abline(Lin)
coefficients(Lin)
summary(Lin)
library(forecast)
accuracy(Lin)
predict(Lin,data=dataTest1)
##we will get the indices of each column ..cbind it..and it is the Predicted values
cbind()

##Stepwise regression
library(Rcmdr)
##0r
cpus.lm <- lm(Car.Age ~ ., data = dataTrain1)
cpus.lm2 <- stepAIC(cpus.lm, trace = FALSE)
summary(cpus.lm2)

  