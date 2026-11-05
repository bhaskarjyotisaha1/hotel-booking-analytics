
USE hotel_booking_analytics;

-- 1. Check duplicate customer IDs

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Check missing customer IDs

SELECT COUNT(*) AS missing_customer_ids
FROM bookings
WHERE customer_id IS NULL
   OR TRIM(customer_id) = '';

-- 3. Check invalid cancellation values

SELECT *
FROM bookings
WHERE is_canceled NOT IN (0, 1)
   OR is_canceled IS NULL;

-- 4. Check negative ADR

SELECT *
FROM bookings
WHERE average_daily_rate < 0;

-- 5. Check missing ADR

SELECT COUNT(*) AS missing_adr
FROM bookings
WHERE average_daily_rate IS NULL;

-- 6. Check invalid lead time

SELECT *
FROM bookings
WHERE lead_time < 0;

-- 7. Check invalid stay duration

SELECT *
FROM bookings
WHERE stays_in_weekend_nights < 0
   OR stays_in_week_nights < 0;

-- 8. Check repeated guest flag

SELECT *
FROM bookings
WHERE is_repeated_guest NOT IN (0, 1)
   OR is_repeated_guest IS NULL;

-- 9. Check unmatched customer records

SELECT b.*
FROM bookings b
LEFT JOIN customers c
ON b.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

