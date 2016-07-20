

V<-read.csv("C:\\Users\\murali.kommanaboina\\Desktop\\Vendor_Data_clusters12.csv")

#V$Order_requested<-sample(1:25,1000,replace=T)

# V$Goods_Damaged<-sample(0:1, 1000, replace=T, prob = c(0.60,0.40))
# 
# 
# 
# V$Goods_Damaged
# table(V$Goods_Damaged)
# V$No_of.items._damaged<-as.numeric(V$No_of.items._damaged)
# 
# for(i in 1:nrow(V)){
#   if(V$Goods_Damaged[i] == 1){
#     if(V$Order_delivered[i] > V$Goods_Damaged[i] ){
#     V$No_of.items._damaged[i] = sample(1:6,1000,replace = TRUE)
#     }else{
#       V$No_of.items._damaged[i] = 1
#   }
# }
#   else if(V$Goods_Damaged[i] == 0){
#     V$No_of.items._damaged[i] = 0
#   }
# }
# 
# for(i in 1:nrow(V)){
#   if( V$No_of.items._damaged[i] == 1){
#     V$No_of.items._damaged[i] = "Customer Not Available at the Specified Address"
#   }
#   else  if( V$No_of.items._damaged[i] == 2){
#     V$No_of.items._damaged[i] = "Wrong Address to Deliver"
#   }
#   else  if( V$No_of.items._damaged[i] == 3){
#     V$No_of.items._damaged[i] = "Missing Parts / Accessories"
#   }
#   else  if( V$No_of.items._damaged[i] == 4){
#     V$No_of.items._damaged[i] = "Quality Not Adequate"
#   }
#   else  if( V$No_of.items._damaged[i] == 5){
#     V$No_of.items._damaged[i] = "Item Defective"
#   }
#   else  if( V$No_of.items._damaged[i] == 6){
#     V$No_of.items._damaged[i] = "Product Mismatch"
#   }
#   else  {
#     V$No_of.items._damaged[i] = "No Replacement"
#   }
# }

# V1<-subset(V, V$Vendor_Name == "Drecom")
# V2<-subset(V, V$Vendor_Name == "FHL")
# V3<-subset(V, V$Vendor_Name == "Logipro")
# V4<-subset(V, V$Vendor_Name == "Office First")
# V5<-subset(V, V$Vendor_Name == "RRD")
# V6<-subset(V, V$Vendor_Name == "SuperSupply")
# 
# table(V1$Replacement_Reason)
# table(V2$Replacement_Reason)
# table(V3$Replacement_Reason)
# table(V4$Replacement_Reason)
# table(V5$Replacement_Reason)
# table(V6$Replacement_Reason)
# 
# plot(V1$Replacement_Reason)
# plot(V2$Replacement_Reason)
# plot(V3$Replacement_Reason)
# plot(V4$Replacement_Reason)
# plot(V5$Replacement_Reason)
# plot(V6$Replacement_Reason)

# for(i in 1:nrow(V)){
#   if( V$Replacement_Reason[i] == "Customer Not Available at the Specified Address"){
#     V$Reason[i] = 1
#   }
#   else  if( V$Replacement_Reason[i] == "Wrong Address to Deliver"){
#     V$Reason[i] = 2
#   }
#   else  if( V$Replacement_Reason[i] == "Missing Parts / Accessories"){
#     V$Reason[i] = 3
#   }
#   else  if( V$Replacement_Reason[i] ==  "Quality Not Adequate"){
#     V$Reason[i] = 4
#   }
#   else  if( V$Replacement_Reason[i] == "Item Defective"){
#     V$Reason[i] = 5
#   }
#   else  if( V$Replacement_Reason[i] == "Product Mismatch"){
#     V$Reason[i] = 6
#   }
#   else  {
#     V$Reason[i] = 0
#   }
# }
###########
write.csv(V, "C:\\Users\\murali.kommanaboina\\Desktop\\Vendor_Data_clusters12.csv")
V<-V[,-c(1:4,6,9,14,19:22)]
V<-V[,-c(15:17,19)]
library(nnet)
logistic<-multinom(Reason~.,data=V)
##0
predict(logistic,data.frame(Product_Category="Technology",Location="Chicago",Brand="StarTAC",Min_Order_Quantity=1,
          Target_Batch_Volume=0.0,Volume=0.97,Sell_Price=115.99,Buy_Price=48.64,Buy_Currency="GBP",Stock_On_Hand=0,Stock_On_Order=2,No_of_days_Taken_to_Supply=3,Rating_Providedby_Dealer=2,
                                               Self_Rating_Vendor=4,Goods_Damaged=0))
##0
predict(logistic,data.frame(Product_Category="Technology",Location="Houston",Brand="Hewlett-Packard",Min_Order_Quantity=1,
                            Target_Batch_Volume=0.0,Volume=0.90,Sell_Price=115.99,Buy_Price=310.69,
                             Buy_Currency="PLN",Stock_On_Hand=22,Stock_On_Order=0,No_of_days_Taken_to_Supply=5,Rating_Providedby_Dealer=1,
                            Self_Rating_Vendor=3,Goods_Damaged=0))

##2
predict(logistic,data.frame(Product_Category="Office Supplies",Location="Boston",Brand="Elite",Min_Order_Quantity=1,
                            Target_Batch_Volume=0.0,Volume=0.85,Sell_Price=8.45,
                            Buy_Price=34.12,Buy_Currency="CNY",
                            Stock_On_Hand=0,Stock_On_Order=3,No_of_days_Taken_to_Supply=1,Rating_Providedby_Dealer=3,
                            Self_Rating_Vendor=4,Goods_Damaged=1))
                            
##5
predict(logistic,data.frame(Product_Category="Office Supplies",Location="Boston",Brand="Wilson",Min_Order_Quantity=35,
                            Target_Batch_Volume=0.0,Volume=0.09,Sell_Price=2.78,
                            Buy_Price=12.77,Buy_Currency="CNY",
                            Stock_On_Hand=2,Stock_On_Order=70,No_of_days_Taken_to_Supply=6,Rating_Providedby_Dealer=1,
                            Self_Rating_Vendor=2,Goods_Damaged=1))

##4
predict(logistic,data.frame(Product_Category="Technology",Location="Chicago",Brand="AT&T",Min_Order_Quantity=1,
                            Target_Batch_Volume=0.0,Volume=0.51,Sell_Price=15.99,
                            Buy_Price=6.97,Buy_Currency="GBP",
                            Stock_On_Hand=0,Stock_On_Order=3,No_of_days_Taken_to_Supply=4,Rating_Providedby_Dealer=3,
                            Self_Rating_Vendor=4,Goods_Damaged=1))

attach(V)
count_v=V %>% select(Replacement_Reason) %>% group_by(Replacement_Reason) %>%summarise(count = n())
count_v
##plot
library(ggplot2)
ggplot(data=count_v, aes(x=Replacement_Reason, y=count, fill=Replacement_Reason)) +
  geom_bar(colour="black", stat="identity") +
  guides(fill=FALSE)


