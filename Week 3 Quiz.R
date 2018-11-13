
#1.
#Create a file for the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

#Download the appropriate data
download.file(fileUrl, destfile = "./data/communities", method = "curl")

#View the data
communities <- read.csv("./data/communities")
names(communities)
filter(communities, AGS == 6, ACR == 3)

communities[which(communities$AGS == 6 & communities$ACR == 3),]
#The Quiz answer is "125,238,262"

#2.
#Remember to set the working directory and flip the "/"s
setwd("C:/Users/george.fleeson/Documents/R/Getting and Cleaning Data")
library(jpeg)
jpeg(JPEG)
install.packages("jpeg")
if(!file.exists("./data")){dir.create("./data")}
f <- file.path(getwd(), "jeff.jpg")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, f, method = "curl")
img <- readJPEG(f,native = TRUE)
quantile(img, probs = c(0.3, 0.8))
#     30%       80% 
#  -15259150 -10575416

#3. 
install.packages("data.table")
library(data.table)
if(!file.exists("./data")){dir.create("./data")}
f <- file.path("./data", "GDP.csv")
g <- file.path("./data", "ED.csv")
gdpUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdpUrl, f, method = "curl")
download.file(edUrl, g, method = "curl")
#Match the data based on country shortcode
dtGDP <- data.table(read.csv(f, skip = 3, nrows = 190))
head(dtGDP)
dtED <- data.table(read.csv(g, header = TRUE, nrows = 235))
head(dtED)
library(dplyr)
setnames(dtGDP, c("X", "Ranking", "X.3", "X.4"), c("CountryCode", "Ranking", 
                                               "Long.Name", "gdp"))
names(dtED) #column of interest is CountryCode
names(dtGDP) #column of interest is X
mergedData <- merge(dtGDP,dtED,by.x = "X", by.y = "CountryCode", all = TRUE)
head(mergedData,1)
dim(mergedData) #235 length, 36 width
sum(!is.na(unique(mergedData$Ranking))) #shows that there are 189 country matches excluding NA values
mergedData2 <- filter(mergedData, !is.na(Ranking))
dim(mergedData2)
mergedData3 <- select(mergedData2, X:US.dollars.)
sortedData <- arrange(mergedData3, desc(Ranking))
sortedData[13,]

#Question 4: Average GDP for  "High income: OECD" and "High income: nonOECD" groups
highIncomeOECD <- filter(mergedData2, Income.Group == "High income: OECD")
test <- mergedData2 %>%   group_by(Income.Group) 
mergedData2.1 <- filter(mergedData, !is.na(Income.Group))
mergedData2.1 %>%
  group_by(Income.Group) %>%
  summarise_at(vars(US.dollars.), funs(mean(., na.rm=TRUE)))
tapply(mergedData2$Rank, mergedData2$Income.Group, mean)
?tapply #this seems to work really well, but I would have prefered to do it with dplyr
by_income <- group_by(mergedData2,Income.Group) #try this
#Answer: 32.96667, 91.91304

#Question 5: 
ddply(mergedData2, .(Income.Group), summarize, sum=sum(count))