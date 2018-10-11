custom.summaries <- function(cm){
# This will only work (properly) with a 2 way confusion matrix
cm <- as.matrix(cm)
if(mean(c(2,2) == dim(cm)) != 1) stop("This function presently only works with 2x2 Confusion Matrix (sorry!)")
summaries <- list()
summaries$ACCURACY <- (cm[1,1] + cm[2,2]) / sum(cm) # Accuracy
summaries$FNR <- cm[1,2]/(cm[1,2] + cm[2,2]) # FN Rate
summaries$PRECISION <- cm[2,2]/(cm[2,2] + cm[2,1]) # Precision
summaries$RECALL <- cm[2,2]/(cm[2,2] + cm[1,2]) # Recall
summaries$F1Score <- (2 * cm[2,2]) / ((2 * cm[2,2]) + cm[2,1] + cm[1,2]) # F1-Score
return(summaries)
}

predict.logistic <- function(model, test, prob=0.5){
  # test <- test[test$EVENT_TYPE_CD %in% model$xlevels$EVENT_TYPE_CD,]
  test[!test$EVENT_TYPE_CD %in% model$xlevels$EVENT_TYPE_CD, "EVENT_TYPE_CD"] <- NA
  y <- data.frame(prob=vector(mode='numeric',length=nrow(test)))
  y$prob <- predict(model, newdata=test)
  y$pred <- ifelse(y$prob > prob,1,0)
  # y$CRITICAL <- I[idx$cv, 'CRITICAL']
  return(y)
}