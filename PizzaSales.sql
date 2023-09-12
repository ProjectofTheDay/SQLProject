--The data is from: https://www.kaggle.com/datasets/shilongzhuang/pizza-sales

--Get to know what kind of info the data has
Select *
From PizzaSalesProject..PizzaSales


--The restaurant's total revenue
SELECT 
	ROUND(SUM(total_price), 0) as total_revenue
FROM PizzaSalesProject..PizzaSales

--The restaurant's total order 
SELECT 
	COUNT(DISTINCT order_id) as total_order
FROM PizzaSalesProject..PizzaSales

--The restaurant's average order value
SELECT
	ROUND(SUM(unit_price)/COUNT(distinct order_id),2) as avg_order_value
FROM PizzaSalesProject..PizzaSales


--When the restaurant tend to be busiest and have the most order
--Get to know which month has the most order
Select 
	DATENAME(month, order_date) as month_pizza_ordered, 
	COUNT(DISTINCT order_id) as total_order,
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by DATENAME(month, order_date)
Order by total_order desc

--Get to know which day of the week has the most order
Select 
	DATENAME(WEEKDAY, order_date) as day_pizza_ordered, 
	COUNT(DISTINCT order_id) as total_order,
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by DATENAME(WEEKDAY, order_date)
Order by total_order desc

--Get to know at what times the restaurant have the most order by hour
Select 
	DATEPART(HH, order_time) as order_hour, 
	COUNT(DISTINCT order_id) as total_order,
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by DATEPART(HH, order_time)
Order by total_order desc

--Get to know at what times the restaurant have the most order by the spesific time
Select 
	CONVERT(VARCHAR(5), order_time, 108) as order_hour_minute, 
	COUNT(DISTINCT order_id) as total_order,
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by CONVERT(VARCHAR(5), order_time, 108)
Order by total_order desc



--The restaurant best and worst-selling pizzas
--Check how many types of pizza the restaurant has and how many pizza sold
SELECT
	COUNT(DISTINCT pizza_name) as total_pizza_type,
	SUM(quantity) as total_pizza_sold
FROM PizzaSalesProject..PizzaSales

--Show the top 3 best-selling pizza in terms of pizza ordered
Select 
	TOP 3 pizza_name, 
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by pizza_name
Order by total_pizza desc

--Show the top 3 worst-selling pizza in terms of pizza ordered
Select 
	TOP 3 pizza_name, 
	SUM(quantity) as total_pizza
From PizzaSalesProject..PizzaSales
Group by pizza_name
Order by total_pizza

--Show the top 3 best-selling pizza in terms of the income of each pizza
Select 
	TOP 3 pizza_name, 
	ROUND(SUM(total_price), 2) as total_income
From PizzaSalesProject..PizzaSales
Group by pizza_name
Order by total_income desc

--Show the top 3 worst-selling pizza in terms of the income of each pizza
Select 
	TOP 3 pizza_name, 
	ROUND(SUM(total_price), 2) as total_income
From PizzaSalesProject..PizzaSales
Group by pizza_name
Order by total_income

--Show most orderded pizza by the category
SELECT
	pizza_category,
	SUM(quantity) as total_pizza
FROM PizzaSalesProject..PizzaSales
GROUP by pizza_category
ORDER by total_pizza desc

--Show most orderded pizza by the size
SELECT
	pizza_size,
	SUM(quantity) as total_pizza
FROM PizzaSalesProject..PizzaSales
GROUP by pizza_size
ORDER by total_pizza desc
