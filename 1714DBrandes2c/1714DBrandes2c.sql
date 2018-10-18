-- Donari Brandes
-- Exercise 2c- Summary queries, groups, joins
--Property Manager db

--1) Building table. Group by State, city. Count buildings.
SELECT        City, State, COUNT(BuildingId) AS [Building Count]
FROM            Building
GROUP BY City, State
--2) Building table. Group by City. Count buildings. Filter MN.
SELECT        COUNT(BuildingId) AS [Building Count], City
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')
--3) Building and Apartment tables. Group by BuildingId, BuildingName. Avg rent.
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Avg Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName
--4) Building and Apartment tables. Group by City, BuildingName. Total rent. Filter MN,
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')
--5) Building and Apartment tables. Group by City. Cheapest Rent.
SELECT        Building.City, MIN(Apartment.Rent) AS Expr1
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.City
--6) Building and Apartment tables. Group by BuildingName. Filter available in Winona.
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Avg Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
GROUP BY Building.BuildingName, Building.City
HAVING        (Building.City = N'Winona')
--7) Invoice and LineItem tables. Group by InvoiceId. Filter Garage during September 2018.
SELECT        MIN(LineItem.Amount) AS [Cheapest Price]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102)) AND (LineItem.Description = N'Garage')
--8) Invoice and LineItem tables. Group by InvoiceId. Filter September 2018.
SELECT        LineItem.InvoiceId, SUM(LineItem.Amount) AS [Total Amount Billed]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.InvoiceId, Invoice.InvoiceDate
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))