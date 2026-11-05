
USE hotel_booking_analytics;

-- CREATE: Add a new customer

INSERT INTO customers
(customer_id, customer_state)
VALUES
('C1004', 'Tamil Nadu');

-- READ: View all customers

SELECT * FROM customers;

-- READ: View bookings

SELECT * FROM bookings;

-- UPDATE: Change customer state

UPDATE customers
SET customer_state = 'Telangana'
WHERE customer_id = 'C1004';

-- UPDATE: Change booking rate

UPDATE bookings
SET average_daily_rate = 175.00
WHERE booking_id = 2;

-- DELETE: Demonstrate deletion safely

START TRANSACTION;

DELETE FROM customers
WHERE customer_id = 'C1004';

-- Check the result before committing

SELECT * FROM customers
WHERE customer_id = 'C1004';

-- Restore the test record

ROLLBACK;

