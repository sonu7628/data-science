create database kit;
use kit;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Inserting 20 records into Customers table
INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'San Francisco'),
(5, 'Eve', 'Houston'),
(6, 'Frank', 'Phoenix'),
(7, 'Grace', 'Austin'),
(8, 'Hannah', 'Seattle'),
(9, 'Ivy', 'Miami'),
(10, 'Jack', 'Dallas'),
(11, 'Karen', 'Boston'),
(12, 'Louis', 'San Diego'),
(13, 'Mona', 'Denver'),
(14, 'Nancy', 'Portland'),
(15, 'Oscar', 'Chicago'),
(16, 'Paul', 'Atlanta'),
(17, 'Quincy', 'Philadelphia'),
(18, 'Rachel', 'San Jose'),
(19, 'Steve', 'Las Vegas'),
(20, 'Tina', 'Orlando');

-- Creating the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting 20 records into Orders table
INSERT INTO Orders (order_id, customer_id, product, order_date) VALUES
(1, 1, 'Laptop', '2025-01-10'),
(2, 2, 'Tablet', '2025-02-15'),
(3, 3, 'Phone', '2025-03-01'),
(4, 4, 'Monitor', '2025-03-02'),
(5, 5, 'Keyboard', '2025-03-05'),
(6, 6, 'Mouse', '2025-03-06'),
(7, 7, 'Desk', '2025-03-08'),
(8, 8, 'Chair', '2025-03-10'),
(9, 9, 'Headphones', '2025-03-12'),
(10, 10, 'Smartwatch', '2025-03-15'),
(11, 4, 'Webcam', '2025-03-18'),
(12, 2, 'Projector', '2025-03-20'),
(13, 11, 'Lamp', '2025-03-21'),
(14, 12, 'Printer', '2025-03-22'),
(15, 13, 'Fan', '2025-03-23'),
(16, 14, 'Router', '2025-03-24'),
(17, 15, 'Microwave', '2025-03-25'),
(18, 16, 'Blender', '2025-03-26'),
(19, NULL, 'TV', '2025-03-27'),  
(20, NULL, 'Fridge', '2025-03-28'); 
select customers.name,orders.order_id from
orders right outer join customers on
customers.customer_id=orders.customer_id;

select customers.name,orders.product from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select orders.product,customers.name from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select customers.name,orders.order_date from
orders right outer join customers on
customers.customer_id=orders.customer_id;

select customers.name,orders.product from
orders right outer join customers on
customers.customer_id=orders.customer_id;

select orders.product,customers.name,customers.city from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select customers.name from
orders right outer join customers on
customers.customer_id=orders.customer_id
where orders.order_id is null;

select orders.product,orders.order_id,customers.name from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select customers.name,orders.product from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select customers.name,orders.product from
orders right outer join customers on
customers.customer_id=orders.customer_id
where orders.product="tablet"or orders.product is null;

select customers.name,orders.product from
orders right outer join customers on
customers.customer_id=orders.customer_id;

select customers.name,orders.product from
customers right outer join orders on
customers.customer_id=orders.customer_id;

select customers.name,count(orders.order_id) from
orders right outer join customers on
customers.customer_id=orders.customer_id
group by customers.name;












