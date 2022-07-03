library(ggplot2)
library(reshape2)
library(readxl)

titanic = read.csv('Titanic.csv', stringsAsFactors = FALSE)

titanic$Pclass = factor(titanic$Pclass)
titanic$Survived = factor(titanic$Survived)

summary(titanic)
str(titanic)

#colored bar chart with pclass
ggplot(titanic, aes(x=Pclass,color=Sex, fill=Sex))+geom_bar(position="dodge")+theme_bw()+theme(legend.position="top")

#boxplot
ggplot(titanic, aes(Sex, Age)) + geom_boxplot()

#colored boxplot with Age vs PClass
ggplot(titanic, aes(x=Pclass, y=Age, fill=Sex)) + geom_boxplot(outlier.color = "dark orange", outlier.shape = 4, notch=TRUE) + coord_flip() + theme_bw()+ggtitle("Boxplot to Plot Age vs Passenger Class")

#histogram
ggplot(titanic, aes(x=Age))+geom_histogram(binwidth=10)

mydata <- mtcars[, c(1,3,4,5,6,7)]
head(mydata)

cormat <- round(cor(mydata), 2)
head(cormat)

melted_cormat <- melt(cormat)
head(melted_cormat)


#Dominos

Dominos <- read_excel("Dominos.xlsx")
View(Dominos)
mean(Dominos$Time)

#H0: The new drive-thru process has no significant impact on reduction of Drive-Thru time
#H1: The new drive-thru process has a significant impact on reduction of Drive-Thru time
#One tailed t-test
t.test(Dominos$Time, alternative = "less", mu=173.62)

#Two tailed t-test
t.test(Dominos$Time, alternative = "two.sided", mu=173.62)
