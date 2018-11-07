## Responding Units
# Load & Combine Dataset from Yearwise .csv

RU <- read.csv("csv/2011_ru.csv", header=T, stringsAsFactors = F, na.strings=c("","NA"))


for(yr in (2012:2016)){
  r_file <- paste("csv/",yr, "_ru.csv", sep="")
  
  r_df <- read.csv(r_file, header=T, stringsAsFactors = F)
  RU <- rbind(RU, r_df)
  
  rm(r_df)
  
}

rm(yr)
rm(r_file)