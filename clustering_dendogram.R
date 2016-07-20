library(cluster)
library(fpc)

#this makes a matrix that is only 95% empty space maximam
dtmss<-removeSparseTerms(dtm,0.95)
inspect(dtmss)

#calculating distance b/w words and then cluster them according to similarity
d<-dist(t(dtmss),method="euclidian")
fit<-hclust(d=d,method="ward.D")
plot(fit,hang=-1)

plot.new()
plot(fit,hang=-1)
groups1<-cutree(fit,k=5)#"k=" differntiate no of clusters you are using  
rect.hclust(fit,k=5,border="orange")#draw dendogram with red borders around the 5 clusters


#k-means clustering
#clustering words into a specified no of groups
d2<-dist(t(dtmss),method="euclidian")
kfit<-kmeans(d,2)
clusplot(as.matrix(d),kfit$cluster,color=T,shade=T,labels = 2,lines=0)

