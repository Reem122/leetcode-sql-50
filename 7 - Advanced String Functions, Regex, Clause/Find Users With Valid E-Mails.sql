SELECT *
FROM Users
WHERE mail LIKE '[A-Za-z]%@leetcode.com' AND NOT mail LIKE '%[#()!?^$%=*+&@]%@leetcode.com'