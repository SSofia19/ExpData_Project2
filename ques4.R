library(ggplot2)
#Extension to files
file1 <- "~/exdata-data-NEI_data/Source_Classification_Code.rds"
file2<-"~/exdata-data-NEI_data/summarySCC_PM25.rds"

#Read in files
NEI<-readRDS(file2)
SCC<-readRDS(file1)

#subset rows of SCC Sectors that contain the word coal
coal<-subset(SCC, grepl("COAL|Coal|coal", EI.Sector))

#subset NEI to read only the coal measurements (matching the SCC codes)
coalmeasure<-subset(NEI, coal$SCC %in% NEI$SCC)

#total the emissions by year
coalm<-aggregate(coalmeasure$Emissions, by=list(Year=coalmeasure$year), FUN=sum)

#graph
ggplot(coalm, aes(Year, x), main="US coal Emissions") 
  +geom_line()+ggtitle("US Coal PM25 Emissions")
  +labs(x="Years", y="Total Emissions(tons)")
  +theme(plot.title = element_text(color="#666666", face="bold", size=20)) 
  + theme(axis.title = element_text(color="#666666", face="bold", size=12)) 

#make a png file
dev.copy(png, file="ques4.png")
dev.off()
