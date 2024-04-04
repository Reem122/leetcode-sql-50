SELECT M.employee_id, M.name, COUNT(E.employee_id) AS reports_count, ROUND(AVG(E.AGE + 0.00), 0) AS average_age
FROM Employees AS E
INNER JOIN Employees AS M
ON M.employee_id = E.reports_to
GROUP BY M.employee_id, M.name
ORDER BY employee_id