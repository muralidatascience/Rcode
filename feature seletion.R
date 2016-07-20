install.packages("UsingR")
library(UsingR)
data("fat")
View(fat)
attach(fat)
sapply(fat, function(x) sum(is.na(x)))
fat<-fat[,-c(1,2,4)]
str(fat)
fat$age<-as.numeric(fat$age)
#########
a<-lm(formula=body.fat.siri~.,data = fat)
a$residuals

x<-fat
library("GA")

#The design matrix without the intercept is extracted from the fitted model object by:


x<- model.matrix(a)[,-1]
y<- model.response(model.frame(a))

#Then the function can be maximized by the following:

fitness <- function(string){
  inc <- which(string ==1)
  x<- cbind(1,x[,inc])
  mod<-lm.fit(x,y)
  class(mod) <- "lm"
  -AIC(mod)
}

GA<-ga("binary",fitness= fitness,nBits=ncol(x),names=colnames(x),monitor=plot)

######
library(Rcmdr)
stepwise(a, direction='forward/backward', criterion='AIC')
stepwise(a, direction='backward/forward', criterion='AIC')
library(mlbench)
library(caret)
?caretFuncs

# ensure results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)
# load the dataset
data(PimaIndiansDiabetes)
# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
# train the model
model <- train(body.fat.siri~., data=fat, method="lvq", preProcess="scale", trControl=control)
# estimate variable importance
importance <- varImp(model, scale=FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)



#################################################
boruta.train <- Boruta(body.fat.siri~., data = fat, doTrace = 2)
print(boruta.train)
plot(boruta.train, xlab = "", xaxt = "n")
lz<-lapply(1:ncol(boruta.train$ImpHistory),function(i)
  boruta.train$ImpHistory[is.finite(boruta.train$ImpHistory[,i]),i])
names(lz) <- colnames(boruta.train$ImpHistory)
Labels <- sort(sapply(lz,median))
axis(side = 1,las=2,labels = names(Labels),
       at = 1:ncol(boruta.train$ImpHistory), cex.axis = 0.7)
final.boruta <- TentativeRoughFix(boruta.train)
 print(final.boruta)
 getSelectedAttributes(final.boruta, withTentative = F)
 