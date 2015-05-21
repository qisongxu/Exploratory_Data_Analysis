
### plot5.R
# (1) Subset Motor Vehicle Source Emissions related NEI data
SCC_veh<-grepl(pattern = "vehicle", SCC$EI.Sector, ignore.case = TRUE)
SCC_veh_SCC <- SCC[SCC_veh,]$SCC
NEI_veh_SSC <- NEI[NEI$SCC %in% SCC_veh_SCC, ]
NEI_veh_Balt <- subset(NEI_veh_SSC, fips == "24510")
NEI_veh_Balt_Tot_Em<-aggregate(Emissions~year, NEI_veh_Balt, sum)
# (2) Plot figure
png(file = "plot5.png")
plot5 <- ggplot(NEI_veh_Balt_Tot_Em,aes(factor(year),Emissions)) + geom_bar(stat="identity") + 
        xlab("Year") + ylab("PM2.5 Emissions (Tons)") + ggtitle("PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")
print(plot5)
dev.off()