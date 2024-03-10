-- 1 Покажите всех менеджеров, которые имеют в подчинении больше 6-ти сотрудников.

SELECT e.employee_id
     , e.first_name
     , e.last_name
  FROM employees e
 INNER JOIN employees m ON e.manager_id = m.employee_id
 GROUP BY e.employee_id, e.first_name, e.last_name
HAVING COUNT(*) > 6;

-- 2 Вывести min и max зарплату с вычетом commission_pct для каждого департамента.

SELECT department_id,
       MIN(salary - (salary * commission_pct / 100)) minSalary,
       MAX(salary - (salary * commission_pct / 100)) maxSalary
  FROM employees
 GROUP BY department_id;

-- 3 Вывести только регион, где работают больше всего людей.

SELECT TOP 1 r.region_name
  FROM regions r
 INNER JOIN countries c ON r.region_id = c.region_id
 INNER JOIN locations l ON c.country_id = l.country_id
 INNER JOIN departments d ON l.location_id = d.location_id
 INNER JOIN employees e ON d.department_id = e.department_id
 GROUP BY r.region_name
 ORDER BY COUNT(*) DESC;

-- 4 Найдите разницу в процентах между средней зп по каждому департаменту от общей средней (по всем департаментам).

SELECT e.department_id
     , AVG(salary) avgSalaryDepartment
     , ((AVG(salary) - (SELECT AVG(salary) FROM employees)) / AVG(salary)) * 100 difference
  FROM employees e
 GROUP BY e.department_id;

-- 5 Найдите людей, кто проработал больше, чем 10 лет в одном департаменте.

SELECT e.employee_id
     , e.first_name
     , e.last_name
  FROM employees e
 INNER JOIN (
    SELECT employee_id
         , department_id
         , DATEDIFF(YEAR, MIN(start_date), ISNULL(MAX(end_date), GETDATE())) numberOfYears
      FROM job_history
     GROUP BY employee_id, department_id
    HAVING DATEDIFF(YEAR, MIN(start_date), ISNULL(MAX(end_date), GETDATE())) >= 10
) AS j ON e.employee_id = j.employee_id;

-- 6 Найдите людей, кто занимает 5-10 место по размеру зарплаты.

SELECT employee_id
     , first_name
     , last_name
     , salary
 FROM (
       SELECT employee_id
            , first_name
            , last_name
            , salary
            , DENSE_RANK() OVER (ORDER BY salary DESC) rank
      FROM employees
      ) ranked_employees
WHERE rank BETWEEN 5 AND 10;
