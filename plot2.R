setwd("~/Documents/Coursera/Exploratory Data Analysis/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

b<- NEI[NEI$fips == '24510', ]
B<- aggregate(b$Emissions, by=list(b$year), FUN=sum)
names(B)<- c("year", "emissions")
png("plot2.png")
plot(B$year, B$emissions, type="l", ylim=c(0, 4000), xlab="Year", ylab="PM2.5 in tons", 
     main= "Total Emissions in Baltimore, MD")
dev.off()