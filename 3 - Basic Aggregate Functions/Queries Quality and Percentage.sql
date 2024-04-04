SELECT query_name, ROUND(AVG((rating + 0.0) /position), 2) AS quality, ROUND((SUM(IIF(rating < 3, 1, 0)) + 0.0) /COUNT(query_name) * 100, 2) AS poor_query_percentage 
FROM (SELECT DISTINCT * FROM Queries) AS Queries
WHERE query_name IS NOT NULL
GROUP BY query_name