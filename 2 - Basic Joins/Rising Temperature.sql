SELECT W.ID
FROM Weather AS W INNER JOIN Weather AS P 
ON W.recordDate = DATEADD(day, 1, P.recordDate)
WHERE W.temperature > P.temperature