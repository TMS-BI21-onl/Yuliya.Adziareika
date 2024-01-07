-- 3. If the values in the sorting column are unique, all three functions return the same result.

-- 4a.
SELECT [UnitMeasureCode]
      -- ,[Name]
      -- ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasure] um
 WHERE um.UnitMeasureCode like 'T%'; -- 0 rows

SELECT COUNT (DISTINCT [UnitMeasureCode])
      -- ,[Name]
      -- ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasure]; -- 38 rows

INSERT INTO [AdventureWorks2017].[Production].[UnitMeasure]
       VALUES
           ('TT1','Test 1','2008-09-09 00:00:00.000'),
		   ('TT2','Test 2', GETDATE());

SELECT [UnitMeasureCode]
      -- ,[Name]
      -- ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasure] um
 WHERE um.UnitMeasureCode like 'T%'; -- 2 rows

-- 4b.
SELECT [UnitMeasureCode]
      ,[Name]
      ,[ModifiedDate]
  INTO [AdventureWorks2017].[Production].[UnitMeasureTest]
  FROM [AdventureWorks2017].[Production].[UnitMeasure] um
 WHERE um.UnitMeasureCode like 'T%' 
    OR um.UnitMeasureCode = 'CAN';

SELECT [UnitMeasureCode]
      ,[Name]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasureTest] umt
 ORDER BY [UnitMeasureCode]; -- 3 rows

-- 4c.
UPDATE [AdventureWorks2017].[Production].[UnitMeasureTest]
   SET UnitMeasureCode = 'TTT';

SELECT [UnitMeasureCode]
      ,[Name]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasureTest] umt
 ORDER BY [UnitMeasureCode]; -- check

-- 4d.
DELETE
  FROM [AdventureWorks2017].[Production].[UnitMeasureTest];

SELECT [UnitMeasureCode]
      ,[Name]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Production].[UnitMeasureTest] umt
 ORDER BY [UnitMeasureCode]; -- check 0 rows

-- 4e.
SELECT [SalesOrderID]
     , [LineTotal]
     , AVG([LineTotal]) OVER (PARTITION BY [SalesOrderId]) avg
	 , MAX([LineTotal]) OVER (PARTITION BY [SalesOrderId]) max
	 , MIN([LineTotal]) OVER (PARTITION BY [SalesOrderId]) min
  FROM [AdventureWorks2017].[Sales].[SalesOrderDetail]
 WHERE SalesOrderID IN ('43659','43664')
 -- ORDER BY SalesOrderId, LineTotal
 ;
-- 4f.
SELECT BusinessEntityId
     , SalesYTD
	 , FirstName
	 , LastName
	 , TerritoryGroup
	 , CONCAT (LEFT (UPPER(LastName),3), 'login', TerritoryGroup) Login
     , DENSE_RANK() OVER (ORDER BY SalesYTD DESC) rank
  FROM [AdventureWorks2017].[Sales].[vSalesPerson]; -- Shu Ito

SELECT BusinessEntityId
     , SalesLastYear
	 , FirstName
	 , LastName
	 , TerritoryGroup
	 , CONCAT (LEFT (UPPER(LastName),3), 'login', TerritoryGroup) Login
     , DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) rank
  FROM [AdventureWorks2017].[Sales].[vSalesPerson]; -- Ranjit Varkey Chudukatil

-- 4g.
SELECT DATEADD(DAY,1,EOMONTH(GETDATE(),-1));
 
/* 5.
count(1)
Result:
4 rows

count(name)
Result:
2 rows

count(id)
Result:
4 rows

count(*)
Result:
4 rows
*/