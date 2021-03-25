/*****************************************
* Peforming a DELETE with a transaction
******************************************/
/*autocommit by default is set to on*/
Set autocommit = off;

/*start a transaction*/
start transaction;

/*DELETE on the enrollment*/
DELETE FROM enrollment
WHERE student_id = 1;
                   
/*DELETE FROM A STUDENT*/
DELETE FROM student
WHERE student_id = 1;

/*DELETE on Contact */
DELETE FROM contact
WHERE contact_id = (SELECT contact_id
						FROM student
					WHERE student_id = 1);


/*DELETE on Address*/
DELETE FROM address
WHERE  address_id = (SELECT address_id 
						FROM contact
					 WHERE contact_id = (SELECT contact_id
											FROM student
										WHERE student_id = 1));

/*Don't forget to commit*/
commit;

/*test*/
SELECT * FROM student
	WHERE student_id = 1;