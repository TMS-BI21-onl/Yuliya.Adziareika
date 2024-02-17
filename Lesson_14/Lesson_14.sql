-- 1
CREATE PROCEDURE GetTop50Passengers
AS
BEGIN
    WITH PassengerTickets AS (
        SELECT p.PassengerID
             , MONTH(t.PurchaseDate) PurchaseMonth
             , COUNT(t.TicketID) TicketsCount
          FROM Passengers p
         INNER JOIN Tickets t ON p.PassengerID = t.PassengerID
         GROUP BY p.PassengerID, MONTH(t.PurchaseDate)
    )
    SELECT TOP 50 WITH TIES
           p.PassengerID
         , p.FirstName
         , p.LastName
         , SUM(
            CASE 
                WHEN pt.TicketsCount >= 10 THEN 3
                WHEN pt.TicketsCount BETWEEN 5 AND 9 THEN 2
                ELSE 1
            END
        ) TotalPoints
    FROM PassengerTickets pt
   INNER JOIN Passengers p ON pt.PassengerID = p.PassengerID
   GROUP BY p.PassengerID, p.FirstName, p.LastName
   ORDER BY TotalPoints DESC;
END;

EXEC GetTop50Passengers;

-- 2
/*
a.
Легенда справа. Избыточна. Достаточно подписи горизонтальной оси.
Цвета. Много "визуального шума" как говорят дизайнеры. Выглядит как график из 2000-хх. Можно убрать фон.В общем сделать меньше цветов в целом.

b.
Непонятно в принципе что это за график.
Если это прибыль по холдингу, то:
1/ Можно сделать круговую диаграмму или гистограмму.
2/ Уточнить компании.

Убрать 3D.

c.
Поработать с осями. Как-то мелко, надо повернуть голову, что бы увидеть что за дата.
Возможно надо в принципе изменить тип диаграммы на линейный график, что бы отобразить в целом динамику посещений.

*/