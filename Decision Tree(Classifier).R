Tata2 <- read.csv("C:/Users/murali.kommanaboina/Desktop/Murali/Tata2.csv",stringsAsFactors <- T)
View(Tata2)
Tata2<-Tata2[,-c(1,10)]
summary(Tata2)
str(Tata2)
##check the distribution of target variable
table(Tata2$Purchased.New.Car)
prop.table(table(Tata2$Purchased.New.Car))
##Partition the dataset into training and testing
library(caret)
set.seed(100)   ### how many times u ran the code it makes the samples
inTrain1<-createDataPartition(y=Tata2$Purchased.New.Car,p=0.50,list=F)
Traindata<-Tata2[inTrain1,]
Testdata<-Tata2[-inTrain1,]
##Further partition the test dataset into test1 and test2
intest<-createDataPartition(y=Testdata$Purchased.New.Car,p=0.50,list = F)
testdata1<-Testdata[intest,]
testdata2<-Testdata[-intest,]
##Checking the rows and proportions of target variable for both training and testing  datasets
nrow(Traindata)
nrow(testdata1)
nrow(testdata2)
prop.table(table(Traindata$Purchased.New.Car))
prop.table(table(testdata1$Purchased.New.Car))
prop.table(table(testdata2$Purchased.New.Car))
##Model
library(C50)
C50model<-C5.0(Traindata[-14],Traindata$Purchased.New.Car)##excluding the Purchased.New.Car
##print summary
C50model
summary(C50model)
##Prediction performance on Testdata1 and Testdata2
C50prediction1<-predict(C50model,testdata1,type="class")
summary(C50prediction1)
C50prediction2<-predict(C50model,testdata2,type="class")
summary(C50prediction2)
##print confusion matrix and mmetric
confusionMatrix(C50prediction1,testdata1$Purchased.New.Car,positive="Yes",dnn=c("Prediction","True"))
confusionMatrix(C50prediction2,testdata2$Purchased.New.Car,positive="Yes",dnn=c("Prediction","True"))
library(rminer)
mmetric(testdata1$Purchased.New.Car,C50prediction1,c("ACC","PRECISION","TPR","F1"))##True positive rate
head(testdata1$Purchased.New.Car,n=5)##the 1st value indicates the PRECISION1,TPR1,F11
mmetric(testdata2$Purchased.New.Car,C50prediction2,c("ACC","PRECISION","TPR","F1"))
head(testdata2$Purchased.New.Car,n=5)
##Building a Decision Tree with J48
library(RWeka)
model_J48=J48(Purchased.New.Car~.,data=Traindata)
##performance on testing
evaluate_Weka_classifier(model_J48,testdata1,numFolds = 0,complexity = F,seed = 1,class = T)
evaluate_Weka_classifier(model_J48,testdata2,numFolds = 0,complexity = F,seed = 1,class = T)
##Tree pruning
C50model_p1<-C5.0(Purchased.New.Car~.,data=Traindata,control=C5.0Control(CF=0.05))
C50model_p1
summary(C50model_p1)

C50model_p1<-C5.0(Purchased.New.Car~.,data=Traindata,control=C5.0Control(CF=0.5))##higher value
C50model_p1
summary(C50model_p1)

