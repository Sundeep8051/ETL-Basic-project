select * from orders

-- truncate table orders

-- ALTER TABLE orders
-- Add CONSTRAINT PK_Order_id PRIMARY KEY (order_id);


-- ALTER TABLE orders
-- ALTER COLUMN profit decimal(7,2) null

--1--Find the top 10 revenue generating products

select top 10 product_id, sum(sale_price) as 'Total sales' from orders
group by product_id
ORDER BY [Total sales] desc

--2--Find top 5 highest selling products in each region
    with cte as (
    select region, product_id, sum(sale_price) as 'total_sales'
    from orders
    group by region, product_id)

    select * from 
    (select *, ROW_NUMBER() over(partition by region order by total_sales desc) as rn from cte) T where rn <=5

--3--Find month over month growth comparison for 2022 and 2023 sales, eg: Jan 2022 vs Jan 2023
    with cte as (
    select month(order_date) as order_month, year(order_date) as order_year, sum(sale_price) as sales
    from orders
    group by month(order_date), year(order_date))

    select order_month,
    Sum(case when order_year = 2022 then sales else 0 end) as 'year_2022', 
    sum(case when order_year = 2023 then sales else 0 end) as 'year_2023'
    from cte
    group by order_month
    order by order_month
 
--4--For each category which month had highest sales
with cte as (
select category, month(order_date) as order_month, year(order_date) as order_year, sum(sale_price) as sales from orders
group by category, month(order_date), year(order_date))

select * from 
(select *, ROW_NUMBER() over(PARTITION by category, order_year order by sales desc) as rn from cte) T where rn = 1
order by category, order_year desc

--5--Which sub category had highest growth by profit in 2023 compared to 2022
with cte as (
select sub_category, year(order_date) as year, sum(sale_price) as total_sales from orders
group by sub_category, year(order_date))

select Top 1*, (sales_2023 - sales_2022)/sales_2022 * 100 as percentage_gain from 
(select sub_category,
sum(case when year=2022 then total_sales else 0 end) as 'sales_2022',
sum(case when year=2023 then total_sales else 0 end) as 'sales_2023'
 from cte
 group by sub_category) T
 order by percentage_gain desc
 