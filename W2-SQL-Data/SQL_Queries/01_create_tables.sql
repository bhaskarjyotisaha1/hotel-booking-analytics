
-- =====================================================
-- HOTEL BOOKING ANALYTICS
-- 01_create_tables.sql
-- =====================================================

CREATE DATABASE IF NOT EXISTS hotel_booking_analytics;

USE hotel_booking_analytics;

CREATE TABLE IF NOT EXISTS hotel_bookings (

    booking_id VARCHAR(50) NOT NULL,
    Customer_ID VARCHAR(50) NOT NULL,
    Customer_State VARCHAR(100),

    arrival_year INT,
    arrival_month VARCHAR(20),

    is_canceled TINYINT,
    reservation_status VARCHAR(30),
    reservation_status_date DATE,

    is_repeated_guest TINYINT,
    previous_cancellations INT,

    reserved_room_type VARCHAR(20),
    average_daily_rate DECIMAL(12,2),

    booking_changes INT,
    market_segment VARCHAR(50),
    lead_time INT,

    stays_in_weekend_nights INT,
    stays_in_week_nights INT,

    PRIMARY KEY (booking_id),

    CONSTRAINT chk_booking_canceled
        CHECK (is_canceled IN (0,1) OR is_canceled IS NULL),

    CONSTRAINT chk_repeat_guest
        CHECK (is_repeated_guest IN (0,1) OR is_repeated_guest IS NULL),

    INDEX idx_customer_id (Customer_ID),
    INDEX idx_arrival_year (arrival_year),
    INDEX idx_cancellation (is_canceled),
    INDEX idx_market_segment (market_segment)

) ENGINE=InnoDB;

-- Verify database and table
SELECT DATABASE() AS current_database;

SHOW TABLES;

DESCRIBE hotel_bookings;
