## Make a plot to see if total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot
##  answering this question.

## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Baltimore City emissions
baltEm = subset(NEI, fips == 24510)

## Get required data for Baltimore
totalBaltEmi = aggregate(Emissions ~ year, data = baltEm, sum)

## Create plot
plot(totalBaltEmi$Emissions, type = "b",
     xaxt = "n", xlab = "Year",
     ylab = expression('PM'[2.5]*' emission from all sources (in tons)'),
     main = "Emissions in Baltimore City")
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))

## Create png file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off() 
