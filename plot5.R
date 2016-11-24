library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510",]
motor <- SCC[grep("motor", SCC$Short.Name, ignore.case = TRUE), ]$SCC
motorBaltimore <- baltimore[baltimore$SCC %in% motor, ]
total <- aggregate(Emissions ~ year, motorNEI, sum)

png(filename = "plot5.png", width = 480, height = 480, units = 'px')
qplot(year, Emissions, data = total, geom = c("line", "point"), xlab = "Year", ylab = "Emissions", main = "Emission from Motor Vehicles in Baltimore from 1999-2008")
dev.off()
