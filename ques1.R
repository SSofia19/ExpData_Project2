
#Extension to files
file1 <- "~/exdata-data-NEI_data/Source_Classification_Code.rds"
file2<-"~/exdata-data-NEI_data/summarySCC_PM25.rds"

#Read in files
NEI<-readRDS(file2)
SCC<-readRDS(file1)

#Change year to factor 
NEI$year<- as.factor(NEI$year)

#Subset into new data frame totaling emissions by year
df<-aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)
df$Year<- as.factor(df$Year)

#plot a graph to show PM25 increase/decrease over time
with(df, plot(x~Year ,xlab="Year", ylab="Emissions", type="l", main="Total PM25 Emissions over Time"))

#copy graph to a png
dev.copy(png, file="ques1.png")
dev.off()