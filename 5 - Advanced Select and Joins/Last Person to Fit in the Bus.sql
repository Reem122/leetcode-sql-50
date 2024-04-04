WITH Queue_CTE AS(
    SELECT *, SUM(weight) OVER(ORDER BY Turn) Total_Weight
    FROM Queue
)
SELECT TOP 1 person_name
FROM Queue_CTE
WHERE Total_Weight <= 1000
ORDER BY turn DESC