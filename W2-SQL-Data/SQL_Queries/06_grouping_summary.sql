
-- 06_grouping_summary.sql

USE hotel_booking_analytics;

-- 1. Overall hotel booking KPIs
SELECT
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END)
        AS cancelled_bookings,

    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END)
        AS successful_bookings,

    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END)
        * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS cancellation_rate_percentage

FROM hotel_bookings;

-- 2. Year-wise cancellation analysis
SELECT
    arrival_year,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY arrival_year
ORDER BY arrival_year;

-- 3. Month-wise cancellation analysis
SELECT
    arrival_month,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY arrival_month
ORDER BY arrival_month;

-- 4. Customer state analysis
SELECT
    customer_state,
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY customer_state
ORDER BY total_bookings DESC;

-- 5. Market segment performance
SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY market_segment
ORDER BY cancellation_rate DESC;

-- 6. Loyalty tier analysis
SELECT
    loyalty_tier,
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY loyalty_tier
ORDER BY total_bookings DESC;

-- 7. Customer type analysis
SELECT
    customer_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY customer_type;

-- 8. Room type cancellation analysis
SELECT
    reserved_room_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY reserved_room_type
ORDER BY cancellation_rate DESC;

-- 9. Lead group cancellation analysis
SELECT
    lead_group,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings,
    ROUND(
        SUM(is_canceled = 1) * 100.0 /
        NULLIF(COUNT(*), 0), 2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY lead_group;

-- 10. Repeat guest analysis
SELECT
    is_repeated_guest,
    COUNT(*) AS total_bookings,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY is_repeated_guest;

-- 11. Previous cancellation history analysis
SELECT
    past_cancel_flag,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY past_cancel_flag;

-- 12. Children-related booking analysis
SELECT
    has_children,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY has_children;

-- 13. Average ADR by cancellation status
SELECT
    is_canceled,
    COUNT(*) AS total_bookings,
    ROUND(AVG(average_daily_rate), 2) AS average_adr,
    ROUND(MIN(average_daily_rate), 2) AS minimum_adr,
    ROUND(MAX(average_daily_rate), 2) AS maximum_adr
FROM hotel_bookings
GROUP BY is_canceled;

-- 14. Revenue summary by reservation status
SELECT
    reservation_status,
    COUNT(*) AS total_bookings,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(lost_revenue), 2) AS total_lost_revenue
FROM hotel_bookings
GROUP BY reservation_status;

-- 15. Room change analysis
SELECT
    room_changed,
    COUNT(*) AS total_bookings,
    SUM(is_canceled = 1) AS cancelled_bookings
FROM hotel_bookings
GROUP BY room_changed;
