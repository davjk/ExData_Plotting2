## Use the ggplot2 plotting system to indicate which of the 4 sources(point, 
## nonpoint, onroad, nonroad) have seen increase. decrease in emissions


## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset required data
data <-aggregate(Emissions ~ year + fips + type, data = NEI, sum)
baltData <- data[data$fips == "24510",]

## Create plot
library(ggplot2)
print(qplot(year,Emissions, data = baltData, geom = "line", color = type, 
            ylab = "Emissions (in tons) in Baltimore City", main = "Total Emissions in Baltimore"))

## Create png file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off() 