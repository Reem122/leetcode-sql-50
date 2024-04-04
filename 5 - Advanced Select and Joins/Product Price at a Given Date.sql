WITH Products_CTE AS(
    SELECT *, MAX(change_date) OVER(PARTITION BY product_id) Max_change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
) 
SELECT product_id, new_price AS price
FROM Products_CTE
WHERE change_date = Max_change_date
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Products_CTE)