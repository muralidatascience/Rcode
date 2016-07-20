
#Simple Bar Plot 
counts4 <- table(Dataframe2$polarity)
barplot(counts4, main="Number of Customer Opinion", 
        xlab="Categories")

# Stacked Bar Plot with Colors and Legend
counts2 <- table(Dataframe2$location, Dataframe2$polarity)
barplot(counts2, main="Customer Feedbacks & Sources",
        xlab="Number of Customer Opinion & Source", col=c("darkblue","red"),
        legend = rownames(counts2)) 

# Grouped Bar Plot
counts3 <- table(Dataframe2$location, Dataframe2$polarity)
barplot(counts3, main="Customer Feedbacks & Sources",
        xlab="Number of Customer Opinion & Source", col=c("darkblue","red"),
        legend = rownames(counts3), beside=TRUE)



write.csv(Dataframe2,"C:\\Users\\murali.kommanaboina\\Desktop\\output.csv")

