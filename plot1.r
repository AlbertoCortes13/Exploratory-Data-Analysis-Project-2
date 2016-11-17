NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggregate(Emissions ~ year, NEI, sum)

png(filename = "plot1.png", width = 480, height = 480, units = 'px')
plot(total, xlab = "Year", ylab = "Total Emission From 1999-2008", type = "o", main = "Total Emission")
dev.off()
