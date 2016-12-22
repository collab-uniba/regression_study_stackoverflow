# Script per il calcolo e la visualizzazione di una curva ROC e per il calcolo automatico della Area-Under-the-Curve della ROC associata.
#Libreria pROC per le funzioni relative al calcolo di ROC
library(pROC)
#dataset di interesse
dsA1 <-read.csv2("A1 secondStudyNoComments.csv")
logitA1 <- glm(formula = Successful ~ CodeSnippet + I(Weekday=='Weekend') + I(GMTHour=='Afternoon') +
I(GMTHour=='Evening') + I(GMTHour=='Night') + I(BodyLength=='Medium') + I(BodyLength =='Long') + I(TitleLength=='Medium') + 
I(TitleLength=='Long')+ SentimentPositiveScore + SentimentNegativeScore + NTag + AvgUpperCharsPPost + URL + I(UserReputation=='Low') + I(UserReputation=='Established') + I(UserReputation=='Trusted'), 
data=dsA1, family=binomial())

#calcolo delle probabilità stimate provenienti dal modello di regressione logistica ottenibile tramite funzione glm
prob=predict(logitA1, type=c("response"))
dsA1$prob=prob
#creazione della curva
g <- roc(Successful ~ prob, data = dsA1)
#visualizzazione della curva
plot(g)
