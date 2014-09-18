## Plot how emissions from coal combustion related sources have changed in the 
## USA fr0m 1999 - 2008


## Get data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset required data
coalCombust = which(grepl("coal", SCC$SCC.Level.Three, ignore.case = TRUE)| 
                    grepl("lignite", SCC$SCC.Level.Three, ignore.case=TRUE))
coalSCC = SCC[coalCombust, 1]
coalNEI = subset(NEI, SCC %in% coalSCC)
coalData = aggregate(Emissions ~ year, data=coalNEI, sum)

## Tidy emissions for neater plot
coalData$EmissionsDivided <- coalData$Emissions / 1000

## Create plot
plot(coalData$EmissionsDivided, type = "b",
     xaxt = "n", xlab = "Year",
     ylab = expression('PM'[2.5]*' emission from coal combustion sources (in 1000 tons)'),
     main = "Coal Emissions Across USA")
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))

## Create png file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off() 