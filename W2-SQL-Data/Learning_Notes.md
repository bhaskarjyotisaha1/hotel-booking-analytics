
# W2 - Learning Notes
## SQL + Data | Hotel Booking Analytics

### 1. Introduction
During Week 2, I learned how to create relational
databases, manage records, retrieve information
and prepare analytical summaries using SQL.

### 2. Database Concepts

**Database:**
A structured collection of information.

**Table:**
Stores data in rows and columns.

**Primary Key:**
Uniquely identifies each record in a table.

**Foreign Key:**
Connects two related tables.

Example:
Customer_ID connects customers and bookings.

### 3. CRUD Operations

CRUD represents four basic database operations.

- CREATE / INSERT: Add records.
- READ / SELECT: Retrieve records.
- UPDATE: Modify records.
- DELETE: Remove records.

### 4. Filtering

Learned how to retrieve specific records using:

- WHERE
- AND
- OR
- IN
- BETWEEN
- LIKE
- ORDER BY

Example:

SELECT *
FROM bookings
WHERE is_canceled = 1;

This retrieves cancelled bookings.

### 5. SQL JOIN Operations

**INNER JOIN:**
Returns matching records from both tables.

**LEFT JOIN:**
Returns all records from the left table
and matching records from the right table.

Used Customer_ID to connect customer
information with booking information.

### 6. Aggregate Functions

Learned the following functions:

- COUNT(): Counts records.
- SUM(): Calculates totals.
- AVG(): Calculates averages.
- MIN(): Finds minimum values.
- MAX(): Finds maximum values.

### 7. GROUP BY and HAVING

GROUP BY groups records based on a column.

HAVING filters grouped results.

Example:

SELECT market_segment, COUNT(*)
FROM bookings
GROUP BY market_segment;

### 8. Hotel Booking Analytics

Learned how to calculate:

- Total booking records.
- Unique customer count.
- Cancelled booking count.
- Cancellation percentage.
- Average Daily Rate.
- Repeat guest bookings.
- Market segment summaries.

Cancellation Rate Formula:

(Cancelled Bookings / Total Bookings) * 100

### 9. Data Quality

Learned to identify:

- Duplicate records.
- Missing values.
- NULL values.
- Invalid values.
- Negative ADR.
- Incorrect cancellation flags.
- Unmatched foreign keys.

### 10. Practical Skills Gained

- Creating relational database tables.
- Writing SQL queries.
- Managing database records.
- Connecting tables using JOIN.
- Performing data aggregation.
- Validating hotel booking data.
- Preparing data for analytics applications.

### 11. Conclusion

Week 2 improved my practical understanding
of SQL database development and data management.

I learned how SQL supports hotel booking analytics
by organizing booking information, validating
data and generating useful business summaries.
