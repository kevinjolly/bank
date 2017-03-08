# ensure the results are repeatable
set.seed(7)
# load the library

library(caret)

#Model after transforms
modeltrans <- train(BadLoan2 ~ Account_Balance + Duration_of_credit_months + Credit_Amount + Payment_status +  
                   Guarantors + Credit_Amount + Value_savingsStocks + Most_valuable_available_asset + Age_years + 
                    Length_of_current_employment + Purpose + Instalment_per_cent,  data = train, method = "glm", 
                   trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE, classProbs = TRUE, 
                    summaryFunction = twoClassSummary) ,metric = "ROC", 
                   preProcess = c("center", "scale", "pca", "spatialSign"))


#Preditions
Badloanpredit <- predict(modeltrans, test)

#Computing for accuracy:
conf <- table(test$BadLoan3, Badloanpredit)
acc <- sum(diag(conf))/sum(conf)
acc

