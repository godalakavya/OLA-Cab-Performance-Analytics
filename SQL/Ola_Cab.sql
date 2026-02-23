##Create Database & Working Table
#Create new database for the project
CREATE DATABASE ola_cab_project;

#Select the database to work in
USE ola_cab_project;

#Create working table from raw dataset
create table dummy_cab as select * from ola_original;

#View raw data before cleaning
select * from dummy_cab;


##Data Audit – Identify Issues
#Identify rows containing NULL values in critical columns - Check NULL values
SELECT *
FROM dummy_cab
WHERE booking_id IS NULL
   OR customer_id IS NULL
   OR driver_id IS NULL
   OR city IS NULL
   OR booking_date IS NULL
   OR category IS NULL
   OR distance_km IS NULL
   OR total_trip_cost IS NULL
   OR payment_type IS NULL;

#Identify blank string values - Check Blank Text Values
SELECT *
FROM dummy_cab
WHERE booking_id = ''
   OR customer_id = ''
   OR driver_id = ''
   OR city = ''
   OR category = ''
   OR trip_type = ''
   OR payment_type = '';

#Identify negative or logically incorrect numeric values - Check Invalid Numeric Values
SELECT *
FROM dummy_cab
WHERE distance_km <= 0
   OR trip_duration_min <= 0
   OR base_fare <= 0
   OR per_km_rate <= 0
   OR surge_multiplier < 1
   OR total_trip_cost <= 0
   OR driver_earning < 0
   OR company_revenue < 0
   OR waiting_time < 0;

#Find duplicate booking IDs - Check Duplicate Records
SELECT booking_id, COUNT(*)
FROM dummy_cab
GROUP BY booking_id
HAVING COUNT(*) > 1;

##Data Cleaning Phase
#Disable safe updates
SET SQL_SAFE_UPDATES = 0;

#Add temporary primary key column
ALTER TABLE dummy_cab
ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;

#Delete duplicate rows (keep first occurrence)
DELETE d1
FROM dummy_cab d1
JOIN dummy_cab d2
ON d1.booking_id = d2.booking_id
AND d1.temp_id > d2.temp_id;

#Verify duplicates removed
SELECT booking_id, COUNT(*)
FROM dummy_cab
GROUP BY booking_id
HAVING COUNT(*) > 1;

#Delete rows with critical NULL values
DELETE FROM dummy_cab
WHERE booking_id IS NULL
   OR customer_id IS NULL
   OR driver_id IS NULL
   OR city IS NULL
   OR booking_date IS NULL
   OR category IS NULL
   OR distance_km IS NULL
   OR total_trip_cost IS NULL
   OR payment_type IS NULL;
   
#Delete rows with blank values
DELETE FROM dummy_cab
WHERE booking_id = ''
   OR customer_id = ''
   OR driver_id = ''
   OR city = ''
   OR category = ''
   OR trip_type = ''
   OR payment_type = '';
   
#Delete logically invalid numeric records
DELETE FROM dummy_cab
WHERE distance_km <= 0
   OR trip_duration_min <= 0
   OR base_fare <= 0
   OR per_km_rate <= 0
   OR surge_multiplier < 1
   OR total_trip_cost <= 0
   OR driver_earning < 0
   OR company_revenue < 0
   OR waiting_time < 0;
   
#Drop helper column
ALTER TABLE dummy_cab
DROP COLUMN temp_id;

##Logical Data Corrections
#Replace NULL/blank cancellation reasons
UPDATE dummy_cab
SET cancellation_reason = 'Not Cancelled'
WHERE cancellation_reason IS NULL
   OR cancellation_reason = '';
   
#Replace NULL/blank ratings with 0
   UPDATE dummy_cab
SET customer_rating = 0
WHERE customer_rating IS NULL;

##Standardize Data Types
#Convert numeric and date columns to proper types
ALTER TABLE dummy_cab
MODIFY booking_date DATE,
MODIFY distance_km DECIMAL(6,2),
MODIFY trip_duration_min DECIMAL(6,2),
MODIFY base_fare DECIMAL(8,2),
MODIFY per_km_rate DECIMAL(6,2),
MODIFY surge_multiplier DECIMAL(4,2),
MODIFY total_trip_cost DECIMAL(10,2),
MODIFY driver_earning DECIMAL(10,2),
MODIFY company_revenue DECIMAL(10,2),
MODIFY customer_rating DECIMAL(2,1);

#Standardize text columns
ALTER TABLE dummy_cab
MODIFY booking_id VARCHAR(20),
MODIFY customer_id VARCHAR(20),
MODIFY driver_id VARCHAR(20),
MODIFY city VARCHAR(50),
MODIFY category VARCHAR(20),
MODIFY trip_type VARCHAR(20),
MODIFY surge_reason VARCHAR(30),
MODIFY ride_status VARCHAR(30),
MODIFY cancellation_reason VARCHAR(50),
MODIFY payment_type VARCHAR(20),
MODIFY weather_condition VARCHAR(20),
MODIFY traffic_level VARCHAR(20);

select * from dummy_cab;
##Convert Trip Duration to HH:MM:SS Format
ALTER TABLE dummy_cab
ADD COLUMN trip_duration_time TIME;

#Convert decimal minutes into TIME format (HH:MM:SS)
UPDATE dummy_cab
SET trip_duration_time = SEC_TO_TIME(trip_duration_min * 60);

#Remove old numeric duration column
ALTER TABLE dummy_cab
DROP COLUMN trip_duration_min;

#Rename new time column
ALTER TABLE dummy_cab
CHANGE trip_duration_time trip_duration_min TIME;

#Display table structure including column names, data types, null settings, and key information
DESCRIBE dummy_cab;

#Display all records from the cleaned table and count of records
select COUNT(*) from dummy_cab;
select * from dummy_cab;