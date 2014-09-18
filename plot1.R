## Make a plot to see if total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot showing the total
## PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset required data
reqdata <- aggregate(Emissions ~ year, data = NEI, FUN = sum)

## Tidy emissions for easier plot readability
reqdata$EmissionsDivided <- reqdata$Emissions / 1000

## Create plot
plot(reqdata$EmissionsDivided, type = "b", 
     xaxt = "n", xlab = "Year",
     ylab = expression('PM'[2.5]*' emission from all sources (in 1000 tons)'), 
     main = "Tons of PM2.5 Generated Per Year")
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))   
## Create png file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off() 