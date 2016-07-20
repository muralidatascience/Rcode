library(randomForest)
##Partition the dataset into training and testing
library(caret)
set.seed(500)   ### how many times u ran the code it makes the samples
inTrain1<-createDataPartition(Tata2$Car.Age,p=0.60,list=F)
dataTrain1<-Tata2[inTrain1,]
dataTest1<-Tata2[-inTrain1,]

##Model
rmf<-randomForest(Car.Age~.,data=dataTrain1)
rmf
p<-predict(rmf,dataTest1)
table(dataTest1[,5],p)
mean(dataTest1[,5]**p)
importance(rmf)##higher the value the more the importance
getTree(rmf,500,labelVar = T)##individual node performance
