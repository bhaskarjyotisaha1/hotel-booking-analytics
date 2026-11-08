USE your_existing_database_name;

-- 1. Total booking records
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;


-- 2. Total unique customers
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers
FROM hotel_bookings
WHERE Customer_ID IS NOT NULL;


-- 3. Cancellation summary
SELECT
    is_canceled,
    COUNT(*) AS booking_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hotel_bookings), 2
    ) AS percentage
FROM hotel_bookings
GROUP BY is_canceled;


-- 4. Monthly booking summary
SELECT
    arrival_year,
    arrival_month,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancelled_bookings,
    ROUND(AVG(is_canceled) * 100, 2) AS cancellation_rate
FROM hotel_bookings
GROUP BY arrival_year, arrival_month
ORDER BY arrival_year, arrival_month;


-- 5. State-wise booking analysis
SELECT
    Customer_State,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancelled_bookings,
    ROUND(AVG(is_canceled) * 100, 2) AS cancellation_rate
FROM hotel_bookings
GROUP BY Customer_State
ORDER BY total_bookings DESC;


-- 6. Market segment analysis
SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS cancelled_bookings,
    ROUND(AVG(is_canceled) * 100, 2) AS cancellation_rate
FROM hotel_bookings
GROUP BY market_segment;


-- 7. Average Daily Rate analysis
SELECT
    reserved_room_type,
    COUNT(*) AS total_bookings,
    ROUND(AVG(average_daily_rate), 2) AS average_adr,
    ROUND(SUM(average_daily_rate), 2) AS total_adr
FROM hotel_bookings
GROUP BY reserved_room_type
ORDER BY average_adr DESC;


-- 8. Repeat customer analysis
SELECT
    Customer_ID,
    COUNT(*) AS booking_count,
    SUM(is_canceled) AS cancelled_bookings
FROM hotel_bookings
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY booking_count DESC;
