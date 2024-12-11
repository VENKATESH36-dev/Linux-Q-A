SELECT order_id, customer_id, customer_date, COUNT(*) 
FROM Order
GROUP BY order_id, customer_id, customer_date
HAVING COUNT(*) > 1;

DELETE o1
FROM Order o1
JOIN Order o2
ON o1.custId = o2.custId
   AND o1.orderDate = o2.orderDate
   AND o1.orderId > o2.orderId;

delete from orders
where order_id not in (
    select min(order_id)
    from orders
    group by cust_id, order_date
);
-----------------------------------------------------------------------
-- employees_projects

CREATE TEMPORARY TABLE employees_projects_temp AS 
SELECT project_id, employee_id
FROM employees_projects
GROUP BY project_id, employee_id;


DELETE FROM employees_projects
WHERE (project_id, employee_id) NOT IN (
    SELECT project_id, employee_id
    FROM employees_projects_temp
);

INSERT INTO employees_projects (project_id, employee_id)
SELECT project_id, employee_id 
FROM employees_projects_temp;

DROP TABLE employees_projects_temp;


---------------------------------------------------------------------------------------

--In Employees_Projects table some rows reference employees who no longer exist in the employees table. Remove these orphaned rows

DELETE ep
FROM employees_projects ep
LEFT JOIN employees e ON ep.employee_id = e.id
WHERE e.id IS NULL;


--Detect Salary gaps
--hint: you want to compare the average salary between departments.
WITH DepartmentAvgSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
OverallAvgSalary AS (
    SELECT AVG(salary) AS overall_avg_salary
    FROM employees
)
SELECT das.department_id, das.avg_salary, oas.overall_avg_salary,
       (das.avg_salary - oas.overall_avg_salary) AS salary_gap
FROM DepartmentAvgSalary das
CROSS JOIN OverallAvgSalary oas
ORDER BY salary_gap DESC;

--Employees working on more than 1 project

SELECT employee_id
FROM employees_projects
GROUP BY employee_id
HAVING COUNT(DISTINCT project_id) > 1;