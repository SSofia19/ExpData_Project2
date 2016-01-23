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

#Subset VM by baltimore
baltvm<-subset(vm, vm$fips == 24510)

baltvmt<-aggregate(baltvm$Emissions, by=list(Year=baltvm$year), FUN=sum)

ggplot(baltvmt, aes(Year, x)) +geom_line()+ggtitle("Baltimore Motor Vehicle Emissions")+labs(x="Years", y="Total Emissions(tons)")+theme(plot.title = element_text(color="#666666", face="bold", size=20)) + theme(axis.title = element_text(color="#666666", face="bold", size=12))

#make a png file
dev.copy(png, file="ques5.png")
dev.off()