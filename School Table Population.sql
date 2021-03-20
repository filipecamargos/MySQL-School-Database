/******************************************************
* THis File will demostrate How to populate the 
* Database - The CREATE of the CRUD operations
*******************************************************/

/*******************************************************
* Add data to the Address Table
********************************************************/
INSERT INTO address (address.street_address, address.city,   address.state, address.country, address.postal_code)
VALUES ('21 116th Street E', 'Lewis', 'Washington', 'US','98377'),
		('41 1st Avenue', 'Lewis', 'Washington', 'US','98377'),
		('20 2nd Avenue', 'Lewis', 'Washington', 'US','98377'),
		('3 2nd Avenue S', 'Lewis', 'Washington', 'US','98377'),
		('17 43rd Avenue SW', 'Lewis', 'Washington', 'US','98377'),
		('35 Baise Lane', 'Lewis', 'Washington', 'US','98377'),
		('23 Beryl Road', 'Lewis', 'Washington', 'US','98377'),
		('51 Boyd Road',  'Lewis', 'Washington', 'US','98377'),
		('47 Broken Street E ', 'Lewis', 'Washington', 'US','98377'),
		('101 Broken 2nd Street E ', 'Lewis', 'Washington', 'US','98377');

/*Test*/
SELECT * FROM address;

/*******************************************************
*  Add data to the Contact Table
********************************************************/
INSERT INTO contact (address_id, phone,   email, last_updated)
VALUES ( 1, '123-456-789', 'a@a.com', now()),
		(2, '223-456-789', 'b@a.com', now()),
		(3, '323-456-789', 'c@a.com', now()),
		(4, '423-456-789', 'd@a.com', now()),
		(5, '523-456-789', 'e@a.com', now()),
		(6, '623-456-789', 'f@a.com', now()),
		(7, '723-456-789', 'g@a.com', now()),
		(8,  '823-456-789', 'h@a.com', now()),
		(9, '923-456-789', 'i@a.com', now()),
		(10, '103-456-789', 'j@a.com', now());
        
/*Test*/
SELECT * FROM contact;

/*******************************************************
* Add data to the Departament Table
********************************************************/
INSERT INTO department (department_name, department_budget)
VALUE ('Computer Information Technology', 500000),
		('Computer Science', 1000000),
        ('Engineering', 800000),
        ('Arts', 400000),
        ('Science', 2000000),
        ('Math & Statistics', 1000000),
        ('Language', 400000);

/*Test*/
SELECT * FROM department;

/*******************************************************
* Add data to the Class Table
********************************************************/
INSERT INTO class (class_title, class_code, class_level, credits, department_id)
VALUE ("Intro to Technology", 'CIT 101', 100, 3, (select department_id FROM department WHERE department_name = 'Computer Information Technology')),
	("English Foudation", 'ENG 101', 100, 3, (select department_id FROM department WHERE department_name = 'Language')),
    ("Statistics", 'MS 231', 200, 4, (select department_id FROM department WHERE department_name = 'Math & Statistics')),
    ("Piano", 'ART 110', 100, 2, (select department_id FROM department WHERE department_name = 'Arts')),
    ("Algebra", 'MS 111', 100, 3, (select department_id FROM department WHERE department_name = 'Math & Statistics')),
    ("Intro to Mechanical Engineering", 'CS 150', 100, 3, (select department_id FROM department WHERE department_name = 'Engineering')),
    ("Programing Intro", 'CS 101', 100, 3, (select department_id FROM department WHERE department_name = 'Computer Science')),
    ("Portugues Intro", 'LNG 100', 100, 2, (select department_id FROM department WHERE department_name = 'Language')),
    ("Data Base Development", 'CIT 225', 200, 3, (select department_id FROM department WHERE department_name = 'Computer Information Technology')),
    ("Algarithms", 'CS 151', 100, 3, (select department_id FROM department WHERE department_name = 'Computer Science')),
    ("Geography Intro", 'SC 101', 100, 3, (select department_id FROM department WHERE department_name = 'Science')),
    ("Biology Intermediate", 'SC 200', 100, 4, (select department_id FROM department WHERE department_name = 'Science'));
    
/*Test*/
SELECT * FROM class;

/*******************************************************
* Add data to the Campus location Table
********************************************************/
INSERT INTO campus_location(building, room_number)
VALUE ('SMITH', 101),
	  ('STC', 221),
	  ('Robert', 107),
	  ('Robert', 103),
	  ('Robert', 301),
	  ('Emma Loof', 221),
	  ('George Bush', 105),
	  ('SMITH', 225),
	  ('SMITH', 335),
      ('Emma Loof', 331),
      ('SMITH', 103),
	  ('STC', 281),
	  ('Robert', 108),
	  ('Robert', 107),
	  ('Robert', 371),
	  ('Emma Loof', 228),
	  ('George Bush', 107),
	  ('SMITH', 282),
	  ('SMITH', 345),
      ('Emma Loof', 375);

/*Test*/
SELECT * FROM campus_location;

/*******************************************************
* Add data to the Instructor Table
********************************************************/
INSERT INTO instructor (first_name, last_name, sex, contact_id, salary, department_id, office_location)
VALUE ('Lynwood',  'Sligh', 'Female', 1, 65000, (SELECT department.department_id from department WHERE department_name = 'Language'), (RAND() * (10 - 1) + 1)),
	('Torrie',  'Brook', 'Male', 2, 65000, (SELECT department.department_id from department WHERE department_name = 'Math & Statistics'), (RAND() * (10 - 1) + 1)),
    ('John',  'Moore', 'Male', 3, 65000, (SELECT department.department_id from department WHERE department_name = 'Science'), (RAND() * (10 - 1) + 1)),
    ('Cindy',  'Brook', 'Female', 4, 65000, (SELECT department.department_id from department WHERE department_name = 'Science'), (RAND() * (10 - 1) + 1)),
    ('Kueku',  'Appu', 'Male', 5, 65000, (SELECT department.department_id from department WHERE department_name = 'Engineering'), (RAND() * (10 - 1) + 1)),
    ('Dalin',  'Roberts', 'Male', 6, 65000, (SELECT department.department_id from department WHERE department_name = 'Computer Science'), (RAND() * (10 - 1) + 1)),
    ('Maria',  'Elizabeth', 'Female', 7, 65000, (SELECT department.department_id from department WHERE department_name = 'Computer Information Technology'), (RAND() * (10 - 1) + 1)),
    ('Marcu',  'Hommy', 'Male', 8, 65000, (SELECT department.department_id from department WHERE department_name = 'Arts'), (RAND() * (10 - 1) + 1)),
    ('Dave',  'Moolar', 'Male', 9, 65000, (SELECT department.department_id from department WHERE department_name = 'Engineering'), (RAND() * (10 - 1) + 1)),
    ('Lidya',  'Smith', 'Female', 10, 65000, (SELECT department.department_id from department WHERE department_name = 'Computer Science'), (RAND() * (10 - 1) + 1));
 
/*test*/
SELECT * FROM instructor;

/*******************************************************
* Add data to the Instructor Table
********************************************************/
INSERT INTO major(major_name, catalog_year, department_id)
VALUE ('Software Engineering', '2020-03-20', (SELECT department_id FROM department WHERE department_name = 'Computer Science')),
	('Computer Science', '2020-04-19', (SELECT department_id FROM department WHERE department_name = 'Computer Science')),
    ('Mechanical Engineerin', '2020-05-20', (SELECT department_id FROM department WHERE department_name = 'Engineering')),
    ('Music', '2020-03-18', (SELECT department_id FROM department WHERE department_name = 'Arts')),
    ('English', '2020-03-17', (SELECT department_id FROM department WHERE department_name = 'Language')),
    ('Cyber Security', '2020-10-20', (SELECT department_id FROM department WHERE department_name = 'Computer Information Technology')),
    ('Biology', '2021-03-20', (SELECT department_id FROM department WHERE department_name = 'Science')),
    ('Geography', '2019-03-20', (SELECT department_id FROM department WHERE department_name = 'Science')),
    ('Statistics', '2018-03-20', (SELECT department_id FROM department WHERE department_name = 'Math & Statistics')),
    ('Applied Tech', '2019-03-21', (SELECT department_id FROM department WHERE department_name = 'Computer Information Technology'));

/*Test*/
SELECT * FROM major;

/*******************************************************
* Add data to the Minor table
********************************************************/
INSERT INTO minor(minor_name, catalog_year, department_id)
VALUE ('Programing', '2020-03-20', (SELECT department_id FROM department WHERE department_name = 'Computer Science')),
	('Machine Learning', '2020-04-19', (SELECT department_id FROM department WHERE department_name = 'Computer Science')),
    ('Auto Mechanics', '2020-05-20', (SELECT department_id FROM department WHERE department_name = 'Engineering')),
    ('Dance', '2020-03-18', (SELECT department_id FROM department WHERE department_name = 'Arts')),
    ('Spanish', '2020-03-17', (SELECT department_id FROM department WHERE department_name = 'Language')),
    ('Data Base Development', '2020-10-20', (SELECT department_id FROM department WHERE department_name = 'Computer Information Technology')),
    ('Animal Science', '2021-03-20', (SELECT department_id FROM department WHERE department_name = 'Science')),
    ('Weather Cast', '2019-03-20', (SELECT department_id FROM department WHERE department_name = 'Science')),
    ('Statistics', '2018-03-20', (SELECT department_id FROM department WHERE department_name = 'Math & Statistics')),
    ('Computer Systems', '2019-03-21', (SELECT department_id FROM department WHERE department_name = 'Computer Information Technology'));

/*Test*/
SELECT * FROM minor;

/*******************************************************
* Populate the Avaible Class table
********************************************************/
INSERT INTO avalaible_class(class_id, instructor_id, start_date, end_date)
VALUE (1, 7, '2021-05-05', '2021-09-05'),
	(3, 1, '2021-05-05', '2021-09-05'),
    (4, 2, '2021-05-05', '2021-09-05'),
    (5, 8, '2021-05-05', '2021-09-05'),
    (6, 2, '2021-05-05', '2021-09-05'),
    (7, 5, '2021-05-05', '2021-09-05'),
	(7, 9, '2021-05-05', '2021-09-05'),
    (8, 6, '2021-05-05', '2021-09-05'),
    (8, 10, '2021-05-05', '2021-09-05'),
    (9, 1, '2021-05-05', '2021-09-05'),
    (10, 7, '2021-05-05', '2021-09-05'),
    (11, 6, '2021-05-05', '2021-09-05'),
    (11, 10, '2021-05-05', '2021-09-05'),
    (12, 3, '2021-05-05', '2021-09-05'),
    (12, 4, '2021-05-05', '2021-09-05'),
    (13, 3, '2021-05-05', '2021-09-05'),
    (13, 4, '2021-05-05', '2021-09-05');

/*test*/
SELECT * FROM avalaible_class; 
  
/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/
