SELECT name, bonus
FROM Employee AS E LEFT JOIN Bonus AS B
ON E.empId = B.empId
WHERE bonus is null or bonus < 1000