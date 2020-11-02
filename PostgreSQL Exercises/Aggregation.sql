--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Aggregation is one of those capabilities that really make you appreciate the power of relational database systems. 
It allows you to move beyond merely persisting your data, into the realm of asking truly interesting questions that can be used to inform decision making. 
This category covers aggregation at length, making use of standard grouping as well as more recent window functions.
*/

/*
Count the number of facilities
Question:
For our first foray into aggregates, we're going to stick to something simple. We want to know how many facilities exist - simply produce a total count.f
*/
--Answer 
SELECT COUNT(*) FROM cd.facilities; 

/*
Count the number of expensive facilities
Question:
Produce a count of the number of facilities that have a cost to guests of 10 or more.
*/
--Answer 
SELECT COUNT(*) FROM cd.facilities 
WHERE guestcost >= 10;

/*
Count the number of recommendations each member makes.
Question:
Produce a count of the number of recommendations each member has made. Order by member ID.
*/
--Answer 
SELECT DISTINCT recommendedby, COUNT(*) 
	FROM cd.members
	WHERE recommendedby IS NOT NULL
	GROUP BY recommendedby
ORDER BY recommendedby;

/*
List the total slots booked per facility
Question:
Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.
*/
--Answer 
SELECT facid, SUM(slots) AS "Total Slots" 
  FROM cd.bookings
  GROUP BY facid
 ORDER BY facid;

/*
List the total slots booked per facility in a given month
Question:
Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots.
*/
--Answer 
SELECT facid, SUM(slots) AS "Total Slots"
	FROM cd.bookings
	WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
	GROUP BY facid 
	ORDER BY SUM(slots);
  
/*
List the total slots booked per facility per month
Question:
Produce a list of the total number of slots booked per facility per month in the year of 2012. 
Produce an output table consisting of facility id and slots, sorted by the id and month.
*/
--Answer 
SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS "Total Slots" FROM cd.bookings
  WHERE EXTRACT(YEAR FROM starttime) = '2012' 
  GROUP BY facid, month
  ORDER BY facid,month;

/*
Find the count of members who have made at least one booking
Question:
Find the total number of members (including guests) who have made at least one booking.
*/
--Answer 
SELECT COUNT(DISTINCT memid) FROM cd.bookings

/*

Question:


*/
--Answer 


/*

Question:


*/
--Answer 