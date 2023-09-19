--For the result and explanation:
--https://docs.google.com/document/d/1ogEtNgar_T391sXz4ATuIkrlWtrvMKMYajgve4pHU3g/edit?usp=sharing

--Product with the highest and lowest sales
Select	pr.Product,
	sum(s.Amount) as TotalAmount
From dbo.sales as s
Join dbo.products as pr on pr.Product_ID = s.Product
Group by pr.Product
Order by TotalAmount desc 
--The highest product is After Nines, while the lowest is Mint Chip Choco

--Highest sales by category and size
Select	pr.Category,
	pr.Size,
	sum(s.Amount) as TotalAmount
From dbo.sales as s
Join dbo.products as pr on pr.Product_ID = s.Product
Group by pr.Category, pr.Size;
--Customers are prefered to buy large sized bars chocolate 

--Most liked cholocate is from
Select	g.Region,
	sum(s.Amount) as TotalAmount
From dbo.sales as s
Join dbo.products as pr on pr.Product_ID = s.Product
Join dbo.geo as g on g.GeoID = s.Geo
Group by g.Region
Order by 2 desc
--Chocolate from Asia Pacific is most liked chocolate

--Average customer in each days and month
Select	DATENAME(WEEKDAY, Date) as Day,
	Avg(Customers) as AvgCustomers
From dbo.sales
Group by DATENAME(WEEKDAY, Date)
Order by AvgCustomers desc
--Monday has the highest average customers
Select	DATENAME(MONTH, Date) as Day,
		Avg(Customers) as AvgCustomers
From dbo.sales
Group by DATENAME(MONTH, Date)
Order by AvgCustomers desc
--October has the highest average customers

--Team with the highest and lowest sales
Select	p.Team,
	SUM(s.Amount) as TotalAmount
From dbo.sales as s
Join dbo.people as p on p.SP_ID = s.Sales_Person
Group by p.Team
Order by 2 desc
--Team Delish has the highest sales

--The sales person who has the highest sales
Select	p.Sales_person,
	p.Team,
	SUM(s.Amount) as TotalAmount
From dbo.sales as s
Join dbo.people as p on p.SP_ID = s.Sales_Person
Group by p.Sales_person, p.Team
Order by TotalAmount
--Wilone O'Kielt from Delish Team sold the most chocolate

