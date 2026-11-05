# W2 – Learning Report: SQL and Data

## 1. Week 2 Learning Objective

The objective of Week 2 was to strengthen practical SQL knowledge and apply it to the Hotel Booking Analytics project using the actual hotel booking dataset.

I focused on database creation, table design, constraints, data insertion, CRUD operations, filtering, joins, grouping, summary queries and data-quality checks.

## 2. Dataset Understanding

The project dataset used for this work is:

**File:** `hospitality_bookings_with_1000_customers_updated.csv`

| Dataset information | Details |
|---|---:|
| Total booking records | 30,000 |
| Total columns | 38 |
| Unique customers | 1,000 |
| Unique booking IDs | 30,000 |
| Duplicate booking IDs | 0 |

Important columns studied include:

- `booking_id` – unique booking reference.
- `customer_id` – customer identifier.
- `customer_state` – customer's state.
- `arrival_year`, `arrival_month`, `arrival_day` – arrival information.
- `is_canceled` – cancellation indicator.
- `reservation_status` – booking status.
- `lead_time` – days between booking and arrival.
- `average_daily_rate` – average daily room rate.
- `market_segment` – booking channel or segment.
- `is_repeated_guest` – repeat guest indicator.
- `previous_cancellations` – customer's previous cancellations.
- `reserved_room_type` and `assigned_room_type` – room information.
- `revenue` and `lost_revenue` – revenue-related fields.

## 3. SQL Concepts Learned

### A. Database and Table Creation
- Creating a database using `CREATE DATABASE`.
- Selecting a database using `USE`.
- Creating a table using `CREATE TABLE`.
- Defining appropriate data types such as `VARCHAR`, `INT`, `DECIMAL` and `DATE`.

### B. SQL Constraints
- Primary Key: uniquely identifies a booking.
- NOT NULL: prevents missing values in required fields.
- CHECK: validates fields such as cancellation flags.
- INDEX: improves searching and filtering performance.

### C. Data Insertion
- Using `INSERT INTO` to insert records.
- Using `INSERT INTO ... SELECT` to load actual data from an imported staging table.
- Verifying inserted records using `SELECT COUNT(*)`.

### D. CRUD Operations
- Create: inserting a booking record.
- Read: retrieving booking information.
- Update: modifying an existing booking.
- Delete: removing a record when an authorized correction or deletion is required.

### E. Filtering
Practised filtering records using:
- `WHERE`
- `AND` and `OR`
- `IN`
- `BETWEEN`
- `ORDER BY`
- Comparison operators.

### F. Joins
Learned how joins connect related records. Since the current project design uses one main table, a self-join can compare different bookings belonging to the same customer.

### G. Grouping and Summary
Learned to use:
- `GROUP BY`
- `COUNT()`
- `COUNT(DISTINCT ...)`
- `SUM()`
- `AVG()`
- `MIN()` and `MAX()`
- `HAVING`

These functions support booking summaries and cancellation analysis.

### H. Data Quality
Learned to check:
- Missing values.
- Duplicate booking identifiers.
- Invalid cancellation flags.
- Negative ADR values.
- Invalid dates.
- Inconsistent booking information.

## 4. Initial Dataset Validation Findings

The following results were identified during inspection of the uploaded CSV:

| Validation check | Actual finding |
|---|---:|
| Total records | 30,000 |
| Unique booking IDs | 30,000 |
| Unique customers | 1,000 |
| Missing customer IDs | 0 |
| Missing booking IDs | 0 |
| Duplicate booking IDs | 0 |
| Missing arrival dates | 19 |
| Missing arrival weekdays | 19 |
| Negative ADR records | 1 |
| Invalid cancellation flags | 0 |

The 19 records with missing arrival dates contain an arrival year of 1900. These records require investigation before date-based analysis.

One negative ADR record was identified:

- Booking ID: `B003790`
- ADR: `-6.38`

These values should be investigated and documented rather than silently deleted.

## 5. Business Analysis Understanding

I learned how SQL can support hotel business questions, including:

1. How many bookings were received?
2. How many unique customers made bookings?
3. What percentage of bookings were cancelled?
4. Which market segments have higher cancellation rates?
5. Which states contribute the highest booking volume?
6. How does cancellation vary by room type?
7. How does previous cancellation history relate to current cancellations?
8. What is the average daily rate for cancelled and non-cancelled bookings?

## 6. Learning Outcome

By the end of Week 2, I developed a better understanding of how SQL supports real-world data management and analytics.

I learned how to design a database, define constraints, retrieve and filter data, perform CRUD operations, use joins and aggregate functions, and validate data quality.

These SQL concepts form the foundation for connecting the hotel booking dataset to Python, Power BI and the project's web application.

## 7. Next Learning Step

The next step is to complete SQL execution and verification, document query outputs, and prepare the validated data for further Python-based analysis.
