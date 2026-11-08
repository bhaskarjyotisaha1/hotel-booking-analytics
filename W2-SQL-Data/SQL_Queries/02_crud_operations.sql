USE your_existing_database_name;

-- Create a temporary test table
CREATE TEMPORARY TABLE w2_crud_test
LIKE hotel_bookings;

-- CREATE: Insert one actual booking as a test record
INSERT INTO w2_crud_test
SELECT *
FROM hotel_bookings
LIMIT 1;

-- READ: Display the inserted record
SELECT *
FROM w2_crud_test;

-- UPDATE: Change the test record's cancellation status
UPDATE w2_crud_test
SET is_canceled = CASE
    WHEN is_canceled = 1 THEN 0
    ELSE 1
END;

-- Verify the update
SELECT booking_id, Customer_ID, is_canceled
FROM w2_crud_test;

-- DELETE: Delete the test record
DELETE FROM w2_crud_test;

-- Verify deletion
SELECT COUNT(*) AS remaining_test_records
FROM w2_crud_test;

-- Drop temporary table
DROP TEMPORARY TABLE w2_crud_test;
