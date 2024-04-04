WITH Customer_CTE AS (
    SELECT visited_on, 
    RANK() OVER(ORDER BY visited_on) AS R,
    ROUND(SUM(amount + 0.0) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS amount, 
    ROUND(AVG(amount + 0.0) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM (
        SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) AS Customer
)
SELECT visited_on, amount, average_amount
FROM Customer_CTE
WHERE R >= 7