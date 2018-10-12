-- Donari Brandes
-- Exercise 2A: 2-table queries
-- Property Manager db

-- 1) Building, Apartment tables. Sort by BuildingId and ApartmentNum

SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId

