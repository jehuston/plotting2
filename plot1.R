setwd("~/Documents/Coursera/Exploratory Data Analysis/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

x<- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(x)<- c("year", "emissions")
png("plot1.png")
plot(x$year, x$emissions/1000000, type="l", ylim=c(0,9), xlab="Year", ylab="PM2.5 in millions of tons", 
     main="Total Emissions, United States")
dev.off()
