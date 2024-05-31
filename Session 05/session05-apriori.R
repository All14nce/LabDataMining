install.packages("arules")
install.packages("arules")
install.packages("tm")
install.packages("Rtools")
install.packages("Matrix", type = "binary")

# read data csv
general_data <- read.csv('general_data.csv', fileEncoding = 'UTF-8-BOM')
employee_survey_data <- read.csv('employee_survey_data.csv', fileEncoding = 'UTF-8-BOM')

# merge 2 csv
mergedata <- merge(general_data, employee_survey_data, by = 'EmployeeID')

mergedata <- na.omit(mergedata)

# select column EmployeeID, JobRole, WorkLifeBalance
mergedata <- mergedata[,c('EmployeeID', 'JobRole', 'WorkLifeBalance')]

# setiap kolom merge parse as.factor
mergedata$EmployeeID <- as.factor(mergedata$EmployeeID)
mergedata$JobRole <- as.factor(mergedata$JobRole)
mergedata$WorkLifeBalance <- as.factor(mergedata$WorkLifeBalance)

# lakuin droplevels
mergedata$EmployeeID <- droplevels(mergedata$EmployeeID)
mergedata$JobRole <- droplevels(mergedata$JobRole)
mergedata$WorkLifeBalance <- droplevels(mergedata$WorkLifeBalance)

library(arules)

# split untuk jobrole dengan worklife balance
worklifebalancedata <- split(mergedata$JobRole, mergedata$WorkLifeBalance)

rules <- apriori(worklifebalancedata, parameter = list(support = 0.05, maxlen = 10, target = 'frequent itemset'))

inspect(rules)

inspect(rulesInduction(rules, confidence = 0.15))

