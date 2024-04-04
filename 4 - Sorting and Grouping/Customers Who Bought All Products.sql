DECLARE @Num_of_Products INT
SET @Num_of_Products = (SELECT COUNT(product_key) FROM Product)

SELECT customer_id
FROM Product AS P INNER JOIN Customer AS C
ON P.product_key = C.product_key
GROUP BY customer_id
HAVING COUNT(DISTINCT C.product_key) = @Num_of_Products