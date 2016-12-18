#impostare, se non fatto precedentemente, la working directory di R
#setwd("/Users/anacarnil/Downloads/Materiale tesi/Dataset")

#I package car e HH hanno entrambi una funzione VIF adeguata
#library(HH)

#inserire il dataset su cui si vuole calcolare la VIF
dataset <- read.csv2("D1 allLowRepNoComments.csv") 
                     
#Effettuare la regressione sul dataset usando le variabili di interesse

dataset_logit <- glm(formula = Successful ~ CodeSnippet + I(Weekday=='Weekend') + 
I(GMTHour=='Afternoon') + I(GMTHour=='Evening') + I(GMTHour=='Night') + 
I(BodyLength=='Medium') + I(BodyLength =='Long') + I(TitleLength=='Medium') + 
I(TitleLength=='Long')+ I(SentimentPositiveScore=='Mild') + 
I(SentimentPositiveScore=='Strong') + I(SentimentNegativeScore=='Mild') + 
I(SentimentNegativeScore=='Strong') + I(CommentSentimentPositiveScore=='Mild') + 
I(CommentSentimentPositiveScore=='Strong') + 
I(CommentSentimentNegativeScore=='Mild') + 
I(CommentSentimentNegativeScore=='Strong') + NTag + AvgUpperCharsPPost +
URL +IsTheSameTopicBTitle + I(UserReputation=='Low') + 
I(UserReputation=='Established') + I(UserReputation=='Trusted'), 
data=dataset, family=binomial())
                     
#Calcolare il VIF sull'output della regressione creato
vif(dataset_logit)
                     