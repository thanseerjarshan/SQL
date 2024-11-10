"""
Table: ActorDirector
+-------------+---------+
| Column Name | Type |
+-------------+---------+
| actor_id | int |
| director_id | int |
| timestamp | int |
+-------------+---------+
timestamp is the primary key column for this table.
Write a SQL query for a report that provides the pairs (actor_id, director_id)
where the actor have cooperated with the director at least 3 times.

"""


CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT PRIMARY KEY
);


INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);

select * from ActorDirector;

select actor_id, director_id from
ActorDirector group by actor_id, director_id
having count(*) >= 3;
