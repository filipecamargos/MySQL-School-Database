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
* department they are from
**************************************************************/   
SELECT i.first_name, c.class_title, c.class_id, i.instructor_id, d.department_name, c.department_id, i.office_location
	FROM instructor i
    LEFT JOIN class c 
		ON i.department_id = c.department_id
    LEFT JOIN department d 
		ON c.department_id = d.department_id
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

