
CREATE TABLE Employee2(
    SSN INTEGER PRIMARY KEY,
    Name VARCHAR (255) NOT NUll,
    LastName VARCHAR (255) NOT NULL,
    Department INTEGER 
)

INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('123234878', 'Michel', 'Rogers', 14)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('152934485', 'Anand', 'Manikutty', 14)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('222364883', 'Carol', 'Smith', 37)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('326587417', 'Joe', 'Stevens', 37)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('332154719', 'Mary-Anne', 'Foster', 14)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('332569843', 'George', 'O''Donnell', 77)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('546523478', 'John', 'Doe', 59)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('631231482', 'David', 'Smith', 77)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('654873219', 'Zacary', 'Efron', 59)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('745685214', 'Eric', 'Goldsmith', 59)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('845657245', 'Elizabeth', 'Doe', 14)
INSERT INTO Employee2(SSN, Name, LastName, Department) VALUES('845657246', 'Kumar', 'Swamy', 14)

SELECT * FROM Employee2
SELECT * FROM Department2