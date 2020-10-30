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
--or
SELECT bks.starttime 
	FROM cd.bookings AS bks
		INNER JOIN cd.members AS mems
			ON bks.memid = mems.memid
	WHERE mems.surname ='Farrell' AND mems.firstname = 'David';
--or
SELECT  bks.starttime 
	FROM cd.bookings AS bks,
				cd.members AS mems
	WHERE
				mems.surname ='Farrell' 
				AND mems.firstname = 'David' 
				AND bks.memid = bks.memid;

/*
Work out the start times of bookings for tennis courts
-- Question:
How can you produce a list of the start times for bookings for tennis courts,
for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
*/
-- Answer
SELECT bks.starttime AS start, fac.name AS name
	FROM cd.facilities AS fac
		INNER JOIN cd.bookings AS bks
			ON fac.facid = bks.facid
	WHERE 
		fac.name LIKE 'Tennis%' AND
		bks.starttime BETWEEN '2012-09-21' AND '2012-09-22' 
ORDER BY bks.starttime;
--or
SELECT bks.starttime AS start, fac.name AS name
	FROM cd.facilities AS fac
		INNER JOIN cd.bookings AS bks
			ON fac.facid = bks.facid
	WHERE 
		fac.name IN ('Tennis Court 2', 'Tennis Court 1') AND
		bks.starttime BETWEEN '2012-09-21' AND '2012-09-22' 
ORDER BY bks.starttime;

/*
Produce a list of all members who have recommended another member
-- Question:
How can you output a list of all members who have recommended another member? 
Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
*/
-- Answer
SELECT DISTINCT recs.firstname AS firstname, recs.surname AS surname
	FROM 
		cd.members mems
		INNER JOIN cd.members AS recs
			ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

/*
Produce a list of all members, along with their recommender
-- Question:
How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).
*/
-- Answer
SELECT mem.firstname AS memfname, 
		mem.surname AS memsname, 
		recs.firstname AS recfname, 
		recs.surname AS recsname
FROM
	cd.members AS mem
	LEFT OUTER JOIN cd.members AS recs
		ON recs.memid = mem.recommendedby
ORDER BY memsname, memfname;

/*
Produce a list of all members who have used a tennis court
-- Question:
How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, 
and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.
*/
-- Answer
SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility
	FROM
		cd.members mems
		INNER JOIN cd.bookings bks
			ON mems.memid = bks.memid
		INNER JOIN cd.facilities facs
			ON bks.facid = facs.facid
	WHERE
		facs.name IN ('Tennis Court 2','Tennis Court 1')
ORDER BY member, facility     

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


/*

-- Question:

*/
-- Answer
