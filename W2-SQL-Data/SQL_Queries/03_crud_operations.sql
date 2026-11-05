
-- 03_crud_operations.sql

USE hotel_booking_analytics;

-- CREATE: Insert a new booking
-- Use this only when a genuine new booking is received.
-- Booking ID must be unique.

-- INSERT INTO hotel_bookings (
--     booking_id,
--     customer_id,
--     gender,
--     age,
--     customer_city,
--     customer_state,
--     customer_type,
--     loyalty_tier,
--     is_canceled,
--     lead_time,
--     arrival_year,
--     arrival_month,
--     arrival_day,
--     stays_in_weekend_nights,
--     stays_in_week_nights,
--     reservation_status,
--     days_in_waiting_list,
--     adults,
--     children,
--     is_repeated_guest,
--     previous_cancellations,
--     previous_bookings_not_canceled,
--     reserved_room_type,
--     assigned_room_type,
--     average_daily_rate,
--     booking_changes,
--     market_segment,
--     total_nights,
--     revenue,
--     lead_group,
--     lost_revenue,
--     age_group,
--     arrival_date,
--     arrival_weekday,
--     has_children,
--     has_weekend_stay,
--     past_cancel_flag,
--     room_changed
-- )
-- VALUES (
--     'B_NEW001', 'CUST0001', 'Female', 30,
--     'Hyderabad', 'Telangana', 'Returning', 'Silver',
--     0, 20, 2026, 11, 10, 1, 2,
--     'Check-Out', 0, 2, 0, 1, 0, 1,
--     'A', 'A', 120.00, 0, 'Online',
--     3, 360.00, '8-30', 0, '26-35',
--     '2026-11-10', 'Tuesday', 0, 1, 0, 0
-- );

-- READ: View actual booking records
SELECT *
FROM hotel_bookings
LIMIT 20;

-- READ: Find a particular customer's booking history
SELECT *
FROM hotel_bookings
WHERE customer_id = 'CUST0275';

-- READ: Find a specific booking
SELECT *
FROM hotel_bookings
WHERE booking_id = 'B000001';

-- UPDATE: Correct a booking's market segment
-- First verify the booking record.
SELECT *
FROM hotel_bookings
WHERE booking_id = 'B000001';

-- Execute only if this correction is genuinely required.
-- UPDATE hotel_bookings
-- SET market_segment = 'Online'
-- WHERE booking_id = 'B000001';

-- DELETE: Safe deletion test using a transaction.
-- ROLLBACK prevents permanent deletion.
-- START TRANSACTION;
-- DELETE FROM hotel_bookings
-- WHERE booking_id = 'B000001';
-- SELECT ROW_COUNT() AS deleted_records;
-- ROLLBACK;

-- Final record count
SELECT COUNT(*) AS total_records
FROM hotel_bookings;
