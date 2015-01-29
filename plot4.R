setwd("~/Documents/Coursera/Exploratory Data Analysis/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

#Find SCC codes whose Short.name includes coal, create subset of corresponding NEI
coal<- SCC[grep(" coal", SCC$Short.Name, ignore.case=TRUE), c(1,3)]
z<-subset(NEI, NEI$SCC %in% coal$SCC)

#aggregate by year and plot
Z<- aggregate(z$Emissions, by=list(z$year), FUN=sum)
names(Z)<- c("Year", "Emissions")
png("plot4.png")
plot(Z$Year, Z$Emissions/100000, type="l", xlab="Year", ylim=c(0,7), 
      ylab="PM2.5 in hundred-thousands of tons", main="Total Emissions from Coal Combustion-Related Sources")
dev.off()