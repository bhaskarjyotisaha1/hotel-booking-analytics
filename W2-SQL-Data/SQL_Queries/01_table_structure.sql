USE your_existing_database_name;

-- Display all existing tables
SHOW TABLES;

-- Display complete hotel booking table structure
DESCRIBE hotel_bookings;

-- Display actual table creation statement
SHOW CREATE TABLE hotel_bookings;

-- Count all imported records
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;

-- Display sample booking records
SELECT *
FROM hotel_bookings
LIMIT 10;
