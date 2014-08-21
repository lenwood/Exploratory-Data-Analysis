# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)
library(scales)
coal <- NEI[NEI$SCC %in% SCC[grep("Coal", SCC$SCC.Level.Three), 1],]
coalEmissions <- with(coal, aggregate(Emissions, by=list(year), sum))
names(coalEmissions) <- c("Year", "Emissions")

g <- ggplot(coalEmissions, aes(x=Year, y=Emissions)) + geom_line(colour="darkgreen") + geom_point(colour="darkgreen")
g <- g + ggtitle("Emissions from Coal Combustion in the United States")
g <- g + scale_y_continuous(labels=comma)
ggsave(filename="plot4.png", plot=g, width=6, height=4.8, dpi=100)
