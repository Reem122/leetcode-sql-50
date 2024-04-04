WITH Min_Year_CTE AS (
    SELECT product_id, MIN(YEAR) AS first_year 
    FROM Sales 
    GROUP BY product_id
)
SELECT S.product_id, first_year, quantity, price
FROM Sales AS S INNER JOIN Min_Year_CTE AS MY
ON S.product_id = MY.product_id AND S.year = MY.first_year