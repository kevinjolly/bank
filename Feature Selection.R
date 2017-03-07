# ensure the results are repeatable
set.seed(7)
# load the library

library(caret)

# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)
# run the RFE algorithm
results <- rfe(German_Credit_Card_Data[,2:21], German_Credit_Card_Data$Badloan,  sizes=c(2:21), rfeControl=control)
# summarize the results
print(results)
# list the chosen features
predictors(results)
# plot the results
plot(results, type=c("g", "o"))

#Model after feature selection
model2 <- train(BadLoan2 ~ Account_Balance + Duration_of_credit_months + Credit_Amount + Payment_status +  
                  Guarantors + Credit_Amount + Value_savingsStocks + Most_valuable_available_asset + Age_years 
                + Length_of_current_employment + Purpose + Instalment_per_cent,  data = train, 
                 method = "glm", trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE, 
                 classProbs = TRUE, summaryFunction = twoClassSummary) ,metric = "ROC")

#Preditions
Badloanpredit <- predict(model2, test)

#Computing for accuracy:
conf <- table(test$BadLoan3, Badloanpredit)
acc <- sum(diag(conf))/sum(conf)
acc

