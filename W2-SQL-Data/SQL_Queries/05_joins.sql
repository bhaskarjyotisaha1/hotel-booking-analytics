
-- 05_joins.sql

USE hotel_booking_analytics;

-- 1. SELF JOIN:
-- Compare different bookings by the same customer.
SELECT
    b1.customer_id,
    b1.booking_id AS first_booking_id,
    b2.booking_id AS second_booking_id,
    b1.arrival_year AS first_arrival_year,
    b2.arrival_year AS second_arrival_year,
    b1.is_canceled AS first_booking_cancelled,
    b2.is_canceled AS second_booking_cancelled
FROM hotel_bookings b1
INNER JOIN hotel_bookings b2
    ON b1.customer_id = b2.customer_id
   AND b1.booking_id < b2.booking_id
LIMIT 100;

-- 2. Compare booking records for repeat customers
SELECT
    b1.customer_id,
    b1.booking_id,
    b2.booking_id AS another_booking_id,
    b1.reservation_status,
    b2.reservation_status AS another_booking_status
FROM hotel_bookings b1
INNER JOIN hotel_bookings b2
    ON b1.customer_id = b2.customer_id
   AND b1.booking_id < b2.booking_id
WHERE b1.is_repeated_guest = 1
LIMIT 100;

-- 3. Customer-level booking summary using self-join
SELECT
    a.customer_id,
    COUNT(DISTINCT a.booking_id) AS customer_booking_count
FROM hotel_bookings a
INNER JOIN hotel_bookings b
    ON a.customer_id = b.customer_id
GROUP BY a.customer_id
HAVING COUNT(DISTINCT a.booking_id) > 1
ORDER BY customer_booking_count DESC;
