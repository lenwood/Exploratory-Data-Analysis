# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BaltimoreCity <- NEI[which(NEI$fips == "24510"),]
emissions <- with(BaltimoreCity, aggregate(Emissions, by=list(year), sum))
names(emissions) <- c("year", "Emissions")

png(filename="plot2.png", width=480, height=480)
plot(emissions$year, emissions$Emissions, type="b", pch=19, col="blue", ylab=expression("PM"[2.5]*" Emissions"), xlab="Year", main=expression("PM"[2.5]*" Emissions in Baltimore City, Maryland"))
dev.off()
