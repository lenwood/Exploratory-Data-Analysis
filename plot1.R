# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

# aggregate by year
emissions <- with(NEI, aggregate(Emissions, by=list(year), sum))

# create the plot & save the file
png(filename="plot1.png", width=480, height=480)
plot(emissions, type="b", pch=19, col="blue", ylab=expression("PM"[2.5]*" Emissions"), xlab="Year", main=expression("Annual PM"[2.5]*" Emissions"))
dev.off()
