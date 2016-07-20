library(mice)
### using package mice ####
iris
data<-iris
summary(iris)
### generate 10% missing values at random & proportion of missing values w.r.to x i.e;noNA
iris.mis<-prodNA(iris,noNA = 0.1)
summary(iris.mis)

## remove categorical variables
iris.mis<-subset(iris.mis,select = -c(Species ))
summary(iris.mis)
##install mice package has a fn md.pattern().It returns a tabular form of missing value present in each variable in data set.
md.pattern(iris.mis)
### Tp visualize missing values we use VIM package

library(VIM)
mice_plot<-aggr(iris.mis,col=c('navyblue','yellow'),numbers=TRUE,sortVars=TRUE,labels=names(iris.mis),cex.axis=.7,gap=3,ylab=c("Missing data","pattern"))
##Now,lets impute missing values.
####m  - Refers to 5 imputed data sets
###maxit - Refers to no. of iterations taken to impute missing values
####method - Refers to method used in imputation. we used predictive mean matching.
imputed_data<-mice(iris.mis,m=5,maxit = 50,method = 'pmm',seed = 500)
summary(imputed_data)

### check imputed values
imputed_data$imp$Sepal.Width
### get complete data 

## build predictive model
fit <-with(data = iris.mis,exp = lm(Sepal.Width ~ Sepal.Length +Petal.Width))
summary(fit)


#################
library(Amelia)
library(missForest)
library(Hmisc)
library(mi)
