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


-- 9. Invalid cancellation values
SELECT COUNT(*) AS invalid_cancellation_records
FROM hotel_bookings
WHERE is_canceled NOT IN (0, 1)
   OR is_canceled IS NULL;


-- 10. Invalid age
SELECT COUNT(*) AS invalid_age_records
FROM hotel_bookings
WHERE Age < 0 OR Age > 120;


-- 11. Missing state
SELECT COUNT(*) AS missing_state_records
FROM hotel_bookings
WHERE Customer_State IS NULL
   OR TRIM(Customer_State) = '';
