CREATE DATABASE hotel_data;
USE hotel_data;

CREATE TABLE visitor(
    code int PRIMARY KEY,
    ff_name VARCHAR(10),
    ll_name VARCHAR(10),
    contact VARCHAR(10),
    gendar VARCHAR(10),
    booking_date VARCHAR(10),
    leave_date VARCHAR(10)
);

CREATE TABLE hotel_employee(
    employee_id int PRIMARY KEY,
    empl_name VARCHAR(10),
    allocated_for int,
    FOREIGN KEY(allocated_for) REFERENCES visitor(code) ON DELETE CASCADE
);

CREATE TABLE room_quality(
    rooms_no int PRIMARY KEY,
    room_status VARCHAR(10),
    member int,
    flr_nmb int DEFAULT 1,
    FOREIGN KEY(member) REFERENCES visitor(code)
);

CREATE TABLE transactions(
    bill_code int PRIMARY KEY,
    code int,
    bill_date VARCHAR(10),
    total_bill int CHECK(total_bill>=500 AND total_bill<=10000),
    payment_details VARCHAR(10),
    FOREIGN KEY(code) REFERENCES visitor(code)
);

CREATE TABLE employee_status(
    emp_st_id int,
    works_details VARCHAR(10),
    job_dept VARCHAR(10),
    PRIMARY KEY(emp_st_id,works_details),
    FOREIGN KEY(emp_st_id) REFERENCES hotel_employee(employee_id) ON DELETE CASCADE
);

CREATE TABLE food_concern(
    order_no int PRIMARY KEY,
    order_date VARCHAR(10),
    code int,
    food_name VARCHAR(10),
    FOREIGN KEY(code) REFERENCES visitor(code)
);

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_code INT,
    feedback_date VARCHAR(10),
    rating INT CHECK (rating >= 1 AND rating <= 5),  
    comments VARCHAR(255),
    FOREIGN KEY (visitor_code) REFERENCES visitor(code) ON DELETE CASCADE
);

CREATE TABLE maintenance_requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    room_no INT,
    request_date VARCHAR(10),
    issue_description VARCHAR(100),
    request_status VARCHAR(10),  
    resolved_date VARCHAR(10),
    FOREIGN KEY (room_no) REFERENCES room_quality(rooms_no) ON DELETE CASCADE
);

CREATE TABLE room_booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_code INT,
    room_no INT,
    check_in_date VARCHAR(10),
    check_out_date VARCHAR(10),
    booking_status VARCHAR(10),  -- e.g., 'confirmed', 'checked_in', 'checked_out', 'cancelled'
    FOREIGN KEY (visitor_code) REFERENCES visitor(code) ON DELETE CASCADE,
    FOREIGN KEY (room_no) REFERENCES room_quality(rooms_no) ON DELETE CASCADE
);



INSERT INTO visitor VALUES(101,'Rahim','Molla','01716160','M','2021-06-20','2021-06-23');
INSERT INTO visitor VALUES(102,'Karim','Uddin','01716160','M','2021-06-18','2021-06-21');
INSERT INTO visitor VALUES(103,'Basir','Biswas','01716160','M','2021-06-20','2021-06-22');
INSERT INTO visitor VALUES(104,'Rahim','Molla','01716160','M','2021-06-15','2021-06-21');
INSERT INTO visitor VALUES(105,'Hridoy','Zaman','01716160','M','2021-06-17','2021-06-25');

INSERT INTO hotel_employee VALUES(10,'Abul',101);
INSERT INTO hotel_employee VALUES(11,'Babul',101);
INSERT INTO hotel_employee VALUES(12,'Kabul',102);
INSERT INTO hotel_employee VALUES(13,'Hablu',102);
INSERT INTO hotel_employee VALUES(14,'Gabul',103);
INSERT INTO hotel_employee VALUES(15,'Dablu',104);
INSERT INTO hotel_employee VALUES(16,'Mabul',105);

INSERT INTO room_quality VALUES(201,'VIP',101,DEFAULT);
INSERT INTO room_quality VALUES(202,'1st_Class',101,DEFAULT);
INSERT INTO room_quality VALUES(203,'2nd_Class',101,DEFAULT);
INSERT INTO room_quality VALUES(204,'Normal',101,DEFAULT);
INSERT INTO room_quality VALUES(205,'Ac',101,DEFAULT);

INSERT INTO transactions VALUES(1001,101,'2021-06-20',1000,'card');
INSERT INTO transactions VALUES(1002,102,'2021-06-20',1500,'bkash');
INSERT INTO transactions VALUES(1003,103,'2021-06-20',2000,'dbbl');
INSERT INTO transactions VALUES(1004,104,'2021-06-20',2500,'card');
INSERT INTO transactions VALUES(1005,105,'2021-06-20',1500,'nogod');

INSERT INTO employee_status VALUES(10,'rm_mngmnt','management');
INSERT INTO employee_status VALUES(10,'manager','management');
INSERT INTO employee_status VALUES(11,'electric','service');
INSERT INTO employee_status VALUES(12,'food_shef','food');
INSERT INTO employee_status VALUES(15,'waiter','food');

INSERT INTO food_concern VALUES(1,'2021-06-20',101,'pizza');
INSERT INTO food_concern VALUES(2,'2021-06-21',102,'burger');
INSERT INTO food_concern VALUES(3,'2021-06-22',103,'pizza');

ALTER TABLE food_concern
ADD food_price VARCHAR(10);
DESCRIBE food_concern;







