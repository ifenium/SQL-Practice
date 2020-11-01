--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Querying data is all well and good, but at some point you're probably going to want to put data into your database! 
This section deals with inserting, updating, and deleting information. Operations that alter your data like this are 
collectively known as Data Manipulation Language, or DML.
*/

/*
Insert some data into a table
Question: 
The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:
facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
*/ 
-- Answer
INSERT INTO cd.facilities
	(facid, Name, membercost, guestcost, initialoutlay, monthlymaintenance)
	VALUES(9, 'Spa', 20, 30, 100000, 800);
--or 
INSERT INTO cd.facilities VALUES(9, 'Spa', 20, 30, 100000, 800);

/*
Insert multiple rows of data into a table
Question:
In the previous exercise, you learned how to add a facility. Now you're going to add multiple facilities in one command. 
Use the following values:
  facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
  facid: 10, Name: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80.
*/
-- Answer 
INSERT INTO cd.facilities
	(facid, Name, membercost, guestcost, initialoutlay, monthlymaintenance)
	VALUES
		(9, 'Spa', 20, 30, 100000, 800),
		(10, 'Squash Court 2', 3.5, 17.5, 5000, 80);

/*
Insert calculated data into a table
Question:
Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the value for 
the next facid, rather than specifying it as a constant. Use the following values for everything else:
	Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
*/
-- Answer 
UPDATE cd.facilities 
	SET initialoutlay = 10000
	WHERE facid = 1;

/*
Update multiple rows and columns at the same time
Question:
We want to increase the price of the tennis courts for both members and guests. Update the costs to be 6 for members, and 30 for guests.
*/
-- Answer 
UPDATE cd.facilities
   SET 
	 membercost=6,
	 guestcost=30
   WHERE facid IN (0,1);

/*
Update a row based on the contents of another row
Question:
We want to alter the price of the second tennis court so that it costs 10% more than the first one. 
Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.
*/
-- Answer 
UPDATE cd.facilities
	SET membercost = (1.1*(SELECT membercost FROM cd.facilities WHERE facid=0)),
		guestcost = (1.1*(SELECT guestcost FROM cd.facilities WHERE facid=0))
WHERE facid=1

-or
UPDATE cd.facilites 
	SET membercost = (SELECT membercost*1.1 FROM cd.faclities WHERE facid=0),
		guestcost = (SELECT guestcost*1.1 FROM cd.facilities WHERE facid=0)


/*

Question:

*/
-- Answer 


*

Question:

*/
-- Answer 
