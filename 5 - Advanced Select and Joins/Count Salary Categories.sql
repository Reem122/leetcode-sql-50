WITH Accounts_CTE AS (
    SELECT *, 
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
        ELSE 'High Salary'
    END AS category
    FROM Accounts
)
SELECT C.category, COUNT(DISTINCT account_id) AS accounts_count
FROM Accounts_CTE AS A RIGHT JOIN (VALUES ('Low Salary'), ('Average Salary'), ('High Salary')) AS C(category)
ON A.category = C.category
GROUP BY C.category;