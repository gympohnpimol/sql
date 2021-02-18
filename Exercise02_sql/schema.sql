CREATE TABLE Department2(
    Code INTEGER PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Budget DECIMAL NOT NULL
)

INSERT INTO Department2(Code, Name, Budget) VALUES(14, 'IT', 65000)
INSERT INTO Department2(Code, Name, Budget) VALUES(37, 'Accounting', 15000)
INSERT INTO Department2(Code, Name, Budget) VALUES(59, 'Human Resources', 24000)
INSERT INTO Department2(Code, Name, Budget) VALUES(77, 'Research', 55000)

SELECT Name FROM Department2

