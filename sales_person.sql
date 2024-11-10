""" 
--Description
Given three tables: salesperson, company, orders.
Output all the names in the table salesperson, who didn’t have sales to company
'RED'.

------+
| name |
+------+
| Amy |
| Mark |
| Alex |
+------+
"""


-- Create the salesperson table
CREATE TABLE salesperson (
    sales_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT,
    commission_rate INT,
    hire_date DATE
);

-- Insert data into the salesperson table
INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (1, 'John', 100000, 6, '2006-04-01');
INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (2, 'Amy', 120000, 5, '2010-05-01');
INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (3, 'Mark', 65000, 12, '2008-12-25');
INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (4, 'Pam', 25000, 25, '2005-01-01');
INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (5, 'Alex', 50000, 10, '2007-02-03');


-- Create the company table
CREATE TABLE company (
    com_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Insert data into the company table
INSERT INTO company (com_id, name, city) VALUES (1, 'RED', 'Boston');
INSERT INTO company (com_id, name, city) VALUES (2, 'ORANGE', 'New York');
INSERT INTO company (com_id, name, city) VALUES (3, 'YELLOW', 'Boston');
INSERT INTO company (com_id, name, city) VALUES (4, 'GREEN', 'Austin');


-- Create the orders table
CREATE TABLE orders_dtl (
    order_id INT PRIMARY KEY,
    order_date DATE,
    com_id INT,
    sales_id INT,
    amount INT
);

-- Insert data into the orders table
INSERT INTO orders_dtl  (order_id, order_date, com_id, sales_id, amount) VALUES (1, '2014-01-01', 3, 4, 100000);
INSERT INTO orders_dtl  (order_id, order_date, com_id, sales_id, amount) VALUES (2, '2014-02-01', 4, 5, 5000);
INSERT INTO orders_dtl  (order_id, order_date, com_id, sales_id, amount) VALUES (3, '2014-03-01', 1, 1, 50000);
INSERT INTO orders_dtl  (order_id, order_date, com_id, sales_id, amount) VALUES (4, '2014-04-01', 1, 4, 25000);


select * from salesperson;
select * from company;
select * from orders_dtl;

select s.name
from salesperson as s
where s.sales_id not in(
 select sales_id
 from orders_dtl as o left join company as c on o.com_id = c.com_id
 where c.name = 'RED');


