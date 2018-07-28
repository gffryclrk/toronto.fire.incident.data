refold.models <- function(F){
  source("r/useful_fn.R")
  metrics <- data.frame(ACCURACY=double(), FNR=double(), PRECISION=double(), RECALL=double(), F1Score=double())
  
  l <- list()
  
  folds <- 10
  for(n in (1:folds)){
      # sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR'))
      # sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR'))
      sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','INCIDENT_DAY','INCIDENT_MONTH','INITIAL_CALL_HOUR','INITIAL_CALL_MIN'))
      
      # g.model <- glm(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + AID_TO_FROM_OTHER_DEPTS + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INCIDENT_YEAR, family=binomial(link='logit'), data = F[sets$train,])
      # g.model <- glm(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INCIDENT_YEAR, family=binomial(link='logit'), data = F[sets$train,])
      g.model <- glm(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INITIAL_CALL_HOUR + INITIAL_CALL_MIN, family=binomial(link='logit'), data = F[sets$train,])
      
      
      y = tryCatch({
        # predict.logistic(g.model, F[sets$test, c('EVENT_TYPE','EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR')])
        predict.logistic(g.model, F[sets$test, c('EVENT_TYPE','EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INITIAL_CALL_HOUR','INITIAL_CALL_MIN')])
      }, error = function(e){
        return("error")
      })
      if(!is.list(y)) next;
      cat("Prediction ", n, " complete.\n")
      g.cm <- table(y$pred, F[sets$test, 'CRITICAL'])
      
      g.stats <- custom.summaries(g.cm)
      
      l[[n]] <- g.cm
      
      metrics <- rbind(metrics, 
                       data.frame(ACCURACY=g.stats$ACCURACY, 
                                  FNR=g.stats$FNR, 
                                  PRECISION=g.stats$PRECISION, 
                                  RECALL=g.stats$RECALL, 
                                  F1Score=g.stats$F1Score))
      
    }

  # return(metrics)
  
  # browser()
  l$metrics <- metrics
  return(l)
  
}