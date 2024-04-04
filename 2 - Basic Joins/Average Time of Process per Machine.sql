SELECT S.machine_id, ROUND(AVG(E.timestamp - S.timestamp), 3) AS processing_time 
FROM Activity AS S INNER JOIN Activity AS E
ON S.machine_id = E.machine_id AND S.process_id = E.process_id
WHERE S.activity_type = 'start' AND E.activity_type = 'end'
GROUP BY S.machine_id
ORDER BY S.machine_id