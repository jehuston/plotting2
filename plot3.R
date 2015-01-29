setwd("~/Documents/Coursera/Exploratory Data Analysis/Project 2")
NEI <- readRDS("summarySCC_PM25.rds")

# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four 
# sources have seen decreases in emissions from 1999–2008 for 
# Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
b<- NEI[NEI$fips == '24510', ]
C<- aggregate(b$Emissions, by=list(b$type, b$year), FUN=sum)
names(C)<- c("type", "year", "emissions")

png("plot3.png")
ggplot(C, aes(x=year, y=emissions, color=type))+
  geom_line()+
  ggtitle("Types of Emissions in Baltimore, MD")+
  ylab("PM2.5 in tons")
dev.off()
