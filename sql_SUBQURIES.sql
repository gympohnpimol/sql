
SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
FROM orders;

/*To pull the average for each, we could do this all in one query, but for readability, 
providing two queries below to perform each separately.*/
SELECT AVG(standard_qty) AS avq_std,
        AVG(gloss_qty) AS avg_gls,
        AVG(poster_qty) AS avg_pst
FROM orders
WHERE DATE_TRUNC('month', MIN(occurred_at)) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', MIN(occurred_at)) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

/*Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.*/
SELECT s.name sales_rep, r.name region_name, SUM(o.total_amt_usd) total
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT t1.region_name, MAX(t1.total) total
FROM (SELECT s.name sales_rep, r.name region_name, SUM(o.total_amt_usd) total
        FROM sales_reps s
        JOIN accounts a
        ON s.id = a.sales_rep_id
        JOIN region r
        ON s.region_id = r.id
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t1
GROUP BY 1;

SELECT t3.sales_rep, t3.region_name, t3.total
FROM (SELECT t1.region_name, MAX(t1.total) total
        FROM (SELECT s.name sales_rep, r.name region_name, SUM(o.total_amt_usd) total
                FROM sales_reps s
                JOIN accounts a
                ON s.id = a.sales_rep_id
                JOIN region r
                ON s.region_id = r.id
                JOIN orders o
                ON o.account_id = a.id
                GROUP BY 1, 2
                ORDER BY 3 DESC) t1
        GROUP BY 1) t2
JOIN (SELECT s.name sales_rep, r.name region_name, SUM(o.total_amt_usd) total
        FROM sales_reps s
        JOIN accounts a
        ON s.id = a.sales_rep_id
        JOIN region r
        ON s.region_id = r.id
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t3
ON t2.region_name = t3.region_name AND t2.total = t3.total;

/*For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?*/
SELECT r.name region_name, SUM(o.total_amt_usd) totals 
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id 
JOIN region r
ON s.region_id = r.id
JOIN orders o
ON a.id = o.account_id
GROUP BY 1;

SELECT MAX(t1.totals)
FROM (SELECT r.name region_name, SUM(o.total_amt_usd) totals 
        FROM sales_reps s
        JOIN accounts a
        ON s.id = a.sales_rep_id 
        JOIN region r
        ON s.region_id = r.id
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1) t1;

SELECT r.name region_name, count(o.total) order_count
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
JOIN orders o
ON a.id = o.account_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
        SELECT MAX(t1.totals)
        FROM (SELECT r.name region_name, SUM(o.total_amt_usd) totals 
                FROM sales_reps s
                JOIN accounts a
                ON s.id = a.sales_rep_id 
                JOIN region r
                ON s.region_id = r.id
                JOIN orders o
                ON a.id = o.account_id
        GROUP BY 1) t1);


