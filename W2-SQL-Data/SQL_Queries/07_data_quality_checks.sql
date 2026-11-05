
-- 07_data_quality_checks.sql

USE hotel_booking_analytics;

-- 1. Total booking records
SELECT COUNT(*) AS total_records
FROM hotel_bookings;

-- 2. Unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM hotel_bookings;

-- 3. Duplicate booking IDs
SELECT
    booking_id,
    COUNT(*) AS duplicate_count
FROM hotel_bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;

-- 4. Missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM hotel_bookings
WHERE customer_id IS NULL
   OR TRIM(customer_id) = '';

-- 5. Missing arrival dates
SELECT COUNT(*) AS missing_arrival_dates
FROM hotel_bookings
WHERE arrival_date IS NULL;

-- 6. Missing arrival weekdays
SELECT COUNT(*) AS missing_arrival_weekdays
FROM hotel_bookings
WHERE arrival_weekday IS NULL
   OR TRIM(arrival_weekday) = '';

-- 7. Negative ADR records
SELECT
    booking_id,
    customer_id,
    average_daily_rate
FROM hotel_bookings
WHERE average_daily_rate < 0;

-- 8. Invalid cancellation values
SELECT *
FROM hotel_bookings
WHERE is_canceled NOT IN (0, 1)
   OR is_canceled IS NULL;

-- 9. Invalid repeated guest flags
SELECT *
FROM hotel_bookings
WHERE is_repeated_guest NOT IN (0, 1)
   OR is_repeated_guest IS NULL;

-- 10. Invalid year records
-- Investigate the 1900 values found in the source CSV.
SELECT
    booking_id,
    customer_id,
    arrival_year,
    arrival_date,
    arrival_month,
    arrival_day
FROM hotel_bookings
WHERE arrival_year = 1900;

-- 11. Negative lead time
SELECT *
FROM hotel_bookings
WHERE lead_time < 0;

-- 12. Negative stay duration
SELECT *
FROM hotel_bookings
WHERE stays_in_weekend_nights < 0
   OR stays_in_week_nights < 0
   OR total_nights < 0;

-- 13. Check revenue and lost revenue
SELECT
    booking_id,
    revenue,
    lost_revenue
FROM hotel_bookings
WHERE revenue < 0
   OR lost_revenue < 0;

-- 14. Check booking flag consistency
SELECT *
FROM hotel_bookings
WHERE has_children NOT IN (0, 1)
   OR has_weekend_stay NOT IN (0, 1)
   OR past_cancel_flag NOT IN (0, 1)
   OR room_changed NOT IN (0, 1);

-- 15. Cancellation status summary
SELECT
    is_canceled,
    reservation_status,
    COUNT(*) AS total_records
FROM hotel_bookings
GROUP BY is_canceled, reservation_status
ORDER BY is_canceled, reservation_status;

-- 16. Customer booking frequency
-- Multiple bookings by the same customer are valid.
SELECT
    customer_id,
    COUNT(*) AS booking_count
FROM hotel_bookings
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY booking_count DESC;

-- 17. Overall data-quality summary
SELECT
    COUNT(*) AS total_records,
    SUM(arrival_date IS NULL) AS missing_arrival_dates,
    SUM(arrival_weekday IS NULL) AS missing_weekdays,
    SUM(average_daily_rate < 0) AS negative_adr_records,
    SUM(arrival_year = 1900) AS suspicious_arrival_years,
    SUM(is_canceled NOT IN (0,1)) AS invalid_cancellation_flags
FROM hotel_bookings;
