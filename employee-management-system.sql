-- step 1: create the database

CREATE DATABASE Employee_Management;
USE Employee_Management;

-- Step 2: Create the Jobs Table   

CREATE TABLE Jobs(
      job_id INT AUTO_INCREMENT PRIMARY KEY,
      job_title VARCHAR(100) NOT NULL,
      min_salary DECIMAL(10,2),
      max_salary DECIMAL(10,2)
      );
      
-- Step 3: Create the Departments Table

CREATE TABLE Departments(
      department_id INT AUTO_INCREMENT PRIMARY KEY,
      department_name VARCHAR(100) NOT NULL,
      manager_id INT
      );
      
-- Step 4: Create the Employees Table   

CREATE TABLE Employees(
      employee_id INT AUTO_INCREMENT PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      email_id VARCHAR(100) UNIQUE NOT NULL,
      phone_number VARCHAR(15),
      hire_date DATE NOT NULL,
      job_id INT,
      department_id INT,
      salary DECIMAL(10,2) NOT NULL,
      manager_id INT,
      FOREIGN KEY (job_id) REFERENCES Jobs (job_id),
      FOREIGN KEY (department_id) REFERENCES Departments (department_id),
      FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) ON DELETE SET NULL
      );  

-- Step 5: Create the Salaries Table      

CREATE TABLE Salaries(
     salary_id INT AUTO_INCREMENT PRIMARY KEY,
     employee_id INT,
     amount DECIMAL(10,2) NOT NULL,
     date_given DATE NOT NULL,
     FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
     );

-- Step 6: Create the Leave_records Table     
     
CREATE TABLE Leave_records(
     leave_id INT AUTO_INCREMENT PRIMARY KEY,
     employee_id INT,
     leave_type VARCHAR(50),
     start_date DATE,
     end_date DATE,
     status ENUM ('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
     FOREIGN KEY(employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
     );

-- Step 7: Insert Sample Data into Jobs Table     
     
INSERT INTO Jobs(job_title, min_salary, max_salary) VALUES
('Software Engineer', 50000, 120000),
('HR Manager', 60000, 150000),
('Data Analyst', 55000, 110000),
('System Administrator', 50000, 100000);    

-- Step 8: Insert Sample Data into Departments Table

INSERT INTO Departments(department_name, manager_id) VALUES
('IT', NULL),
('Human Resources', NULL),
('Finance', NULL);

-- Step 9: Insert Sample Data into Employees Table

INSERT INTO Employees(first_name, last_name, email_id, phone_number, hire_date, job_id, department_id, salary, manager_id) VALUES
('John', 'Doe', 'john.doe@email.com', '1234567890', '2022-08-15', 1, 1, 75000, NULL),
('Alice', 'Smith', 'alice.smith@email.com', '9876543210', '2021-06-10', 2, 2, 90000, 1),
('Robert', 'Brown', 'robert.brown@email.com', '7890123456', '2020-03-25', 3, 3, 70000, NULL);

-- Step 10: Insert Sample Data into Salaries Table

INSERT INTO Salaries(employee_id, amount, date_given) VALUES
(1, 75000, '2023-01-01'),
(2, 90000, '2023-01-01'),
(3, 70000, '2023-01-01');

-- Step 11: Insert Sample Data into Leave_records Table

INSERT INTO Leave_records(employee_id, leave_type, start_date, end_date, status) VALUES
(1, 'Sick Leave', '2024-03-01', '2024-03-03', 'Approved'),
(2, 'Casual Leave', '2024-03-05', '2024-03-06', 'Pending'),
(3, 'Annual Leave', '2024-04-10', '2024-04-20', 'Approved');
