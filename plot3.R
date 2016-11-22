library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Show information related with Baltimore only
baltimore <- NEI[NEI$fips == "24510",]

##sums the Emissions by type per year
totalType <- ddply(baltimore, c("year", "type"), function(x)sum(x$Emissions, na.rm = TRUE))

png(filename = "plot3.png", width = 480, height = 480, units = 'px')
qplot(year, V1, data = totalType, colour = type, geom = c("line", "point"), xlab = "Year", ylab = "Emission", main = "Total Type Emission in Baltimore per year")
dev.off()
