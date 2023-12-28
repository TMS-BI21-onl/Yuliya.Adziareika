-- 2a.
SELECT [Name]
      , CASE 
	        WHEN StandardCost = 0 OR StandardCost IS NULL THEN 'Not for sale'
			WHEN StandardCost > 0 AND StandardCost < 100 THEN '<$100'
			WHEN StandardCost >= 100 AND StandardCost < 500 THEN '<$500'
			ELSE '>=$500'
	    END PriceRange
  FROM [AdventureWorks2017].[Production].[Product];

-- 2b.
SELECT pv.ProductID, pv.BusinessEntityID, v.Name
  FROM [AdventureWorks2017].[Purchasing].[ProductVendor] pv
  JOIN [AdventureWorks2017].[Purchasing].[Vendor] v ON pv.BusinessEntityID = v.BusinessEntityID
 WHERE pv.StandardPrice > 10
   AND (v.Name LIKE '%X%' or v.Name LIKE 'N%');

-- 2c.
SELECT v.Name
  FROM [AdventureWorks2017].[Purchasing].[Vendor] v
  LEFT JOIN [AdventureWorks2017].[Purchasing].[ProductVendor] pv ON pv.BusinessEntityID = v.BusinessEntityID
 WHERE pv.ProductID IS NULL;

 -- 3a.
SELECT p.Name, p.ListPrice
  FROM [AdventureWorks2017].[Production].[ProductModel] pm
  JOIN [AdventureWorks2017].[Production].[Product] p on p.ProductModelID = pm.ProductModelID
 WHERE pm.Name LIKE 'LL%';
 
 -- 3b.
 SELECT Name
   FROM [AdventureWorks2017].[Purchasing].[Vendor]
  UNION
 SELECT Name
   FROM [AdventureWorks2017].[Sales].[Store]
  ORDER BY Name;

 -- 3c.
 SELECT p.Name, COUNT (so.SpecialOfferID)
   FROM [AdventureWorks2017].[Sales].[SpecialOffer] so
   JOIN [AdventureWorks2017].[Sales].[SpecialOfferProduct] sop ON so.SpecialOfferID = sop.SpecialOfferID
   JOIN [AdventureWorks2017].[Production].[Product] p ON sop.ProductID = p.ProductID
  GROUP BY p.Name
 HAVING COUNT (so.SpecialOfferID) > 1;
