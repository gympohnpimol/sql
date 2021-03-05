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

--3.9 Select the codes of all warehouses that are saturated 
--(a warehouse is saturated if the number of boxes 
--in it is larger than the warehouse's capacity).
SELECT W.Code, COUNT(*) AS Cap
FROM Boxes
INNER JOIN Warehouses W
ON W.Code = Boxes.Warehouse
GROUP BY Boxes.Warehouse
HAVING W.Capacity < Cap

--3.10 Select the codes of all the boxes located in Chicago.
SELECT Boxes.Code
FROM Boxes
INNER JOIN Warehouses
ON Boxes.Warehouse = Warehouses.Code 
WHERE Warehouses.Location = 'Chicaco'

--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO Warehouses(Location, Capacity) VALUES('New York', 3)

--3.12 Create a new box, with code "H5RT", 
--containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO Boxes(Code, Content, Value, Warehouse) VALUES('H5RT', 'Papers', 200, 2)

--3.13 Reduce the value of all boxes by 15%.
UPDATE Boxes SET Value = Value * 0.85

--3.14 Apply a 20% value reduction to boxes 
--with a value larger than the average value of all the boxes.
UPDATE Boxes SET Value = Value * 0.8
WHERE Value > (SELECT AVG(Value) FROM (SELECT * FROM Boxes) AS X)

SELECT*FROM Warehouses
SELECT*FROM Boxes
