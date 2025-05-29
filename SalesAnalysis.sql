create database company;
-- Q1: Find all orders shipped via 'Economy' mode with a total amount greater than 25, 000

use  company;

select * from sales;

select  * from sales where  ship_mode = 'Economy' and  Total_Amount>25000;

-- 2Q) Retrieve all sales data for  'Technology' category in 'Ireland' made after 2020-01-01.

select * from sales;


select * from sales  where order_date >'2020-01-01' and  Category = 'Technology' and  Country = 'Ireland' ;

-- 3Q) List the top 10 most profitable sales transactions in descending order
select * from sales 
order by unit_profit desc
limit 10,20; -- top 10 record will be skipped , top20 records it will show

-- 4Q Find all customers whos name starts with 'j' and  ends with with 'n'.

select order_id,customer_name from sales where customer_name like 'j%n';

--  5Q) Retrieve  all product names that contain 'Acco' any where in the name.alter

select Product_name, Order_Id from sales where Product_name like '%Acco%';
-- 6Q) Get the top 5 cities with the highest total sales amount.

select   city, sum(Total_amount) as total_sales  from sales   T
group by city
order by total_sales desc;

-- 7Q) Display the second set of 10  records for customer_name and Total_amount in decreasing order

select customer_name, total_amount from sales 
order by total_amount desc
limit 10,10;

-- Find the total revenue, average unit cost, and total number of orders

select  sum(total_amount) as `total revenue`,
 avg(unit_cost) as `average unit cost`  , 
 count(order_id) `total number of orders`
 from sales ; 
 
 -- 9Q) count the unique number of regions
 select  count(distinct(region)) as `unique regions` from sales;
 
 -- 10Q) Find the number of orders placed by each customer
 
 select  customer_name,count(order_id) as order_count from sales
 group by customer_name 
 order by order_count desc;
 
 -- 11Q) Rank 5 products based on total sales using Rank() row_number, rank(), dense_rank() ,ntile()
 
 select product_Name, sum(Total_amount) as Total_sales,
 Rank() Over (order BY SUM(Total_Amount) desc) as sales_Rank
 from sales
 group by product_name
 limit 5;
 
 







