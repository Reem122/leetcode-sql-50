SELECT id - 1 AS id, student
FROM Seat
WHERE id % 2 = 0

UNION

SELECT id + 1 AS id, student
FROM Seat
WHERE id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat)

UNION

SELECT id AS id, student
FROM Seat
WHERE id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat)