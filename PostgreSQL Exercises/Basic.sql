--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Retrieve everything from a table
Question: 
How can you retrieve all the information from the cd.facilities table?
*/ 
-- Answer
SELECT * 
FROM cd.facilities;

/*
Retrieve specific columns from a table
Question: 
You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
*/
-- Answer
SELECT name, membercost 
FROM cd.facilities;

/*
Control which rows are retrieved
-- Question:
How can you produce a list of facilities that charge a fee to members?
*/
-- Answer
SELECT * 
FROM cd.facilities
  WHERE membercost > 0;

/*
Control which rows are retrieved - part 2
-- Question: 
How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
*/
-- Answer
SELECT facid, name, membercost, monthlymaintenance 
	FROM cd.facilities
	WHERE membercost <> 0 AND membercost < 0.02*monthlymaintenance;
--or
SELECT facid, name, membercost, monthlymaintenance 
  FROM cd.facilities
  WHERE membercost > 0 AND membercost < monthlymaintenance/50;

/*
Basic string searches
-- Question:
How can you produce a list of all facilities with the word 'Tennis' in their name?
*/
-- Answer
SELECT * 
  FROM cd.facilities
  WHERE name LIKE '%Tennis%'

/*
Matching against multiple possible values
-- Question:
How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
*/
-- Answer
SELECT * FROM cd.facilities 
WHERE facid IN (1,5);

/*
Classify results into buckets
-- Question:
How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on 
if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.
*/
-- Answer
SELECT name, 
  CASE 
	  WHEN monthlymaintenance >= 100 THEN 'expensive'
	  ELSE 'cheap'
  END AS cost
  FROM cd.facilities;

/*
Working with dates
-- Question:
How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, 
firstname, and joindate of the members in question.
*/
-- Answer
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01'

/*

-- Question:

*/
-- Answer


/*

-- Question:

*/
-- Answer
