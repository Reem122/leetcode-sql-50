SELECT unique_id, name 
FROM Employees E LEFT JOIN EmployeeUNI U 
ON E.ID = U.ID