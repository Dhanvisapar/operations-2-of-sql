-- Task 4: Aggregate Functions and Grouping
-- Assumes a table named 'employees' with columns: id, name, department, salary, bonus, hire_date

-- 1. Total salary paid (SUM)
SELECT SUM(salary) AS total_salary FROM employees;

-- 2. Total salary per department (GROUP BY + SUM)
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 3. Average salary per department (AVG)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 4. Count of employees per department (COUNT)
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

-- 5. Count distinct departments (COUNT DISTINCT)
SELECT COUNT(DISTINCT department) AS distinct_departments FROM employees;

-- 6. Maximum salary by department (MAX)
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 7. Minimum salary by department (MIN)
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- 8. Average + Rounded average salary per department (ROUND + AVG)
SELECT department, ROUND(AVG(salary), 2) AS avg_salary_rounded
FROM employees
GROUP BY department;

-- 9. Sum of salary and bonus per department (SUM multiple columns)
SELECT department, SUM(salary + COALESCE(bonus,0)) AS total_compensation
FROM employees
GROUP BY department;

-- 10. Filter groups with HAVING (departments with more than 5 employees)
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- 11. Departments with average salary > 60000 (HAVING)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 12. Using BETWEEN with aggregates (employees hired between dates, then count)
SELECT department, COUNT(*) AS hires_count
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31'
GROUP BY department;

-- 13. Combining GROUP BY on multiple columns (department + job_title)
-- Assumes a job_title column exists
SELECT department, job_title, COUNT(*) AS count_by_role
FROM employees
GROUP BY department, job_title
ORDER BY department, count_by_role DESC;

-- 14. Using HAVING with SUM (departments with total compensation > 500000)
SELECT department, SUM(salary + COALESCE(bonus,0)) AS total_comp
FROM employees
GROUP BY department
HAVING SUM(salary + COALESCE(bonus,0)) > 500000;

-- 15. Example: top 3 departments by average salary (use subquery for portability)
SELECT department, avg_salary
FROM (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
) t
ORDER BY avg_salary DESC
LIMIT 3;
