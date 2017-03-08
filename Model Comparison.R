#set random seed
set.seed(7)

#load packages
library(caret)

#Original Model without feature selection
model1 <- train(BadLoan2 ~ ., data = train,  method = "glm", 
                trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE,classProbs = TRUE, 
                summaryFunction = twoClassSummary),metric = "ROC")

#Model with feature selection
model2 <- train(BadLoan2 ~ Account_Balance + Duration_of_credit_months + Credit_Amount + Payment_status +  
                Guarantors + Credit_Amount + Value_savingsStocks + Most_valuable_available_asset + Age_years +
                Length_of_current_employment + Purpose + Instalment_per_cent,  data = train, method = "glm", 
                trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE, classProbs = TRUE, 
                summaryFunction = twoClassSummary) ,metric = "ROC")

#comparing models: 
install.packages("caretEnsemble")
library(caretEnsemble)
model_list <- list(mod1 = model1, mod2 = model2)
resamps <- resamples(model_list)
bwplot(resamps, metric = "ROC")

#Model with feature selection
model2 <- train(BadLoan2 ~ Account_Balance + Duration_of_credit_months + Credit_Amount + Payment_status + 
               Guarantors + Credit_Amount + Value_savingsStocks + Most_valuable_available_asset + Age_years + 
               Length_of_current_employment + Purpose + Instalment_per_cent,  data = train, method = "glm",
               trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE, classProbs = TRUE, 
               summaryFunction = twoClassSummary) ,metric = "ROC")

#Model with transforms
modeltrans <- train(BadLoan2 ~ Account_Balance + Duration_of_credit_months + Credit_Amount + Payment_status + 
                    Guarantors + Credit_Amount + Value_savingsStocks + Most_valuable_available_asset + Age_years +
                    Length_of_current_employment + Purpose + Instalment_per_cent,  data = train, method = "glm", 
                    trControl = trainControl(method = "cv", number = 10, verboseIter=TRUE, classProbs = TRUE, 
                    summaryFunction = twoClassSummary) ,metric = "ROC", 
                    preProcess = c("center", "scale", "pca", "spatialSign"))

#comparing models: 
install.packages("caretEnsemble")
library(caretEnsemble)
model_list <- list(mod1 = model2, mod2 = modeltrans)
resamps <- resamples(model_list)
bwplot(resamps, metric = "ROC")