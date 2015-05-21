
### plot6.R
# (1) Subset NEI data from Baltimore city and Los Angeles County
SCC_veh<-grepl(pattern = "vehicle", SCC$EI.Sector, ignore.case = TRUE)
SCC_veh_SCC <- SCC[SCC_veh,]$SCC
NEI_veh_SSC <- NEI[NEI$SCC %in% SCC_veh_SCC, ]
NEI_veh_Balt <- subset(NEI_veh_SSC, fips == "24510")
NEI_veh_LA<-subset(NEI_veh_SSC, fips == "06037")
NEI_veh_Balt_Tot_Em<-aggregate(Emissions~year, NEI_veh_Balt, sum)
NEI_veh_LA_Tot_Em<-aggregate(Emissions~year, NEI_veh_LA, sum)
NEI_veh_Balt_Tot_Em$Change<-c(0, diff(NEI_veh_Balt_Tot_Em$Emissions))
NEI_veh_LA_Tot_Em$Change<-c(0, diff(NEI_veh_LA_Tot_Em$Emissions))
NEI_veh_Balt_Tot_Em$City <- "Baltimore City"
NEI_veh_LA_Tot_Em$City <- "Los Angeles County"
data_com <- rbind(NEI_veh_Balt_Tot_Em,NEI_veh_LA_Tot_Em)
# (2) Plot figure
png(file = "plot6.png")
plot6 <- ggplot(data_com, aes(x=year, y=Change, group=City, color=City)) + geom_line() + 
        geom_point( size=5, shape=20, fill=c("white")) +
        xlab("Year") + ylab("Change in Emissions (Tons)") +
        ggtitle("Changes in Motor Vehicle Emissions: Baltimore vs. LA")
print(plot6)
dev.off()