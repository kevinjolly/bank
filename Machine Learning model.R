
#set  random seed
set.seed(7)

#split data into training and test sets
rows <- sample(nrow(German_Credit_Card_Data))
German_Credit_Card_Data <- German_Credit_Card_Data[rows,]
split <- round(nrow(German_Credit_Card_Data) * .60)
train <- German_Credit_Card_Data[1:split,]
test <- German_Credit_Card_Data[(split + 1):nrow(German_Credit_Card_Data),]

#loading the caret package
library(caret)

#building the first model based on all the parameters
model <- train(BadLoan2 ~ ., data = train,  method = "glm",
               trControl = trainControl(method = "cv", number = 10,
                                        verboseIter=TRUE,classProbs = TRUE,
                                        summaryFunction = twoClassSummary),metric = "ROC")

            

#predicting the values 

BadloanPredict <- predict(model, test)


#combining the columns

output <- cbind(test, BadloanPredict)

#computing the model accuracy:

conf <- table(test$Badloan2, BadloanPredict)
acc <- sum(diag(conf))/sum(conf)
acc


