-- Donari Brandes
-- Exercise 2A: 2-table queries
-- PropertyManager db

-- 1) Building, Apartment tables. Sort by BuildingId and ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentId, Apartment.Rent, Apartment.ApartmentNum
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

--2) Building, Apartment tables. Sort by BuildingId and Rent
SELECT        Apartment.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Building.BuildingId
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC

--3) Apartment, Invoice tables. Sort by ApartmentNum, InvoiceDate
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC
--4) Apartment, Invoice tables. Sort by BuildingId, ApartmentNum, InvoiceDate
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate

--5) Apartment, Person tables. Sort by BuildingId, ApartmentNum
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.LastName AS Admin, Apartment.Rent
FROM            Apartment INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId AND Apartment.AdminId = Person1.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum

--6) Apartment, Person tables. Sort by BuildingId, TenantLastName, TenantFirstName
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person1.FirstName AS TenantFirstName, Person1.LastName AS TenantLastName
FROM            Apartment INNER JOIN
                         Person1 ON Apartment.TenantId = Person1.PersonId AND Apartment.AdminId = Person1.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFirstName

--7) Invoice, LineItem tables. Sort by ApartmentId, InvoiceId
SELECT        Invoice.InvoiceId, Invoice.ApartmentId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--8) Invoice, LineItem tables. Sort by ApartmentId, InvoiceDate
SELECT        Invoice.InvoiceId, Invoice.ApartmentId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Garage')

--9) Invoice, Reciept tables. Sort by ApartmentId, InvoiceId
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceId