library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 5
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle, ]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

head(vehicle)
head(vehicleSCC)
head(vehicleNEI)

baltimoreVNEI <- vehicleNEI[vehicleNEI$fips=="24510",]

png("plot5.png",width=500,height=500,units="px",bg="transparent")

ggp <- ggplot(baltimoreVNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill="none") +
  labs(x="year", y=expression("emissions")) + 
  labs(title=expression("baltimore vehicle emissions"))

dev.off()
