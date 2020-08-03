
/*Finding Matched and Unmatched Rows with FULL OUTER JOIN*/
SELECT * 
FROM accounts
FULL JOIN sales_reps 
ON accounts.sales_rep_id = sales_reps.id
WHERE accounts.sales_rep_id IS NULL OR sales_reps.id IS NULL;

/*Inequality JOINS*/
SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
  FROM accounts
  LEFT JOIN sales_reps
    ON accounts.sales_rep_id = sales_reps.id
   AND accounts.primary_poc < sales_reps.name

/*Self JOINS*/
SELECT we1.id AS we_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel AS we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel AS we2_channel
  FROM web_events we1 
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 day'
ORDER BY we1.account_id, we2.occurred_at

/*UNION*/
SELECT *
    FROM accounts

UNION ALL

SELECT *
  FROM accounts;

SELECT *
    FROM accounts
    WHERE name = 'Walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE name = 'Disney';

WITH double_accounts AS (
    SELECT *
      FROM accounts

    UNION ALL

    SELECT *
      FROM accounts
)

SELECT name,
       COUNT(*) AS name_count
 FROM double_accounts 
GROUP BY 1
ORDER BY 2 DESC;