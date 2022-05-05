library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 3
Baltimore <- NEI[NEI$fips=="24510",]
tot <- aggregate(Emissions ~ year, Baltimore, sum)

png("plot3.png",width=500,height=500,units="px",bg="transparent")


ggp <- ggplot(Baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" emissions")) + 
  labs(title=expression("PM"[2.5]*" baltimore emissions by type"))

print(ggp)

dev.off()
