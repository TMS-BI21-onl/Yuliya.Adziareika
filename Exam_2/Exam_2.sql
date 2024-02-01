-- 1
   SELECT p.FirstName
        , p.LastName
	    , pp.PhoneNumber
     FROM Person.Person p
LEFT JOIN person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
    WHERE pp.PhoneNumber like ('4_5%');

-- 2
SELECT e.NationalIDNumber
     , e.BirthDate
     , CASE
        WHEN DATEDIFF(YEAR, e.BirthDate, GETDATE()) BETWEEN 17 AND 20 THEN 'Adolescence'
        WHEN DATEDIFF(YEAR, e.BirthDate, GETDATE()) BETWEEN 21 AND 59 THEN 'Adults'
        WHEN DATEDIFF(YEAR, e.BirthDate, GETDATE()) BETWEEN 60 AND 75 THEN 'Elderly'
        WHEN DATEDIFF(YEAR, e.BirthDate, GETDATE()) BETWEEN 76 AND 90 THEN 'Senile'
        ELSE 'Is not defined'
    END AS AgeCategory
  FROM HumanResources.Employee e;

-- 3
SELECT p.Color
     , p.Name
     , p.StandardCost
  FROM Production.Product p
 WHERE p.StandardCost = (SELECT MAX (p2.StandardCost) 
                          FROM Production.Product p2
						  WHERE p.Color = p2.Color);

WITH ProductWithRowNumber AS (
		SELECT p.Color
			 , p.Name
			 , p.StandardCost
			 , DENSE_RANK() OVER (PARTITION BY p.Color ORDER BY p.StandardCost DESC) RowNumber
		  FROM Production.Product p )
SELECT Color
	 , Name
	 , StandardCost
  FROM ProductWithRowNumber
 WHERE RowNumber = 1;

 SELECT Color
	  , Name
	  , StandardCost
  FROM (SELECT p.Color
			 , p.Name
			 , p.StandardCost
			 , MAX(p.StandardCost) OVER (PARTITION BY p.Color) MaxCost
		  FROM Production.Product p) MaxStandartCost
 WHERE StandardCost = MaxCost;