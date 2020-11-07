  
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

-- Question:

*/
-- Answer

/*

-- Question:

*/
-- Answer
