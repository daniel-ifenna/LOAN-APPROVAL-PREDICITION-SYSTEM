#1. Import Data 
L.predict <- read.csv("data/Loan prediction/loan_data.csv")
summary(L.predict)
sum(is.na(L.predict))
sum(duplicated(L.predict))
str(L.predict)
L.predict$Employment_Status<- factor(L.predict$Employment_Status, levels = c("employed", "unemployed"), 
                                                                    labels = c(1, 0))
L.predict$Approval<- factor(L.predict$Approval, levels = c("Approved", "Rejected"),
                                                labels= c(1,0))
table(L.predict$Employment_Status)
table(L.predict$Approval)

#2. Plotting to see if data is balanced
library(ggplot2)
library(tidyverse)
L.predict %>% 
  ggplot(aes(x = Approval, fill = Approval))+
  geom_bar()+
  labs(title = "Approval Distribution", x = "1 = Approved, 0= Rejected", y="count")+
  theme_gray()

L.predict %>% 
  ggplot(aes(x = Employment_Status, fill = Employment_Status))+
  geom_bar()+
  labs(title = "Employment Distribution", x = "1 = employed, 0= unemployed", y="count")+
  theme_gray()

round(prop.table(table(L.predict$Employment_Status))*100, digits = 1)
round(prop.table(table(L.predict$Approval))*100, digits = 1)
## Employment status is perfectly balanced. However Approval is high imbalanced

# Balancing Data and scaling 
library(ROSE)
Balanced_data<- ROSE(Approval~., data = L.predict[-1], seed=123)$data
round(prop.table(table(Balanced_data$Approval))*100, digits = 1)

Balanced_data %>% 
  ggplot(aes(x = Approval, fill = Approval))+
  geom_bar()+
  labs(title = "Approval Distribution", x = "1 = Approved, 0= Rejected", y="count")+
  theme_gray()

Balanced_data[-c(5,6)]<- scale(Balanced_data[-c(5,6)])

#Training and Testing
set.seed(1234)
library(rsample)
split<- initial_split(Balanced_data, .80, strata = "Approval")
Train_data<- training(split)
Test_data<- testing(split)


library(randomForest)
forest<- randomForest(Approval~., data = Train_data,ntree= 100, importance= TRUE)
print(forest)
Test_data$predicted<- predict(forest, Test_data)

P<- table(Test_data$Approval, Test_data$predicted)
CF<- sum(diag(P))/sum(P)
Accuracy<- round(CF*100, digits = 1)
print(Accuracy)

library(caret)
M<- confusionMatrix(factor(Test_data$predicted), Test_data$Approval)

