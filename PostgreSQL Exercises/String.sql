  
--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
String Operations
String operations in most RDBMSs are, arguably, needlessly painful. 
Fortunately, Postgres is better than most in this regard, providing strong regular expression support. 
This section covers basic string manipulation, use of the LIKE operator, and use of regular expressions. 
I also make an effort to show you some alternative approaches that work reliably in most RDBMSs. 
*/

/*
Format the names of members
Question: 
Output the names of all members, formatted as 'Surname, Firstname'
*/ 
-- Answer
SELECT surname || ', ' || firstname AS name
FROM cd.members;

/*
Find facilities by a name prefix
Question: 
Find all facilities whose name begins with 'Tennis'. Retrieve all columns.
*/ 
-- Answer
SELECT *  
  FROM cd.facilities
  WHERE name LIKE 'Tennis%';

/*
Perform a case-insensitive search
Question: 
Perform a case-insensitive search to find all facilities whose name begins with 'tennis'. Retrieve all columns.
*/ 
-- Answer
SELECT *  
  FROM cd.facilities
  WHERE upper(name) LIKE 'TENNIS%';

/*
Find telephone numbers with parentheses
Question: 
You've noticed that the club's member table has telephone numbers with very inconsistent formatting. 
You'd like to find all the telephone numbers that contain parentheses, returning the member ID and telephone number sorted by member ID.
*/ 
-- Answer
SELECT memid, telephone 
  FROM cd.members
  WHERE telephone LIKE '(%';

--or
SELECT memid, telephone 
  FROM cd.members
  WHERE telephone SIMILAR TO '%[()]%';

--or (using Regular Expressions)
SELECT memid, telephone 
  FROM cd.members
  WHERE telephone ~ '[()]';

/*
Pad zip codes with leading zeroes
Question: 
The zip codes in our example dataset have had leading zeroes removed from them by virtue of being stored as a numeric type.
Retrieve all zip codes from the members table, padding any zip codes less than 5 characters long with leading zeroes. 
Order by the new zip code.
*/ 
-- Answer
SELECT LPAD(CAST(zipcode AS char(5)), 5, '0') AS zip 
  FROM cd.members
  ORDER BY zip;

/*
Count the number of members whose surname starts with each letter of the alphabet
Question: 
You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet. 
Sort by the letter, and don't worry about printing out a letter if the count is 0.
*/ 
-- Answer
SELECT SUBSTR(mems.surname,1,1) AS letter, count(*) AS count
  FROM cd.members AS mems 
  GROUP BY letter
  ORDER BY letter;
                 
/*
Clean up telephone numbers
Question: 
The telephone numbers in the database are very inconsistently formatted. 
You'd like to print a list of member ids and numbers that have had '-','(',')', and ' ' characters removed. Order by member id.
*/ 
-- Answer
SELECT memid, TRANSLATE(telephone, '-() ', '') AS telephone
  FROM cd.members 
  GROUP BY memid
  ORDER BY memid;
