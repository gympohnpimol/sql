
"How many accounts have more than 20 orders?"
SELECT a.id, a.name, COUNT(*) num 
FROM account a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num;

"Which account has the most orders?"
SELECT a.id, a.name, COUNT(*) num 
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.id, a.name 
ORDER BY num DESC 
LIMIT 1;



