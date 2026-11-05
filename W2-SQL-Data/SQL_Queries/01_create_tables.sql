
-- W2: Hotel Booking Analytics
-- Database creation

CREATE DATABASE IF NOT EXISTS hotel_booking_analytics;

USE hotel_booking_analytics;

-- 1. Customer master table

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_state VARCHAR(100)
);

-- 2. Booking transaction table

CREATE TABLE IF NOT EXISTS bookings (
    booking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,

    arrival_year INT,
    arrival_month VARCHAR(20),

    is_canceled TINYINT,
    reservation_status VARCHAR(30),

    lead_time INT,
    market_segment VARCHAR(100),
    reserved_room_type VARCHAR(20),

    average_daily_rate DECIMAL(12,2),

    stays_in_weekend_nights INT,
    stays_in_week_nights INT,

    previous_cancellations INT,
    is_repeated_guest TINYINT,

    CONSTRAINT fk_booking_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
