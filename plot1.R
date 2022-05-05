## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 1
tot <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=500,height=500,units="px",bg="transparent")

barplot(
  (tot$Emissions)/10^6,
  names.arg=tot$year,
  xlab="Year",
  ylab="PM2.5 emissions",
  main="total PM2.5 emissions"
)

dev.off()