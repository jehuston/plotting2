setwd("~/Documents/Coursera/Exploratory Data Analysis/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#subset to Baltimore City
b<- NEI[NEI$fips == '24510', ]

mv<- SCC[grep("veh", SCC$Short.Name, ignore.case=TRUE), c(1,3)]
bc_mv<-subset(b, b$SCC %in% mv$SCC)

BC<-aggregate(bc_mv$Emissions, by=list(bc_mv$year), FUN=sum)
names(BC)<- c("Year", "emissions")
png("plot5.png")
plot(BC$Year, BC$emissions, type="l", ylim=c(0, 400), xlab="Year", ylab="PM2.5 in tons",
     main="Emissions from motor vehicle sources in Baltimore, MD")
dev.off()