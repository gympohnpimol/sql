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

"How many accounts spent more than 30,000 usd total across all orders?"
SELECT a.id, a.name, SUM(o.total_amt_usd) total
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id 
GROUP BY a.id, a.name 
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total;

"How many accounts spent less than 1,000 usd total across all orders?"
SELECT a.id, a.name, SUM(o.total_amt_usd) total
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id 
GROUP BY a.id, a.name 
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total;

"Which account has spent the most with us?"
SELECT a.id, a.name, SUM(o.total_amt_usd) total
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.id, a.name 
ORDER BY total DESC
LIMIT 1;

"Which account has spent the least with us?"
SELECT a.id, a.name, SUM(o.total_amt_usd) total
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.id, a.name 
ORDER BY total
LIMIT 1;

"Which accounts used facebook as a channel to contact customers more than 6 times?"
SELECT a.id, a.name, w.channel, COUNT(*) count_time
FROM accounts a 
JOIN web_events w 
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel 
HAVING COUNT(*) > 6 and w.channel = 'facebook'
ORDER BY count_time;

"Which account used facebook most as a channel?"
SELECT a.id, a.name, w.channel, COUNT(*) count_time 
FROM accounts a 
JOIN web_events w 
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY count_time DESC
LIMIT 1;

"Which channel was most frequently used by most accounts?"
SELECT a.id, a.name, w.channel, COUNT(*) count_time
FROM accounts a 
JOIN web_events w 
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel 
ORDER BY count_time DESC 
LIMIT 10;

