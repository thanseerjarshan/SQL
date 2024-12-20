"""
Write a SQL query to find all duplicate emails in a table named Person.
+----+---------+
| Id | Email |
+----+---------+
| 1 | a@b.com |
| 2 | c@d.com |
| 3 | a@b.com |
+----+---------+
For example, your query should return the following for the above table:
+---------+
| Email |
+---------+
| a@b.com |
+---------+
"""



CREATE TABLE Emails (
    Id INT PRIMARY KEY,
    Email VARCHAR(50)
);

INSERT INTO Emails (Id, Email) VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');


select * from Emails;

select Email 
from Emails
group by Email
having count(*) >1;