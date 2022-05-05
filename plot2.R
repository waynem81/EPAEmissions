## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 2
Baltimore <- NEI[NEI$fips=="24510",]
tot <- aggregate(Emissions ~ year, Baltimore, sum)

png("plot2.png",width=500,height=500,units="px",bg="transparent")

barplot(
  (tot$Emissions)/10^6,
  names.arg=tot$year,
  xlab="Year",
  ylab="PM2.5 emissions",
  main="Baltimore PM2.5 emissions"
)

dev.off()
