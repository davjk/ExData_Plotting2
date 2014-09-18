## Plot how motor vehicle emissions have changed in Baltimore City from 1999 -2008

## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset required data
motor = subset(NEI, fips==24510 & type =="ON-ROAD")
motorData = aggregate(Emissions ~ year, data = motor, sum)

## Create plot
plot(motorData$Emissions, type = "b",
     xaxt = "n", xlab = "Year",
     ylab = expression('PM'[2.5]*' emission from motor vehicle sources (in tons)'),
     main = "Emissions from motor vehicles in Baltimore City")
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))

## Create png file
dev.copy(png, file = "plot5.png", width=480, height=480)
dev.off() 