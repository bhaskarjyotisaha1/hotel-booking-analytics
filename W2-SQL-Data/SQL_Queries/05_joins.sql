
USE hotel_booking_analytics;

-- 1. INNER JOIN

SELECT
    c.customer_id,
    c.customer_state,
    b.arrival_year,
    b.arrival_month,
    b.is_canceled,
    b.market_segment,
    b.average_daily_rate
FROM customers c
INNER JOIN bookings b
ON c.customer_id = b.customer_id;

-- 2. LEFT JOIN

SELECT
    c.customer_id,
    c.customer_state,
    b.booking_id,
    b.is_canceled
FROM customers c
LEFT JOIN bookings b
ON c.customer_id = b.customer_id;

-- 3. Customer booking count

SELECT
    c.customer_id,
    c.customer_state,
    COUNT(b.booking_id) AS total_bookings
FROM customers c
LEFT JOIN bookings b
ON c.customer_id = b.customer_id
GROUP BY
    c.customer_id,
    c.customer_state;

-- 4. Customer cancellation count

SELECT
    c.customer_id,
    c.customer_state,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.is_canceled) AS cancelled_bookings
FROM customers c
INNER JOIN bookings b
ON c.customer_id = b.customer_id
GROUP BY
    c.customer_id,
    c.customer_state;

