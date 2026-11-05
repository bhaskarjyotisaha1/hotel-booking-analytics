
-- 02_insert_sample_data.sql

USE hotel_booking_analytics;

LOAD DATA LOCAL INFILE
'C:/Users/YourWindowsUsername/Downloads/hospitality_bookings_with_1000_customers_updated(1).csv'

INTO TABLE hotel_bookings

CHARACTER SET utf8mb4

FIELDS TERMINATED BY ','
ENCLOSED BY '"'

LINES TERMINATED BY '\n'

IGNORE 1 ROWS

(
    booking_id,
    customer_id,
    gender,
    age,
    customer_city,
    customer_state,
    customer_type,
    loyalty_tier,
    is_canceled,
    lead_time,
    arrival_year,
    arrival_month,
    arrival_day,
    stays_in_weekend_nights,
    stays_in_week_nights,
    reservation_status,
    days_in_waiting_list,
    adults,
    children,
    is_repeated_guest,
    previous_cancellations,
    previous_bookings_not_canceled,
    reserved_room_type,
    assigned_room_type,
    average_daily_rate,
    booking_changes,
    market_segment,
    total_nights,
    revenue,
    lead_group,
    lost_revenue,
    age_group,
    @arrival_date,
    @arrival_weekday,
    has_children,
    has_weekend_stay,
    past_cancel_flag,
    room_changed
)

SET
    arrival_date = STR_TO_DATE(
        NULLIF(@arrival_date, ''),
        '%Y-%m-%d'
    ),
    arrival_weekday = NULLIF(@arrival_weekday, '');

-- Verify actual loaded data
SELECT COUNT(*) AS total_booking_records
FROM hotel_bookings;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM hotel_bookings;

SELECT *
FROM hotel_bookings
LIMIT 10;
