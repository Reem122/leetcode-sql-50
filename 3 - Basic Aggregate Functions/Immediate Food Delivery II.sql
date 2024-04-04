WITH res AS (
        SELECT *, RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS "Rank" FROM Delivery
    )
SELECT ROUND(
    AVG(IIF(
            order_date = customer_pref_delivery_date, 100.00, 0
        ))
    , 2) immediate_percentage 

FROM res
WHERE "Rank" = 1