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