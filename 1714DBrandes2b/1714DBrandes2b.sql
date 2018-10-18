-- Donari Brandes
-- Exercise 2: Summary queries
-- PropertyManager db

--1) Building table. Count all buildings.
SELECT        COUNT(BuildingId) AS [Building Count]
FROM            Building
--2) Building table. Count all buildings in Winona.
SELECT        COUNT(BuildingId) AS [Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')
--3) Apartment table. Average rent of all apartments.
SELECT        AVG(Rent) AS [Avg Rent]
FROM            Apartment
--4) Apartment table. Total rent of apartments in Building 1.
SELECT        SUM(Rent) AS [Total Rent]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)
--5) Apartment table. Cheapest rent for BUilding 2.
SELECT        MIN(Rent) AS [Cheapest Rent]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)
--6) Apartment table. Smallest, Average, largest size for Building 1.
SELECT        MIN(SquareFeet) AS [Smallest SqFt], AVG(SquareFeet) AS [Avg SqFt], MAX(SquareFeet) AS [Largest SqFt]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)
--7) LineItem table. Cheapest price for Garage.
SELECT        MIN(Amount) AS [Cheapest Price]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')
--8) LineItem table. Total amount billed for Gas.
SELECT        SUM(Amount) AS [Total Gas Amount]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')
--9) LineItem table. Totoal rent for month of October.
SELECT        SUM(Amount) AS [October Rent Total]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Rent, Oct 2018')