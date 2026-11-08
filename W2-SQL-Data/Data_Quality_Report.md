# W2 – Hotel Booking Data Quality Report

## 1. Dataset Information

- Project: Hotel Booking Cancellation Analytics
- Database: MySQL
- Table: hotel_bookings
- Imported records: 29,981
- Analysis: SQL data validation and quality assessment

## 2. Data Quality Checks

| Validation | Actual findings | Action |
|---|---:|---|
| Total booking records | 29,981 | Verified |
| Duplicate booking IDs | Pending execution | Investigate |
| Missing booking IDs | Pending execution | Investigate |
| Missing Customer_ID | Pending execution | Investigate |
| Missing reservation status dates | Pending execution | Document and investigate |
| Negative ADR | Pending execution | Investigate |
| Invalid cancellation values | Pending execution | Validate |

## 3. Validation Methods

The following SQL techniques were used:

- COUNT() to measure records and missing values.
- GROUP BY and HAVING to identify duplicate booking IDs.
- IS NULL to identify missing values.
- Conditional filtering to identify invalid cancellation values.
- Numeric comparisons to identify negative ADR values.

## 4. Data Cleaning Approach

Data-quality issues were identified before modifying the source data.

The original booking table was preserved during testing. Any proposed corrections will be documented and validated before implementation.

## 5. Conclusion

SQL validation helps ensure that hotel booking records are reliable for further analytics, reporting and application integration.
