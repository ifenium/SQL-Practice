--Queries based on exercises from Codecademy

/*
Creating a table and inserting data
Creating a Griocery List Table
*/

CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER);

INSERT INTO groceries VALUES (1, "Bananas", 4);
INSERT INTO groceries VALUES (2, "Peanut Butter", 1);
INSERT INTO groceries VALUES (3, "Garri", 2);
SELECT * FROM groceries;

/*
Challenge
Book list database
*/

CREATE TABLE  favourite_books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);  

INSERT INTO favourite_books VALUES (1, "The Nordic Theory of Everything", 5);
INSERT INTO favourite_books VALUES (2, "The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations", 4.5);
INSERT INTO favourite_books VALUES (3, "Where Good Ideas Come from: The Natural History of Innovation", 4);

SELECT * from favourite_books

/*
Querying the table
*/

CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, aisle INTEGER);
INSERT INTO groceries VALUES (1, "Bananas", 4, 7);
INSERT INTO groceries VALUES(2, "Peanut Butter", 1, 2);
INSERT INTO groceries VALUES(3, "Garri", 2, 2);
INSERT INTO groceries VALUES(4, "Biscuit", 5, 12);
INSERT INTO groceries VALUES(5, "Honey", 2, 2);
INSERT INTO groceries VALUES(6, "Rice", 1, 4);

-- Displays all rows in the table
SELECT * FROM groceries;

-- Displays all rows in the name column
SELECT name from groceries;

-- Displays the rows available on the table ordered by aisle
SELECT * FROM  groceries ORDER BY aisle;

-- Displays the rows where the asiel in greather than 5 ordered by aisle
SELECT * FROM  groceries WHERE aisle > 5 ORDER BY aisle;

/*
Challenge
Book list database
*/
