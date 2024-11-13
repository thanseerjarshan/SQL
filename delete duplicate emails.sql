"""
Write a SQL query to delete all duplicate email entries in a table named Person,
keeping only unique emails based on its smallest Id.
+----+------------------+
| Id | Email |
+----+------------------+
| 1 | john@example.com |
| 2 | bob@example.com |
| 3 | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the
following rows:
+----+------------------+
| Id | Email |
+----+------------------+
| 1 | john@example.com |
| 2 | bob@example.com |
+----+------------------+
Note:
Your output is the whole Person table after executing your sql. Use delete
--statement
"""


CREATE TABLE Emails_dlt (
    Id INT PRIMARY KEY,
    Email VARCHAR(50)
);

INSERT INTO Emails_dlt (Id, Email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

select * from Emails_dlt;

delete e1
from Emails_dlt e1, Emails_dlt e2
where e1.Email = e2.Email and e1.Id > e2.Id;


