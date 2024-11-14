"""
Select all employee's name and bonus whose bonus is < 1000.Select all employee's name and bonus whose bonus is < 1000.
Table:EmployeeDetails
+-------+--------+-----------+--------+
| empId | name | supervisor| salary |
+-------+--------+-----------+--------+
| 1 | John | 3 | 1000 |
| 2 | Dan | 3 | 2000 |
| 3 | Brad | null | 4000 |
| 4 | Thomas | 3 | 4000 |

Table:EmployeeBonus
+-------+-------+
| empId | bonus |
+-------+-------+
| 2 | 500 |
| 4 | 2000 |
+-------+-------+

empId is the primary key column for this table.
Example ouput:
+-------+-------+
| name | bonus |
+-------+-------+
| John | null |
| Dan | 500 |
| Brad | null |
+-------+-------+
"""


CREATE TABLE EmployeeDetails (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    supervisor INT,
    salary INT
);

INSERT INTO EmployeeDetails (empId, name, supervisor, salary) VALUES
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(3, 'Brad', NULL, 4000),
(4, 'Thomas', 3, 4000);


CREATE TABLE EmployeeBonus (
    empId INT PRIMARY KEY,
    bonus INT
);

INSERT INTO EmployeeBonus (empId, bonus) VALUES
(2, 500),
(4, 2000);




select * from EmployeeDetails;
select * from EmployeeBonus;

select d.name, b.bonus
from EmployeeDetails d
left join EmployeeBonus b
on d.empId = b.empId
where b.bonus < 1000 or b.bonus is null;