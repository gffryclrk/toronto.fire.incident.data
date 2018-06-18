testColumn <- function(x){
  # browser()
  os_time <- paste(as.Date(x$DISPATCH_DATE)," ",formatC(x$ONSCENE_HOUR, width=2, flag="0"), ":", formatC(x$ONSCENE_MIN, width=2,flag="0"), ":",formatC(x$ONSCENE_SEC, width=2, flag="0"), sep="")
  # cat(os_time, x$DISPATCH_DATE)
  # cat(class(x$DISPATCH_DATE), class(os_time))
  # cat(as.POSIXct(as.numeric(x$DISPATCH_DATE), origin="1970-01-01"))
  return(as.POSIXct(os_time, format="%Y-%m-%d %H:%M:%S") == x$DISPATCH_DATE)
}
