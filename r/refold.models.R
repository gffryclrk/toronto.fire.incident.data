refold.models <- function(F){
  source("useful_fn.R")
  metrics <- data.frame(ACCURACY=double(), FNR=double(), PRECISION=double(), RECALL=double(), F1Score=double())
  
  
  folds <- 10
  for(n in (1:folds)){
      sets <- repsample(F, c('EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR'))
      
      g.model <- glm(CRITICAL ~ EVENT_TYPE_CD + ALARM_TO_FD + RESPONSE_TYPE + AID_TO_FROM_OTHER_DEPTS + EST_KM + INITIAL_UNIT_PERSONNEL + INCIDENT_DAY + INCIDENT_MONTH + INCIDENT_YEAR, family=binomial(link='logit'), data = F[sets$train,])
      
      y = tryCatch({
        predict.logistic(g.model, F[sets$test, c('EVENT_TYPE','EVENT_TYPE_CD','ALARM_TO_FD','RESPONSE_TYPE','AID_TO_FROM_OTHER_DEPTS','EST_KM','INITIAL_UNIT_PERSONNEL','INCIDENT_DAY','INCIDENT_MONTH','INCIDENT_YEAR')])
      }, error = function(e){
        return("error")
      })
      if(y == "error") next;
      
      g.cm <- table(y$pred, F[sets$test, 'CRITICAL'])
      
      g.stats <- custom.summaries(g.cm)
      
      metrics <- rbind(metrics, 
                       data.frame(ACCURACY=g.stats$ACCURACY, 
                                  FNR=g.stats$FNR, 
                                  PRECISION=g.stats$PRECISION, 
                                  RECALL=g.stats$RECALL, 
                                  F1Score=g.stats$F1Score))
      
    }

  return(metrics)
  
}