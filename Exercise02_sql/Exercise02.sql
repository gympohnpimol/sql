--1. Select the last name of all employees.
SELECT LastName FROM Employee2

-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT(LastName) FROM Employee2

-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * 
FROM Employee2
WHERE LastName = 'Smith'

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * 
FROM Employee2
WHERE LastName IN ('Smith', 'Doe')