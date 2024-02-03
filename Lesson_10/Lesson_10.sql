/* 0 travel agency
 
 Table 1
 Bookings
 
 id
 client_id
 tour_id
 hotel_id
 booking_date
 number_of_persons
 created_datetime
 
 Table 2
 Tours
 
 id
 start_date
 end_date
 price
 tour_type_id
 description
 
 
 Table 3
 Clients
 
 id
 first_name
 last_name
 birth_date
 country
 city
 address
 email
 phone_number
 passport_data
 status
 
 
 Table 4
 Payments
 
 id
 booking_id
 created_datetime
 payment_type
 amount
 document_number
 
 
 Table 5
 Reviews
 
 id
 tour_id
 clients_id
 rating
 description
 created_datetime
 
 Table 6
 Hotels
 
 id
 name
 country
 city
 address
 rating
 email
 description
 active
 
 Table 7
 TourTypes
 
 id
 name
 
 
 Task 1
 
 Select the list of customers with the total value of their bookings:
 A list of clients is required together with the total value of all their bookings. 
 Include only those customers whose total booking value exceeds a certain amount.

 Task 2
 Find the top 3 most popular hotels:
 You need to select the three most popular hotels together with the number of bookings for each hotels.
 
 */
 
 -- 4
 
 SELECT *
   FROM (
      SELECT YEAR(DueDate) Year,
             CASE 
                 WHEN MONTH(DueDate) = 12 THEN 'December'
                 WHEN MONTH(DueDate) = 1 THEN 'January'
                 WHEN MONTH(DueDate) = 2 THEN 'February'
             END Month,
             OrderQty
        FROM [AdventureWorks2017].[Production].[WorkOrder]
       WHERE MONTH(DueDate) IN (12, 1, 2)
    ) AS Source
PIVOT (
    SUM(OrderQty)
    FOR Month IN ([December], [January], [February])
) AS PivotTable
ORDER BY Year;