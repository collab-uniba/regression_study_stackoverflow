# Carica il file csv che contiene il dataset.
# Converte i campi boolean come CodeSnippet e Successful da 'yes', 'no' a TRUE, FALSE.
# Avvia la regressione logistica.

#library(glmnet) #per ora non la usa
library(aod)
#source('orcip_so.R')
#source('timaProbabilita.R') #DECOMMENTARE per calcolare la probabilità stimata

stackoverflow_dataset <- read.csv2('/tmp/ReputationStudyRefactored.csv')

#stackoverflow_dataset$TitleLength<-discretize(stackoverflow_dataset$TitleLength, method="cluster", categories=3, labels=c(‘short','medium','long’), ordered=FALSE, onlycuts=FALSE)

#stackoverflow_dataset$BodyLength <- discretize(stackoverflow_dataset$BodyLength, categories = 3, labels = c(‘short','medium','long’), method="cluster", ordered=FALSE, onlycuts=FALSE)

#stackoverflow_dataset$NTag<-sapply(as.character(stackoverflow_dataset$NTag),switch,'Single'=as.logical(FALSE),'Multiple'=as.logical(TRUE))

#stackoverflow_dataset$TitleLength<-discretize(stackoverflow_dataset$TitleLength, method="cluster", categories=3, labels= NULL, ordered=FALSE, onlycuts=FALSE)

#stackoverflow_dataset$BodyLength <- discretize(stackoverflow_dataset$BodyLength, categories = 3, labels = NULL, method="cluster", ordered=FALSE, onlycuts=FALSE)


#stackoverflow_dataset$CodeSnippet <- sapply(as.character(stackoverflow_dataset$CodeSnippet),switch,'yes'=as.logical(TRUE),'no'=as.logical(FALSE))
#stackoverflow_dataset$Successful <- sapply(as.character(stackoverflow_dataset$Successful),switch,'yes'=as.logical(TRUE),'no'=as.logical(FALSE))
#stackoverflow_dataset$IsTheSameTopicBTitle <- sapply(as.character(stackoverflow_dataset$IsTheSameTopicBTitle),switch,'yes'=as.logical(TRUE),'no'=as.logical(FALSE))
#stackoverflow_dataset$URL <- sapply(as.character(stackoverflow_dataset$URL), switch, 'Yes' = as.logical(TRUE), 'No' = as.logical(FALSE))
#stackoverflow_dataset$Gratitude <- sapply(as.character(stackoverflow_dataset$Gratitude),switch,'yes'=as.logical(TRUE),'no'=as.logical(FALSE))



#no Gratitude

stackoverflow_logit <- glm(formula=Successful ~ CodeSnippet + I(Weekday=='Weekend') + I(GMTHour=='Afternoon') + I(GMTHour=='Evening') + I(GMTHour=='Night') + I(BodyLength=='medium') + I(BodyLength =='long') + I(TitleLength=='medium') + I(TitleLength=='long')+ I(SentimentPositiveScore=='Mild') + I(SentimentPositiveScore=='Strong') + I(SentimentNegativeScore=='Mild') + I(SentimentNegativeScore=='Strong') + I(CommentSentimentPositiveScore=='Mild') + I(CommentSentimentPositiveScore=='Strong') + I(CommentSentimentNegativeScore=='Mild') + I(CommentSentimentNegativeScore=='Strong') + NTag + AvgUpperCharsPPost + URL +IsTheSameTopicBTitle + I(UserReputation=='Low') + I(UserReputation=='Established') + I(UserReputation=='Trusted'), data=stackoverflow_dataset, family=binomial())

cat("Regressione eseguita con successo..")
capture.output(summary(stackoverflow_logit), file="/tmp/regressione10ott2016.txt")

#plot.CodeSnippet_prob_pertopic(stackoverflow_dataset, stackoverflow_logit_new_DEF)
#DECOMMENTARE la riga soprastante per calcolare la probabilità stimata

cat("Calcolo odds in corso.")
orcipwald.glm(stackoverflow_logit)

roc(Successful ~ CodeSnippet + Weekday + GMTHour + BodyLength + TitleLength + SentimentPositiveScore + SentimentNegativeScore + CommentSentimentPositiveScore + CommentSentimentNegativeScore + Gratitude + NTag + AvgUpperCharsPPost + URL +IsTheSameTopicBTitle, data=sodata)











