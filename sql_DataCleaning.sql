
/*LEFT and RIGHT*/
SELECT RIGHT(website,3) web, count(*) num
FROM accounts
GROUP BY 1;

SELECT LEFT(UPPER(name), 1) first_name, COUNT(*) num
FROM accounts
GROUP BY first_name
ORDER BY first_name;

SELECT sum(nums) nums, SUM(letters) letters 
FROM (SELECT name,
      CASE WHEN LEFT(UPPER(name),1) in ('0','1','2','3','4','5','6','7','8','9') THEN 1 ELSE 0 END AS nums,
      CASE WHEN LEFT(UPPER(name),1) in ('0','1','2','3','4','5','6','7','8','9') THEN 0 ELSE 1 END AS letters
FROM accounts) t1;

SELECT sum(vowel) vowel, sum(non_vowel) non_vowel 
FROM (SELECT name,
CASE WHEN LEFT(UPPER(name), 1) in ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END AS vowel,
CASE WHEN LEFT(UPPER(name), 1) NOT IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END AS non_vowel
FROM accounts) t;


/*POSITION & STRPOS*/
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) first_name,
      RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;

SELECT LEFT(name, STRPOS(name, ' ')-1) first_name,
      RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;

/*CONCAT*/
SELECT CONCAT(firstname,'.',lastname,'@',name,'.com') mail
FROM (SELECT 
LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) firstname,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) lastname,
name
FROM accounts) t;

WITH t1 AS (SELECT 
LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) firstname,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) lastname,
name
FROM accounts)

SELECT CONCAT(firstname,'.',lastname,'@',name,'.com')
FROM t1;

WITH t2 AS (
  SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) firstname,
  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) lastname, 
  name
  FROM accounts)

SELECT 
CONCAT(firstname,'.',lastname,'@',REPLACE(name,' ',''),'.com')
FROM t2;

WITH t3 AS(
  SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) firstname,
  RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) lastname,
  name
  FROM accounts)

SELECT 
LEFT(LOWER(firstname),1)||RIGHT(LOWER(firstname), 1)||LEFT(LOWER(lastname),1)||RIGHT(LOWER(lastname),1)||LENGTH(firstname)||LENGTH(lastname)||REPLACE(UPPER(name), ' ','')
FROM t3;

/*CAST*/
SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date FROM sf_crime_data; 

/*COALESCE*/
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;