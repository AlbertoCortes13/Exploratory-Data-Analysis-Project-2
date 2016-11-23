library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Filters Short.Name that have coal in them
coal <- SCC[grep("^Coal ", SCC$Short.Name, ignore.case = FALSE), "SCC"]
coalNEI <- NEI[NEI$SCC %in% coal,]
total <- aggregate(Emissions ~ year, coalNEI, sum)

png(filename = "plot4.png", width = 480, height = 480, units = 'px')
qplot(year, Emissions, data = total, geom = "line", xlab = "Year", ylab = "Emissions", main = "Coal Combustion Total Emission per Year")
dev.off()

