/********************************************
* THIS FILE CONTAINS THE OPERATION TO TEST
* DATABASE BASED ON THE DATA THAT HAS BEING
* INSERTED ON THE School Table Population
*********************************************/

/*************************************************************
* JOIN with instructor and department on the ids
* to know what department a instructor belongs
**************************************************************/
SELECT i.instructor_id, i.first_name, i.last_name, d.department_name
	FROM instructor i
	JOIN department d 
		ON i.department_id = d.department_id;
    
/**************************************************************
* JOIN with class and department to know what 
* department is reponsible for what classes
**************************************************************/
SELECT c.class_id, c.class_title, d.department_name
	FROM class c
	JOIN department d 
		ON c.department_id = d.department_id;
    
 /**************************************************************
* Multiples LEFT JOIN with the instructor, class, and department
* table to check what class each professor can teach and what 
* department they are from and the location
**************************************************************/   
SELECT i.first_name, c.class_title, d.department_name, 
		concat(l.building, ' ', l.room_number) office
	FROM instructor i
    LEFT JOIN class c 
		ON i.department_id = c.department_id
    LEFT JOIN department d 
		ON c.department_id = d.department_id
	LEFT JOIN campus_location l
		ON i.office_location = l.location_id
	ORDER BY c.class_id;
    
/**************************************************************
* Query using JOINs to know what classes are avalable, who are the 
* teachers and from what department
***************************************************************/
SELECT c.class_title, concat(i.first_name, ' ', i.last_name) as instructor, d.department_name, a.avalaible_class_id
	FROM avalaible_class a
	LEFT JOIN class c
    ON a.avalaible_class_id = c.class_id
    LEFT JOIN instructor i 
    ON a.instructor_id = i.instructor_id
    LEFT JOIN department d
    ON i.department_id = d.department_id
    WHERE class_title IS NOT NULL;

/************************************ 
* USING JOIN and FILTER to Return 
* the avalaible class id based
* on the class name using right Join
*************************************/
SELECT c.class_title, a.avalaible_class_id
		FROM avalaible_class a
        LEFT JOIN class c
        ON c.class_id = a.avalaible_class_id
WHERE c.class_title = 'Piano';

/*****************************************
* Use the contact, address, major, minor,
* major department, and the student table
* to get information on the student
******************************************/
SELECT concat(s.first_name, ' ', s.last_name) as student, s.birth_day,
	c.phone, concat(a.street_address, ' ', a.city) as address,
    ma.major_name, mi.minor_name, d.department_name as department
FROM student s
	LEFT JOIN contact c
		ON s.contact_id = c.contact_id
	LEFT JOIN address a
		ON c.address_id = a.address_id
	LEFT JOIN major ma
		ON s.major_id = ma.major_id
	LEFT JOIN department d
		ON ma.department_id = d.department_id
	LEFT JOIN minor mi
		ON s.minor_id = mi.minor_id;

/*******************************************
* Check what classes are in a department
* using the class and the departament table
********************************************/
SELECT c.class_title, d.department_name
FROM class c 
	LEFT JOIN department d
		ON c.department_id = d.department_id;
        
/************************************************************
* Check what students class enrollment information using
* student class, available_class, student, intructor,
* campus_location and enrollamment table
************************************************************/
SELECT concat(s.first_name, ' ', s.last_name) as name, 
		c.class_title, concat(i.first_name, ' ', i.last_name) instructor,
        e.enrollment_date, concat(l.building, ' ', l.room_number)
	FROM enrollment e
		RIGHT JOIN student s
			ON s.student_id = e.student_id
        RIGHT JOIN avalaible_class a
			ON a.avalaible_class_id = e.avalaible_class_id
		RIGHT JOIN class c
			ON c.class_id = a.avalaible_class_id
		RIGHT JOIN instructor i
			ON a.instructor_id = i.instructor_id
	WHERE s.first_name IS NOT NULL;

/*************************************************
* Check the assigments created, for what classe 
* they are and what intructor created them as well
* the date it was created and the repository
**************************************************/
SELECT a.title, c.class_title, concat(i.first_name, ' ', i.last_name) as name,
		a.created_date, a.assigment_repo
	FROM assigment a
		LEFT JOIN class c
			ON a.class_id = c.class_id
		LEFT JOIN instructor i
			ON a.publisher_id = i.instructor_id
	ORDER BY a.title;
            
/************************************************************
* Update the student table by change a last name
************************************************************/
UPDATE student 
	SET first_name  = 'John',
		last_name = 'Dough'
    WHERE student_id = 1;

SELECT first_name, last_name
	FROM student 
    WHERE student_id = 1;

/************************************************************
*  Update the address and then and do a JOIN between the 
* student, contact and address to check the result
*************************************************************/
UPDATE address
	SET street_address = 'Julius Cezar',
		city = 'Alexandria',
        state = 'Rome',
        country = 'Marcedonia',
        postal_code = '589657'
	WHERE address_id =  (SELECT address_id
							FROM contact 
							WHERE contact_id = (SELECT contact_id
												FROM student 
												WHERE student_id = 1));
                                                
/*Test Result*/
SELECT concat(s.first_name, ' ', s.last_name) name, a.street_address, 
				a.city, a.state, a.country, a.postal_code
	FROM student s
		JOIN contact c 
			ON s.contact_id = c.contact_id
		JOIN address a 
			ON a.address_id = c.address_id
WHERE s.student_id = 1;    