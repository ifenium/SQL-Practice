--Queries based on exercises from Codecademy

/*
Creating a table and inserting data
*/

-- Creating a Griocery List Table.
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

-- Displays all rows in the table.
SELECT * FROM groceries;

-- Displays all rows in the name column.
SELECT name from groceries;

-- Displays the rows available on the table ordered by aisle.
SELECT * FROM  groceries ORDER BY aisle;

-- Displays the rows where the asiel in greather than 5 ordered by aisle.
SELECT * FROM  groceries WHERE aisle > 5 ORDER BY aisle;

/*
Challenge
Box Office hits database
*/

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
-- Select all the movies
SELECT * from movies;
-- Retrieves only the movies that were released in the year 2000 or later, not before. Sort the results so that the earlier movies are listed first.
SELECT * from movies WHERE release_year > 1999 ORDER BY release_year;


/*
Aggregating Data
*/

CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, aisle INTEGER);
INSERT INTO groceries VALUES (1, "Bananas", 4, 7);
INSERT INTO groceries VALUES(2, "Peanut Butter", 1, 2);
INSERT INTO groceries VALUES(3, "Garri", 2, 2);
INSERT INTO groceries VALUES(4, "Biscuit", 5, 12);
INSERT INTO groceries VALUES(5, "Honey", 2, 2);
INSERT INTO groceries VALUES(6, "Rice", 1, 4);

-- Gets the total number of items in the grocery list.
SELECT SUM(quantity) FROM groceries;

-- Gets the maximum item from the grocery list.
SELECT MAX(quantity) FROM groceries;

-- Gets the sum of every item in each aisle.
SELECT aisle, SUM(quantity) FROM groceries GROUP BY aisle;

/*
Challenge
TODO list database stats
*/

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES (4, "Save the world", 1);

-- Select the SUM of minutes it will take to do all of the items on your TODO list. 
SELECT SUM(minutes) FROM todo_list;


/*
Project
Design a store database
*/

CREATE TABLE shoe_store (id INTEGER PRIMARY KEY, name TEXT, size INTEGER, colour TEXT, price INTEGER, release_location TEXT, manufacturer TEXT);

INSERT INTO shoe_store VALUES(1, "Nike Air Force1'07", 7, "Blue", "320", "Egypt", "Nike");
INSERT INTO shoe_store VALUES(2, "ZX 2K Boost Shoes 7", 7, "Grey", "420", "Australia", "Adidas");
INSERT INTO shoe_store VALUES(3, "Nike Air Max 90 LTR", 7, "Yellow", "400", "UK", "Nike");
INSERT INTO shoe_store VALUES(4, "Nike Air Zoom Tempo Next", 8, "Black", "500", "US", "Nike");
INSERT INTO shoe_store VALUES(5, "Nike Metcon 6", 8, "Grey", "550", "Canada", "Nikes");
INSERT INTO shoe_store VALUES(6, "Nike Manoa", 7.5, "Brown", "600", "US", "Nike");
INSERT INTO shoe_store VALUES(7, "LeBron 18", 6.5, "Pink", "350", "US", "Nike");
INSERT INTO shoe_store VALUES(8, "Super Star Shoes7", 8, "White", "300", "UK", "Adidas");
INSERT INTO shoe_store VALUES(9, "Dame 7", 6.5, "Orange", "500", "Canada", "Adidas");
INSERT INTO shoe_store VALUES(10, "Nite Jogger", 7.5, "Blue", "150", "Sweden", "Adidas");
INSERT INTO shoe_store VALUES(11, "Kaptir Shoe", 8, "Green", "250", "Australia", "Adidas");
INSERT INTO shoe_store VALUES(12, "UA CUrry 7", 6.5, "Gold", "400", "Australia", "Under Armour");
INSERT INTO shoe_store VALUES(13, "608v5", 7, "White", "240", "China", "New Balance");
INSERT INTO shoe_store VALUES(14, "574", 6.5, "Brown", "420", "China", "New Balance");
INSERT INTO shoe_store VALUES(15, "Minimus Prevail7", 8, "Indigo", "250", "Egypt", "New Balance");

-- Displays all rows in the shoe_store table
SELECT * FROM shoe_store;
-- Displays all rows in the shoe_store table ordered by price
SELECT * FROM shoe_store ORDER BY price;
-- Displays the colour column and aggregated prices column of the shoe_store table grouped by colour
SELECT colour, SUM(price) FROM shoe_store GROUP BY colour;
