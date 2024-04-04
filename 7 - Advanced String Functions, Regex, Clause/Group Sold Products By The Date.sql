WITH Activities_T AS (
    SELECT DISTINCT sell_date, product FROM Activities
)
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, STRING_AGG(product, ',') AS products
FROM Activities_T
GROUP BY sell_date