read_data<-function(d){
  x<-read.csv(d)
  return(x)
}
#data("C:\\Users\\murali.kommanaboina\\Desktop\\fitted1.csv")
i=c(4,3)
a=330
k=19
data1="Skill_Set_5_Clothing"
j="Emp_Id"
MyData=read.csv("C:/Users/murali.kommanaboina/Desktop/Staff optimization/updated_transc_data_updated.csv")
MyData <- read.csv("C:/Users/murali.kommanaboina/Desktop/Staff optimization/updated_transc_data_updated.csv")
SO<-function(MyData,data1,a,i,j,k){
  
  ##data with 4&5 scores in skillset
  
  newdata_clothing <- subset(MyData, MyData[,which(colnames(MyData)==data1)]>= i[1] ,select= c(j,data1))
  
  ##data with 3 and below scores in skillset
  
  newdata1_clothing <- subset(MyData, MyData[,which(colnames(MyData)==data1)] <= i[2] ,select= c(j,data1))
  
  ## sorting in descending order
  
  
newdata1_clothing[,which(colnames(newdata1_clothing)==data1)]=sort(newdata1_clothing[,which(colnames(newdata1_clothing)==data1)],decreasing = TRUE)
  
  ##employees available per department
  
  Available_emp_clothing=length(newdata_clothing[,which(colnames(newdata_clothing)==j)])
  
  ##employees required per department
  
  emp_required_clothing=a/k
  
  ##additional employees required per department
  
  difference_emp_clothing=emp_required_clothing-Available_emp_clothing
  
  ##additional rows that has to be added to available employees to meet requirment
  
  additional_clothing=newdata1_clothing[1:(difference_emp_clothing),]
  
  
  if(emp_required_clothing > Available_emp_clothing){
    newlist_clothing=rbind(newdata_clothing,additional_clothing)
  }else{
    newlist_clothing=newdata_clothing[1:(nrow(newdata_clothing)-length(difference_emp_clothing)),]
  }
  
  return(newlist_clothing)
  
}

SO(read_data("C:/Users/murali.kommanaboina/Desktop/Staff optimization/updated_transc_data_updated.csv"),"Skill_Set_4_Electronics",330,c("4","3"),"Emp_Id",19)











