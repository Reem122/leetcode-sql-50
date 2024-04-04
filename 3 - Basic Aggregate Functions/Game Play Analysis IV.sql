WITH log AS (
    SELECT *, LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS Next_Activity
    FROM Activity
    )

SELECT ROUND(SUM(IIF(DATEDIFF(DAY, Min_Current, Min_Next) = 1, 1.00, 0)) / COUNT(player_id), 2) AS fraction

FROM (
    SELECT player_id, MIN(event_date) AS Min_Current, MIN(Next_Activity) AS Min_Next 
    FROM log
    GROUP BY player_id) AS res
