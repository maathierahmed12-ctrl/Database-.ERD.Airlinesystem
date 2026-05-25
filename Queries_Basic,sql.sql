
---Basic Level---

SELECT *
FROM Flight
ORDER BY Departure_datetime ASC;

SELECT *
FROM Passenger
ORDER BY Full_name ASC;

SELECT *
FROM Aircraft
ORDER BY Capacity DESC;

SELECT DISTINCT Class
FROM Booking;

SELECT *
FROM Flight
WHERE Status IN ('Delayed', 'Cancelled');

SELECT *
FROM Passenger
WHERE Nationality = 'Omani';

SELECT *
FROM Airport
ORDER BY Country;

