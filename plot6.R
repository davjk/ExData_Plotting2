## Compare motor emissions from LA County with motor emissions from Baltimore

## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset required data
motor = subset(NEI, (type == "ON-ROAD" & (fips == "24510" | fips == "06037")))
motorData = aggregate(Emissions ~ year + fips, data = motor, sum)

## Rename fips codes
motorData$fips <- factor(motorData$fips, levels = c("24510", "06037"), 
                        labels = c("Baltimore City", "Los Angeles"))


## Create plot
library(ggplot2)
print(qplot(year, Emissions, data = motorData, geom = "line", color = fips, 
            ylab = "Emissions (in tons)", main = "Motor vehicle emissions in Baltimore City Vs LA County"))

## Create png file
dev.copy(png, file = "plot6.png", width=480, height=480)
dev.off() 
