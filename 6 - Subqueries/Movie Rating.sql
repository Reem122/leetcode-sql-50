SELECT results
FROM (
    SELECT name AS results, RANK() OVER(ORDER BY Ratings DESC, name) AS R
    FROM (
        SELECT name, COUNT(movie_id) AS Ratings
        FROM Users AS U
        INNER JOIN MovieRating AS M
        ON U.user_id = M.user_id
        GROUP BY name
    ) AS Users_Ratings_Table

    UNION ALL

    SELECT title AS results, RANK() OVER(ORDER BY Rating_AVG DESC, title) AS R
    FROM (
        SELECT title, AVG(rating + 0.00) AS Rating_AVG
        FROM Movies AS M
        INNER JOIN MovieRating AS R
        ON M.movie_id = R.movie_id
        WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
        GROUP BY title

    ) AS Movings_Ratings_Table
) AS RES
WHERE R = 1