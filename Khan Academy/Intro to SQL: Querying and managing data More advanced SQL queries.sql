/*
More Complex Queries With AND/OR
*/

-- Creating an Exercise log Table while using AND and OR as filters
CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);

/*
-- A shorter way to insert data into the table
INSERT INTO exercise_logs(type, minutes, calories, hear_rate) VALUES (("biking", 30, 100, 110),("biking", 10, 30, 105),("dancing", 15, 200, 120);
*/

SELECT * FROM exercise_logs WHERE calories > 50 ORDER BY calories;

/* AND */
SELECT * FROM exercise_logs WHERE calories > 50 AND minutes < 30;

/* OR */
SELECT * FROM exercise_logs WHERE calories > 50 OR heart_rate > 100;

/*
Challenge
Karaoke Song Selector
*/

CREATE TABLE songs (
    id INTEGER PRIMARY KEY,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER);
    
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);
    
-- Select the song title
SELECT title FROM songs;

-- Add another SELECT that uses OR to show the titles of the songs that have an 'epic' mood or a release date after 1990.
SELECT title FROM songs WHERE mood = 'epic' OR released > 1990;

-- Add another SELECT that uses AND to show the titles of songs that are 'epic', and released after 1990, and less than 4 minutes long.
SELECT title FROM songs WHERE mood = 'epic' AND released > 1990 AND duration < 240;


/*
Querying IN subqueries
*/

CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

SELECT * FROM exercise_logs WHERE type = "biking" OR type = "hiking" OR type = "tree climbing" OR type = "rowing";

-- Working with IN 
SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking", "tree climbing", "rowing");

-- Working with Sub QUeries

INSERT INTO drs_favorites(type, reason) VALUES ("biking", "Improves endurance and flexibility.");
INSERT INTO drs_favorites(type, reason) VALUES ("hiking", "Increases cardiovascular health.");

-- Selects the type column from the drs_favourites table
SELECT type FROM drs_favorites;

-- Selects the type from the drs_favorites table so the query does not break when the type is modified
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites);
    
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason = "Increases cardiovascular health");
    
-- Using LIKE which can be used with some wildcard characters such as *, ?, [], !, -, #
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");

/*
Challenge
Playlist Maker
*/

CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);

INSERT INTO artists (name, country, genre)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Bob Marley", "Jamaica", "Reggae");

CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO songs (artist, title)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO songs (artist, title)
    VALUES ("Rihanna", "Stay");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO songs (artist, title)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO songs (artist, title)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO songs (artist, title)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO songs (artist, title)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs (artist, title)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO songs (artist, title)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO songs (artist, title)
    VALUES ("Guns N' Roses", "Don't cry");
    
-- Select the title of all the songs by the artist named 'Queen'
SELECT title FROM songs WHERE artist = 'Queen';

-- Select the name of all of the artists from the 'Pop' genre
SELECT name FROM artists WHERE genre = 'Pop';

-- Add another query that will select the title of all the songs from the 'Pop' artists. It should use IN on a nested subquery that's based on your previous query
SELECT title FROM songs WHERE artist IN (
    SELECT name FROM artists WHERE genre = 'Pop');
    
/* 
Restricting grouped results with HAVING 
*/

CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 115, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 45, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

-- Show how much calorie was burnt for each type of activity 
SELECT type, SUM(calories) AS total_calories FROM exercise_logs GROUP BY type;

-- Show activities where a total of 150 calories were burnt  
SELECT type, SUM(calories) As total_calories FROM exercise_logs 
    GROUP BY type
    HAVING total_calories > 150;
    
-- Show the average calories for all exercises where more than 70 calories where burnt
SELECT type, AVG(calories) AS avg_calories FROM exercise_logs
    GROUP BY type
    HAVING avg_calories > 70; 
    
-- Show exercises which were carried out 2 or more times
SELECT type FROM exercise_logs 
    GROUP BY type 
    HAVING COUNT(1) >= 2;
    
 /*
 Challenge
 The wordiest author
 */

CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author TEXT,
    title TEXT,
    words INTEGER);
    
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);

INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Twilight", 118501);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Breaking Dawn", 192196);
    
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Return of the King", 134462);
    
-- Select all the authors who have written more than 1 million words the query should include the 'author' and their total word count as a 'total_words'
SELECT author, SUM(words) AS total_words FROM books
    GROUP BY author
    HAVING total_words > 1000000;
    
-- Select all the authors that write more than an average of 150,000 words per book the query should include the 'author' and average words as an 'avg_words' 
SELECT author, AVG(words) AS avg_words FROM books
    GROUP BY author
    HAVING avg_words > 150000;
    
/*
Calculating results with CASE
*/

CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

-- Check if you have a healthy heart rate (if your heart rate is less than 220 - your current age)
SELECT COUNT(*) FROM exercise_logs 
    WHERE heart rate > 220 - 20;
    
-- Check if your heart rate goes above the 'target zone (50% - 90% of max)

SELECT COUNT(*) FROM exercise_logs
    WHERE heart_rate >= ROUND(0.50 * (220 - 20)) AND
        heart_rate =< ROUND(0.90 * (220 - 20));                                 
    
-- Create a new column to group each row if "above max", "within taget" and "below target" using CASE
SELECT type, hear_rate 
    CASE
        WHEN heart_rate  > 220 - 0 THEN "above max"
        WHEN heart_rate  > ROUND(0.90 * (220 - 20)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220 - 20)) THEN "above target"
        ELSE "below target"
    END AS "hr_zone" 
FROM exercise_logs;
                                        
-- Counts how many fall in each of the groups created
SELECT COUNT(*),
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
    END AS "hr_zone"
FROM exercise_logs
GROUP BY hr_zone;

 /*
 Challenge
 Gradebook
 */
                                        
CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);
                                        
-- Select all of the rows, and display the name, number_grade, and percent_completed, which you can compute by multiplying and rounding the fraction_completed column.
SELECT name, number_grade, ROUND(fraction_completed * 100) AS percent_completed FROM student_grades; 
                                        
/*                                      
The goal is a table that shows how many students have earned which letter_grade. 
You can output the letter_grade by using CASE with the number_grade column, 
outputting 'A' for grades > 90, 'B' for grades > 80, 'C' for grades > 70, and 'F' otherwise. 
Then you can use COUNT with GROUP BY to show the number of students with each of those grades.
*/
                                                                       
SELECT COUNT(*),
    CASE 
        WHEN number_grade > 90 THEN "A"
        WHEN number_grade > 80 THEN "B"
        WHEN number_grade > 70 THEN "C"
        ELSE "F"
    END AS "letter_grade"
FROM student_grades
GROUP BY letter_grade;
                                        
/*
Project
Data dig
*/

/*
Earned Badges
This table contains badges earned by a user, including the most recent date achieved, the type, the name, the # of energy points earned, and the activity earned from.
Collected by: https://www.khanacademy.org/profile/chopsor/
*/

CREATE TABLE badges (
    date TEXT,
    badge_type TEXT,
    badge_name TEXT,
    energy_points INTEGER
);

INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/12", "Sun", "Oracle", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Earth", "Incredible Inspiration", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/29", "Challenge Patch", "Intro to JS: Drawing & Animation Mastery", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/05", "Meteorite", "Thumbs Up", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Moon", "1000 Kelvin", 1000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/25", "Earth", "299,792,458 Meters per Second", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/20", "Sun", "Da Vinci", 200000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Newton", 150000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Hypatia", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Kepler", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Copernicus", 80000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/07", "Sun", "Sally Ride", 35000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/06", "Sun", "Magellan", 30000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Earth", "Guru", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/29", "Earth", "Work Horse", 14000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 10/20", "Moon", "Redwood", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2013, 10/20", "Meteorite", "Cypress", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/18", "Sun", "Millionaire", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/27", "Earth", "Five Times Ten to the Fifth", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/04", "Earth", "Investigator", 0);

-- What are average, max, and min values in the data?
SELECT MAX(energy_points) FROM badges;
SELECT AVG(energy_points) FROM badges;
SELECT MIn(energy_points) FROM badges;

-- What about those numbers per category in the data (using HAVING)?
SELECT badge_type, COUNT(badge_type) AS no_of_badges FROM badges
GROUP BY badge_type
HAVING badge_type >= 0;

-- What ways are there to group the data values that don’t exist yet (using CASE)?
SELECT COUNT(*), energy_points,
    CASE 
        WHEN energy_points > 180000 THEN "100 Hours or more"
        WHEN energy_points > 100000 THEN "70 Hours or more"
        WHEN energy_points > 10000 THEN "50 Hours or more"
        WHEN energy_points > 1000 THEN "20 Hours or more"
        ELSE "Less than 20 Hours"
    END AS "approx_time_spent"
FROM badges
GROUP BY approx_time_spent;

-- What interesting ways are there to filter the data (using AND/OR)?
SELECT energy_points, badge_name FROM badges
WHERE energy_points > 2000 AND badge_name = "Newton"; 
                                                                         
