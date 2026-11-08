USE your_existing_database_name;

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM hotel_bookings;


-- 2. Duplicate booking IDs
SELECT
    booking_id,
    COUNT(*) AS duplicate_count
FROM hotel_bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


-- 3. Total duplicate booking IDs
SELECT
    COUNT(*) AS duplicate_id_groups
FROM (
    SELECT booking_id
    FROM hotel_bookings
    GROUP BY booking_id
    HAVING COUNT(*) > 1
) AS duplicates;


-- 4. Missing booking IDs
SELECT COUNT(*) AS missing_booking_ids
FROM hotel_bookings
WHERE booking_id IS NULL
   OR TRIM(booking_id) = '';


-- 5. Missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM hotel_bookings
WHERE Customer_ID IS NULL
   OR TRIM(Customer_ID) = '';


-- 6. Missing reservation status
SELECT COUNT(*) AS missing_reservation_status
FROM hotel_bookings
WHERE reservation_status IS NULL;


-- 7. Missing reservation status date
SELECT COUNT(*) AS missing_status_dates
FROM hotel_bookings
WHERE reservation_status_date IS NULL;


-- 8. Negative ADR
SELECT COUNT(*) AS negative_adr_records
FROM hotel_bookings
WHERE average_daily_rate < 0;



SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT booking_id) AS unique_booking_ids,
    COUNT(*) - COUNT(DISTINCT booking_id) AS duplicate_id_difference,
    SUM(booking_id IS NULL OR TRIM(booking_id) = '')
        AS missing_booking_ids,
    SUM(Customer_ID IS NULL OR TRIM(Customer_ID) = '')
        AS missing_customer_ids,
    SUM(is_canceled IS NULL OR is_canceled NOT IN (0,1))
        AS invalid_cancellation_values,
    SUM(average_daily_rate < 0)
        AS negative_adr_records
FROM hotel_bookings;
