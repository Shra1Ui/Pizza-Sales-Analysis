----------CHARTS REQUIREMENTS-----
---WE NEED TO UNDERSTAND AND VISUALIZE ASPECTS AND TRENDS .

--1.DAILY TREND FOR TOTAL ORDERS--= Create a bar chart from mon to sunday

select DATENAME(DW, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales_excel_file
group by DATENAME(DW, order_date);

---2. Monthly Trends--==Line Chart

select DATENAME(Month,order_date) as month_name , count(distinct order_id) as total_orders from pizza_sales_excel_file
group by DATENAME(Month,order_date)
order by total_orders desc;

----3.Percentage of sales by pizza category--=Pie chart

select pizza_category,sum(total_price)*100/(select sum(total_price)
from pizza_sales_excel_file) as PCT from pizza_sales_excel_file
group by pizza_category;

-4--to see only for 1 month use while --
select pizza_category,sum(total_price)*100/(select sum(total_price)
from pizza_sales_excel_file where month(order_date)=1) as PCT from pizza_sales_excel_file
where month(order_date)=1
group by pizza_category;

--5-PCT sales by pizza size--

select pizza_size,sum(total_price)*100/(select sum(total_price)
from pizza_sales_excel_file) as PCT from pizza_sales_excel_file
group by pizza_size;

----6--Top 5 Best sellers by rev,total quant and total orders--

select top 5 pizza_name, sum(total_price) as total_rev from 
pizza_sales_excel_file group by pizza_name
order by total_rev desc;

--7-now for tot qaunt and total ord--

select top 5 pizza_name, sum(quantity) as total_quantity from 
pizza_sales_excel_file group by pizza_name
order by total_quantity desc;

select top 5 pizza_name, count(distinct order_id) as total_orders from 
pizza_sales_excel_file group by pizza_name
order by total_orders desc;

----------NOW ITS DASHBOARD TIME____MOVE to POWERBI