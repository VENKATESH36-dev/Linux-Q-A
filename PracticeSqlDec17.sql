CREATE TABLE Employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
department_id INT,
hire_date DATE,
salary DECIMAL(10, 2),
FOREIGN KEY (department_id) references Departments(department_id)
);

CREATE TABLE Departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
manager_id INT,
FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Projects(
project_id INT PRIMARY KEY,
project_name VARCHAR(100) NOT NULL,
start_date DATE,
end_date DATE
);

CREATE TABLE Employee_Projects(
employee_id INT,
project_id INT,
hours_logged DECIMAL(6,2),
allocation_date DATE,

PRIMARY KEY (employee_id, project_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    transaction_type VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
