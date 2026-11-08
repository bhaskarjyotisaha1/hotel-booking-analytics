USE your_existing_database_name;

-- 1. Display cancelled bookings
SELECT *
FROM hotel_bookings
WHERE is_canceled = 1;

-- 2. Display successful bookings
SELECT *
FROM hotel_bookings
WHERE is_canceled = 0;

-- 3. Filter bookings by arrival year
SELECT *
FROM hotel_bookings
WHERE arrival_year = 2022;

-- 4. Filter bookings by state
SELECT *
FROM hotel_bookings
WHERE Customer_State = 'Telangana';

-- 5. Filter by market segment
SELECT *
FROM hotel_bookings
WHERE market_segment = 'Online';

-- 6. Filter by ADR range
SELECT *
FROM hotel_bookings
WHERE average_daily_rate BETWEEN 100 AND 200;

-- 7. Display bookings with highest lead time
SELECT *
FROM hotel_bookings
ORDER BY lead_time DESC
LIMIT 10;
