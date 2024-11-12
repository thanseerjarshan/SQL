""
Employees Earning More Than Their Managers
""

CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    ManagerId INT
);


INSERT INTO Employee (Id, Name, Salary, ManagerId)
VALUES 
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

select * from Employee;

select t1.name from
Employee t1
join Employee t2
on t1.ManagerId = t2.Id
where t1.Salary > t2.Salary;
