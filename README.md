# bank
Predicting the drivers for bad loans for a leading German Bank 

Objective: One of the leading banks in Germany would like to solve the following business problem: 
1.	The drivers for the bad loans and predict the bad loans given the drivers. 

Data Dictionary: 
Number of variables in the dataset: 21

1.	 Badloan: 
     0: Good Loan
     1: Bad Loan
2.	Account Balance: Status of existing checking account
     1: Less than 0 USD
     2: Between 0 and 200 USD
     3: Greater than 200 USD
     4: No checking account
3.	Duration of credit (months)
4.	Payment status of previous credit: Credit History
    0: No credits taken/All credits paid back fully
    1:All credits at bank paid back duly
    2: existing credits paid back duly till now
    3:delay in paying off in the past
    4: critical account/ other credits existing(not at this bank)
5.	Purpose
    0: Car (new)
    1: Car (used)
    2: furniture/equipment
    3: radio/television
    4: domestic appliances
    5: repairs
    6: education
    7: vacation
    8: retraining
    9: business
    10: others
6.	Credit Amount: Loan Amount
7.	Value Savings/Stocks
    1: Less than 100 DM
    2: Between 100 and 500 DM
    3: Between 500 and 1000 DM
    4: Greater than or equal to 1000 DM
8.	Length of current employment
    1: Unemployed
    2: Less than one year
    3: Between 1 and 4 years
    4: Between 4 and 7 years
    5: Greater than or equal to 7 years
9.	Instalment per cent
10.	Sex & Marital status
    1: Male: Divorced/Separated
    2: Female: Divorced/Separated/Married
    3: Male: Single
    4: Male: Married/widowed 
    5: female: single 
11.	Guarantors
    1: None
    2: Co-applicant
    3: guarantor
12.	Duration of current address
13.	Most valuable available asset
    1: Real estate
    2: if not 1: building society savings account/life insurance
    3: if not1 or 2: Car or other
    4: unknown/no property
14.	Age(years)
15.	Concurrent credits
    1: bank
    2: stores
    3: none
16.	Type of apartment
    1: rent
    2: own
    3: for free
17.	No. of credits at this bank
18.	Occupation
    1: unemployed/unskilled – non-resident
    2: unskilled – resident
    3: skilled employee / official
    4: management/ self – employed / highly qualified employee / officer
19.	Number of dependents 
20.	Telephone
   1: none
   2: yes
21.	Foreign Worker 
   1: yes
   2: no


Methodology:

1.	 Data cleaning and visualization 
2.	Machine learning model building
3.	Feature Selection
4.	Machine learning model building with transformations
5.	Model validation and comparison 
6.	Results and conclusion

Essential Packages: 
1.   caret
2.   ggplot2
3.   caretEnsemble
4.   readr
