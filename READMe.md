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
        ├── basics/               ← Fundamentals (this batch)
        ├── joins/                ← JOIN types (coming soon)
        ├── subqueries/           ← Subqueries & nested queries (coming soon)
        ├── window_functions/     ← RANK, ROW_NUMBER, etc. (coming soon)
        ├── stored_procedures/    ← Procedures & functions (coming soon)
        ├── indexes/              ← Indexing & performance (coming soon)
        └── advanced/             ← CTEs, views, transactions (coming soon)

---

## ✅ Progress Tracker

### 🟢 Basics (Completed)

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

### 🔵 Joins (Up Next)

| # | File | Topic | Status |
|---|---|---|---|
| 19 | joins/01_inner_join.sql | INNER JOIN | 🔲 Pending |
| 20 | joins/02_left_join.sql | LEFT JOIN | 🔲 Pending |
| 21 | joins/03_right_join.sql | RIGHT JOIN | 🔲 Pending |
| 22 | joins/04_full_outer_join.sql | FULL OUTER JOIN | 🔲 Pending |
| 23 | joins/05_self_join.sql | SELF JOIN | 🔲 Pending |
| 24 | joins/06_cross_join.sql | CROSS JOIN | 🔲 Pending |
| 25 | joins/07_multiple_joins.sql | Joining Multiple Tables | 🔲 Pending |

---

### 🟡 Subqueries

| # | File | Topic | Status |
|---|---|---|---|
| 26 | subqueries/01_scalar_subquery.sql | Scalar Subquery | 🔲 Pending |
| 27 | subqueries/02_subquery_in_where.sql | Subquery in WHERE | 🔲 Pending |
| 28 | subqueries/03_subquery_in_from.sql | Subquery in FROM | 🔲 Pending |
| 29 | subqueries/04_correlated_subquery.sql | Correlated Subquery | 🔲 Pending |
| 30 | subqueries/05_exists_not_exists.sql | EXISTS / NOT EXISTS | 🔲 Pending |

---

### 🟠 Window Functions

| # | File | Topic | Status |
|---|---|---|---|
| 31 | window_functions/01_row_number.sql | ROW_NUMBER() | 🔲 Pending |
| 32 | window_functions/02_rank_dense_rank.sql | RANK() / DENSE_RANK() | 🔲 Pending |
| 33 | window_functions/03_lead_lag.sql | LEAD() / LAG() | 🔲 Pending |
| 34 | window_functions/04_partition_by.sql | PARTITION BY | 🔲 Pending |
| 35 | window_functions/05_running_totals.sql | Running Totals with SUM OVER | 🔲 Pending |

---

### 🔴 Advanced

| # | File | Topic | Status |
|---|---|---|---|
| 36 | advanced/01_cte.sql | Common Table Expressions (CTE) | 🔲 Pending |
| 37 | advanced/02_views.sql | Creating and Using Views | 🔲 Pending |
| 38 | advanced/03_indexes.sql | Indexes and Performance | 🔲 Pending |
| 39 | advanced/04_transactions.sql | Transactions (COMMIT, ROLLBACK) | 🔲 Pending |
| 40 | advanced/05_stored_procedures.sql | Stored Procedures | 🔲 Pending |
| 41 | advanced/06_triggers.sql | Triggers | 🔲 Pending |
| 42 | advanced/07_string_functions.sql | String Functions | 🔲 Pending |
| 43 | advanced/08_date_functions.sql | Date & Time Functions | 🔲 Pending |

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
3. Add the topic to the progress table in this README
4. Change status from `🔲 Pending` to `✅ Done` once practiced

---

## 📖 Resources

- [MySQL Official Docs](https://dev.mysql.com/doc/)
- [Sakila DB Guide](https://dev.mysql.com/doc/sakila/en/)
- [W3Schools SQL](https://www.w3schools.com/sql/)
- [SQLZoo Practice](https://sqlzoo.net/)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial/)

---

*This repository is a living document — updated continuously as new SQL topics are learned.*
