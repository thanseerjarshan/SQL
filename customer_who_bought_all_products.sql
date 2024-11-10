


"""
Table: Customer
+-------------+---------+
| Column Name | Type |
+-------------+---------+
| customer_id | int |
| product_key | int |
+-------------+---------+
product_key is a foreign key to Product table.
Table: Product
+-------------+---------+
| Column Name | Type |
+-------------+---------+
| product_key | int |
+-------------+---------+
product_key is the primary key column for this table.
Write an SQL query for a report that provides the customer ids from the Customer
table that bought all the products in the Product table.
"""
CREATE TABLE Customer (
    customer_id INT,
    product_key INT
);

INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


CREATE TABLE Productdtl (
    product_key INT PRIMARY KEY
);


INSERT INTO Productdtl (product_key) VALUES
(5),
(6);

select * from Customer;
select * from Productdtl;


select customer_id from Customer
group by customer_id
having sum(distinct product_key) = (
select sum(product_key) from Productdtl
);

