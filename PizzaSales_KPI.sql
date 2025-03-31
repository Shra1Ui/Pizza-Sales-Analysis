select * from pizza_sales_excel_file;

                 ---"PROBLEM  STATEMENT"---

--KPI's Requirements 
--We need to analyze Key indicators for our pizza sales data to gain insights into our business performance. Specifically ,
--we calcualte following metrics-- 

--1.Find out the total revenure? = Sum of toal price of all pizza orders

select sum(total_price) as total_revenue from pizza_sales_excel_file;

--2-Avg order values = total rev % total orders -- first find no of orders

select count(distinct order_id)as total_no_orders from pizza_sales_excel_file;

select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales_excel_file;

--3..Total Pizzas Sold--sum of all quantities pizzas sold --

select sum(quantity) as tot_pizzas_sold from pizza_sales_excel_file;

---4. Total Orders Placed--
select count(distinct order_id)as total_no_orders from pizza_sales_excel_file;

---5.Avg pizzas per order--Total No of pizza sold/ total no of orders

select sum(quantity)/count(distinct order_id) as Avg_pizzas_sold from pizza_sales_excel_file;
---to need in decimal values--we use cast fcn--
select cast(sum(quantity)As decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) 
as Avg_pizzas_sold from pizza_sales_excel_file;
---first we used cast for numerator, denominator, if we need we can use it for whole output