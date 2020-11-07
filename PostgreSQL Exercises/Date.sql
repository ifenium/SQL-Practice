  
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

-- Question:

*/
-- Answer


-- Question:

*/
-- Answer
