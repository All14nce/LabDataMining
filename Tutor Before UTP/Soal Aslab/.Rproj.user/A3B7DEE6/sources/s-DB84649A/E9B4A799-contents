# 1
data <- read.csv('03/Exchange Rate.csv', na.strings = c('', NA), fileEncoding = 'UTF-8-BOM')
data <- na.omit(data)

divide <- split(data, data$Cryptocurrency)
divide

# 2
data <- data[order(data$Date, data$Time), ]
data

# 3
typeof(data$Date)
data <- data[(data$Date == '16-Aug-18' & data$Cryptocurrency == 'ETH'), ]
data

data <- data[order(data$Time), ]
data

open <- head(data$Price, 1)
open
print(paste('Ethereum 16 August Open Price : Rp. ', open))

close <- tail(data$Price, 1)
close
print(paste('Ethereum 16 August Close Price : Rp. ', close))

# 4
data2 <- data[(data$Date == '15-Aug-18' & data$Cryptocurrency == 'BTC'), ]
data2

high <- max(data2$Price)
high
print(paste('Bitcoin 15 August High Price : Rp. ', high))

low <- min(data2$Price)
low
print(paste('Bitcoin 15 August Low Price : Rp. ', low))

# 5
data3 <- data[(data$Date == "18-Aug-18" & data$Cryptocurrency == 'XRP'), ]
data3
summary(data3)

typeof(data3$Price)
data3$Price <- as.numeric(data3$Price)

mean(data3$Price)
median(data3$Price)
sd(data3$Price)*1000
