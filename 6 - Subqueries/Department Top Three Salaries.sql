WITH Employee_CTE AS( 
    SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS R
    FROM Employee
)
SELECT D.name AS Department, E.NAME AS Employee, Salary
FROM Employee_CTE AS E INNER JOIN Department AS D
ON E.departmentId = D.id
WHERE R <= 3