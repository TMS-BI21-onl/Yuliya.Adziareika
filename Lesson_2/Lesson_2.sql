-- 1a. All column
SELECT [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Sales].[SalesTerritory];
  
-- 1b. Select [TerritoryID] and [Name]
SELECT [TerritoryID]
      ,[Name]
  FROM [AdventureWorks2017].[Sales].[SalesTerritory];
  
-- 1c. All data where LastName = Norman
SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Person].[Person]
 WHERE [LastName] = 'Norman';
 
-- 1d. All data where EmailPromotion !=2
SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Person].[Person]
 WHERE [EmailPromotion] != 2; 

 /* 3. Aggregate Functions (Transact-SQL)
 Transact-SQL provides the following aggregate functions:
APPROX_COUNT_DISTINCT
CHECKSUM_AGG
COUNT_BIG
GROUPING
GROUPING_ID
STDEV
STDEVP
STRING_AGG
VAR
VARP
 */

 -- 4a.
 SELECT COUNT (DISTINCT [PersonType])
   FROM [AdventureWorks2017].[Person].[Person]
  WHERE [LastName] like 'M%'
     OR [EmailPromotion] != 1;

 -- 4b.
 SELECT TOP (3) WITH TIES [DiscountPct]
      ,[SpecialOfferID]
      ,[Description]
      ,[Type]
      ,[Category]
      ,[StartDate]
      ,[EndDate]
      ,[MinQty]
      ,[MaxQty]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Sales].[SpecialOffer]
  WHERE [StartDate] >= '2013-01-01' AND [StartDate] <= '2014-01-01'
  ORDER BY [DiscountPct];

 -- 4c.
 SELECT MAX ([Size]) max_size
      , MIN ([Weight]) min_weight
  FROM [AdventureWorks2017].[Production].[Product];

 -- 4d.
 SELECT [ProductSubcategoryID]
      , MAX ([Size]) max_size
      , MIN ([Weight]) min_weight
  FROM [AdventureWorks2017].[Production].[Product]
 GROUP BY [ProductSubcategoryID];

 -- 4e.
 SELECT [ProductSubcategoryID]
      , MAX ([Size]) max_size
      , MIN ([Weight]) min_weight
  FROM [AdventureWorks2017].[Production].[Product]
  WHERE [Color] IS NOT null
 GROUP BY [ProductSubcategoryID];