
-- DATABASE: hotel_booking_analytics
-- ============================================

USE hotel_booking_analytics;


-- 1. Display all booking records
SELECT *
FROM hotel_bookings
LIMIT 10;


-- 2. Check total booking records
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;


-- 3. Count unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM hotel_bookings;


-- 4. Count cancelled and non-cancelled bookings
SELECT
    is_canceled,
    COUNT(*) AS booking_count
FROM hotel_bookings
GROUP BY is_canceled;


-- 5. Calculate cancellation rate
SELECT
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate_percentage
FROM hotel_bookings;


-- 6. Analyse bookings by market segment
SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancelled_bookings
FROM hotel_bookings
GROUP BY market_segment
ORDER BY total_bookings DESC;


-- 7. Average Daily Rate by cancellation status
SELECT
    is_canceled,
    ROUND(AVG(average_daily_rate), 2) AS average_adr
FROM hotel_bookings
GROUP BY is_canceled;


-- 8. Booking distribution by customer state
SELECT
    customer_state,
    COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY customer_state
ORDER BY total_bookings DESC;


-- 9. Booking distribution by arrival month
SELECT
    arrival_month,
    COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY arrival_month
ORDER BY arrival_month;


-- 10. Repeat guest analysis
SELECT
    is_repeated_guest,
    COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY is_repeated_guest;


-- 11. Check missing values in important columns
SELECT
    SUM(booking_id IS NULL) AS missing_booking_ids,
    SUM(customer_id IS NULL) AS missing_customer_ids,
    SUM(customer_state IS NULL) AS missing_states,
    SUM(arrival_date IS NULL) AS missing_arrival_dates,
    SUM(reservation_status IS NULL) AS missing_status,
    SUM(average_daily_rate IS NULL) AS missing_adr
FROM hotel_bookings;


-- 12. Check duplicate booking IDs
SELECT
    booking_id,
    COUNT(*) AS duplicate_count
FROM hotel_bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


-- 13. Check duplicate customer IDs
-- Customer IDs can repeat because customers may make multiple bookings.
SELECT
    customer_id,
    COUNT(*) AS number_of_bookings
FROM hotel_bookings
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY number_of_bookings DESC
LIMIT 20;


-- 14. Validate cancellation values (only 0 or 1)
SELECT *
FROM hotel_bookings
WHERE is_canceled NOT IN (0, 1)
   OR is_canceled IS NULL;


-- 15. Validate binary flag columns
SELECT *
FROM hotel_bookings
WHERE is_repeated_guest NOT IN (0, 1)
   OR has_children NOT IN (0, 1)
   OR has_weekend_stay NOT IN (0, 1)
   OR past_cancel_flag NOT IN (0, 1)
   OR room_changed NOT IN (0, 1);


-- 16. Check invalid age values
SELECT *
FROM hotel_bookings
WHERE age < 18 OR age > 100;


-- 17. Validate arrival month
SELECT *
FROM hotel_bookings
WHERE arrival_month NOT BETWEEN 1 AND 12;


-- 18. Validate arrival day
SELECT *
FROM hotel_bookings
WHERE arrival_day NOT BETWEEN 1 AND 31;


-- 19. Check negative lead time
SELECT *
FROM hotel_bookings
WHERE lead_time < 0;


-- 20. Check negative stay duration
SELECT *
FROM hotel_bookings
WHERE stays_in_weekend_nights < 0
   OR stays_in_week_nights < 0
   OR total_nights < 0;


-- 21. Check negative ADR
SELECT *
FROM hotel_bookings
WHERE average_daily_rate < 0;


-- 22. Check negative revenue
SELECT *
FROM hotel_bookings
WHERE revenue < 0;


-- 23. Check negative previous cancellation history
SELECT *
FROM hotel_bookings
WHERE previous_cancellations < 0
   OR previous_bookings_not_canceled < 0;


-- 24. Check missing arrival dates
SELECT *
FROM hotel_bookings
WHERE arrival_date IS NULL;


-- 25. Check records with missing customer information
SELECT *
FROM hotel_bookings
WHERE customer_id IS NULL
   OR customer_state IS NULL
   OR customer_city IS NULL;
