-- A <- AnimalIDGCOUNT(*) AS NUM_SURGERIES(SURGERIES)
-- π(AnimalID, Animal.Name( σNUM_SURGERIES>5(A) JOIN (ANIMAL))

-- We could skip the name so that we would avoid the join
-- We pick more than once instead of 5 due to limited entries in the db
SELECT Surgeries.AnimalID, Animal.Name AS Animal_Name
FROM Surgeries
	JOIN Animal ON Surgeries.AnimalID = Animal.AnimalID
GROUP BY AnimalID
HAVING Count(*) > 1;
