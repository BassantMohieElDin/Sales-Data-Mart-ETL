USE [AdventureWorksDWH2014]
GO

-- Delete 10% of records -> 383 rows affected
DELETE FROM DimCustomer 
WHERE  CustomerId % 50 = 2; 

SELECT DISTINCT City
FROM DimCustomer;

-- Update City (SCD: Type 1) -> 204 rows affected
UPDATE DimCustomer
SET City = 'Alex'
WHERE City = 'Bellingham'

-- Update Phone (SCD: Type 2) -> 472 rows affected
UPDATE DimCustomer 
SET    Phone = Substring(Phone, 10, 3) 
               + Substring(Phone, 4, 5) + Substring(Phone, 9, 1) 
               + Substring(Phone, 1, 3) 
WHERE  Len(Phone) = 12 
       AND LEFT(Phone, 3) BETWEEN '101' AND '125'; 

