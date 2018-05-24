# Carica il file csv che contiene il dataset.
# Converte i campi boolean come CodeSnippet e Successful da 'yes', 'no' a TRUE, FALSE.
# Avvia la regressione logistica.

#library(glmnet) #per ora non la usa
library(aod)
#source('orcip_so.R')
#source('timaProbabilita.R') #DECOMMENTARE per calcolare la probabilità stimata

stackoverflow_dataset <- read.csv2('/tmp/ReputationStudyRefactored.csv')

#without comment sentiment scores
stackoverflow_logit <- glm(formula=Successful ~ CodeSnippet + I(Weekday=='Weekend') + I(GMTHour=='Afternoon') + I(GMTHour=='Evening') 
                           + I(GMTHour=='Night') + I(BodyLength=='Medium') + I(BodyLength =='Long') + I(TitleLength=='Medium') 
                           + I(TitleLength=='Long')+ SentimentPositiveScore + SentimentNegativeScore 
                           + NTag + AvgUpperCharsPPost + URL 
                           + I(UserReputation=='Low') + I(UserReputation=='Established') + I(UserReputation=='Trusted'), 
                           data=stackoverflow_dataset, family=binomial())


#without comment sentiment scores, by reputation categories
stackoverflow_logit <- glm(formula=Successful ~ CodeSnippet + I(Weekday=='Weekend') + I(GMTHour=='Afternoon') + I(GMTHour=='Evening') 
                           + I(GMTHour=='Night') + I(BodyLength=='Medium') + I(BodyLength =='Long') + I(TitleLength=='Medium') 
                           + I(TitleLength=='Long')+ SentimentPositiveScore + SentimentNegativeScore 
                           + NTag + AvgUpperCharsPPost + URL, data=stackoverflow_dataset, family=binomial())


cat("Regressione eseguita con successo..")
capture.output(summary(stackoverflow_logit), file="/tmp/regressione10ott2016.txt")

#plot.CodeSnippet_prob_pertopic(stackoverflow_dataset, stackoverflow_logit_new_DEF)
#DECOMMENTARE la riga soprastante per calcolare la probabilità stimata

cat("Calcolo odds in corso.")
orcipwald.glm(stackoverflow_logit)

roc(Successful ~ CodeSnippet + Weekday + GMTHour + BodyLength + TitleLength + SentimentPositiveScore + SentimentNegativeScore + CommentSentimentPositiveScore + CommentSentimentNegativeScore + Gratitude + NTag + AvgUpperCharsPPost + URL +IsTheSameTopicBTitle, data=sodata)











