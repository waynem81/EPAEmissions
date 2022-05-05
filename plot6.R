library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 6
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

vehicleBaltimoreNEI <- vehicleNEI[vehicleNEI$fips=="24510",]
vehicleBaltimoreNEI$city <- "Baltimore City"

vehicleLANEI <- vehicleNEI[vehicleNEI$fips=="06037",]
vehicleLANEI$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
bothNEI <- rbind(vehicleBaltimoreNEI, vehicleLANEI)

png("plot6.png",width=500,height=500,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill="none") + theme_bw() +
  labs(x="year", y=expression("emissions")) + 
  labs(title=expression("comparison baltimore and la emissions"))

print(ggp)

dev.off()