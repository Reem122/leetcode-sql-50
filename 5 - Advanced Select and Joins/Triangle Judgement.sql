SELECT *, 
CASE
    WHEN X + Y > Z AND X + Z > Y AND Y + Z > X THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle