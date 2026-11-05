
-- W1: SQL + Data
-- Project: Hotel Booking Cancellation Analytics
-- File: 02_insert_sample_data.sql
-- Data loading method: MySQL Workbench Table Data Import Wizard

USE hotel_booking_analytics;

-- The CSV dataset was imported into hotel_bookings
-- using MySQL Workbench Table Data Import Wizard.
-- The following queries verify the imported data.

-- 1. Check total imported records
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;

-- 2. Display sample booking records
SELECT *
FROM hotel_bookings
LIMIT 10;

-- 3. Check unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM hotel_bookings;
