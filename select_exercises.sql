# BASIC STATEMENTS EXERCISES 

-- 1). CREATE a NEW FILE called select_exercises.sql. Store your CODE FOR this exercise IN that file. You should be testing your CODE IN Sequel Ace AS you go.
# Completed

-- 2). USE the albums_db database.
USE `albums_db`;

-- 3). Explore the structure of the albums table.
DESCRIBE TABLE albums;

-- a. How many ROWS are IN the albums TABLE? #31
SELECT COUNT(*) AS 'Record Count' FROM albums;


-- b. How many UNIQUE artist NAMES are IN the albums TABLE?
SELECT COUNT(DISTINCT(artist)) AS 'Distinct Artists'  FROM albums; #23


-- c. What IS the PRIMARY KEY FOR the albums TABLE?
DESCRIBE albums; # 'id' field is the PRIMARY KEY

-- d. What IS the oldest RELEASE DATE FOR ANY album IN the albums TABLE? What IS the most recent RELEASE DATE?
SELECT MIN(`release_date`) AS 'Oldest Release Date' FROM albums; #1967


-- 4). WRITE queries TO find the following information:

-- a. The NAME of ALL albums BY Pink Floyd
SELECT NAME FROM albums WHERE artist = 'Pink Floyd';

-- b. The YEAR Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date AS 'Sgt Pepper Release Date' FROM albums WHERE NAME = 'Sgt. Pepper\'s Lonely Hearts Club band';

-- c. The genre for the album Nevermind
SELECT genre AS 'Nevermind Album' FROM albums WHERE NAME = "Nevermind";

-- d. Which albums were released IN the 1990s
SELECT NAME AS 'Albums Released in 1990s' FROM albums WHERE `release_date` >= 1990 AND `release_date` <= 1999;

SELECT NAME, release_date, artist FROM albums WHERE `release_date` BETWEEN 1990 AND 1999;


-- e. Which albums had LESS THAN 20 million certified sales
SELECT NAME AS 'Albums with Less than 20 million Sales' FROM albums WHERE sales <= 20.0;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT NAME AS 'Rock Genre Albums' FROM albums WHERE genre LIKE '%Rock%';






		

