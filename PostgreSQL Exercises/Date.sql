  
--Queries based on exercises from PostgreSQL Exercises (https://pgexercises.com/questions/basic/)

/*
Working with Timestamps
Dates/Times in SQL are a complex topic, deserving of a category of their own. 
They're also fantastically powerful, making it easier to work with variable-length concepts like 'months' than many programming languages. 
*/

/*
Produce a timestamp for 1 a.m. on the 31st of August 2012
-- Question:
Produce a timestamp for 1 a.m. on the 31st of August 2012.
*/
-- Answer
SELECT timestamp '2012-08-31 01:00:00';

/*
Subtract timestamps from each other
-- Question:
Find the result of subtracting the timestamp '2012-07-30 01:00:00' from the timestamp '2012-08-31 01:00:00'
*/
-- Answer
SELECT timestamp '2012-08-31 01:00:00' - timestamp '2012-07-30 01:00:00' AS interval;

/*
Generate a list of all the dates in October 2012
-- Question:
Produce a list of all the dates in October 2012. 
They can be output as a timestamp (with time set to midnight) or a date.
*/
-- Answer
SELECT generate_series(timestamp '2012-10-01', timestamp '2012-10-31', interval '1 day')AS ts;

/*
Get the day of the month from the timestamp '2012-08-31' as an integer.
-- Question:
Get the day of the month from the timestamp '2012-08-31' as an integer.
*/
-- Answer
SELECT EXTRACT(DAY from timestamp '2012-08-31');

/*
Work out the number of seconds between timestamps
Question:
Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'
*/
-- Answer
SELECT EXTRACT(EPOCH FROM timestamp '2012-09-02 00:00:00'- timestamp '2012-08-31 01:00:00') AS date_part

/*
Work out the number of days in each month of 2012
-- Question:
For each month of the year in 2012, output the number of days in that month. 
Format the output as an integer column containing the month of the year, and a second column containing an interval data type.
*/
-- Answer

SELECT EXTRACT(MONTH FROM cal.month) AS month, 
		(cal.month + interval '1 month') - cal.month AS length
FROM (
	SELECT generate_series(timestamp '2012-01-01', timestamp '2012-12-01', interval '1 month') AS month
  ) AS cal
ORDER BY month;

--or
-- Using CTE
WITH cal AS (
  SELECT * 
  FROM generate_series(timestamp '2012-01-01', timestamp '2012-12-01', interval '1 month') AS month
 )
 
SELECT EXTRACT(MONTH FROM cal.month) AS month, 
		(cal.month + interval '1 month') - cal.month AS length
FROM cal
ORDER BY month;

/*
Work out the number of days remaining in the month
-- Question:
For any given timestamp, work out the number of days remaining in the month. 
The current day should count as a whole day, regardless of the time. Use '2012-02-11 01:00:00' as an example timestamp for the purposes of making the answer. 
Format the output as a single interval value.
*/
-- Answer
SELECT (date_trunc('month', ts.testts) + interval '1 month')
		- date_trunc('day', ts.testts) AS remaining
FROM (SELECT timestamp '2012-02-11 01:00:00' AS testts) AS ts;

/*
-- Question:

*/
-- Answer


/*
-- Question:

*/
-- Answer

