"""
The Employee table holds all employees including their managers. Every employee
has an Id, and there is also a column for the manager Id.
Given the Employee table, write a SQL query that finds out managers with at
least 5 direct report. For the above table, your SQL query should return:

+------+----------+-----------+----------+
|Id |Name |Department |ManagerId |
+------+----------+-----------+----------+
|101 |John |A |null |
|102 |Dan |A |101 |
|103 |James |A |101 |
|104 |Amy |A |101 |
|105 |Anne |A |101 |
|106 |Ron |B |101 |

-------+
| Name |
+-------+
| John |
+-------+
"""

CREATE TABLE Employees_manager (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Department CHAR(1),
    ManagerId INT
);

INSERT INTO Employees_manager (Id, Name, Department, ManagerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


select * from Employees_manager;


select Name 
from Employees_manager
where Id in (select ManagerId 
from Employees_manager
group by ManagerId
having count(*) >= 5);
