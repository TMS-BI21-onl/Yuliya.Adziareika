-- 1
SELECT d.*
  FROM drivers d
 WHERE d.drivers_experience NOT IN (3, 5, 6, 10)
   AND d.place_of_registration = 'eee';
   
-- 2
SELECT d.passport_number
  FROM drivers d
  LEFT JOIN dispatch ds ON ds.driver_id = d.id
 WHERE ds.driver_id IS NULL
 GROUP BY d.passport_number;
 
 -- 3
 SELECT c.reg_number
      , ds.arrival_time 
      , ds.departure_time
      , r.destination
   FROM cars c
   JOIN dispatch ds ON ds.cars_id = c.id -- kod avto = kod avto
   JOIN route r ON r.route_id = ds.route_code -- kod marshruta = putevka
  WHERE c.year_of_issue = 2015;
---------------------------------
-- 1
SELECT LEFT(e.first_name, 1) first_letter
     , COUNT(e.*) AS employee_count
  FROM employees e
 GROUP BY LEFT(e.first_name, 1)
HAVING COUNT(e.*) > 1
 ORDER BY COUNT(e.*) DESC;
-- 2
-- 3
SELECT e.*
  FROM employees e
 WHERE e.MANAGER_ID IS NULL;
