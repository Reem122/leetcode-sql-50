WITH  No_of_Friends AS(
    SELECT requester_id AS id, COUNT(accepter_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT accepter_id AS id, COUNT(requester_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)
SELECT TOP 1 id, SUM(num) AS num
FROM No_of_Friends
GROUP BY id
ORDER BY num DESC