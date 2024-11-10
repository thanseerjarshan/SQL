"""
Table: Sales
+-------------+-------+
| Column Name | Type |
+-------------+-------+
| sale_id | int |
| product_id | int |
| year | int |
| quantity | int |
| price | int |
+-------------+-------+
(sale_id, year) is the primary key of this table.
product_id is a foreign key to Product table.
Note that the price is per unit.
Table: Product
+--------------+---------+
| Column Name | Type |
+--------------+---------+
| product_id | int |
| product_name | varchar |
+--------------+---------+
product_id is the primary key of this table.
Write an SQL query that reports all product names of the products in the Sales
table along with their selling year and price.
Solution
01/13/2020:
1069. Product Sales Analysis II
--Description
For example:
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1 | 100 | 2008 | 10 | 5000 |
| 2 | 100 | 2009 | 12 | 5000 |
| 7 | 200 | 2011 | 15 | 9000 |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100 | Nokia |
| 200 | Apple |
| 300 | Samsung |
+------------+--------------+
Result table:
+--------------+-------+-------+
| product_name | year | price |
+--------------+-------+-------+
| Nokia | 2008 | 5000 |
| Nokia | 2009 | 5000 |
| Apple | 2011 | 9000 |
+--------------+-------+-------

"""


CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price DECIMAL(10, 2)
);


INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);


CREATE TABLE Product_dtl (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO Product_dtl (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');


select Product_dtl.product_name, Sales.year, Sales.price
from Product_dtl inner join Sales on Product_dtl.product_id = Sales.product_id;
