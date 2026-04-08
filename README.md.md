# 📘 SQL Learning Journey — MySQL Workbench (Sakila DB)

> A personal SQL practice repository. Each topic has its own `.sql` file with notes and hands-on queries run on the **Sakila sample database** in MySQL Workbench. This repo grows as I learn more.

---

## 🛠️ Setup

1. Download and install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
2. Install the [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/sakila-installation.html)
3. Always run `USE sakila;` at the top of every query file
4. Open any `.sql` file from the `practice/` folder and execute it in MySQL Workbench

---

## 📁 Repository Structure

    sql-learning/
    ├── README.md
    └── practice/
        ├── basics/
        ├── functions/
        ├── joins/
        ├── subqueries/           (coming soon)
        ├── window_functions/     (coming soon)
        ├── stored_procedures/    (coming soon)
        ├── indexes/              (coming soon)
        └── advanced/             (coming soon)

---

## ✅ Progress Tracker

### 🟢 Basics (Completed — 07 April 2025)

| # | File | Topic | Status |
|---|---|---|---|
| 01 | basics/01_comments.sql | Comments in SQL | ✅ Done |
| 02 | basics/02_operators.sql | Arithmetic, Comparison, Logical Operators | ✅ Done |
| 03 | basics/03_null_values.sql | NULL, IS NULL, IS NOT NULL | ✅ Done |
| 04 | basics/04_aliases.sql | Column and Table Aliases | ✅ Done |
| 05 | basics/05_select.sql | SELECT Statement | ✅ Done |
| 06 | basics/06_select_distinct.sql | SELECT DISTINCT | ✅ Done |
| 07 | basics/07_where.sql | WHERE Clause | ✅ Done |
| 08 | basics/08_order_by.sql | ORDER BY | ✅ Done |
| 09 | basics/09_limit.sql | LIMIT / OFFSET | ✅ Done |
| 10 | basics/10_like_pattern_matching.sql | Pattern Matching with LIKE | ✅ Done |
| 11 | basics/11_wildcards.sql | Wildcards % and _ | ✅ Done |
| 12 | basics/12_in_operator.sql | IN / NOT IN | ✅ Done |
| 13 | basics/13_between_operator.sql | BETWEEN | ✅ Done |
| 14 | basics/14_is_null.sql | IS NULL / IS NOT NULL | ✅ Done |
| 15 | basics/15_aggregate_functions.sql | COUNT, SUM, AVG, MIN, MAX | ✅ Done |
| 16 | basics/16_group_by.sql | GROUP BY | ✅ Done |
| 17 | basics/17_having.sql | HAVING | ✅ Done |
| 18 | basics/18_case_expression.sql | CASE Expression | ✅ Done |

---

### 🟢 Functions (Completed — 07 April 2025)

| # | File | Topic | Status |
|---|---|---|---|
| 19 | functions/19_string_functions.sql | String Functions | ✅ Done |
| 20 | functions/20_numeric_functions.sql | Numeric Functions | ✅ Done |
| 21 | functions/21_date_time_functions.sql | Date and Time Functions | ✅ Done |
| 22 | functions/22_conversion_cast_convert.sql | Conversion / CAST / CONVERT | ✅ Done |
| 23 | functions/23_coalesce_ifnull_isnull.sql | COALESCE / IFNULL / ISNULL | ✅ Done |
| 24 | functions/24_conditional_logic_case_if.sql | Conditional Logic — CASE / IF / IIF | ✅ Done |

---

### 🟢 Joins (Completed — 07 April 2025)

| # | File | Topic | Status |
|---|---|---|---|
| 25 | joins/25_temporary_tables.sql | Temporary Tables | ✅ Done |
| 26 | joins/26_inner_join.sql | INNER JOIN | ✅ Done |
| 27 | joins/27_left_join.sql | LEFT JOIN | ✅ Done |
| 28 | joins/28_right_join.sql | RIGHT JOIN | ✅ Done |
| 29 | joins/29_full_outer_join.sql | FULL OUTER JOIN | ✅ Done |
| 30 | joins/30_cross_join.sql | CROSS JOIN | ✅ Done |
| 31 | joins/31_self_join.sql | SELF JOIN | ✅ Done |
| 32 | joins/32_multi_table_joins.sql | Multi-Table Joins | ✅ Done |
| 33 | joins/33_joining_aggregated_data.sql | Joining Aggregated Data | ✅ Done |
| 34 | joins/34_join_conditions_and_order.sql | Join Conditions and Join Order | ✅ Done |
| 35 | joins/35_referential_integrity.sql | Referential Integrity Basics | ✅ Done |
| 36 | joins/36_many_to_many_relationships.sql | Many-to-Many Relationships | ✅ Done |

---

### 🔵 Subqueries (Up Next)

| # | File | Topic | Status |
|---|---|---|---|
| 37 | subqueries/37_scalar_subquery.sql | Scalar Subquery | 🔲 Pending |
| 38 | subqueries/38_subquery_in_where.sql | Subquery in WHERE | 🔲 Pending |
| 39 | subqueries/39_subquery_in_from.sql | Subquery in FROM | 🔲 Pending |
| 40 | subqueries/40_correlated_subquery.sql | Correlated Subquery | 🔲 Pending |
| 41 | subqueries/41_exists_not_exists.sql | EXISTS / NOT EXISTS | 🔲 Pending |

---

### 🔵 Window Functions

| # | File | Topic | Status |
|---|---|---|---|
| 42 | window_functions/42_row_number.sql | ROW_NUMBER() | 🔲 Pending |
| 43 | window_functions/43_rank_dense_rank.sql | RANK() / DENSE_RANK() | 🔲 Pending |
| 44 | window_functions/44_lead_lag.sql | LEAD() / LAG() | 🔲 Pending |
| 45 | window_functions/45_partition_by.sql | PARTITION BY | 🔲 Pending |
| 46 | window_functions/46_running_totals.sql | Running Totals with SUM OVER | 🔲 Pending |

---

### 🔵 Advanced

| # | File | Topic | Status |
|---|---|---|---|
| 47 | advanced/47_cte.sql | Common Table Expressions (CTE) | 🔲 Pending |
| 48 | advanced/48_views.sql | Creating and Using Views | 🔲 Pending |
| 49 | advanced/49_indexes.sql | Indexes and Performance | 🔲 Pending |
| 50 | advanced/50_transactions.sql | Transactions (COMMIT, ROLLBACK) | 🔲 Pending |
| 51 | advanced/51_stored_procedures.sql | Stored Procedures | 🔲 Pending |
| 52 | advanced/52_triggers.sql | Triggers | 🔲 Pending |

---

## 🗂️ Key Sakila Tables Reference

| Table | Description |
|---|---|
| film | Movie catalog with ratings, length, rental info |
| actor | Actors linked to films via film_actor |
| customer | Registered customers |
| rental | Rental transactions |
| payment | Payment records |
| inventory | Film copies per store |
| staff | Store employees |
| store | Store locations |
| category | Genres linked via film_category |
| address, city, country | Location data |

---

## 🧠 SQL Clause Execution Order

    1. FROM       -- Identify source table(s)
    2. WHERE      -- Filter individual rows
    3. GROUP BY   -- Group filtered rows
    4. HAVING     -- Filter groups
    5. SELECT     -- Choose columns to display
    6. DISTINCT   -- Remove duplicates
    7. ORDER BY   -- Sort final result
    8. LIMIT      -- Restrict number of rows

---

## 📌 How to Add a New Topic

1. Create a new `.sql` file in the relevant subfolder under `practice/`
2. Follow the naming convention: `##_topic_name.sql`
3. Add the topic row to the correct section table in this README
4. Change status from `🔲 Pending` to `✅ Done` once practiced
5. Add the completion date to the section heading

---

## 📖 Resources

- [MySQL Official Docs](https://dev.mysql.com/doc/)
- [Sakila DB Guide](https://dev.mysql.com/doc/sakila/en/)
- [W3Schools SQL](https://www.w3schools.com/sql/)
- [SQLZoo Practice](https://sqlzoo.net/)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial/)

---

*Last updated: 07 April 2025 — 36 topics completed across Basics, Functions, and Joins.*
