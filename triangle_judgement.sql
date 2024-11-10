"""
 A pupil Tim gets homework to identify whether three line segments could possibly
form a triangle.
Solution
01/14/2020:
612. Shortest Distance in a Plane
--Description
However, this assignment is very heavy because there are hundreds of records to
calculate.
Could you help Tim by writing a query to judge whether these three sides can
form a triangle, assuming table triangle holds the length of the three sides x,
y and z.
| x | y | z |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |
For the sample data above, your query should return the follow result:
| x | y | z | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No |
| 10 | 20 | 15 | Yes |
"""

-- Create the example_table
CREATE TABLE triangle (
    x INT,
    y INT,
    z INT
);

-- Insert data into the example_table
INSERT INTO triangle (x, y, z) VALUES (13, 15, 30);
INSERT INTO triangle (x, y, z) VALUES (10, 20, 15);


select * from triangle;

select *, 
case when x+y > z and y+z > x and x+z > y 
then 'Yes' else 'No' 
end as triangle_can_be_formed
from triangle;