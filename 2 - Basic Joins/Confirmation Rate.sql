SELECT SU.user_id, ISNULL(ROUND(SUM(is_confirmed)/COUNT(SU.user_id), 2), 0)
AS confirmation_rate
FROM Signups AS SU LEFT JOIN (
    SELECT user_id, time_stamp, action,
    IIF(C.action = 'confirmed', 1.00, 0.00)
    AS is_confirmed
    FROM Confirmations AS C
) AS C
ON SU.user_id = C.user_id
GROUP BY SU.user_id