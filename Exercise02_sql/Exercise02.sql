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

-- 2.5 Select all the data of employees that work in department 14.
SELECT * 
FROM  Employee2 
WHERE Department = 14

-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * 
FROM Employee2  
WHERE Department in (37, 77)

-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT *
FROM Employee2 
WHERE LastName LIKE 'S%'

-- 2.8 Select the sum of all the departments' budgets.
SELECT SUM(Budget) FROM Department2

-- 2.9 Select the number of employees in each department 
--(you only need to show the department code and the number of employees).

SELECT Department, COUNT(*)
FROM Employee2
GROUP BY Department

-- 2.10 Select all the data of employees, 
--including each employee's department's data.
SELECT *
FROM Employee2 E 
INNER JOIN Department2 D 
ON D.Code = E.Department

-- 2.11 Select the name and last name of each employee, 
-- along with the name and budget of the employee's department.
SELECT E.Name, E.LastName, D.Name, D.Budget
FROM Employee2 E 
INNER JOIN Department2 D
ON E.Department = D.Code

-- 2.12 Select the name and last name of employees working for departments 
-- with a budget greater than $60,000.
SELECT E.Name, E.LastName
FROM Employee2 E
JOIN Department2 D 
ON E.Department = D.Code
WHERE D.Budget >= 60000

-- 2.13 Select the departments with a budget larger than 
-- the average budget of all the departments.
SELECT Name 
FROM Department2
WHERE Budget > 
    (SELECT AVG(Budget)
    FROM Department2 )

-- 2.14 Select the names of departments with more than two employees.
SELECT D.Name, COUNT(E.Name) AS Amount
FROM Department2 D 
INNER JOIN Employee2 E 
ON E.Department = D.Code 
GROUP BY  D.Name
HAVING Amount >= 2

-- 2.15
-- Select the name and last name of employees working for
-- departments with second lowest budget.
SELECT E.Name, E.LastName 
FROM Employee2 E 
JOIN Department2 D 
ON E.Department = D.Code 
WHERE D.Budget IN (
    SELECT Budget FROM Department2 
    ORDER BY Budget 
    LIMIT 1
)

-- 2.16
-- Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.



SELECT * FROM Employee2
SELECT * FROM Department2