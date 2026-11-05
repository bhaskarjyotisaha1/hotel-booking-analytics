
USE hotel_booking_analytics;

-- Insert test customers

INSERT INTO customers
(customer_id, customer_state)
VALUES
('C1001', 'Telangana'),
('C1002', 'Andhra Pradesh'),
('C1003', 'Karnataka');

-- Insert test bookings

INSERT INTO bookings
(
    customer_id,
    arrival_year,
    arrival_month,
    is_canceled,
    reservation_status,
    lead_time,
    market_segment,
    reserved_room_type,
    average_daily_rate,
    stays_in_weekend_nights,
    stays_in_week_nights,
    previous_cancellations,
    is_repeated_guest
)
VALUES
('C1001', 2017, 'July', 0, 'Check-Out',
 20, 'Online TA', 'A', 120.00, 1, 2, 0, 0),

('C1002', 2017, 'July', 1, 'Canceled',
 90, 'Offline TA/TO', 'B', 150.00, 2, 3, 1, 0),

('C1001', 2017, 'August', 0, 'Check-Out',
 15, 'Direct', 'A', 100.00, 1, 1, 0, 1),

('C1003', 2018, 'January', 1, 'Canceled',
 120, 'Online TA', 'D', 180.00, 2, 4, 2, 0);

-- Verify inserted records

SELECT * FROM customers;

SELECT * FROM bookings;
