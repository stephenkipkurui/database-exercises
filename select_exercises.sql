# Basic Statements SQL Exercises

SHOW DATABASES;
USE `albums_db`;

SHOW TABLES IN `albums_db`;
DESCRIBE TABLE albums;

#1. Created select_exercises.sql
#2. Selected albums_db
#3. Structure of album:  
		#a. Rows: 31
SELECT * FROM albums;

	 #b. Unique artists names in albums table: 31
	 
SELECT COUNT(DISTINCT name) FROM albums as unique_names_count;

	 #c.  Primary Key: id 
	 #d. Oldest release date for any album in albums table: 1967
	 
SELECT MIN(`release_date`) FROM albums;


#4. a. Name of album by Pink Floyd: The Dark Side of the Moon & The Wall
SELECT name FROM albums WHERE artist = 'Pink Floyd';

#b: Year SGT Pepper was released: 1967
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club band';

#c. Genre of album Nevermind: Grudge, Alternative rock
SELECT genre FROM albums WHERE name = "Nevermind";

#d. Album released in 1990s
SELECT name from albums WHERE `release_date` >= 1990 and `release_date` <= 1999;

#e. Albums less than 20 million certified sales:
SELECT name FROM albums WHERE sales <= 20.0;

#f. 





		

