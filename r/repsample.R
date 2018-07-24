repsample <- function(data.set, attr, train.prop = 0.6){
  idl <- list()
  idl$train <- sample(1:nrow(data.set), (train.prop * nrow(data.set)))[1];
  # 
  for(a in attr){
    t <- table(data.set[,a])
    for(n in names(t[t > 0])){
      # browser()
      ni <- which(data.set[,a] %in% n)[1]
      # cat("ni: ", ni, " id: ", which(data.set[-idl$train, a] %in% n)[1])
      if(!is.na(ni)) idl$train <- c(idl$train, ni)
      # idx$train <- c(idx$train, which(data.set[-idx$train, a] %in% name)[1])
      # 
    }
  }
  idl$train <- unique(c(idl$train, sample(1:nrow(data.set), (train.prop * nrow(data.set)))))
  idl$test <- (1:nrow(data.set))[-idl$train]
    return(idl)
}

# repsample(I[I$EVENT_TYPE %in% 'Fire',], c('EVENT_TYPE_CD'))
