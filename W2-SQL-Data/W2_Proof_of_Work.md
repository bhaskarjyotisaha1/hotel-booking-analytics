# W2 – Proof of Work
## Hotel Booking Analytics – SQL and Data Implementation

### 1. Project Information

| Item | Details |
|---|---|
| Project | Hotel Booking Analytics |
| Week | Week 2 |
| Phase | SQL and Data Implementation |
| Database | MySQL |
| Source dataset | hospitality_bookings_with_1000_customers_updated.csv |
| Dataset records | 30,000 |
| Dataset columns | 38 |
| Unique customers | 1,000 |

### 2. Week 2 Objective

The objective of Week 2 was to build the SQL foundation for the Hotel Booking Analytics project using the actual hotel booking dataset.

The work focuses on creating the database and table, importing the dataset, implementing SQL queries, analysing booking information and checking data quality.

### 3. Dataset Inspection

The uploaded dataset was inspected to understand its structure and contents.

Verified findings:

- 30,000 booking records.
- 38 columns.
- 1,000 unique customers.
- 30,000 unique booking IDs.
- 10 distinct customer states.
- 2 market segments.
- Cancellation flag contains valid 0 and 1 values.

### 4. SQL Implementation Plan

The following SQL files are prepared for the project:

| SQL file | Implementation |
|---|---|
| `01_create_tables.sql` | Create database and main hotel bookings table with constraints |
| `02_insert_sample_data.sql` | Load actual dataset records into the main table |
| `03_crud_operations.sql` | Implement Create, Read, Update and Delete |
| `04_filtering_queries.sql` | Filter bookings by cancellation, year, segment, customer and other conditions |
| `05_joins.sql` | Compare bookings belonging to the same customer using a self-join |
| `06_grouping_summary.sql` | Generate booking, cancellation, customer, state and ADR summaries |
| `07_data_quality_checks.sql` | Check missing values, duplicate IDs, invalid values and data consistency |

**Database design:** The current implementation uses one main table, `hotel_bookings`, because the project currently uses one source dataset. A separate customer table is not required for this version.

### 5. Initial Data Quality Findings

| Quality check | Result |
|---|---:|
| Total records | 30,000 |
| Duplicate booking IDs | 0 |
| Missing booking IDs | 0 |
| Missing customer IDs | 0 |
| Missing arrival dates | 19 |
| Missing arrival weekdays | 19 |
| Negative ADR values | 1 |
| Invalid cancellation flags | 0 |

**Issues identified:**

1. Nineteen records have missing arrival dates and arrival weekdays.
2. These records have an arrival year of 1900, which requires investigation.
3. One record has a negative ADR value of -6.38 (booking `B003790`).

The identified issues are documented for further validation and correction decisions.

### 6. SQL Execution Evidence

Complete this section after running the SQL scripts in MySQL Workbench.

| Evidence | Status |
|---|---|
| Database creation | Pending screenshot |
| Table creation and constraints | Pending screenshot |
| Actual dataset import | Pending screenshot |
| Inserted record count | Pending screenshot |
| CRUD query execution | Pending screenshot |
| Filtering query execution | Pending screenshot |
| Join query execution | Pending screenshot |
| Grouping and summary outputs | Pending screenshot |
| Data-quality check outputs | Pending screenshot |

### 7. Screenshots

Add the following screenshots to the `Screenshots` folder:

1. `01_database_creation.png`
2. `02_table_structure.png`
3. `03_dataset_import.png`
4. `04_inserted_records.png`
5. `05_crud_operations.png`
6. `06_filtering_queries.png`
7. `07_join_results.png`
8. `08_grouping_summary.png`
9. `09_data_quality_checks.png`

### 8. Outcome

The actual hotel booking dataset has been inspected, its structure understood and initial data-quality issues identified. The SQL implementation is organized into seven scripts covering database creation, data loading, CRUD operations, filtering, joins, aggregation and validation.

The remaining work is to execute the scripts in MySQL Workbench, verify the actual database outputs, capture screenshots and document the execution results.

### 9. Next Step

After completing SQL implementation, the validated hotel booking data will be prepared for Python-based data analysis and further integration with the project's Power BI dashboards and web application.
