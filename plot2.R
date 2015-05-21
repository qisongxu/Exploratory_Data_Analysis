
### plot2.R
# (1) Baltimore City - Annual sum of Total Emissions
bal_city <- NEI[NEI$fips == "24510",]
bal_city_emi <- aggregate(Emissions ~ year,bal_city, sum)
# (2) Baltimore City - Plot of Total Emissions against year
png(file = "plot2.png")
barplot(bal_city_emi$Emissions,
        names.arg=bal_city_emi$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Baltimore City - Total PM2.5 Emissions from 1999 to 2008")
dev.off()