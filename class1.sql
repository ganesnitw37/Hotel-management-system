-- Selecting all records from tables
-- SELECT * FROM visitor;
-- SELECT * FROM hotel_employee;
-- SELECT * FROM room_quality;
-- SELECT * FROM transactions;
-- SELECT * FROM employee_status;
-- SELECT * FROM food_concern;

-- Selecting specific columns from the 'visitor' table where code is 101
-- SELECT ff_name, ll_name 
-- FROM visitor 
-- WHERE code = 101;

-- Adding a new column to the 'food_concern' table
-- ALTER TABLE food_concern
-- ADD food_price VARCHAR(10);

-- Describing the structure of the 'food_concern' table to check the changes
-- DESCRIBE food_concern;

-- Modifying the data type of the 'food_price' column
-- Note: MySQL does not have a `NUMBER` data type, so use `INT` or `DECIMAL`.
-- ALTER TABLE food_concern
-- MODIFY food_price INT(10);

-- Describing the structure of the 'food_concern' table to verify the changes
-- DESCRIBE food_concern;

-- Dropping the 'food_price' column from the 'food_concern' table
-- ALTER TABLE food_concern
-- DROP COLUMN food_price;

-- Describing the structure of the 'food_concern' table to verify the column removal
-- DESCRIBE food_concern;
select * from hotel_employee;

