-- 3
 USE [AdventureWorks2017]
 GO
 CREATE PROCEDURE UpdateNationalIDNumberByBEID
        @BusinessEntityID int,
		@NationalIDNumberNew nvarchar(15)
 AS
 BEGIN
 UPDATE [HumanResources].[Employee] 
    SET NationalIDNumber = @NationalIDNumberNew
  WHERE BusinessEntityID = @BusinessEntityID
 END;

 EXEC UpdateNationalIDNumberByBEID 15, '879341111';

 SELECT [BusinessEntityID]
      , [NationalIDNumber]
   FROM [AdventureWorks2017].[HumanResources].[Employee]
  WHERE BusinessEntityID = 15; -- check
