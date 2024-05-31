# read csv data
general_data <- read.csv('general_data.csv', fileEncoding = 'UTF-8-BOM')

na.omit(general_data)

# 1
# data preprocessing 1
get_manager_data <- general_data[general_data$JobRole == 'Manager',]

# ordering data -> data preprocessing 2
order_manager_data <- get_manager_data[order(get_manager_data$MonthlyIncome, decreasing = TRUE), c("JobRole", "MonthlyIncome")]

duplicated(order_manager_data$MonthlyIncome)

# remove duplicated
remove_dup_manager <- order_manager_data[!duplicated(order_manager_data$MonthlyIncome), ]

# top 3 data manager
top_income_manager <- remove_dup_manager[1:3, c('MonthlyIncome')]

# pie char
pie(top_income_manager, labels = top_income_manager)

# 4
newbie_data <- general_data[(general_data$YearsAtCompany >= 1 & general_data$YearsAtCompany <= 3), ]

senior_data <- general_data[(general_data$YearsAtCompany >= 4 & general_data$YearsAtCompany <= 6), ]

veteran_data <- general_data[(general_data$YearsAtCompany >= 7 & general_data$YearsAtCompany <= 20), ]

# get total data newbie, total senior, total veteran
total_newbie_data <- nrow(newbie_data)
total_senior_data <- nrow(senior_data)
total_veteran_data <- nrow(veteran_data)

barplot(c(total_newbie_data, total_senior_data, total_veteran_data), names.arg = c('Newbie', 'Senior', 'Veteran'))

