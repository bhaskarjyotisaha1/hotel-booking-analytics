
USE your_existing_database_name;

-- JOIN 1: Booking details with customer booking summary

SELECT
    b.booking_id,
    b.Customer_ID,
    b.Customer_State,
    b.is_canceled,
    c.total_bookings,
    c.cancelled_bookings
FROM hotel_bookings b
INNER JOIN
(
    SELECT
        Customer_ID,
        COUNT(*) AS total_bookings,
        SUM(is_canceled) AS cancelled_bookings
    FROM hotel_bookings
    WHERE Customer_ID IS NOT NULL
    GROUP BY Customer_ID
) c
ON b.Customer_ID = c.Customer_ID
LIMIT 20;


-- JOIN 2: Booking details with monthly summary

SELECT
    b.booking_id,
    b.arrival_year,
    b.arrival_month,
    b.is_canceled,
    m.monthly_bookings,
    m.monthly_cancellations
FROM hotel_bookings b
LEFT JOIN
(
    SELECT
        arrival_year,
        arrival_month,
        COUNT(*) AS monthly_bookings,
        SUM(is_canceled) AS monthly_cancellations
    FROM hotel_bookings
    GROUP BY arrival_year, arrival_month
) m
ON b.arrival_year = m.arrival_year
AND b.arrival_month = m.arrival_month
LIMIT 20;
