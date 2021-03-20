/********************************************
* The code to create the tables used in this
* database
***********************************************/

/***************************
Create the Student Table
*****************************/ 
CREATE TABLE `school`.`student` (
  `student_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `birth_day` DATE NOT NULL,
  `major_id` INT NOT NULL,
  `minor_id` INT NULL,
  `marital_status` VARCHAR(45) NOT NULL CHECK (marital_status IN ('Single', 'Married', 'Divorced', 'Widow')),
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (major_id) REFERENCES major(major_id),
  FOREIGN KEY (minor_id) REFERENCES minor(minor_id),
  FOREIGN KEY (contact_id) REFERENCES contact(contact_id));
  
/*Update*/
ALTER TABLE `school`.`student` 
ADD COLUMN `sex` VARCHAR(8) NOT NULL CHECK (sex IN ('Male' 'Female'))AFTER `birth_day`;

/***************************
*Create the Major table 
*****************************/  
CREATE TABLE `school`.`major` (
  `major_id` INT NOT NULL AUTO_INCREMENT,
  `major_name` VARCHAR(45) NOT NULL,
  `catalog_year` DATE NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`major_id`),
  FOREIGN KEY (department_id) REFERENCES department(department_id));

/***************************
*Create the Minor table 
*****************************/
CREATE TABLE `school`.`minor` (
  `minor_id` INT NOT NULL AUTO_INCREMENT,
  `minor_name` VARCHAR(45) NOT NULL,
  `catalog_year` DATE NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`minor_id`),
  FOREIGN KEY (department_id) REFERENCES department(department_id));
  
/*********************************
* Create the contact Table
*********************************/
CREATE TABLE `school`.`contact`(
	`contact_id` INT NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(100) NOT NULL,
    `city` VARCHAR(45) NOT NULL,
    `postal_code` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(45) NOT NULL,
    `last_updated` DATE NOT NULL,
    PRIMARY KEY (`contact_id`)
);

/*Update*/
ALTER TABLE `school`.`contact` 
ADD COLUMN `email` VARCHAR(45) NOT NULL AFTER `phone`;

ALTER TABLE `school`.`contact` 
DROP COLUMN `postal_code`,
DROP COLUMN `city`,
CHANGE COLUMN `address` `address_id` INT NOT NULL ,
ADD INDEX `address_id_idx` (`address_id` ASC) VISIBLE;
;
ALTER TABLE `school`.`contact` 
ADD CONSTRAINT `address_id`
  FOREIGN KEY (`address_id`)
  REFERENCES `school`.`address` (`address_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*********************************
* Create the Address Table
**********************************/
CREATE TABLE `school`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`));
  
/***************************
* Create the Department table 
*****************************/
CREATE TABLE `school`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  `department_budget` DOUBLE(10, 2) NOT NULL,
  PRIMARY KEY (`department_id`));

/***************************
* Create the Employee table 
*****************************/
CREATE TABLE `school`.`instructor` (
  `intructor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `contact_id` INT NOT NULL,
  `salary` DOUBLE(7, 2) NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`intructor_id`),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (contact_id) REFERENCES contact(contact_id));

/*UPDATE*/
ALTER TABLE `school`.`instructor`
ADD COLUMN `sex` VARCHAR(8) NOT NULL CHECK (sex IN ('Male', 'Female'))AFTER `last_name`;

/*UPDATE*/
ALTER TABLE `school`.`instructor` 
ADD COLUMN `office_location` INT NULL AFTER `department_id`,
ADD INDEX `instructor_ibfk_3_idx` (`office_location` ASC) VISIBLE;
;
ALTER TABLE `school`.`instructor` 
ADD CONSTRAINT `instructor_ibfk_3`
  FOREIGN KEY (`office_location`)
  REFERENCES `school`.`campus_location` (`location_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
/*******************************
* Create Classe table
********************************/
CREATE TABLE `school`.`class` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `class_title` VARCHAR(45) NOT NULL,
  `class_code` VARCHAR(8) NOT NULL,
  `class_level` INT NOT NULL CHECK (class_level IN (100, 200, 300, 400)),
  `credits` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`class_id`),
  FOREIGN KEY (department_id) REFERENCES department(department_id));

/**********************************
* Create Current Classe Table
***********************************/
CREATE TABLE `school`.`avalaible_class` (
  `avalaible_class_id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`avalaible_class_id`),
  FOREIGN KEY (location_id) REFERENCES location(location_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id),
  FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id));
  
/***************************************
* Create Enrollment Table
****************************************/
CREATE TABLE `school`.`enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `avalaible_class_id` INT NOT NULL,
  `student_id` INT UNSIGNED NOT NULL,
  `enrollment_date` DATETIME NOT NULL,
  `grade` VARCHAR(1) NOT NULL,
  FOREIGN KEY (avalaible_class_id) REFERENCES avalaible_class(avalaible_class_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  PRIMARY KEY (`enrollment_id`));
  
/*UPdate*/
ALTER TABLE `school`.`enrollment` 
CHANGE COLUMN `grade` `grade` VARCHAR(1) NULL ;
  
/******************************************
* Cumpus Location
*******************************************/
CREATE TABLE `school`.`campus_location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `building` VARCHAR(45) NULL,
  `room_number` INT NULL,
  PRIMARY KEY (`location_id`));

/******************************************
* Create an Assigment table
*******************************************/
CREATE TABLE `school`.`assigments` (
  `assigments_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(60) NOT NULL,
  `class_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
	FOREIGN KEY (publisher_id) REFERENCES instructor(instructor_id),
	FOREIGN KEY (class_id) REFERENCES class(class_id),
	PRIMARY KEY (`assigments_id`));

/*Update*/
ALTER TABLE `school`.`assigments` 
ADD COLUMN `created_date` DATE NOT NULL AFTER `publisher_id`,
ADD COLUMN `assigment_repo` VARCHAR(300) NOT NULL AFTER `created_date`;

ALTER TABLE `school`.`assigments` 
RENAME TO  `school`.`assigment` ;




  