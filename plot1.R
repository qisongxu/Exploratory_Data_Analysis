
### plot1.R
# (1) Sum of Total Emissions
total_emi <- aggregate(Emissions ~ year,NEI, sum)
# (2) Plot of Total Emissions against year
png(file = "plot1.png")
barplot(total_emi$Emissions/10^6,
        names.arg=total_emi$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions in all United States from 1999 to 2008")
dev.off()