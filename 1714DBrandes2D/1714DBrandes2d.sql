-- Donari Brandes
-- Exercise 2d- Multi-Tab;e join queries
--Property Manager db

--1) Building, Apartments, Admin. Sort City, BuildingName, ApartmentNum, LastName, FirstName.
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person1.FirstName, Person1.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person1 ON Apartment.AdminId = Person1.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person1.LastName, Person1.FirstName

--2) Tenants, buildings, apartments. Sort by LastName, FirstName, BuildingId, ApartmentNum.
SELECT        Apartment.ApartmentNum, Person1.LastName, Person1.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Person1.PersonId
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
ORDER BY Person1.LastName, Person1.FirstName, Building.BuildingId, Apartment.ApartmentNum

--3) Apartment, tenant, invoice, line items. Sort by ApartmentNum, LastName, FirstName, InvoiceDate. Filter Building 1.
SELECT        Apartment.ApartmentNum, Person1.LastName, Person1.FirstName, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person1.LastName, Invoice.InvoiceDate 

--4) Apartment, tenant, invoice total. 
SELECT        Apartment.BuildingId, Apartment.ApartmentId, Person1.LastName, Person1.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person1.LastName, Person1.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

--5) Invoice, tenant, receipt. Sort by InvoiceDate, ReceiptDate.
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person1.LastName, Person1.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--6) Invoice, tenant, apartment, billed, received.
SELECT        Invoice.InvoiceDate, Person1.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS [Total Billed], Receipt.Amount AS Received, Receipt.InvoiceId
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceDate, Person1.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Receipt.InvoiceId, Receipt.Amount

--7) Administrator, invoice, total billed, received.
SELECT        Person1.PersonId, Apartment.AdminId, Person1.LastName, Receipt.InvoiceId, Invoice.InvoiceDate, Receipt.Amount AS [Total Received], SUM(LineItem.Amount) AS [Total Billed]
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person1 ON Apartment.AdminId = Person1.PersonId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Person1.PersonId, Apartment.AdminId, Person1.LastName, Receipt.InvoiceId, Invoice.InvoiceDate, Receipt.Amount