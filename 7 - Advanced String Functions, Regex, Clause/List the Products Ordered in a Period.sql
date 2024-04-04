SELECT product_name, SUM(unit) AS unit
FROM Products AS P INNER JOIN Orders AS O
ON P.product_id = O.product_id
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY product_name
HAVING SUM(unit) >= 100