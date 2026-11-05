-- W1: Hotel Booking Data Validation
USE hotel_booking_analytics;

-- 1. Check total booking records
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;

-- 2. Check unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM hotel_bookings;

-- 3. Check missing booking IDs
SELECT COUNT(*) AS missing_booking_ids
FROM hotel_bookings
WHERE booking_id IS NULL;

-- 4. Check duplicate booking IDs
SELECT booking_id, COUNT(*) AS duplicate_count
FROM hotel_bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;

-- 5. Check cancellation values
SELECT is_canceled, COUNT(*) AS record_count
FROM hotel_bookings
GROUP BY is_canceled;

-- 6. Check missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM hotel_bookings
WHERE customer_id IS NULL;

-- 7. Check negative ADR values
SELECT COUNT(*) AS negative_adr_records
FROM hotel_bookings
WHERE average_daily_rate < 0;

-- 8. Check missing arrival dates
SELECT COUNT(*) AS missing_arrival_dates
FROM hotel_bookings
WHERE arrival_date IS NULL;

-- 9. Check bookings by market segment
SELECT market_segment, COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY market_segment
ORDER BY total_bookings DESC;

-- 10. Check cancellation status
SELECT reservation_status, COUNT(*) AS total_records
FROM hotel_bookings
GROUP BY reservation_status;
