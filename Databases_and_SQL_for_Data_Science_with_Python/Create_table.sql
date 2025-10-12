-- Question 1. Create a new table in the database named Toys with attributes as ID (integer), Variety (variable length string), and Quantity (integer). Make sure the ID is not Null.

CREATE TABLE Toys (
        ID INTEGER NOT NULL,
        Variety VARCHAR(20),
        Quantity INTEGER
        

-- Question 2. Add the below-mentioned entries to the table using the INSERT statement.
ID	Variety	Quantity
1	Chew toy	20
2	Balls	50
3	Bowls	30
4	Foldable bed	40

INSERT INTO Toys VALUES
        (1, 'Chew toy', 20),
        (2, 'Balls', 50),
        (3, 'Bowls', 30),
        (4, 'Foldable bed', 40)


-- Question 3. ALTER the length of 'Variety' in the table to 30 characters.

ALTER TABLE Toys
MODIFY Variety VARCHAR(30)


-- Question 4. TRUNCATE the table 'Toys'.

TRUNCATE TABLE Toys


--  Question 5. DROP the table 'Toys'.

DROP TABLE Toys
