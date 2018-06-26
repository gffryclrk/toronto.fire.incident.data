tta <- function(x){
  browser()
  if(sum(is.na(c(x["INCIDENT_DATE"], x["INITIAL_CALL_HOUR"], x["INITIAL_CALL_MIN"], x["INITIAL_CALL_SEC"], x["ONSCENE_HOUR"],x["ONSCENE_MIN"],x["ONSCENE_SEC"]))) > 0) return(NA)
  # onscene_date <- x["INCIDENT_DATE"]
  ic <- as.POSIXct(paste0(
    x["INCIDENT_DATE"], " ", x["INITIAL_CALL_HOUR"], ":", x["INITIAL_CALL_MIN"], ":", x["INITIAL_CALL_SEC"] 
  ), format="%Y-%m-%d %H:%M:%S", tz="EST")
  os <- as.POSIXct(paste0(
    x["INCIDENT_DATE"], " ", x["ONSCENE_HOUR"], ":", x["ONSCENE_MIN"], ":", x["ONSCENE_SEC"]
  ), format="%Y-%m-%d %H:%M:%S", tz="EST")
  if(x["ONSCENE_HOUR"] < x["INITIAL_CALL_HOUR"]){ os <- os + (24 * 60 * 60) }
  return(as.numeric(os) - as.numeric(ic))
  
}
