
Overview

This task focuses on using SQL aggregate functions and grouping to summarize, analyze, and filter data.

Key Concepts

Aggregate Functions: SUM, AVG, COUNT, MIN, MAX, ROUND

GROUP BY: Group rows to perform aggregation

HAVING: Filter groups after aggregation

WHERE: Filter rows before grouping

COUNT(DISTINCT): Count unique values

COALESCE: Handle NULL values in calculations

CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT,
  department TEXT,
  job_title TEXT,
  salary NUMERIC,
  bonus NUMERIC,
  hire_date DATE
);
