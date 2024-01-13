 -- 6 
CREATE TABLE Patients  
(  
 ID int identity(1,1) PRIMARY KEY,  
 FirstName NVARCHAR(50) NOT NULL,  
 LastName NVARCHAR(50) NOT NULL,   
 SSN uniqueidentifier DEFAULT NEWSEQUENTIALID(),   
 Email AS UPPER(LEFT(FirstName,1)) + LOWER(LEFT(LastName,3)) + '@mail.com',  
 Temp DECIMAL(5,2) NOT NULL,  
 CreatedDate DATETIME DEFAULT GETDATE()
); 

-- 7 
INSERT INTO Patients (FirstName, LastName, Temp)
     VALUES
           ('Li','Tests', 36.6),
		   ('Pi','Test', 38.4);

SELECT * FROM Patients; -- check

-- 8 
ALTER TABLE Patients
  ADD TempType AS
	  (CASE 
	        WHEN Temp < 37 THEN '<37°C'
			WHEN Temp > 37 THEN '>37°C'
			ELSE '=37°C'
	   END);

SELECT * FROM Patients; -- check

-- 9
CREATE VIEW Patients_v 
AS
SELECT 
      ID
	, FirstName
	, LastName
	, SSN
	, Email
	, (Temp*9/5 + 32) TempInFarengeit
	, CreatedDate
 FROM Patients;

SELECT * FROM Patients_v; -- check
 
-- 10
CREATE FUNCTION dbo.udfGetTemperatureInFahrenheit (@TempInCelsius DECIMAL(5,2))
RETURNS DECIMAL(5,2)
AS
BEGIN
     RETURN @TempInCelsius*9/5 + 32;
END;

SELECT dbo.udfGetTemperatureInFahrenheit (36.6) TempInFah; -- check

-- 11
DECLARE @FirstDayOfMonth DATETIME = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0);
WHILE DATEPART(WEEKDAY, @FirstDayOfMonth) IN (1, 7)
BEGIN
    SET @FirstDayOfMonth = DATEADD(DAY, 1, @FirstDayOfMonth);
END
SELECT @FirstDayOfMonth FirstWeekdayOfMonth; 

-- 12
WITH LatestJobHistory AS (
  SELECT jh.EMPLOYEE_ID
       , jh.END_DATE
       , ROW_NUMBER() OVER (PARTITION BY jh.EMPLOYEE_ID ORDER BY jh.START_DATE DESC) AS JobNum
     FROM job_history jh
)
SELECT e.FIRST_NAME
     , CASE
           WHEN ljh.END_DATE IS NOT NULL THEN CONCAT('Left the company at ', ljh.END_DATE)
           ELSE 'Currently Working'
       END AS STATUS
 FROM employees e
 LEFT JOIN LatestJobHistory ljh ON e.EMPLOYEE_ID = ljh.EMPLOYEE_ID 
WHERE ljh.JobNum = 1; 