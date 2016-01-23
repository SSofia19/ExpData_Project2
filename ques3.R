file2<-"~/exdata-data-NEI_data/summarySCC_PM25.rds"
NEI<-readRDS(file2)
library(ggplot2)
#Subset to only include Baltimore
baltimore<- subset(NEI, fips==24510)

#Total emissions by type and year
baltimore2<-aggregate(baltimore$Emissions, by=list(Type=baltimore$type,Year=baltimore$year), FUN=sum)


#Plot Baltimore Emissions
qplot(Year, x, data=baltimore2, color=Type, group=Type, ylab="Emissions Total (tons)", main="Baltimore Total Emmissions by Type") + geom_line()

#Create copy
dev.copy(png, file="ques3.png")
dev.off()