SELECT customer_id, COUNT(V.visit_id) count_no_trans
FROM Visits AS V FULL OUTER JOIN Transactions AS T
ON V.visit_id = T.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
