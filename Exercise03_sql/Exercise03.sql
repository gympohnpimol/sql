--3.1 Select all warehouses.
SELECT * FROM  Warehouses

--3.2 Select all boxes with a value larger than $150.
SELECT * FROM Boxes
WHERE Value > 150

--3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT(Content) FROM Boxes

--3.4 Select the average value of all the boxes.
SELECT AVG(Value) FROM Boxes

--3.5 Select the warehouse code 
--and the average value of the boxes in each warehouse.
SELECT AVG(Value), Warehouse
FROM Boxes
GROUP BY Warehouse

--3.6 Same as previous exercise, 
--but select only those warehouses where the average value 
--of the boxes is greater than 150.
SELECT Warehouse, AVG(Value) AS avg
FROM Boxes
GROUP BY Warehouse
HAVING AVG(Value) > 150

--3.7 Select the code of each box, 
--along with the name of the city the box is located in.
SELECT B.Code, W.Location
FROM Boxes B 
INNER JOIN  Warehouses W 
ON B.Warehouse = W.Code

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
--Optionally, take into account that some warehouses are empty 
--(i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT B.Warehouse, COUNT(*) AS NUM_Warehouse
FROM Boxes B 
LEFT JOIN Warehouses W  
ON W.Code = B.Warehouse 
GROUP BY B.Warehouse 

