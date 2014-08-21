# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a
# plot to answer this question.

library(plyr)
library(ggplot2)

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BaltimoreCity <- NEI[which(NEI$fips == "24510"),]
emissions <- ddply(BaltimoreCity, .(type, year), summarize, emissions=sum(Emissions))

g <- ggplot(emissions, aes(x=year, y=emissions, group=type))
g <- g + geom_line(aes(colour=type)) + geom_point(aes(colour=type))
g <- g + labs(
              list(x="Year", y=expression(PM[2.5]*" Emissions"),
              title=expression(PM[2.5]*" Emissions by Type in Baltimore City, Maryland"))
              )
ggsave(filename="plot3.png", plot=g, width=6, height=4.8, dpi=100)
