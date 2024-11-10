"""
Given a table tree, id is identifier of the tree node and p_id is its parent
node's id.
+----+------+
| id | p_id |
+----+------+
| 1 | null |
| 2 | 1 |
| 3 | 1 |
| 4 | 2 |
| 5 | 2 |
+----+------+
Each node in the tree can be one of three types:
Leaf: if the node is a leaf node.
Root: if the node is the root of the tree.
Inner: If the node is neither a leaf node nor a root node.
Write a query to print the node id and the type of the node. Sort your output by
the node id. The result for the above sample is:
+----+------+
| id | Type |
+----+------+
| 1 | Root |
| 2 | Inner|
| 3 | Leaf |
| 4 | Leaf |
| 5 | Leaf |
+----+------
"""


-- Create the tree table
CREATE TABLE tree (
    id INT PRIMARY KEY,
    p_id INT NULL
);

-- Insert data into the tree table
INSERT INTO tree (id, p_id) VALUES (1, NULL);
INSERT INTO tree (id, p_id) VALUES (2, 1);
INSERT INTO tree (id, p_id) VALUES (3, 1);
INSERT INTO tree (id, p_id) VALUES (4, 2);
INSERT INTO tree (id, p_id) VALUES (5, 2);


select * from tree;

select
id, case when p_id is null then 'Root' when id is not null and id  in
(select distinct p_id from tree) then 'Inner' else 'Leaf' end as Type from tree;