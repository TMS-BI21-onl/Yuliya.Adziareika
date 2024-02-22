-- 1

SELECT ProductSubcategoryID
  FROM Production.Product
 WHERE ProductSubcategoryID IS NOT NULL
 GROUP BY ProductSubcategoryID
HAVING MIN(Weight) > 150;

-- 2

SELECT TOP 1 WITH TIES *
  FROM Production.Product
 ORDER BY StandardCost DESC;

SELECT *
  FROM Production.Product
 WHERE StandardCost = (SELECT MAX(StandardCost) FROM Production.Product);

SELECT *
  FROM (
    SELECT *
         , DENSE_RANK () OVER (ORDER BY StandardCost DESC) rowNum
      FROM Production.Product
) ranked
WHERE rowNum = 1;

SELECT *
 FROM Production.Product p
WHERE NOT EXISTS (
    SELECT 1
      FROM Production.Product p2
     WHERE p2.StandardCost > p.StandardCost
);

-- 3

SELECT c.clientId
  FROM Client c
  LEFT JOIN Order o ON c.clientId = o.clientId
 WHERE o.clientId IS NULL 
    OR o.orderDate < DATEADD(year, -1, GETDATE())
 GROUP BY c.clientId;


-- 4

SELECT v.vendorId
     , v.name
     , COUNT(o.orderId)
  FROM Vendor v
  LEFT JOIN Order o ON v.vendorId = o.vendorId
 WHERE o.orderDate >= DATEADD(year, -5, GETDATE())
 GROUP BY v.vendorId, v.name;


-- 5 

SELECT n.category
  FROM Notifications n
  JOIN Users u ON n.user_id = u.id
 WHERE u.email = 'alex@gmail.com'
   AND n.is_read = 0
 GROUP BY category
HAVING COUNT(*) > 50;
