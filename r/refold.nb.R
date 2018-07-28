refold.nb <- function(F){
  require(e1071)
  source("r/useful_fn.R")
  metrics <- data.frame(ACCURACY=double(), FNR=double(), PRECISION=double(), RECALL=double(), F1Score=double())
  F$EST_KM.f <- factor(F$EST_KM)
  F$INITIAL_UNIT_PERSONNEL.f <- factor(F$INITIAL_UNIT_PERSONNEL)
  F$INITIAL_CALL_HOUR <- factor(F$INITIAL_CALL_HOUR)
  F$INITIAL_CALL_MIN <- factor(F$INITIAL_CALL_MIN)
  
  l <- list()
  
  folds <- 10
  for(n in (1:folds)){
      # sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR'))
      # sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR'))
      sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','EST_KM.f','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INITIAL_CALL_HOUR','INITIAL_CALL_MIN'))
      
      # g.model <- naiveBayes(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + AID_TO_FROM_OTHER_DEPTS + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INCIDENT_YEAR, data = F[sets$train,])
      # g.model <- naiveBayes(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INCIDENT_YEAR, data = F[sets$train,])
      g.model <- naiveBayes(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + EST_KM.f + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INITIAL_CALL_HOUR + INITIAL_CALL_MIN, data = F[sets$train,])
      
      
      y = tryCatch({
        # predict.logistic(g.model, F[sets$test, c('EVENT_TYPE','EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR')])
        predict(
          g.model, 
          # F[sets$test, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM.f','INITIAL_UNIT_PERSONNEL.f','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR')])
          F[sets$test, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','EST_KM.f','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INITIAL_CALL_HOUR','INITIAL_CALL_MIN')])
      }, error = function(e){
        return("error")
      })
      if(!is.factor(y)) next;
      
      cat("Prediction ", n, " complete.\n")
      g.cm <- table(y, F[sets$test, 'CRITICAL'])
      l[[n]] <- g.cm 
      
      g.stats <- custom.summaries(g.cm)
      
      metrics <- rbind(metrics, 
                       data.frame(ACCURACY=g.stats$ACCURACY, 
                                  FNR=g.stats$FNR, 
                                  PRECISION=g.stats$PRECISION, 
                                  RECALL=g.stats$RECALL, 
                                  F1Score=g.stats$F1Score))
      
    }
  
  # return(metrics)
  
  l$metrics <- metrics
  return(l)
}