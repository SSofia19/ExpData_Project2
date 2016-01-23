library(ggplot2)
#Extension to files
file1 <- "~/exdata-data-NEI_data/Source_Classification_Code.rds"
file2<-"~/exdata-data-NEI_data/summarySCC_PM25.rds"

#Read in files
NEI<-readRDS(file2)
SCC<-readRDS(file1)

#Get the SCC code for vehicle groups
vehicle<-subset(SCC, grepl("VEHICLE|Vehicle|vehicle", EI.Sector))

#Subset NEI by only vehicle SCC
vm<-subset(NEI, vehicle$SCC %in% NEI$SCC)

#Subset VM by baltimore and LA
baltLA<-subset(vm, vm$fips == "24510" | vm$fips =="06037")

#Get total emissions sorted by year and fips code
baltLASum<-aggregate(baltLA$Emissions, by=list(Fips=baltLA$fips,Year=baltLA$year), FUN=sum)

#Average emissions per year.  Noticed there were a lot more LA readings than Baltimore and thought that would give an unfair reading
baltLAAvg<-aggregate(baltLA$Emissions, by=list(Fips=baltLA$fips, Year=baltLA$year), FUN=mean)

#Graph Total Emissions 
qplot(Year, x, data=baltLASum, color=Fips) +geom_line()+ggtitle("Total Emissions Baltimore and LA")+labs(x="Years", y="Total Emissions(tons)")

qplot(Year, x, data=baltLAAvg, color=Fips) +geom_line()+ggtitle("Average Emissions Baltimore and LA")+labs(x="Years", y="Total Emissions(tons)")
)
#make a png file
dev.copy(png, file="ques5.png")
dev.off()