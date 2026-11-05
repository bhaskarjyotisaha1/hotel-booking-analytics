# W1 – SQL Learning Notes

## 1. Introduction to SQL
SQL (Structured Query Language) is used to create, manage and retrieve data from relational databases.

## 2. Database and Tables
A database stores organized information. Tables contain records (rows) and fields (columns).

## 3. Primary Key
A primary key uniquely identifies each record in a table.

Example: `Customer_ID` or `Booking_ID`.

## 4. Foreign Key
A foreign key connects two tables by referencing the primary key of another table.

Example: `Customer_ID` in the Bookings table references the Customers table.

## 5. SQL Commands
- CREATE: Creates database objects.
- INSERT: Adds new records.
- SELECT: Retrieves records.
- UPDATE: Modifies existing records.
- DELETE: Removes records.

## 6. Filtering and Sorting
- WHERE: Filters records based on conditions.
- ORDER BY: Sorts records.
- GROUP BY: Groups records for analysis.

## 7. Aggregate Functions
- COUNT(): Counts records.
- SUM(): Calculates totals.
- AVG(): Calculates averages.
- MIN(): Finds the minimum value.
- MAX(): Finds the maximum value.

## 8. SQL Joins
- INNER JOIN: Returns matching records from both tables.
- LEFT JOIN: Returns all records from the left table and matching records from the right table.

## 9. Application in Our Project
SQL helps organize hotel booking data, identify cancelled bookings, calculate cancellation rates and analyse booking patterns by market segment, customer type and arrival period.

## 10. Learning Outcome
I understood how SQL supports structured data storage, database relationships and analytical reporting in a hospitality project.
