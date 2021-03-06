// Query 1 - To count the overall number of questions with accepted answers (no self-answered) in the last month:
SELECT COUNT(Questions.Id) FROM Posts AS Questions INNER JOIN Posts AS Answers ON Questions.AcceptedAnswerId = Answers.Id 
WHERE (Questions.OwnerUserId<>Answers.OwnerUserId) 
AND (Questions.CreationDate BETWEEN '2016-11-14'AND '2016-12-14');

// Query 2 - To count the overall number of questions in the last month:
SELECT COUNT(Questions.Id) FROM Posts AS Questions WHERE 
Questions.CreationDate BETWEEN '2016-11-14'AND '2016-12-14';

// Query 3 - To get a subsample of questions marked with a single tag, alongside the Question ID used to merge the generated csv with the
// original one
SELECT Id, Tags FROM Posts WHERE Tags = '<java>' OR Tags = '<javascript>' OR Tags = '<php>' OR Tags = '<python>' OR Tags = '<c#>' 
INTO OUTFILE '/tmp/topicsStackOF.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n';
 
// Query 4 - To get the date of the last Question posted on Stackoverflow and present in the database
SELECT CreationDate FROM Posts WHERE PostTypeId = 1 GROUP BY CreationDate DESC LIMIT 1;

// Query 5 - To get the date of the last Answer posted on Stackoverflow and present in the database
SELECT CreationDate FROM Posts WHERE PostTypeId = 2 GROUP BY CreationDate DESC LIMIT 1;

// Query 6 - To get the questions posted in the last three days before the extraction of the dump of stackoverflow
SELECT Id FROM Posts WHERE PostTypeId = 1 AND CreationDate BETWEEN '2014-09-12' AND '2014-09-15' INTO OUTFILE '/tmp/lastThreeDaysSTACKOF.csv'
 FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n';
 
 //Query 7 - To get the reputation of the author of accepted answers in a certain date interval
 SELECT Questions.Id, Users.Reputation FROM Posts AS Questions 
 INNER JOIN Posts AS Answers ON Questions.AcceptedAnswerId = Answers.Id 
 INNER JOIN Users ON Answers.OwnerUserId = Users.Id 
 WHERE Questions.CreationDate BETWEEN '2014-08-10' AND '2014-09-15' 
 INTO OUTFILE '/tmp/answererReputation.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n';
