# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

mobileVehicles <- NEI[NEI$SCC %in% SCC[grep("Mobile", SCC$EI.Sector), 1],]
BaltimoreCity <- mobileVehicles[which(mobileVehicles$fips == "24510"),]
mvEmissions <- with(BaltimoreCity, aggregate(Emissions, by=list(year), sum))
names(mvEmissions) <- c("Year", "Emissions")

g <- ggplot(mvEmissions, aes(x=Year, y=Emissions)) + geom_line(colour="blue") + geom_point(colour="blue")
g <- g + ggtitle("Motor Vehicle Emissions in Baltimore City, Maryland")
ggsave(filename="plot5.png", plot=g, width=6, height=4.8, dpi=100)
