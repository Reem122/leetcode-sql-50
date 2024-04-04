SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB10[0-9]%' 
	OR conditions LIKE '% DIAB10[0-9]' 
	OR conditions LIKE '% DIAB10[0-9] %'