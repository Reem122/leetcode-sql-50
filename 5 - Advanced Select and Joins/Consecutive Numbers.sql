WITH sequence AS(
SELECT *, LEAD(num) OVER(ORDER BY id) next_1, LEAD(num, 2) OVER(ORDER BY id) next_2
FROM Logs
) SELECT DISTINCT num AS ConsecutiveNums
FROM sequence
WHERE num = next_1 AND num = next_2 AND next_1 = next_2