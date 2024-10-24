1) Retrieve the first 5 employees by highest salary.
Hint: Use LIMIT.

SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

2) Retrieve the 5 employees with the lowest salary, skipping the first 10 records.
Hint: Combine ORDER BY with LIMIT and OFFSET.

SELECT employee_name, salary
FROM employees
ORDER BY salary ASC
LIMIT 5 OFFSET 10;

3) Display each departments total salary, but only show departments where the total salary exceeds $30,000.
Hint: Use GROUP BY and HAVING.

SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 30000;

4) For each employee, display their salary and a note if it is above or below $7000.
Hint: Use the CASE statement.

SELECT employee_name, salary,
CASE
    WHEN salary > 7000 THEN 'Above $7000'
    ELSE 'Below $7000'
END AS salary_note
FROM employees;
5) List the projects that started in the last 6 months.
Hint: Use CURDATE() and DATE_SUB().

SELECT project_name, start_date
FROM projects
WHERE start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

6) Display all projects, including those with no employees assigned.
Hint: Use RIGHT JOIN.

SELECT projects.project_name, employees.employee_name
FROM projects
RIGHT JOIN employees_projects ON projects.project_id = employees_projects.project_id
LEFT JOIN employees ON employees_projects.employee_id = employees.employee_id;

7) Increase the salary of all employees in the 'Finance' department by 12%.
Hint: Use UPDATE.

UPDATE employees
SET salary = salary * 1.12
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Finance');

8) Retrieve the first and last names of employees whose last names start with 'S'.
Hint: Use LIKE.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'S%';

9) Count the number of employees assigned to each department.
Hint: Use COUNT and GROUP BY.

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

10) Find the total number of hours worked by employees on each project.
Hint: Use JOIN and SUM.

SELECT projects.project_name, SUM(work_hours) AS total_hours
FROM employees_projects
JOIN projects ON employees_projects.project_id = projects.project_id
GROUP BY projects.project_name;

11) Select the employees who earn more than the average salary.
Hint: Use a subquery to find the average salary.

SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

12) Display each projects start date in the format 'Month Day, Year' (e.g., January 01, 2024).
Hint: Use DATE_FORMAT().

SELECT project_name, DATE_FORMAT(start_date, '%M %d, %Y') AS formatted_start_date
FROM projects;

13) List all employees, their department names, and the projects they have worked on.
Hint: Use multiple JOIN clauses.

SELECT e.employee_name, d.department_name, p.project_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id;

14) List all projects, showing 'Assigned' if any employees are assigned and 'Unassigned' otherwise.
Hint: Use RIGHT JOIN with CASE.

SELECT p.project_name, 
       CASE 
           WHEN ep.employee_id IS NOT NULL THEN 'Assigned'
           ELSE 'Unassigned'
       END AS assignment_status
FROM projects p
RIGHT JOIN employees_projects ep ON p.project_id = ep.project_id;

15) Find the average salary of employees in each department, but only show departments where more than 5 employees work.
Hint: Use GROUP BY with HAVING.

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

16) Concatenate employees first and last names into a single full name, separated by a space.
Hint: Use CONCAT().

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

17) Set all employees with salaries above $8000 and belonging to the 'IT' department to a new salary of $8500.
Hint: Use UPDATE with WHERE.

UPDATE employees
SET salary = 8500
WHERE salary > 8000
AND department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');

18) Find the employee with the highest salary who works in the 'HR' department.
Hint: Use a subquery with MAX().

SELECT employee_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) 
                FROM employees 
                WHERE department_id = (SELECT department_id 
                                       FROM departments 
                                       WHERE department_name = 'HR'));
									   
19) Find employees who have been assigned to projects that will end within the next 2 months.
Hint: Use CURDATE() and DATE_ADD().

SELECT e.employee_name, p.project_name, p.end_date
FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE p.end_date <= DATE_ADD(CURDATE(), INTERVAL 2 MONTH);

20) For each project, show the total salary billed based on the hours worked by employees, but only for projects where total billing exceeds $10,000.
Hint: Use JOIN, SUM, and HAVING.

SELECT p.project_name, SUM(e.salary * ep.hours_worked) AS total_billing
FROM projects p
JOIN employees_projects ep ON p.project_id = ep.project_id
JOIN employees e ON ep.employee_id = e.employee_id
GROUP BY p.project_name
HAVING SUM(e.salary * ep.hours_worked) > 10000;