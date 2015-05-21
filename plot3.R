
### plot3.R
# (1) Baltimore City - Annual sum of Total Emissions
library(ggplot2)
bal_city <- NEI[NEI$fips == "24510",]
bal_city_agg <- aggregate(Emissions ~ year + type, bal_city, sum)
# (2) Baltimore City - Plots of Emissions by Type and Year
png(file = "plot3.png")
plot3 <- ggplot(bal_city_agg,aes(factor(year),Emissions)) + geom_bar(stat="identity") + 
        facet_grid(~ type)+theme(axis.text.x = element_text(size = 9))+
        xlab("Year") + ylab("PM2.5 Emissions (Tons)") + ggtitle("Baltimore PM2.5 Emissions by Type and Year")
print(plot3)
dev.off()