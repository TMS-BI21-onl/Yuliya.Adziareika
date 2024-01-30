-- 2 Generation of 1 million random first names and last names

CREATE TABLE RandomPeople (
    ID int identity(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
); -- create a table when we gonna save the random data

INSERT INTO RandomPeople (FirstName, LastName)
     SELECT TOP 1000000
            t1.column1,
            t2.column2
       FROM dbo.MOCK_DATA t1
 CROSS JOIN dbo.MOCK_DATA t2; -- fill the table 1 million rows, my table MOCK_DATA consists of 1000 person
 
SELECT TOP (1000000) ID, FirstName, LastName
  FROM RandomPeople; -- check
 

/* 3 
1/ When can we use CTE?
If we need to use the same subquery several times within the same query

2/ How does CTE differ from subquery?
Naming:
CTE have a name and can be referenced within the scope of the query where they are defined.
Subqueries are not named.

Reuse:
CTEs can be referenced multiple times within a single query.
Subqueries are typically used at the specific point.

Readability:
CTEs can enhance code readability.
Subqueries may result in more nested and harder-to-read code. 
*/