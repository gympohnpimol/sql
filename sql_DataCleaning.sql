s
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