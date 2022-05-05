library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)

print(dir())

#Question 4
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustandcoal <- (combustion & coal)
combCoalSCC <- SCC[combustandcoal,]$SCC
combCoalNEI <- NEI[NEI$SCC %in% combCoalSCC,]

head(combustionandcoal)
head(combCoalSCC)
head(combCoalNEI)

png("plot4.png",width=500,height=500,units="px",bg="transparent")

ggp <- ggplot(combCoalNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill="none") +
  labs(x="year", y=expression("emissions")) + 
  labs(title=expression("coal combustion emissions in us"))

print(ggp)

dev.off()
