Tata2 <- read.csv("~/Tata2.csv",stringsAsFactors <- T)
View(Tata2)
Tata2<-Tata2[,-c(1,2,3,10)]
summary(Tata2)
str(Tata2)
##check the distribution of target variable
table(Tata2$Purchased.New.Car)
##Partition the dataset into training and testing
library(caret)
set.seed(500)   ### how many times u ran the code it makes the samples
inTrain1<-createDataPartition(Tata2$Purchased.New.Car,p=0.60,list=F)
dataTrain1<-Tata2[inTrain1,]
dataTest1<-Tata2[-inTrain1,]
##Checking the rows and proportions of target variable for both training and testing  datasets
nrow(dataTrain1)
nrow(dataTest1)
prop.table(table(dataTrain1$Purchased.New.Car))
prop.table(table(dataTest1$Purchased.New.Car))
##Note is the probabilities are similar we done correct
##Naive Bayes
library(e1071)
library(rminer)
##model building
e1071model<-naiveBayes(Purchased.New.Car~.,data=dataTrain1)
##check the summary of the model
e1071model
##check the conditional probability of the categorical variable "carmodel"
prop.table(table(dataTrain1$Car.Model,dataTrain1$Purchased.New.Car),2)
##check the frequency of the categorical variable "carmodel"
table(dataTrain1$Car.Model,dataTrain1$Purchased.New.Car)
##Prediction on test data
e1071modelPrediction<-predict(e1071model,dataTest1)
head(e1071modelPrediction,n=5)
##print confusion matrix
print(confusionMatrix(e1071modelPrediction,dataTest1$Purchased.New.Car,positive="Yes",dnn=c("Prediction","True")))
mmetric(dataTest1$Purchased.New.Car,e1071modelPrediction,c("ACC","PRECISION","TPR","F1"))
##Predict
predict(e1071model, data.frame(Car.Model="Safari",Car.Type="SUV"
                               ,Total.Number.of.Servicing="9",Days.to.Last.Servicing="45", Km.Reading.on.last.servicing="43267"
                               ,Current.Market.Price.of.Car="12",Car.Age="2",Customer.Income.Group ="low",Age="32"
                               , Locality..State....2....3.States...Max="Maharastra",Marital.Status="Un-Married"))
