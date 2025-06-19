use sales;
select * from sales2;
select product_id ,sum(quantity_sold) from sales2
group by product_id;
select product_id ,sum(quantity_sold*price) from sales2
group by product_id;
select product_id ,avg(quantity_sold) from sales2
group by product_id;
select product_id ,count(*) from sales2
group by product_id;
select product_id ,min(quantity_sold) from sales2
group by product_id;
select product_id ,max(quantity_sold) from sales2
group by product_id;
select date(sales_date),sum(quantity_sold) from sales2
group by date(sales_date);
select monthname( sales_date),product_id,sum(quantity_sold*price) from sales2
group by monthname(sales_date),product_id;
select sales_date,sum(quantity_sold*price) from sales2
group by sales_date;
select year(sales_date),sum(quantity_sold) from sales2
group by year(sales_date);
select month(sales_date),avg(quantity_sold) from sales2
group by month(sales_date);
select product_id ,max(quantity_sold*price) from sales2
group by product_id;
select product_id ,min(quantity_sold*price) from sales2
group by product_id;
select month(sales_date),sum(quantity_sold) from sales2
group by month(sales_date);
select week(sales_date),sum(quantity_sold) from sales2
group by week(sales_date);
select product_id ,count(*) from sales2
group by product_id;
select week(sales_date),avg(quantity_sold) from sales2
group by week(sales_date);
select product_id ,count(*),avg(quantity_sold*price) from sales2
group by product_id;
select week(sales_date),avg(quantity_sold) from sales2
group by week(sales_date);
select product_id ,avg(quantity_sold*price) from sales2
group by product_id;
select count(distinct product_id),date(sales_date)from sales2
group by date(sales_date);
#20.Find the total quantity sold for each product, grouped by quarter.
select product_id ,quarter(sales_date) as quarter,sum(quantity_sold) from sales2
group by quarter(sales_date),product_id;

#21. Get the total sales per product for each day of the week.
select product_id ,sum(quantity_sold*price) as total ,dayname(sales_date) as day_of_week from
sales2 group by product_id,dayname(sales_date)
order by product_id,field(day_of_week,"sundday","monday",'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

#22. Find the product with the highest average sales per transaction.
select product_id,avg(quantity_sold*price) as total from sales2
group by product_id
order by total desc limit 1;

#23. Find the total quantity sold for each product in a specific year.
select product_id,sum(quantity_sold) from sales2
where year(sales_date)=2024
group by product_id;

#24. Find the total quantity sold for each product for the current year.
select product_id,sum(quantity_sold) from sales2
where year(sales_date)=year(current_date)
group by product_id;

#25. Get the total sales for each product in the last quarter.
select product_id,sum(quantity_sold*price),quarter(sales_date) from sales2
group by product_id,quarter(sales_date)
order by quarter(sales_date) desc limit 1;

#26. Find the average number of products sold per transaction for each product.
select product_id,avg(quantity_sold) from sales2
group by product_id;

#27. Find the average quantity sold per product per month.
select product_id,year(sales_date),month(sales_date),avg(quantity_sold) as average from sales2
group by product_id,year(sales_date),month(sales_date);

#28. Find the total sales for each product, grouped by day of the week.
select product_id,sum(quantity_sold*price),dayname(sales_date)
from sales2 group by product_id,dayname(sales_date);

#29. Get the number of sales transactions for each product by year.
select product_id,year(sales_date),avg(quantity_sold) as average from sales2
group by product_id,year(sales_date);

#30. Find the average quantity sold for each product, grouped by quarter.
select product_id,year(sales_date),quarter(sales_date),avg(quantity_sold) as average from sales2
group by product_id,year(sales_date),quarter(sales_date);



















