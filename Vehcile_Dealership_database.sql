DROP SCHEMA mydb;
CREATE SCHEMA mydb;
USE mydb;

-- -----------------------------------------------------
-- Table `mydb`.`showroom`
-- -----------------------------------------------------
CREATE TABLE showroom (
  branch_id CHAR(5) NOT NULL,
  showroom_name VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  phone LONGTEXT,
  PRIMARY KEY (branch_id)
  );
  
-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE departments (
  dept_id INT NOT NULL,
  dept_name VARCHAR(45),
  dept_status VARCHAR(45),
  manager_id INT,
  branch_id CHAR(5),
  no_of_staff INT,
  PRIMARY KEY (dept_id),
  FOREIGN KEY (branch_id) REFERENCES showroom(branch_id)
);

-- -----------------------------------------------------
-- Table `mydb`.`staff`
-- -----------------------------------------------------
CREATE TABLE staff (
  staff_id INT,
  staff_name VARCHAR(45),
  staff_Hiring DATE,
  staff_status VARCHAR(45),
  staff_phone LONGTEXT,
  staff_address VARCHAR(45),
  staff_salary INT,
  manager_id INT,
  dept_name VARCHAR(45),
  dept_id INT,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
  );

-- -----------------------------------------------------
-- Table `mydb`.`vehicless`
-- -----------------------------------------------------
CREATE TABLE vehicles (
  vehicle_id INT,
  vehicle_name VARCHAR(45),
  vehicle_make VARCHAR(45),
  vehicle_year YEAR,
  vehicle_type VARCHAR(45),
  vehicle_status VARCHAR(45),
  vehicle_condition INT,
  vehicle_color VARCHAR(45),
  vehicle_price VARCHAR(45),
  PRIMARY KEY (vehicle_id)
);

-- -----------------------------------------------------
-- Table `mydb`.`parts`
-- -----------------------------------------------------
CREATE TABLE parts (
	part_id INT NOT NULL,
	part_name VARCHAR(45),
    part_make VARCHAR(45),
    part_price VARCHAR(45),
	PRIMARY KEY (part_id)
    );

-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE services (
  service_id INT NOT NULL,
  service_name VARCHAR(45),
  part_id INT,
  service_price INT,  
  staff_name VARCHAR(45),
  staff_id INT,
  part_name VARCHAR(45),
  service_date DATE,
  vehicle_id INT,
  PRIMARY KEY (service_id),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (part_id) REFERENCES parts(part_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
  );

-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE customers(
  customer_id INT NOT NULL,
  customer_name VARCHAR(45),
  customer_phone LONGTEXT,
  vehicle_id INT,
  service_id INT,
  customer_notes VARCHAR(100),
  PRIMARY KEY (customer_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
  );

-- -----------------------------------------------------
-- Table `mydb`.`payments`
-- -----------------------------------------------------
CREATE TABLE payments (
  transaction_id INT NOT NULL,
  amount INT,
  staff_id INT,
  customer_id INT,
  service_id INT,
  part_price INT,
  part_id INT,
  vehicle_price INT,
  service_price INT,
  vehicle_id INT,
  payment_type varchar(45),
  PRIMARY KEY (transaction_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id)
  );

-- -----------------------------------------------------
-- Table `mydb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE bookings (
	booking_id INT NOT NULL,
	vehicle_id INT,
	amount INT,
	balance INT,
	vehicle_price INT,
	booking_date DATE,
    customer_id INT,
    transaction_id INT,
	PRIMARY KEY (booking_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (transaction_id) REFERENCES payments(transaction_id)
);

-- Data: Showroom
INSERT INTO `mydb`.`showroom` (`branch_id`, `showroom_name`, `city`, `phone`) VALUES ('AG123', 'Auto Geeks', 'Islamabad', '0514444515'); 

-- Data: Departments
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('1', 'Administration', 'Active', '1', 'AG123', '3');
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('2', 'Sales', 'Active', '2', 'AG123', '10');
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('3', 'Human Resource', 'Active', '3', 'AG123', '2');
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('4', 'Accounts', 'Active', '4', 'AG123', '1');
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('5', 'Security', 'Active', '5', 'AG123', '6');
INSERT INTO `mydb`.`departments` (`dept_id`, `dept_name`, `dept_status`, `manager_id`, `branch_id`, `no_of_staff`) VALUES ('6', 'Garage', 'Active', '6', 'AG123', '4');

-- Data: Staff
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('10', 'Asad Raza', '2005-01-01', 'Available', '03215575167', 'Islamabad', '100000', '1', 'Administration', '1');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('11', 'Azhar Choudhary', '2005-02-01', 'Available', '03223425123', 'Islamabad', '65000', '1', 'Administration', '1');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('12', 'Jamshed Ahmed', '2006-01-03', 'Transffered', '03334213234', 'Rawalpindi', '60000', '2', 'Sales', '2');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('13', 'Asmara Tariq', '2007-05-23', 'Available', '03132233456', 'Islamabad', '50000', '2', 'Sales', '2');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('14', 'Shahmir Sidiqui', '2006-08-11', 'Available', '03335234576', 'Islamabad', '50000', '3', 'HR', '3');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('15', 'M Daniyal ', '2004-12-22', 'Available', '03236347719', 'Islamabad', '39000', '2', 'Sales', '2');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('16', 'Faheel Afzal', '2008-04-18', 'Absent', '03234213123', 'Rawalpindi', '35000', '3', 'HR', '3');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('17', 'Syed Ahmed Shafiq', '2006-03-12', 'Available', '03334675453', 'Lahore', '38000', '2', 'Sales', '2');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('18', 'Fazal Shah', '2002-01-02', 'Available', '03547277238', 'Waziristan', '25000', '5', 'Security', '5');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('19', 'Shamshad Bhatti', '2003-09-08', 'Available', '03873324245', 'Karachi', '32000', '4', 'Accounts', '4');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('20', 'Hashmat Khan', '2004-02-01', 'On-Leave', '03324545564', 'Islamabad', '30000', '6', 'Garage', '6');
INSERT INTO `mydb`.`staff` (`staff_id`, `staff_name`, `staff_Hiring`, `staff_status`, `staff_phone`, `staff_address`, `staff_salary`, `manager_id`, `dept_name`, `dept_id`) VALUES ('21', 'Anayatullah', '2005-10-23', 'Available', '03342315468', 'Quetta', '27500', '6', 'Garage', '6');

-- Data: Vehicles
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('21', 'Benz SLK class', 'Mercedes', 2007, 'Sports', 'Available', '10', 'White', '4650000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('22', 'Evolution X', 'Mitsubishi', 2008, 'Sedan', 'Booked', '9', 'Silver', '6000000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('23', 'IS-300', 'Lexus', 2007, 'Sedan', 'Available', '8', 'Black', '4000000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('24', 'Impreza WRC', 'Subaru', 2007, 'Sports', 'Available', '8', 'Blue', '4500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('25', 'GTR', 'Nisaan', 2008, 'Sports', 'Available', '9', 'Blue', '6500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('26', 'Hayabusa', 'Suzuki', 2009, 'SuperBike', 'Available', '10', 'Grey', '3200000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('27', 'Celica', 'Toyota', 2007, 'Sports', 'Sold', '10', 'Black', '3600000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('28', 'X6', 'BMW', 2009, 'Crossover', 'Available', '9', 'White', '4500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('29', 'Continental', 'Bentley', 2009, 'Convertible', 'Sold', '9', 'White', '5500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('30', 'R6', 'Yamaha', 2008, 'SuperBike', 'Available', '8', 'Red', '220000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('31', 'YBR-125', 'Yamaha', 2009, 'Bike', 'Available', '10', 'Grey', '180000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('32', 'Cultus', 'Suzuki', 2009, 'Hatchback', 'Available', '8', 'Silver', '2500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('33', 'Parado', 'Toyota', 2008, 'SUV', 'Available', '10', 'White', '5500000');
INSERT INTO `mydb`.`vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_make`, `vehicle_year`, `vehicle_type`, `vehicle_status`, `vehicle_condition`, `vehicle_color`, `vehicle_price`) VALUES ('34', 'CD-70', 'Honda', 2009, 'Bike', 'Available', '9', 'Red', '107000');

-- Data: Parts
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('1522', 'Schemic DRLS-31', 'Decento', '35000');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('1324', 'V8-TRB-2131', 'Honda', '335000');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('1872', 'RBD-TypeN', 'RBD', '125000');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('1234', 'Mercine-SD-1342', 'Mercine UK', '65000');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('2312', 'TRIX-BrakePads', 'Brabus', '25000');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('1394', 'PhysX-SCov-53', 'Penman', '13500');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('5463', 'UMBLE-34', 'Ulman', '2300');
INSERT INTO `mydb`.`parts` (`part_id`, `part_name`, `part_make`, `part_price`) VALUES ('3452', 'Meverick-22', 'TopGear', '3000');

-- Data: Services
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('221', 'Oil Change', '5463', '5000', 'Anayat', '21', 'Oil', '2008-12-25','27');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('222', 'Tire Rehancemnt', '1522', '125000', 'Waqar', '20', 'Tires', '2008-12-25','23');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('223', 'Part Replacement', '2312', '23000', 'Waqar', '20', 'Bumper(Front)', '2008-12-26','27');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('224', 'Oil Change', '5463', '5000', 'Anayat', '21', 'Oil', '2008-12-26','21');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('225', 'Engine Upgrade', '3452', '29000', 'Waqar', '20', 'TFR-213', '2008-12-27','27');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('226', 'Body Improvement', '1872', '18350', 'Waqar', '20', 'Body Kit', '2008-12-27','23');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('227', 'Complete Service', '5463', '12000', 'Anayat', '21', 'Oil', '2008-12-27','25');
INSERT INTO `mydb`.`services` (`service_id`, `service_name`, `part_id`, `service_price`, `staff_name`, `staff_id`, `part_name`, `service_date`,`vehicle_id`) VALUES ('228', 'Complete Service', '5463', '13500', 'Anayat', '21', 'Oil', '2008-12-28','21');


-- Data: Customers
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_notes`) VALUES ('2012187', 'Sheharyar Abid', '03345575232', 'Returning Customer');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `vehicle_id`, `customer_notes`) VALUES ('2012307', 'Jaweria Zameer', '03323746772', '27', 'Satisfied');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `vehicle_id`, `customer_notes`) VALUES ('2012314', 'Momna Ali', '03243255633', '22', 'Booking');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `vehicle_id`, `customer_notes`) VALUES ('2012332', 'Sharjeel Ali Khan', '03754532434', '29', 'Not Satisfied');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_notes`) VALUES ('2012423', 'Abu Hurrara Maqsod', '03345732432', 'Returning Customer');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `service_id`,`customer_notes`) VALUES ('2012123', 'M Taha', '03131231234','227',  'Not Satisfied');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `customer_phone`, `service_id`, `customer_notes`) VALUES ('2012124', 'M Ali Naqi', '03123421412','228', 'Satisfied');


-- Data: Payments
INSERT INTO `mydb`.`PAYMENTS` (`transaction_id`, `amount`, `staff_id`, `customer_id`, `vehicle_price`, `vehicle_id`,`payment_type`) VALUES ('3071', '3600000', '13', '2012307',  '3600000', '27','Sale');
INSERT INTO `mydb`.`PAYMENTS` (`transaction_id`, `amount`, `staff_id`, `customer_id`, `vehicle_price`, `vehicle_id`,`payment_type`) VALUES ('3141', '500000', '12', '2012314', '6000000', '22','Booking');
INSERT INTO `mydb`.`PAYMENTS` (`transaction_id`, `amount`, `staff_id`, `customer_id`, `vehicle_price`, `vehicle_id`,`payment_type`) VALUES ('3321', '5500000', '17', '2012332',  '5500000', '29','Sale');
INSERT INTO `mydb`.`PAYMENTS` (`transaction_id`, `amount`, `staff_id`, `customer_id`, `service_id`, `part_price`, `part_id`, `service_price`,`vehicle_id`,`payment_type`) VALUES ('1231', '5000', '21', '2012123', '221', '2300', '5463',  '5000', '23','Service');
INSERT INTO `mydb`.`PAYMENTS` (`transaction_id`, `amount`, `staff_id`, `customer_id`, `service_id`, `part_price`, `part_id`, `service_price`,`vehicle_id`,`payment_type`) VALUES ('1221', '13500', '21', '2012124', '228', '2300', '5463', '13500', '24','Service');  

-- Data: Bookings
INSERT INTO `mydb`.`bookings` (`booking_id`, `vehicle_id`, `amount`, `balance`, `vehicle_price`, `booking_date`, `customer_id`, `transaction_id`) VALUES ('2012', '22', '500000','5500000','60000000', '2022-12-24', '2012314', '3141');

-- 8 Clauses
-- Clause 1:
-- Statement: Display staff name,phone and department name and ID of staff which are not at work.
SELECT staff_name, staff_phone,staff_status, dept_name, dept_id FROM staff WHERE staff_status != 'Available';

-- Clause 2:
-- Statement: View vehicles details that are booked.
SELECT * FROM vehicles WHERE vehicle_status = 'Booked';

-- Clause 3:
-- Statement: Display staff names and departments in order of increasing Salaries.
SELECT  staff_name , dept_name, staff_salary FROM staff ORDER BY staff_salary ASC;

-- Clause 4: 
-- Statement: Show number vehicles by vehicles type.
SELECT COUNT(vehicle_name), vehicle_type From vehicles GROUP BY vehicle_type;

-- Clause 5:
-- Statement: Show total earnings of multiple jobs in decending order.
SELECT sum(amount), payment_type FROM payments GROUP BY payment_type ORDER BY amount DESC;

-- Clause 6:
-- Statement: Display all available vehicles manufactured after 2007.
SELECT * FROM vehicles HAVING vehicle_year  > 2007 ORDER BY vehicle_year ASC;

-- Clause 7:
-- Statement: Display most valuable sedan.
SELECT vehicle_name, vehicle_make, MAX(vehicle_price) FROM vehicles WHERE vehicle_type='Sedan';

-- Clause 8:
-- Statement: Show average salary every department is paying to their employees.
SELECT dept_name, dept_id , AVG(staff_salary) FROM staff GROUP BY dept_name;

-- 3 Sub Queries:
-- Sub-Query 1:
-- Statement: Show staff name and phone number of the staff who performed service id 221 for client.
 SELECT staff_name, staff_phone FROM staff WHERE staff_id IN (SELECT staff_id FROM services WHERE service_id = '221');
 
-- Sub-Query 2:
-- Statement: Display the employee who has sold the vehcile with satisfactory notes from the customer.
SELECT * FROM staff WHERE staff_id IN (SELECT staff_id FROM payments WHERE vehicle_id IN (SELECT vehicle_id FROM customers WHERE customer_notes = 'Satisfied'));
 
 -- Sub-Query 3:
-- Statement: Show part which has bad ratings in terms of customer notes.
SELECT * FROM parts  WHERE part_id IN (SELECT part_id FROM services WHERE service_id IN (SELECT service_id FROM customers WHERE customer_notes = 'Not Satisfied'));


-- Join Clause 1
-- Statement: Show Vehcile name and service name stored that were serviced as per our records.
SELECT vehicles.vehicle_name, services.service_name FROM vehicles INNER JOIN services ON vehicles.vehicle_id=services.vehicle_id;
 
 -- Join Clause 2
 -- Statement: Show all payments according to staff that served the clients.
 SELECT staff.staff_name, payments.payment_type, payments.amount FROM payments LEFT JOIN staff ON staff.staff_id=payments.staff_id;
 
 -- Join Clause 3
 -- Statement: Show contact number and name of the clients who made a bookings.
SELECT customers.customer_name, customers.customer_phone, bookings.booking_id, bookings.vehicle_id FROM customers RIGHT JOIN bookings ON bookings.customer_id=customers.customer_id;

-- Join Clause 4
-- Statement: Show how many workers worked in same department including the staff itself by name.
SELECT staff.staff_name, departments.no_of_staff, departments.dept_name FROM staff JOIN departments ON staff.dept_id=departments.dept_id;
