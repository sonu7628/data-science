use sonu;
CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
city VARCHAR(50)
);
INSERT INTO Customers (customer_id, first_name, last_name,
email, phone, city)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', 'New York'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-2345', 'Los
Angeles'),
(3, 'Tom', 'Johnson', 'tom.johnson@example.com', '555-3456',
'Chicago'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-4567', 'San
Francisco'),
(5, 'Michael', 'Brown', 'michael.brown@example.com', '555-5678',
'Miami'),
(6, 'Sarah', 'Williams', 'sarah.williams@example.com', '555-6789',
'Houston'),
(7, 'David', 'Martinez', 'david.martinez@example.com', '555-7890',
'Dallas'),
(8, 'Laura', 'Garcia', 'laura.garcia@example.com', '555-8901',
'Phoenix'),
(9, 'James', 'Rodriguez', 'james.rodriguez@example.com', '555-
9012', 'Austin'),
(10, 'Linda', 'Wilson', 'linda.wilson@example.com', '555-1122',
'Seattle'),
(11, 'Robert', 'Moore', 'robert.moore@example.com', '555-2233',
'Denver'),
(12, 'Lisa', 'Taylor', 'lisa.taylor@example.com', '555-3344', 'Boston'),
(13, 'William', 'Anderson', 'william.anderson@example.com', '555-
4455', 'Portland'),
(14, 'Maria', 'Thomas', 'maria.thomas@example.com', '555-5566',
'Las Vegas'),
(15, 'Joseph', 'Jackson', 'joseph.jackson@example.com', '555-6677',
'Atlanta'),
(16, 'Patricia', 'White', 'patricia.white@example.com', '555-7788',
'Orlando'),
(17, 'Charles', 'Harris', 'charles.harris@example.com', '555-8899',
'Dallas'),
(18, 'Margaret', 'Clark', 'margaret.clark@example.com', '555-9900',
'Chicago'),
(19, 'Daniel', 'Lewis', 'daniel.lewis@example.com', '555-1011', 'New
York'),
(20, 'Susan', 'Young', 'susan.young@example.com', '555-1213', 'San
Francisco');
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES
Customers(customer_id)
);
INSERT INTO Orders (order_id, customer_id, order_date,
total_amount)
VALUES
(1, 1, '2023-01-15', 120.50),
(2, 2, '2023-02-20', 250.00),
(3, 3, '2023-03-10', 90.00),
(4, 4, '2023-03-25', 150.75),
(5, 5, '2023-04-05', 300.00),
(6, 6, '2023-04-15', 220.45),
(7, 7, '2023-05-01', 80.30),
(8, 8, '2023-05-20', 110.10),
(9, 9, '2023-06-10', 60.50),
(10, 10, '2023-06-25', 180.90),
(11, 11, '2023-07-10', 205.40),
(12, 12, '2023-07-15', 275.60),
(13, 13, '2023-08-05', 95.00),
(14, 14, '2023-08-20', 132.25),
(15, 15, '2023-09-01', 150.00),
(16, 16, '2023-09-10', 210.75),
(17, 17, '2023-10-01', 145.00),
(18, 18, '2023-10-15', 280.30),
(19, 19, '2023-11-05', 300.00),
(20, 20, '2023-11-15', 185.25);
select customers.customer_id,orders.order_id from 
customers inner join orders on 
customers.customer_id=orders.order_id;
select customers.first_name,customers.last_name,orders.total_amount
from customers inner join orders on
customers.customer_id=orders.customer_id;
select concat(customers.first_name," ",customers.last_name) as full_name,sum(orders.total_amount) as total
from customers inner join orders on
customers.customer_id=orders.customer_id
group by customers.customer_id;
select customers.first_name,customers.last_name,orders.total_amount,orders.order_date
from customers inner join orders on
customers.customer_id=orders.customer_id;
select concat(customers.first_name," ",customers.last_name),customers.email,orders.order_id
from customers inner join orders on
customers.customer_id=orders.customer_id;
select count(orders.order_id),customers.city
from customers inner join orders on
customers.customer_id=orders.customer_id
group by customers.city
having customers.city="new york";
#7.How can you find all customers who have placed orders after a specific date?
select distinct concat(customers.first_name," ",customers.last_name) as full_name
from customers inner join orders on
customers.customer_id=orders.customer_id
where orders.order_date > "2023-11-05";
#8.How would you join Customers and Orders to find the order details of customers who have a specific phone number?
select concat(customers.first_name," ",customers.last_name)as full_name,orders.order_id ,orders.customer_id 
,orders.order_date ,orders.total_amount
from orders inner join customers
on customers.customer_id=orders.customer_id
where customers.phone='555-2345';

#9.How do you find the total order amount for each customer along with their full name?
select concat(customers.first_name," ",customers.last_name) as full_name,sum(orders.total_amount)
from customers inner join orders on
customers.customer_id=orders.customer_id
group by full_name;

#10.How would you list all orders and their respective customer names (first and last)?
select concat(customers.first_name," ",customers.last_name)as full_name,orders.order_id ,orders.customer_id 
,orders.order_date ,orders.total_amount
from orders inner join customers
on customers.customer_id=orders.customer_id;

#11. How do you filter the result to show only customers who have made orders above $100?
select concat(customers.first_name," ",customers.last_name) as full_name,sum(orders.total_amount) as total
from customers inner join orders on
customers.customer_id=orders.customer_id
group by full_name
having sum(orders.total_amount)>100;

#12. How would you find customers who have placed orders between two specific dates?
select concat(customers.first_name," ",customers.last_name) as full_name
from customers inner join orders on
customers.customer_id=orders.customer_id
where orders.order_date between "2023-01-12" and "2023-05-12";

#13.How can you retrieve a list of customers with their order dates, and filter only those orders placed in the last 30 days?
select concat(customers.first_name," ",customers.last_name) as full_name,orders.order_date
from customers inner join orders on
customers.customer_id=orders.customer_id
where orders.order_date >=(select max(order_date) from orders)-interval 30 day ;

#14.How would you get the names of customers and their orders where the total amount is less than $50?
select concat(customers.first_name," ",customers.last_name) as full_name,orders.order_id,orders.total_amount
from customers inner join orders on
customers.customer_id=orders.customer_id
where orders.total_amount < 50.00;

#15.How do you join the Customers and Orders tables and filter the results where the city is 'New York'?
select * from customers inner join  orders on customers.customer_id=orders.customer_id
where customers.city="New York";

#16.How can you find all customers whose first name starts with 'J' and who have placed an order?
select customers.first_name,orders.order_id
from customers inner join orders on
customers.customer_id=orders.customer_id
where customers.first_name LIKE "J%";

#17.How do you filter the orders to show only those placed by customers living in a certain city?
select * from customers inner join  orders on customers.customer_id=orders.customer_id
where customers.city="Chicago";

#18.How can you get the customers who have placed multiple orders?
select customers.customer_id,concat(customers.first_name," ",customers.last_name) as full_name,count(orders.order_id)
from customers inner join orders on
customers.customer_id=orders.customer_id
group by customers.customer_id,concat(customers.first_name," ",customers.last_name)
having count(orders.order_id)>1;

#19.How would you find all orders made by customers whose email ends with "@gmail.com"?
select Customers.first_name,Customers.email ,count(orders.order_id)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.first_name,Customers.email
having Customers.email LIKE "%@gmail.com";

#20.How can you join the Customers and Orders tables and find customers who have not placed any orders?
select Customers.first_name,Customers.email ,count(orders.order_id)
from Customers left outer join orders on Customers.customer_id=orders.customer_id
group by Customers.first_name,Customers.email
having count(orders.order_id) is null;

#21.How would you join the Customers and Orders tables to get the most recent order placed by each customer?
select Customers.first_name,orders.order_id,orders.order_date
from customers inner join orders on
Customers.customer_id=orders.customer_id
where orders.order_date =(select max(o2.order_date) from orders o2  where o2.customer_id=Customers.customer_id);

#22.How do you sort the result of an INNER JOIN by the order_date column in ascending order?
select Customers.first_name,orders.order_id,orders.order_date
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.order_date ASC;

#23.How would you sort the customers and orders by the total order amount in descending order?
select Customers.first_name,orders.order_id,orders.order_date,orders.total_amount
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.total_amount DESC;

#24.How can you join two tables and limit the results to the top 10 customers based on the total order amount?
select Customers.first_name,orders.order_id,orders.order_date,orders.total_amount
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.total_amount DESC limit 10;

#25.How do you retrieve customers and their orders, sorted by customer name in ascending order?
select Customers.first_name,orders.order_id,orders.order_date,orders.total_amount
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by Customers.first_name;

#26.How do you join the tables and find the first 5 orders placed by customers using LIMIT?
select Customers.first_name,orders.order_id,orders.order_date,orders.total_amount
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.order_date  limit 5;

#27.How can you list orders made by customers and sort them by order_date in descending order?
select *
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.order_date DESC;

#28.How do you join the Customers and Orders tables and retrieve results ordered by city and total_amount?
select *
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.total_amount,Customers.city;

#29.How would you list all orders placed by customers sorted by order_date but only showing the first 10 results?
select *
from customers inner join orders on
Customers.customer_id=orders.customer_id
order by orders.order_date limit 10;

#30.How do you get the latest 5 orders and the corresponding customer names?
select concat(Customers.first_name," ",Customers.last_name) as full_name,orders.order_date
from Customers inner join orders on Customers.customer_id=orders.customer_id
order by orders.order_date limit 5; 

#31.How can you calculate the total number of orders placed by each customer?
select concat(Customers.first_name," ",Customers.last_name) as full_name,count(orders.order_id)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.customer_id,concat(Customers.first_name," ",Customers.last_name); 

#32.How would you join Customers and Orders to find the average order value per customer?
select concat(Customers.first_name," ",Customers.last_name) as full_name,avg(orders.total_amount)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.customer_id,concat(Customers.first_name," ",Customers.last_name); 

#33.How do you group the results by customer_id and calculate the total order amount for each customer?
select concat(Customers.first_name," ",Customers.last_name) as full_name,avg(orders.total_amount)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.customer_id,concat(Customers.first_name," ",Customers.last_name); 

#34.How can you find the total order amount for each customer, grouped by city?
select concat(Customers.first_name," ",Customers.last_name) as full_name,avg(orders.total_amount),Customers.city
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.city,concat(Customers.first_name," ",Customers.last_name); 

#35.How do you retrieve the customer name and total amount spent, grouped by customer?
select concat(Customers.first_name," ",Customers.last_name) as full_name,avg(orders.total_amount)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.customer_id,concat(Customers.first_name," ",Customers.last_name); 

#36.How would you calculate the sum of all orders placed by customers in a particular city using INNER JOIN?
select concat(Customers.first_name," ",Customers.last_name) as full_name,sum(orders.total_amount),Customers.city
from Customers inner join orders on Customers.customer_id=orders.customer_id
where Customers.city="New York"
group by Customers.city,concat(Customers.first_name," ",Customers.last_name) ;

#37.How do you calculate the average total order amount for all customers using INNER JOIN?
select concat(Customers.first_name," ",Customers.last_name) as full_name,sum(orders.total_amount),Customers.city
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.customer_id,concat(Customers.first_name," ",Customers.last_name);

#38.How can you retrieve customers who have placed more than three orders, grouped by customer name?
select concat(Customers.first_name," ",Customers.last_name) as full_name,count(orders.order_id)
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by concat(Customers.first_name," ",Customers.last_name)
having count(orders.order_id)>3;

#39.How would you list the customers and their total order amount, grouped by city?
select concat(Customers.first_name," ",Customers.last_name) as full_name,sum(orders.total_amount),Customers.city
from Customers inner join orders on Customers.customer_id=orders.customer_id
group by Customers.city,concat(Customers.first_name," ",Customers.last_name);

#40.How can you get the total number of orders placed by customers for each month?
select date_format(order_date,"%Y%M") as order_month,count(order_id)
from orders group by order_month 
order by order_month;



