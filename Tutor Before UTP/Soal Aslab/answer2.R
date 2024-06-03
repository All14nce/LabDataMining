# 1
result <- read.csv('02/Result.csv', na.strings = c('', NA), fileEncoding = 'UTF-08-BOM')
result <- na.omit(result)

vis_1 <- table(result$Question.2)
vis_1

pie(
  vis_1,
  col = rainbow(length(vis_1)),
  labels = paste(vis_1/sum(vis_1)*100, 1),
  main = '...'
)

legend(
  'topright',
  legend = c('Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree'),
  cex = 0.5,
  fill = rainbow(length(vis_1))
)

# 2
participant <- read.csv('02/Participant.csv', na.strings = c('', NA), fileEncoding = 'UTF-8-BOM')
result <- read.csv('02/Result.csv', na.strings = c('', NA), fileEncoding = 'UTF-8-BOM')
par_res <- merge(participant, result, by = 'Participant.Number')

vis_2 <- par_res[par_res$Gender == 'Female', ]
vis_2 <- table(vis_2$Question.6)
vis_2

pie(
  vis_2,
  col = c('red', 'cyan'),
  labels = round(prop.table(vis_2) * 100, 1),
  main = 'Result percentage'
)

legend(
  'topright',
  legend = names(vis_2),
  fill = c('red', 'cyan')
)

# 3
participant <- read.csv('02/Participant.csv', na.strings = c('', NA), fileEncoding = 'UTF-8-BOM')
result <- read.csv('02/Result.csv', na.strings = c('', NA), fileEncoding = 'UTF-8-BOM')
par_res <- merge(participant, result, by = 'Participant.Number')

female <- par_res[par_res$Gender == 'Female', ]
vis_female <- table(female$Question.1)
vis_female

male <- par_res[par_res$Gender == 'Male', ]
vis_male <- table(male$Question.1)
vis_male

gabungan <- rbind(vis_female, vis_male)
gabungan

barplot(
  gabungan,
  col = c('red', 'orange'),
  names.arg = c('Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree'),
  main = '...'
)

legend(
  'topleft',
  legend = c('Female', 'Male'),
  fill = c('red', 'orange')
)

# 4 
boxplot(
  par_res$Question.1 ~ par_res$Gender,
  col = c('red', 'orange'),
  xlab = 'Gender',
  ylab = 'Question 1 Answer'
)

# 5
hist(
  result$Question.4,
  breaks = 4,
  col = rainbow(4),
  xlab = 'Question 4 Answers',
  ylab = 'Count'
)

# 6
q1 <- table(result$Question.1)
q2 <- table(result$Question.2)
q3 <- table(result$Question.3)
q4 <- table(result$Question.4)
q5 <- table(result$Question.5)

q <- rbind(q1, q2, q3, q4, q5)

q_prop <- prop.table(q, 1) * 100
q_prop

barplot(
  t(q_prop),
  col = rainbow(length(q_prop))
)

# 7
result <- read.csv('02/Result.csv', na.strings = c('', NA), fileEncoding = 'UTF-08-BOM')
result <- na.omit(result)

vis_7 <- table(result$Date)
vis_7

df <- data.frame(vis_7)
df

plot(
  df$Freq,
  xlab = 'Survey Date',
  ylab = 'Number of Participant',
  ylim = c(0, 27),
  main = 'Number Participant from 2018-07-14 to 2018-07-20'
)

plot(
  df$Freq,
  type = 'l',
  xlab = 'Survey Date',
  ylab = 'Number of Participant',
  ylim = c(0, 27),
  main = 'Number Participant from 2018-07-14 to 2018-07-20'
)

plot(
  df$Freq,
  type = 'ou',
  xlab = 'Survey Date',
  ylab = 'Number of Participant',
  ylim = c(0, 27),
  main = 'Number Participant from 2018-07-14 to 2018-07-20'
)


