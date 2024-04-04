SELECT P.project_id, ISNULL(ROUND(AVG(experience_years), 2), 0) AS average_years
FROM Project AS P LEFT JOIN (
    SELECT employee_id, (experience_years + 0.0) AS experience_years FROM Employee
) AS E
ON P.employee_id = E.employee_id
GROUP BY P.project_id
ORDER BY P.project_id