-- 1. Select the name of all the pieces.
SELECT name FROM Pieces

-- 2. Select all the providers' data.
SELECT * FROM Providers

-- 3. Obtain the average price of each piece 
-- (show only the piece code and the average price)
SELECT Piece, AVG(Price) 
FROM ProvidesM
GROUP BY Piece

-- 4. Obtain the names of all providers who supply piece 1
SELECT Providers.Name
FROM Providers
INNER JOIN Provides
ON Providers.Code = Provides.Provider
AND Provides.Piece = 1

-- 5. Select the name of pieces provided by provider with code "HAL".
SELECT Name
FROM Pieces 
WHERE Code IN (
    SELECT Piece FROM Provides 
    WHERE Provider = 'HAL')

-- 6. For each piece, find the most expensive offering of that 
-- piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).

SELECT Pieces.Name, Providers.Name, Price
FROM Pieces 
INNER JOIN Provides ON Pieces.Code = Piece
INNER JOIN Providers ON Providers.Code = Provider
WHERE Price =(
     SELECT MAX(Price) FROM Provides
     WHERE Piece = Pieces.Code
   )

-- 7. Add an entry to the database to indicate that "Skellington Supplies" 
-- (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides VALUES (1, 'TNBC', 7)

-- 8. Increase all prices by one cent.
UPDATE Providers SET Price = Price + 1

-- 9. Update the database to reflect that "Susan Calvin Corp." (code "RBT") 
-- will not supply bolts (code 4).
DELETE FROM Providers 
WHERE Provider = 'RBT'
AND Piece = 4

-- 10. Update the database to reflect that "Susan Calvin Corp." 
-- (code "RBT") will not supply any pieces (the provider should still remain in the database).
DELETE FROM Providers
WHERE Provider = 'RBT'

SELECT*FROM Provides