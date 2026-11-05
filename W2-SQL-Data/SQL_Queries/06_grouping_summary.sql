
USE hotel_booking_analytics;

-- 1. Total booking records

SELECT COUNT(*) AS total_booking_records
FROM bookings;

-- 2. Unique customers with bookings

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM bookings;

-- 3. Cancelled bookings

SELECT COUNT(*) AS cancelled_bookings
FROM bookings
WHERE is_canceled = 1;

-- 4. Cancellation rate

SELECT
    ROUND(
        100.0 * SUM(is_canceled) / NULLIF(COUNT(*), 0),
        2
    ) AS cancellation_rate
FROM bookings;

-- 5. Bookings by arrival year

SELECT
    arrival_year,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY arrival_year
ORDER BY arrival_year;

-- 6. Cancellation by market segment

SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancelled_bookings,
    ROUND(
        100.0 * SUM(is_canceled) / NULLIF(COUNT(*), 0),
        2
    ) AS cancellation_rate
FROM bookings
GROUP BY market_segment;

-- 7. Average daily rate by room type

SELECT
    reserved_room_type,
    ROUND(AVG(average_daily_rate), 2) AS average_adr
FROM bookings
GROUP BY reserved_room_type;

-- 8. Repeat guest booking summary

SELECT
    is_repeated_guest,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY is_repeated_guest;

-- 9. Cancellation by state

SELECT
    c.customer_state,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.is_canceled) AS cancelled_bookings
FROM customers c
INNER JOIN bookings b
ON c.customer_id = b.customer_id
GROUP BY c.customer_state
ORDER BY cancelled_bookings DESC;

