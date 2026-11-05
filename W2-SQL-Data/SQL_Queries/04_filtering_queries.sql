
USE hotel_booking_analytics;

-- 1. Find cancelled bookings

SELECT *
FROM bookings
WHERE is_canceled = 1;

-- 2. Find successful bookings

SELECT *
FROM bookings
WHERE is_canceled = 0;

-- 3. Filter by arrival year

SELECT *
FROM bookings
WHERE arrival_year = 2017;

-- 4. Filter by market segment

SELECT *
FROM bookings
WHERE market_segment = 'Online TA';

-- 5. Find bookings with high lead time

SELECT *
FROM bookings
WHERE lead_time > 90;

-- 6. Find high ADR bookings

SELECT *
FROM bookings
WHERE average_daily_rate > 150;

-- 7. Find repeat guest bookings

SELECT *
FROM bookings
WHERE is_repeated_guest = 1;

-- 8. Filter multiple conditions

SELECT *
FROM bookings
WHERE arrival_year = 2017
AND is_canceled = 1;

