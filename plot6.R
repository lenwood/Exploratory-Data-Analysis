# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
# sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes
# over time in motor vehicle emissions?
library(ggplot2)
library(scales)

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

mobileVehicles <- NEI[NEI$SCC %in% SCC[grep("Mobile", SCC$EI.Sector), 1],]
BaltimoreCity <- mobileVehicles[which(mobileVehicles$fips == "24510"),]
BCEmissions <- with(BaltimoreCity, aggregate(Emissions, by=list(year), sum))
names(BCEmissions) <- c("Year", "Emissions")
BCEmissions$City <- rep("Baltimore City", nrow(BCEmissions))

LosAngeles <- mobileVehicles[which(mobileVehicles$fips == "06037"),]
LAEmissions <- with(LosAngeles, aggregate(Emissions, by=list(year), sum))
names(LAEmissions) <- c("Year", "Emissions")
LAEmissions$City <- rep("Los Angeles", nrow(LAEmissions))

comparison <- rbind(BCEmissions, LAEmissions)

g <- ggplot(comparison, aes(x=Year, y=Emissions, group=City)) + geom_line(aes(colour=City)) + geom_point(aes(colour=City))
g <- g + ggtitle("Motor Vehicle Emissions in Baltimore City & Los Angeles")
g <- g + scale_y_continuous(labels=comma)
ggsave(filename="plot6.png", plot=g, width=6, height=4.8, dpi=100)
