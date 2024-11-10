"""
Given a table salary, such as the one below, that has m=male and f=female
values. Swap all f and m values (i.e., change all f values to m and vice versa)
with a single update statement and no intermediate temp table.
Note that you must write a single update statement, DO NOT write any select
statement for this problem

"""


CREATE TABLE employees_and_gender (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    sex CHAR(1),
    salary DECIMAL(10, 2)
);


INSERT INTO employees_and_gender (id, name, sex, salary) VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);


select * from employees_and_gender;

update employees_and_gender
set sex = case when sex = 'f' then 'm' else 'f' end;