
---Medium Level---

SELECT 
    f.Flight_number,
    a1.Name AS Origin_Airport,
    a2.Name AS Destination_Airport
FROM Flight f
JOIN Airport a1 ON f.Origin_airport = a1.IATA_code
JOIN Airport a2 ON f.Destination_airport = a2.IATA_code;

SELECT 
    b.*,
    p.Full_name,
    f.Flight_number
FROM Booking b
JOIN Passenger p ON b.Passenger_id = p.Passenger_id
JOIN Flight f ON b.Flight_id = f.Flight_id;

SELECT 
    c.Full_name,
    c.Role
FROM CrewMember c
JOIN FlightCrew fc ON c.Crew_id = fc.Crew_id
JOIN Flight f ON fc.Flight_id = f.Flight_id
WHERE f.Flight_number = 'SK101';


SELECT 
    f.Flight_number,
    a.Model
FROM Flight f
JOIN Aircraft a ON f.Aircraft_id = a.Aircraft_id
WHERE f.Status = 'Completed';

SELECT 
    p.Full_name,
    COUNT(b.Booking_id) AS Total_Bookings
FROM Passenger p
LEFT JOIN Booking b ON p.Passenger_id = b.Passenger_id
GROUP BY p.Full_name
ORDER BY Total_Bookings DESC;


SELECT 
    Class,
    SUM(Price) AS Total_Revenue
FROM Booking
GROUP BY Class;


SELECT 
    a.Aircraft_id,
    COUNT(f.Flight_id) AS Total_Flights
FROM Aircraft a
LEFT JOIN Flight f ON a.Aircraft_id = f.Aircraft_id
GROUP BY a.Aircraft_id;


SELECT 
    Flight_id,
    COUNT(*) AS Total_Bookings
FROM Booking
GROUP BY Flight_id
HAVING COUNT(*) > 1;

SELECT 
    p.Full_name,
    f.Flight_number,
    a1.Name AS Origin,
    a2.Name AS Destination,
    b.Class,
    b.Price
FROM Booking b
JOIN Passenger p ON b.Passenger_id = p.Passenger_id
JOIN Flight f ON b.Flight_id = f.Flight_id
JOIN Airport a1 ON f.Origin_airport = a1.IATA_code
JOIN Airport a2 ON f.Destination_airport = a2.IATA_code;