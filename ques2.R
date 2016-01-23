#Extension to files
file1 <- "~/exdata-data-NEI_data/Source_Classification_Code.rds"
file2<-"~/exdata-data-NEI_data/summarySCC_PM25.rds"

#Read in files
NEI<-readRDS(file2)
SCC<-readRDS(file1)

#Subset to only include Baltimore
baltimore<- subset(NEI, fips==24510)

#Total Emissions by year
baltimore$year<-as.factor(baltimore$year)
baltimore1<-aggregate(baltimore$Emissions, by=list(Year=baltimore$year), FUN=sum)

#Plot Baltimore Emissions
with(baltimore1, plot(x~Year, ylab="Emissions (tons)", main="Baltimore Yearly Emissions"))

#Create copy
dev.copy(png, file="ques2.png")
dev.off()