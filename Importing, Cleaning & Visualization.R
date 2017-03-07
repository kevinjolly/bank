#Importing the Dataset into RStudio
library(readr)
German_Credit_Card_Data <- read_csv("C:/Users/Admin/Downloads/German+Credit+Card+Data.csv")
View(German_Credit_Card_Data)

#Creating valid variable names for the dataset
colnames(German_Credit_Card_Data) <- c("Badloan", "Account_Balance","Duration_of_credit_months", "Payment_status", "Purpose", 
                                       "Credit_Amount", "Value_savingsStocks", "Length_of_current_employment", 
                                       "Instalment_per_cent", "Sex_and_marital_status", "Guarantors", 
                                       "Duration_in_current_address", "Most_valuable_available_asset","Age_years", 
                                       "Concurrent_credits", "Type_of_apartment", "No_of_credits_at_this_bank", 
                                       "Occupation", "No_of_dependents", "Telephone", "Foreign_worker")

#Factoring the columns having categorical variables: 
factor(German_Credit_Card_Data$Badloan)
factor(German_Credit_Card_Data$Account_Balance)
factor(German_Credit_Card_Data$Payment_status)
factor(German_Credit_Card_Data$Purpose)
factor(German_Credit_Card_Data$Value_savingsStocks)
factor(German_Credit_Card_Data$Length_of_current_employment)
factor(German_Credit_Card_Data$Instalment_per_cent)
factor(German_Credit_Card_Data$Sex_and_marital_status)
factor(German_Credit_Card_Data$Guarantors)
factor(German_Credit_Card_Data$Duration_in_current_address)
factor(German_Credit_Card_Data$Most_valuable_available_asset)
factor(German_Credit_Card_Data$Concurrent_credits)
factor(German_Credit_Card_Data$Type_of_apartment)
factor(German_Credit_Card_Data$No_of_credits_at_this_bank)
factor(German_Credit_Card_Data$Occupation)
factor(German_Credit_Card_Data$No_of_dependents)
factor(German_Credit_Card_Data$Telephone)
factor(German_Credit_Card_Data$Foreign_worker)

#Creating a new Bad_loan column with Yes/No
BadLoan2 <- factor(German_Credit_Card_Data$Badloan, levels = c(0,1), labels = c("No", "Yes"))
German_Credit_Card_Data <- cbind(German_Credit_Card_Data, BadLoan2)

#Data Visualization: 
library(ggplot2)
#Account Balance faceted by Bad loans
ggplot(German_Credit_Card_Data, aes(x= `Account Balance`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Payment status of previous credit faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x = `Payment Status of Previous Credit`)) + geom_bar(position = "dodge") 
       + facet_wrap(~Badloan)
#Purpose faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Purpose`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan) 
       + scale_x_continuous("Purpose", limits = c(0,11), breaks = seq(0,11, 1))
#Value Savings/Stocks faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Value Savings/Stocks`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Length of current employment faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Length of current employment`)) + geom_bar(position = "dodge") 
      + facet_wrap(~Badloan)
#Instalment per cent faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Instalment per cent`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Sex and marital status faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Sex & Marital Status`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Guarantors faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Guarantors`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Duration in current address faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Duration in Current address`)) + geom_bar(position = "dodge") 
       + facet_wrap(~Badloan)
#Most valuable availiable asset faceted by Bad loan
ggplot(German_Credit_Card_Data, aes(x= `Most valuable available asset`)) + geom_bar(position = "dodge") 
      + facet_wrap(~Badloan)
#Concurrent Credits faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Concurrent Credits`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#Type of apartment faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Type of apartment`)) + geom_bar(position = "dodge") + facet_wrap(~Badloan)
#No of credits at this bank faceted by Bad LOan
ggplot(German_Credit_Card_Data, aes(x= `No of Credits at this Bank`)) + geom_bar(position = "dodge") 
       + facet_wrap(~Badloan)
#Occupation faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Occupation`)) + geom_bar(position = "t_wrap(~Badloan)dodge") 
       + facet_wrap(~Badloan)
#No of dependents faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `No of dependents`)) + geom_bar(position = "dodge") 
      + facet_wrap(~Badloan) + scale_x_continuous("No of dependents", limits = c(0,3), breaks = seq(0,3,1))
#Telephone Faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Telephone`)) + geom_bar(position = "dodge") 
      + facet_wrap(~Badloan)+ scale_x_continuous("Telephone", limits = c(0,3), breaks = seq(0,3,1))
#Foreign worker faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Foreign Worker`)) + geom_bar(position = "dodge") 
      + facet_wrap(~Badloan) + scale_x_continuous("Foreign Worker", limits = c(0,3), breaks = seq(0,3,1))
#Duration of credit(month) faceted by Bad LOan
ggplot(German_Credit_Card_Data, aes(x = `Duration of Credit (month)`)) + geom_histogram() + facet_wrap(~Badloan)
#Credit Amount Faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x = `Credit Amount`)) + geom_histogram() + facet_wrap(~Badloan)
#Age (years) faceted by Bad Loan
ggplot(German_Credit_Card_Data, aes(x= `Age (years)`)) + geom_histogram() + facet_wrap(~Badloan)
#Credit amount Vs. Duration of credit(month) coloured by Bad Loan
ggplot(German_Credit_Card_Data, aes(x = `Duration of Credit (month)`, y= `Credit Amount`, colour = Badloan)) 
       + geom_point()
#Credit Amount Vs. Age (years) coloured by Bad Loan
ggplot(German_Credit_Card_Data, aes(x = `Age (years)`, y = `Credit Amount`, colour = Badloan)) + geom_point()
