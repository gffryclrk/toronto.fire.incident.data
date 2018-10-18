rs_build <- function(x){
  if(sum(RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER']) < 1){
    RS <- get('RS', envir = .GlobalEnv)
    RS <- rbind(RS, 
                data.frame(
                  INCIDENT_NUMBER=x['INCIDENT_NUMBER'],
                  FIRST_STATION=NA,
                  SECOND_STATION=NA,
                  THIRD_STATION=NA,
                  FIRST_APPARATUS=NA,
                  SECOND_APPARATUS=NA,
                  THIRD_APPARATUS=NA
                ))
  }
  if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'FIRST_STATION'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'FIRST_STATION'] <- strsplit(x['CAD_UNIT_ID'], "\\D+")[[1]][2]
  }
  else if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'SECOND_STATION'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'SECOND_STATION'] <- strsplit(x['CAD_UNIT_ID'], "\\D+")[[1]][2] 
  }
  else if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'THIRD_STATION'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'THIRD_STATION'] <- strsplit(x['CAD_UNIT_ID'], "\\D+")[[1]][2] 
  }
  if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'FIRST_APPARATUS'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'FIRST_APPARATUS'] <- strsplit(x['CAD_UNIT_ID'], "\\d+")[[1]][1] 
  }
  else if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'SECOND_APPARATUS'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'SECOND_APPARATUS'] <- strsplit(x['CAD_UNIT_ID'], "\\d+")[[1]][1] 
  }
  else if(is.na(RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'THIRD_APPARATUS'])){
    RS[RS$INCIDENT_NUMBER == x['INCIDENT_NUMBER'], 'THIRD_APPARATUS'] <- strsplit(x['CAD_UNIT_ID'], "\\d+")[[1]][1] 
  }
  assign("RS", RS, envir = .GlobalEnv)
}
