
-- 04_filtering_queries.sql

USE hotel_booking_analytics;

-- 1. Cancelled bookings
SELECT *
FROM hotel_bookings
WHERE is_canceled = 1;

-- 2. Successful bookings
SELECT *
FROM hotel_bookings
WHERE is_canceled = 0;

-- 3. Bookings by year
SELECT *
FROM hotel_bookings
WHERE arrival_year = 2022;

-- 4. Bookings in July
SELECT *
FROM hotel_bookings
WHERE arrival_month = 7;

-- 5. Online market segment bookings
SELECT *
FROM hotel_bookings
WHERE market_segment = 'Online';

-- 6. Returning customers
SELECT *
FROM hotel_bookings
WHERE customer_type = 'Returning';

-- 7. Gold loyalty customers
SELECT *
FROM hotel_bookings
WHERE loyalty_tier = 'Gold';

-- 8. Customers with children
SELECT *
FROM hotel_bookings
WHERE has_children = 1;

-- 9. Bookings with previous cancellation history
SELECT *
FROM hotel_bookings
WHERE past_cancel_flag = 1;

-- 10. Bookings where the assigned room changed
SELECT *
FROM hotel_bookings
WHERE room_changed = 1;

-- 11. Long lead-time bookings
SELECT *
FROM hotel_bookings
WHERE lead_time > 90
ORDER BY lead_time DESC;

-- 12. High-value bookings
SELECT *
FROM hotel_bookings
WHERE revenue > 500
ORDER BY revenue DESC;

-- 13. High ADR bookings
SELECT *
FROM hotel_bookings
WHERE average_daily_rate > 150
ORDER BY average_daily_rate DESC;

-- 14. Combined cancellation and loyalty filter
SELECT *
FROM hotel_bookings
WHERE is_canceled = 1
  AND loyalty_tier = 'Gold';

-- 15. Customer state and year filter
SELECT *
FROM hotel_bookings
WHERE customer_state = 'Telangana'
  AND arrival_year = 2022;
