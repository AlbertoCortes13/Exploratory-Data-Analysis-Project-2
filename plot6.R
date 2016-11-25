library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Baltimore Information
baltimore <- NEI[NEI$fips == "24510",]
motor <- SCC[grep("motor", SCC$Short.Name, ignore.case = TRUE), ]$SCC
motorBaltimore <- baltimore[baltimore$SCC %in% motor, ]
total <- aggregate(Emissions ~ year, motorBaltimore, sum)

##Los Angeles County Information
LA <- NEI[NEI$fips == "06037",]
motorLA <- LA[LA$SCC %in% motor,]
totalLA <- aggregate(Emissions ~ year, motorLA, sum)

##Assign a name of the city
total$city <- "Baltimore City"
totalLA$city <- "Los Angeles County"

##Join both cities
citiesTotal <- rbind(total, totalLA)

png(filename = "plot6.png", width = 480, height = 480, units = 'px')
qplot(year, Emissions, data = citiesTotal, color = city, geom = c("line", "point"), xlab = "Year", ylab = "Emission", main = "Emission From Baltimore City & Los Angeles County from 1999-2008")
devo.off()