a = c(1,2,3,4)
b = c(4,2,1,3)

plot(a,b, type="o", col="blue", xlab="Bawah", ylab="Samping", main="Plot Testing")

report = read.csv("Report.csv")

plot(report$Year, report$Income, type="l", col="blue", ylim=c(0,250000), xlab="Year", ylab="Cash", main="Yearly Report", cex.main=2, cex.lab=1)
lines(report$Year, report$Expense, type="l", col="red")
legend("topleft", legend=c("Income", "Expense"), fill=c("Blue", "Red"), title="Legend", cex=1)

# kalau ada i.. itu ganti fileEncoding nya
score = read.csv("Score.csv", fileEncoding="UTF-8-BOM")
# cara manual:
# score = read.csv("Score.csv")
# colnames(score) = c("Name", "Course", "Assignment", "Mid.Exam", "Final.Exam")

# remove data yang ada di project
rm(a)
rm(b)

scoreCourseA = score[score$Course=='A', ]

pie(scoreCourseA$Assignment, labels=paste(scoreCourseA$Name, scoreCourseA$Assignment), cex=1, col=rainbow(length(scoreCourseA$Assignment)), main="Assignment Score Course A", cex.main=1)

avgAsgA = mean(score[score$Course=="A", "Assignment"])
avgAsgB = mean(score[score$Course=="B", "Assignment"])
avgAsgC = mean(score[score$Course=="C", "Assignment"])

avgAsg = c(avgAsgA, avgAsgB, avgAsgC)
courseName = score[!duplicated(score$Course), "Course"]

barplot(avgAsg, names.arg = courseName, ylim=c(0,100), col=rainbow(length(avgAsg)), xlab="Course", ylab="Avg Score", main="Average Assignmetn Score")

hist(score$Assignment, xlab="Score", main="Histogram of Assignment Score", col=rainbow(4))

boxplot(score$Mid.Exam ~ score$Course, xlab="Course", ylab="Mid Exam", main="Box Plot Mid Score", col=rainbow(3))

allscore = score[,c(1:2)]
allscore$totalScore = rowMeans(score[,c(3:5)])

allscore = aggregate(allscore$totalScore, by=list(allscore$Name), FUN=mean)
colnames(allscore) = c("Name", "Final.Score")
sorted = allscore[order(allscore$Final.Score), ]

barplot(allscore$Final.Score)
barplot(sorted$Final.Score)
