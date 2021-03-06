# setting the current working directory
# code files, eg plot2.R will be in subdir code
# data files will be in subdir data (not synced with github)
# plots (png) will be stored in subdir figure
 
# set working dir
setwd("C://Users/Axel Schwanke/Documents/GitHub/ExData_Plotting1")
getwd()

# read in the data file: household_power_consumption.txt

data <- read.table("./data/household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?")
dim(data)
names(data)
str(data)
head(data)


# 16/12/2006 17:24:00 -> 
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
str(data)
head(data)

# 16/12/2006 -> yyyy-mm-dd
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
str(data)
head(data)

# subset
data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
dim(data2)
head(data2)

par(type="l")
with(data2, plot(DateTime,Global_active_power, type="l",
                 xlab="",
                 ylab="Global Active Power (kilowatt)",
                 cex.lab=0.8,
                 cex.axis=0.9))




# saving as png 480*480 pixels
dev.copy(png,'figure/plot2.png')
dev.off()

