#Calculation of the Pearson's Chi-square test for the assessment of the goodness of fit of a model
#Logit of a given dataset is needed

dsA1 <- read.csv2("A1 secondStudyNoComments.csv")
logitA1 <- glm(formula=Successful ~ CodeSnippet + I(Weekday=='Weekend') + 
I(GMTHour=='Afternoon') + I(GMTHour=='Evening') + I(GMTHour=='Night') + I(BodyLength=='Medium') + I(BodyLength =='Long') + 
I(TitleLength=='Medium') + I(TitleLength=='Long') + SentimentPositiveScore+ SentimentNegativeScore + NTag + AvgUpperCharsPPost + 
URL, data=dsA1, family=binomial())

#fitted values from logit
fittedVal <- logitA1$fitted

#chi squared test calculation
chisq.test(dsA1$Successful, fittedVal)

#Calculation of the Log Likelihood Ratio test
#lmtest library importing
library(lmtest)

#function lrtest needs the logit object generated with the glm function previously
lrtest(logitA1)
