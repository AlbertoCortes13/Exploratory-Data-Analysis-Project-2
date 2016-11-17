NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI[NEI$fips == "24510",]
totalBalt <- aggregate(Emissions ~ year, Baltimore, sum)

png(filename = "plot2.png", width = 480, height = 480, units = 'px')
plot(totalBalt, xlab = "Year", ylab = "Total PM 2.5 Emission", type = "l", main = "Total PM2.5 Emission from 1999-2008 from ")
dev.off()