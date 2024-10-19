-- Create Customers table
CREATE TABLE Customers (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    Id INT PRIMARY KEY,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);

-- Inserting values into Customers table
INSERT INTO Customers (Id, Name)
VALUES 
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Inserting values into Orders table
INSERT INTO Orders (Id, CustomerId)
VALUES 
(1, 3),
(2, 1);


select * from Customers;
select * from Orders;

select t1.Name from (select Customers.Name,Orders.CustomerId from Customers left join
Orders on Customers.Id = Orders.CustomerId) t1 where t1.CustomerId is null;