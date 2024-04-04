SELECT P.product_id, ISNULL(ROUND(SUM(price*units)/SUM(units), 2), 0) AS average_price
FROM Prices AS P LEFT JOIN (
    SELECT product_id, purchase_date, CAST(units AS FLOAT) AS units FROM UnitsSold
) AS U 
ON P.product_id = U.product_id AND purchase_date >= start_date AND purchase_date <= end_date
GROUP BY P.product_id