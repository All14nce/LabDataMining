# 1 - A
juice <- read.csv('Dataset/Juice.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
rating <- read.csv('Dataset/MSRating.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')

## merge tabel
juice_rate <- merge(juice, rating, by = 'JuiceID')
juice_rate <- na.omit(juice_rate)
juice_rate

vis_1 <- table(juice_rate$JuiceName)
vis_1 <- vis_1[order(vis_1, decreasing = TRUE)]
vis_1 <- head(vis_1, n = 7)
vis_1

pie(
  vis_1,
  col = rainbow(length(vis_1)),
  main = 'Seven Most Rated Juice'
)

# 2
juice <- read.csv('Dataset/Juice.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
juice <- na.omit(juice)

juice <- juice[juice$JuiceYear >= 2000 & juice$JuiceYear <= 2005, ]
vis_2 <- table(juice$JuiceYear)
vis_2

barplot(
  vis_2,
  xlab = 'Year (2000-2005)',
  ylab = 'Number of Frequency',
  ylim = c(0, 1.2*max(vis_2))
)

# 3
customer <- read.csv('Dataset/Customer.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
customer <- na.omit(customer)

customer 
vis_3 <- customer[customer$CustomerAge >= 20 & customer$CustomerAge <= 50, ]
vis_3 <- table(vis_3$CustomerAge)
vis_3

plot(
  vis_3,
  col = 'red',
  xlab = 'Age',
  ylab = 'Count'
)

# 4
juice <- read.csv('Dataset/Juice.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
juice <- na.omit(juice)

taste <- ifelse(juice$JuiceTaste == 'A', 'Best Juice', 
                ifelse(juice$JuiceTaste == 'B', 'Good Juice', 'Unknown Juice'))

taste

vis_4 <- table(taste)
vis_4

install.packages('plotrix')
library(plotrix)

pie3D(
  vis_4,
  col = c('red', 'yellow'),
  labels = names(vis_4),
  labelscex = 0.8,
  main = 'Juice Grade Chart'
)

# FREQUENT ITEMS

header <- read.csv('Dataset/Header.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
detail <- read.csv('Dataset/Detail.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')
juice <- read.csv('Dataset/Juice.csv', na.string = c('', NA), fileEncoding = 'UTF-8-BOM')

transactions <- merge(header, detail, by = 'SalesID')

# 1 
null_check <- sapply(transactions, function(x)sum(is.na(x)))
transactions <- na.omit(transactions)

# 2 - remove data yg dibawah tahun 2020
transactions <- transactions[format(as.Date(transactions$SalesDate, format = '%Y-%m-%d'), '%Y') > 2020, ]

# 3 - hapus jus yg namanya Radish
transactions <- merge(transactions, juice, by = 'JuiceID')
transactions <- transactions[transactions$JuiceName != 'Radish', ]
transactions

# 4
transactions <- transactions[, c('SalesID', 'JuiceName')]

# as.factor
transactions$SalesID <- as.factor(transactions$SalesID)
transactions$JuiceName <- as.factor(transactions$JuiceName)

# droplevels
transactions$SalesID <- droplevels(transactions$SalesID)
transactions$JuiceName <- droplevels(transactions$JuiceName)

# kelompokkan -> split
# yg kiri baka dikelompokin berdasar yg kanan
transactions <- split(transactions$JuiceName, transactions$SalesID)

# apriori
library(arules)

itemsets <- apriori(transactions,
                    parameter = list(
                      supp = 0.001,
                      target = 'frequent itemsets'
                    ))

inspect(itemsets)

# association rules
rules <- ruleInduction(itemsets, confidence = 0.015)
inspect(rules)
