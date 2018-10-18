# RS <- data.frame(INCIDENT_NUMBER=character(), FIRST_STATION=character(), SECOND_STATION=character(), THIRD_STATION=character(), FIRST_APPARATUS=character(), SECOND_APPARATUS=character(), THIRD_APPARATUS=character())

counter <- 0


for(i in I$INCIDENT_NUMBER[nchar(I$INCIDENT_NUMBER) == 9 & !I$INCIDENT_NUMBER %in% RS$INCIDENT_NUMBER]){
  
  
  counter <- counter + 1
  if(counter >= 1000){
    # curr_year <- substr(i, 2,3)
    cat(nrow(RS), "\n")
    write.csv(RS, file="csv/RS_2nd_run.csv")
    counter <- 0
    
  }
  
  subset <- RU[RU$INCIDENT_NUMBER == i,]
  subset <- subset[order(subset[,3]),]
  
  if(nrow(subset) < 1) next
  
  this_RS <- data.frame(INCIDENT_NUMBER=i,
                        FIRST_STATION=as.character(NA),
                        SECOND_STATION=as.character(NA),
                        THIRD_STATION=as.character(NA),
                        FIRST_APPARATUS=as.character(NA),
                        SECOND_APPARATUS=as.character(NA),
                        THIRD_APPARATUS=as.character(NA))
  
  # this_RS$FIRST_STATION <- strsplit(subset[1,'CAD_UNIT_ID'], "\\D+")[[1]][2]
  # this_RS$FIRST_APPARATUS <- strsplit(subset[1,'CAD_UNIT_ID'], "\\d+")[[1]][1]
  
  this_RS$FIRST_STATION <- regmatches(subset[1,'CAD_UNIT_ID'], regexpr("\\D+", subset[1,'CAD_UNIT_ID']), invert=T)[[1]][2]
  this_RS$FIRST_APPARATUS <- regmatches(subset[1,'CAD_UNIT_ID'], regexpr("\\D+", subset[1,'CAD_UNIT_ID']), invert=F)
  
  if(nrow(subset) > 1){
    this_RS$SECOND_STATION <- regmatches(subset[2,'CAD_UNIT_ID'], regexpr("\\D+", subset[2,'CAD_UNIT_ID']), invert=T)[[1]][2]
    this_RS$SECOND_APPARATUS <- regmatches(subset[2,'CAD_UNIT_ID'], regexpr("\\D+", subset[2,'CAD_UNIT_ID']), invert=F)
    
    # this_RS$SECOND_STATION <- strsplit(subset[2,'CAD_UNIT_ID'], "\\D+")[[1]][2]
    # this_RS$SECOND_APPARATUS <- strsplit(subset[2,'CAD_UNIT_ID'], "\\d+")[[1]][1]
  }
  if(nrow(subset) > 2){
    this_RS$THIRD_STATION <- regmatches(subset[3,'CAD_UNIT_ID'], regexpr("\\D+", subset[3,'CAD_UNIT_ID']), invert=T)[[1]][2]
    this_RS$THIRD_APPARATUS <- regmatches(subset[3,'CAD_UNIT_ID'], regexpr("\\D+", subset[3,'CAD_UNIT_ID']), invert=F)
    
    # this_RS$THIRD_STATION <- strsplit(subset[3,'CAD_UNIT_ID'], "\\D+")[[1]][2]
    # this_RS$THIRD_APPARATUS <- strsplit(subset[3,'CAD_UNIT_ID'], "\\d+")[[1]][1]
    
  }
  
  RS <- rbind(RS, this_RS)
  
  
}

write.csv(RS, file="csv/RS_2nd_run.csv")