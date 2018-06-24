testColumn <- function(x){
  # os_time <- paste(as.Date(x$DISPATCH_DATE)," ",formatC(x$ONSCENE_HOUR, width=2, flag="0"), ":", formatC(x$ONSCENE_MIN, width=2,flag="0"), ":",formatC(x$ONSCENE_SEC, width=2, flag="0"), sep="")
  browser()
  # os_time <- paste0(x["DISPATCH_DATE"], " ", x["ONSCENE_HOUR"], ":", x["ONSCENE_MIN"], ":", x["ONSCENE_SEC"] )
  os_time <- paste0(substr(x["DISPATCH_DATE"], 0, 10), " ", x["ONSCENE_HOUR"], ":", x["ONSCENE_MIN"], ":", x["ONSCENE_SEC"] )
  return(as.POSIXct(os_time, format="%Y-%m-%d %H:%M:%S") == x$DISPATCH_DATE)
}
