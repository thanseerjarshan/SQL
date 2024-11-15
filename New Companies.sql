
"""
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers,
total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, 
if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
"""


-- Company table
CREATE TABLE Company_dtl (
    company_code VARCHAR(10),
    founder VARCHAR(50)
);

-- Lead_Manager table
CREATE TABLE Lead_Manager (
    lead_manager_id INT,
    company_code VARCHAR(10)
);

-- Senior_Manager table
CREATE TABLE Senior_Manager (
    senior_manager_id INT,
    company_code VARCHAR(10)
);

-- Manager table
CREATE TABLE Manager_company (
    manager_id INT,
    company_code VARCHAR(10)
);

-- Employee table
CREATE TABLE Employee_company (
    employee_id INT,
    company_code VARCHAR(10)
);



INSERT INTO Company_dtl (company_code, founder) VALUES
('C_1', 'Alice'),
('C_1', 'Alice'),  -- Duplicate
('C_2', 'Bob'),
('C_2', 'Bob'),    -- Duplicate
('C_10', 'Charlie');

INSERT INTO Lead_Manager (lead_manager_id, company_code) VALUES
(1, 'C_1'),
(2, 'C_1'),
(3, 'C_2'),
(4, 'C_2'),
(5, 'C_10');



INSERT INTO Senior_Manager (senior_manager_id, company_code) VALUES
(1, 'C_1'),
(2, 'C_1'),
(3, 'C_2'),
(4, 'C_2'),
(5, 'C_10'),
(6, 'C_10');  -- Duplicate entry for testing


INSERT INTO Manager_company(manager_id, company_code) VALUES
(1, 'C_1'),
(2, 'C_1'),
(3, 'C_1'),    -- Duplicate entry for testing
(4, 'C_2'),
(5, 'C_10');


INSERT INTO Employee_company(employee_id, company_code) VALUES
(1, 'C_1'),
(2, 'C_1'),
(3, 'C_1'),    -- Duplicate entry for testing
(4, 'C_2'),
(5, 'C_2'),    -- Duplicate entry for testing
(6, 'C_10');


-- Selecting all records from Company_dtl
SELECT * FROM Company_dtl;

-- Selecting all records from Lead_Manager
SELECT * FROM Lead_Manager;

-- Selecting all records from Senior_Manager
SELECT * FROM Senior_Manager;

-- Selecting all records from Manager_company
SELECT * FROM Manager_company;

-- Selecting all records from Employee_company
SELECT * FROM Employee_company;


SELECT 
    c.company_code,
    c.founder,
    COALESCE(t1.LM, 0) AS total_lead_managers,
    COALESCE(t2.SM, 0) AS total_senior_managers,
    COALESCE(t3.M, 0) AS total_managers,
    COALESCE(t4.E, 0) AS total_employees
FROM
    (SELECT DISTINCT company_code, founder 
     FROM Company_dtl) c
LEFT JOIN
    (SELECT company_code, COUNT(DISTINCT lead_manager_id) AS LM 
     FROM Lead_Manager 
     GROUP BY company_code) t1
ON c.company_code = t1.company_code
LEFT JOIN
    (SELECT company_code, COUNT(DISTINCT senior_manager_id) AS SM 
     FROM Senior_Manager 
     GROUP BY company_code) t2
ON c.company_code = t2.company_code
LEFT JOIN
    (SELECT company_code, COUNT(DISTINCT manager_id) AS M 
     FROM Manager_company 
     GROUP BY company_code) t3
ON c.company_code = t3.company_code
LEFT JOIN
    (SELECT company_code, COUNT(DISTINCT employee_id) AS E 
     FROM Employee_company 
     GROUP BY company_code) t4
ON c.company_code = t4.company_code
ORDER BY 
    c.company_code ASC;
