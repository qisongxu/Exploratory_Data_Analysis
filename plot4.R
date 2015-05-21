
### plot4.R
# (1) Subset coal combustion related NEI data
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (coal & comb)
comb_SCC <- SCC[coalComb,]$SCC
comb_NEI <- NEI[NEI$SCC %in% combustionSCC,]
# (2) Plot figure
png(file = "plot4.png")
plot4 <- ggplot(comb_NEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity") + 
        xlab("Year") + ylab("PM2.5 Emissions (10^5 Tons)") + ggtitle("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")
print(plot4)
dev.off()