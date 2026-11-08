# W2 – SQL + Data Engineering Proof of Work

## 1. Project Overview

**Project:** Hotel Booking Cancellation Analytics  
**Milestone:** W2 – Week 2 – Build + Connect  
**Role:** AI Data Engineer  
**Database:** MySQL Workbench  
**Dataset:** Hotel Booking Dataset  
**Imported Records:** 29,981

## 2. Objective

The objective of this milestone was to implement SQL database operations, develop analytical queries, validate booking data and prepare structured outputs for integration with the team's analytics and web application components.

## 3. Implementation Details

### A. Database and Table Structure
- Connected to the existing MySQL database.
- Inspected the hotel_bookings table.
- Verified column names and data types.
- Checked the imported record count.

### B. CRUD Operations
Implemented:
- INSERT – Inserted a test booking record into a temporary table.
- SELECT – Retrieved booking records.
- UPDATE – Modified the temporary test record.
- DELETE – Removed the temporary test record.

### C. Filtering Operations
Implemented filtering using:
- WHERE
- AND
- BETWEEN
- ORDER BY
- LIMIT

### D. JOIN Operations
Implemented:
- INNER JOIN with customer-level booking summaries.
- LEFT JOIN with monthly booking summaries.

### E. Aggregation Operations
Implemented:
- COUNT()
- SUM()
- AVG()
- GROUP BY
- HAVING()

Prepared summaries for monthly bookings, cancellation rates, customer activity, states, market segments and ADR.

### F. Data Quality Validation
Performed checks for:
- Duplicate booking IDs.
- Missing customer IDs.
- Missing reservation dates.
- Negative ADR.
- Invalid cancellation values.
- Missing booking IDs and customer states.

## 4. Execution Evidence

The following screenshots are included:

1. Database and table structure.
2. Total imported booking records.
3. CRUD execution results.
4. Filtering query results.
5. JOIN query results.
6. Aggregation query results.
7. Data-quality validation results.

## 5. Team Integration

SQL outputs and validated booking records support the Power BI analytics and role-based web application developed by the other team members.

## 6. Outcome

The W2 implementation demonstrates SQL database operations, analytical query development, data validation and preparation of structured outputs for the hotel booking analytics project.

**Note:** All numerical data-quality findings will be reported using actual MySQL execution results.
