-- Donari Brandes
-- Exercise 2e- Functions and Calculations
--Property Manager db

--1)  	Building name and location. Filter Winona, MN.
SELECT        BuildingName, Address, City + N', ' + State + N', ' + Zip AS Location
FROM            Building

--2)	Apartment estimated Rent. Filter Red Wing, MN.
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet, Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms AS [Estimated Rent], Building.City
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

--3)	Estimated vs Actual Rent. Filter Red Wing, MN.
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * .9 + 100 * Apartment.Bathrooms) 
                         AS [Rent Difference], Building.City
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

--4)	Invoice Total. 
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Amount
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName, Invoice.InvoiceDate
--5)	Invoice Total and Reciept.
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], Receipt.Amount AS [Receipt Amount]
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName, Invoice.InvoiceDate, Receipt.Amount

--6)	Invoice Total VS Total Recieved.
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Amount], Receipt.Amount AS [Receipt Amount], 
                         SUM(LineItem.Amount) - Receipt.Amount AS Difference
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING        ((SUM(LineItem.Amount) - Receipt.Amount) > 0)
--7)	Late Payments.
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName + N' ' + Person1.LastName AS Tenant, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
/*8)	Next Invoice Date.*/
SELECT        Person1.PersonId, Apartment.TenantId, MAX(Invoice.InvoiceDate) AS [Most Recent], MAX(DATEADD(month, 1, Invoice.InvoiceDate)) AS [1 Month]
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
GROUP BY Apartment.TenantId, Person1.PersonId