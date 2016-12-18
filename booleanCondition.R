#Script di utilità generale: applicazione di un valore booleano per filtrare righe su un dataset

#impostazione working directory
#setwd("/Users/anacarnil/Downloads/Materiale tesi/Dataset")

#lettura dataset di interesse
datasetB1 <- read.csv2("B1 thirdStudy95kNoUserRep.csv")

#memorizzazione colonna su cui applicare la condizione in una variabile separata
userReputation <- datasetB1$UserReputation

#creazione vettore booleano sulla base della condizione desiderata
allLowUsersCondition <- userReputation == "Low"

#creazione di un nuovo dataset sulla base dei valori true presenti nel vettore booleano
newDatasetD1 <- datasetB1[allLowUsersCondition, ]

#memorizzazione dataset
write.csv2(newDatasetD1, "D1 allLowUserRepNoComments.csv")