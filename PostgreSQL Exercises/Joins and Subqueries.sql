--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Joins and Subqueries
This category deals primarily with a foundational concept in relational database systems: joining. 
Joining allows you to combine related information from multiple tables to answer a question. 
This isn't just beneficial for ease of querying: a lack of join capability encourages denormalisation of data, 
which increases the complexity of keeping your data internally consistent.
This topic covers inner, outer, and self joins, as well as spending a little time on subqueries (queries within queries). 
*/


/*
Retrieve the start times of members' bookings
-- Question:
How can you produce a list of the start times for bookings by members named 'David Farrell'?
*/
-- Answer
SELECT starttime 
	FROM cd.bookings 
INNER JOIN cd.members
	ON cd.members.memid = cd.bookings.memid
		WHERE surname ='Farrell' AND firstname = 'David';
/*

-- Question:

*/
-- Answer

/*

-- Question:

*/
-- Answer

/*

-- Question:

*/
-- Answer
