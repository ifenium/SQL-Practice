/*
Changing rows with UPDATE and DELETE
*/

-- Working with INSERT, UPDATE AND DELETE
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT);
    
CREATE TABLE diary_logs (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    date TEXT,
    content TEXT
    );
    
/* After user submitted their new diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-01",
    "I had a horrible fight with OhNoesGuy and I buried my woes in 3 pounds of dark chocolate.");
    
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-02",
    "We made up and now we're best friends forever and we celebrated with a tub of ice cream.");

SELECT * FROM diary_logs;

-- Updates the Table using the row id
UPDATE diary_logs SET content = "I had a horrible fight with OhNoesGuy" 
WHERE id = 1;

-- Deletes the row from Table with the WHERE condition
DELETE FROM diary_logs WHERE id = 1;

SELECT * 
FROM diary_logs;


/*
Challenge:
Dynamic Documents
*/

CREATE table documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    author TEXT);
    
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

SELECT * FROM documents;

-- Use UPDATE to change the author to 'Jackie Draper' for all rows where it's currently 'Jackie Paper'. 
-- Then re-select all the rows to make sure the table changed like you expected.
UPDATE documents 
SET author="Jackie Draper" 
WHERE author="Jackie Paper";

--  Delete the row where the title is 'Things I'm Afraid Of'. Then re-select all the rows to make sure the table changed like you expected.
DELETE FROM documents 
WHERE title = "Things I'm Afraid Of";
SELECT * FROM documents;

/*
Altering tables after creation
*/

/* What we used to originally create the table */
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT);
    
CREATE TABLE diary_logs (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    date TEXT,
    content TEXT
    );
    
/* After user submits a diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-02",
    "OhNoesGuy and I made up and now we're best friends forever and we celebrated with a tub of ice cream.");
    
-- Adds a new column "emotion" to the table
ALTER TABLE diary_logs ADD emotion TEXT;

--  Modifies the table's scheme and sets deault value to "unknown" instead of default
ALTER TABLE diary_logs ADD emotion TEXT default "unknown";

INSERT INTO diary_logs (user_id, date, content, emotion) VALUES (1, "2015-04-03",
    "We went to Disneyland!", "happy");
    
SELECT * FROM diary_logs;

-- Deletes the entire table 
DROP TABLE diary_logs;

/*
Challenge:
Clothing alterations
*/

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

-- Use ALTER to add a 'price' column to the table. Then select all the columns in each row to see what your table looks like now.
ALTER TABLE clothes ADD price INTEGER;
SELECT * FROM clothes;

-- Assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 dollars, item 3 should be 30 dollars. 
-- When you're done, do another SELECT of all the rows to check that it worked as expected.
UPDATE clothes SET price = 10 WHERE id=1;
UPDATE clothes SET price = 20 WHERE id=2;
UPDATE clothes SET price = 30 WHERE id=3;

SELECT * FROM clothes;

-- Insert a new item into the table that has all three attributes filled in, including 'price'. Do one final SELECT of all the rows to check it worked.
INSERT INTO clothes (type, design, price)
    VALUES("T-Shirt", "plain", 40);
    
SELECT * FROM clothes

/*
Notes:
Make your SQL safer
*/

/*
-- Avoiding bad updates/deletes
  Run a SELECT with the same WHERE to make sure you're updating the right column and row.
  You can use the LIMIT operator to make sure you don't accidentally update too many rows

-- Using transactions
-- Making backups
-- Replication
-- Granting privileges
*/
