--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Aggregation is one of those capabilities that really make you appreciate the power of relational database systems. 
It allows you to move beyond merely persisting your data, into the realm of asking truly interesting questions that can be used to inform decision making. 
This category covers aggregation at length, making use of standard grouping as well as more recent window functions.
*/

/*
Count the number of facilities
Question:
For our first foray into aggregates, we're going to stick to something simple. 
We want to know how many facilities exist - simply produce a total count.f
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
Produce a count of the number of recommendations each member has made. 
Order by member ID.
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
Produce a list of the total number of slots booked per facility. 
For now, just produce an output table consisting of facility id and slots, sorted by facility id.
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
List facilities with more than 1000 slots booked
Question:
Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and slots, sorted by facility id.
*/
--Answer 
SELECT facid, SUM(slots) AS "Total Slots" 
  FROM cd.bookings
  GROUP BY facid
  HAVING SUM(slots) > 1000
  ORDER BY facid;

/*
Find the total revenue of each facility
Question:
Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. 
Remember that there's a different cost for guests and members!
*/
--Answer 
SELECT facs.name, SUM(slots * 
					  CASE 
					  	WHEN memid = 0 THEN facs.guestcost
					   	ELSE facs.membercost
					  	END) AS revenue

	FROM cd.bookings AS bks
	INNER JOIN cd.facilities AS facs
		ON bks.facid = facs.facid 
	GROUP BY facs.name
ORDER BY revenue;

/*
Find facilities with a total revenue less than 1000
Question:
Produce a list of facilities with a total revenue less than 1000. 
Produce an output table consisting of facility name and revenue, sorted by revenue. 
Remember that there's a different cost for guests and members!
*/
--Answer 
SELECT facs.name, SUM(slots * 
				CASE
					WHEN memid=0 THEN facs.guestcost
				ELSE facs.membercost
				END) AS revenue
	FROM cd.bookings AS bks
	INNER JOIN cd.facilities AS facs
		ON facs.facid = bks.facid
	GROUP BY facs.name
	HAVING SUM(slots * 
				CASE
					WHEN memid=0 THEN facs.guestcost
				ELSE facs.membercost
				END) < 1000
ORDER BY revenue;

--or 
SELECT name, revenue FROM(
				  SELECT facs.name, SUM(CASE
											WHEN memid = 0 THEN slots * facs.guestcost
											ELSE slots * facs.membercost
										END) AS revenue 
						FROM cd.bookings AS bks
						INNER JOIN cd.facilities AS facs
							ON bks.facid = facs.facid
						GROUP BY facs.name
					) AS agg 
	WHERE revenue < 1000
	ORDER BY revenue;

/*
Output the facility id that has the highest number of slots booked
Question:
Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!
*/
--Answer 
SELECT facid, SUM(slots) AS "Total Slots"
  FROM cd.bookings
  GROUP BY facid
ORDER BY SUM(slots) DESC 
LIMIT 1;

--or
WITH sum as (SELECT facid, SUM(slots) AS totalslots
	FROM cd.bookings
	GROUP BY facid
)
SELECT facid, totalslots 
	FROM sum 
	WHERE totalslots = (SELECT MAX(totalslots) FROM sum); 
	
/*
List the total slots booked per facility per month, part 2
Question:
Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month. When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.
*/
--Answer 
SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS "Total Slots" 
  FROM cd.bookings
   WHERE EXTRACT(YEAR FROM starttime) = '2012' 
  GROUP BY rollup(facid,month)
 ORDER BY facid,month;

/*
List the total hours booked per named facility
Question:
Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. 
The output table should consist of the facility id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places.
*/
--Answer 
SELECT facs.facid, facs.name, TRIM(TO_CHAR(SUM(bks.slots)/2.0, '9999999999999999D99')) AS "Total Hours"
FROM cd.bookings AS BKS
	INNER JOIN cd.facilities AS facs
		ON bks.facid = facs.facid
	GROUP BY facs.facid, facs.name
ORDER BY facs.facid;
																	 
/*
List each member's first booking after September 1st 2012
Question:
Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.
*/
--Answer 
SELECT mems.surname, mems.firstname, mems.memid, MIN(bks.starttime) AS starrtime
	FROM cd.members AS mems
	INNER JOIN cd.bookings AS bks
		ON mems.memid = bks.memid
	WHERE starttime >= '2012-09-01'
	GROUP BY mems.surname, mems.firstname, mems.memid
ORDER BY mems.memid;
																					 
/*
Produce a list of member names, with each row containing the total member count
Question:
Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.
*/
--Answer 

/*

Question:

*/
--Answer 
