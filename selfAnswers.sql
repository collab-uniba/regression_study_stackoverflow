// Query 1 - To count the overall number of questions with accepted answers (no self-answered) in the last month:
SELECT COUNT(Questions.Id) FROM Posts AS Questions INNER JOIN Posts AS Answers ON Questions.AcceptedAnswerId = Answers.Id 
WHERE (Questions.OwnerUserId<>Answers.OwnerUserId) 
AND (Questions.CreationDate BETWEEN '2016-11-14'AND '2016-12-14');

// Query 2 - To count the overall number of questions in the last mont:
SELECT COUNT(Questions.Id) FROM Posts AS Questions WHERE 
Questions.CreationDate BETWEEN '2016-11-14'AND '2016-12-14';
