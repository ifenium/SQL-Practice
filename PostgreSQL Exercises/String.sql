  
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

Question: 

*/ 
-- Answer

