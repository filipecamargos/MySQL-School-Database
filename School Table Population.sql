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
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/


/*******************************************************
*
********************************************************/
