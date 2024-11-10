"""
Mary is a teacher in a middle school and she has a table seat storing students'
names and their corresponding seat ids.
The column id is continuous increment.
Mary wants to change seats for the adjacent students.
Can you write a SQL query to output the result for Mary?
"""


CREATE TABLE studentinfo (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

INSERT INTO studentinfo (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');


select * from studentinfo;

WITH  NumberedStudents AS (
select 
*, ROW_NUMBER() OVER (ORDER BY id) AS row_num 
from studentinfo),

Swapped AS (
 SELECT 
    CASE 
      WHEN row_num % 2 = 0 THEN row_num - 1
      WHEN row_num % 2 = 1 AND row_num < (SELECT MAX(row_num) FROM NumberedStudents) THEN row_num + 1
      ELSE row_num
    END AS new_row_num,
    student
  FROM NumberedStudents

)



select id, Swapped.student
from Swapped
join studentinfo
on Swapped.new_row_num = studentinfo.id;


select * from studentinfo;

select t1.new_id as id, t1.student as student from (select *, 
case 
	when id % 2 = 0 then id -1
	when id % 2 =1 and id < (select max(id) from studentinfo) then id +1
	else id
	end as new_id
from studentinfo) t1 order by new_id;
