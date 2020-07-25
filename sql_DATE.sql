"Find the sales in terms of total dollars for all orders in each year, 
ordered from greatest to least. Do you notice any trends in the yearly sales totals?"
SELECT DATE_PART('year', occurred_at) AS year,
    SUM(total_amt_usd) AS total_order
FROM orders
GROUP BY year
ORDER BY total_order DESC;

"Which month did Parch & Posey have the greatest sales in terms of total dollars? 
Are all months evenly represented by the dataset?"
SELECT DATE_PART('month', occurred_at) AS month,
	SUM(total_amt_usd) AS total_order
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month
ORDER BY total_order DESC;

"Which year did Parch & Posey have the greatest sales in terms of total number of orders? 
Are all years evenly represented by the dataset?"
SELECT DATE_PART('year', occurred_at) AS year,
	COUNT(*) AS total_order
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY year
ORDER BY total_order DESC;

"Which month did Parch & Posey have the greatest sales in terms of total number of orders?
Are all months evenly represented by the dataset?"
SELECT DATE_PART('month', occurred_at) AS month,
	COUNT(*) AS total_order
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month
ORDER BY total_order DESC;

"In which month of which year did Walmart spend the most on gloss paper in terms of dollars?"
SELECT DATE_TRUNC('month', o.occurred_at) AS month,
    SUM(o.gloss_amt_usd) AS spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY month
ORDER BY spent DESC
LIMIT 1;