
---Advanced Level---

SELECT 
    f.Flight_number,
    a1.Name AS Origin,
    a2.Name AS Destination,
    a.Model,
    COUNT(b.Booking_id) AS Total_Passengers
FROM Flight f
LEFT JOIN Booking b ON f.Flight_id = b.Flight_id
JOIN Aircraft a ON f.Aircraft_id = a.Aircraft_id
JOIN Airport a1 ON f.Origin_airport = a1.IATA_code
JOIN Airport a2 ON f.Destination_airport = a2.IATA_code
GROUP BY f.Flight_number, a1.Name, a2.Name, a.Model;

SELECT *
FROM Passenger p
WHERE NOT EXISTS (
    SELECT 1
    FROM Booking b
    WHERE b.Passenger_id = p.Passenger_id
);


SELECT 
    f.Flight_number,
    SUM(b.Price) AS Total_Revenue
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_number
HAVING SUM(b.Price) > 500
ORDER BY Total_Revenue DESC;


SELECT 
    c.Full_name,
    COUNT(fc.Flight_id) AS Total_Flights
FROM CrewMember c
JOIN FlightCrew fc ON c.Crew_id = fc.Crew_id
GROUP BY c.Full_name
HAVING COUNT(fc.Flight_id) > 1;