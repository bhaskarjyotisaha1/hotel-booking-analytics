
-- HOTEL BOOKING ANALYTICS
-- 01_create_tables.sql

CREATE DATABASE IF NOT EXISTS hotel_booking_analytics;

USE hotel_booking_analytics;

CREATE TABLE IF NOT EXISTS hotel_bookings (

    booking_id VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    gender VARCHAR(20),
    age INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_type VARCHAR(30),
    loyalty_tier VARCHAR(30),

    is_canceled TINYINT,
    lead_time INT,
    arrival_year INT,
    arrival_month INT,
    arrival_day INT,

    stays_in_weekend_nights INT,
    stays_in_week_nights INT,

    reservation_status VARCHAR(30),
    days_in_waiting_list INT,
    adults INT,
    children INT,

    is_repeated_guest TINYINT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,

    reserved_room_type VARCHAR(20),
    assigned_room_type VARCHAR(20),
    average_daily_rate DECIMAL(12,2),
    booking_changes INT,
    market_segment VARCHAR(50),

    total_nights INT,
    revenue DECIMAL(14,2),
    lead_group VARCHAR(30),
    lost_revenue DECIMAL(14,2),
    age_group VARCHAR(30),

    arrival_date DATE,
    arrival_weekday VARCHAR(20),

    has_children TINYINT,
    has_weekend_stay TINYINT,
    past_cancel_flag TINYINT,
    room_changed TINYINT,

    CONSTRAINT pk_hotel_bookings
        PRIMARY KEY (booking_id),

    CONSTRAINT chk_is_canceled
        CHECK (is_canceled IN (0,1)),

    CONSTRAINT chk_repeated_guest
        CHECK (is_repeated_guest IN (0,1)),

    CONSTRAINT chk_has_children
        CHECK (has_children IN (0,1)),

    CONSTRAINT chk_has_weekend_stay
        CHECK (has_weekend_stay IN (0,1)),

    CONSTRAINT chk_past_cancel_flag
        CHECK (past_cancel_flag IN (0,1)),

    CONSTRAINT chk_room_changed
        CHECK (room_changed IN (0,1)),

    INDEX idx_customer_id (customer_id),
    INDEX idx_arrival_year_month (arrival_year, arrival_month),
    INDEX idx_is_canceled (is_canceled),
    INDEX idx_market_segment (market_segment),
    INDEX idx_customer_state (customer_state)

) ENGINE=InnoDB;

-- Verify database and table
SELECT DATABASE() AS current_database;

SHOW TABLES;

DESCRIBE hotel_bookings;
