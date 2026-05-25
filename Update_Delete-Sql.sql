
---UPDATE statements for the airline database---

UPDATE Flight
SET Status = 'Cancelled'
WHERE Flight_number = 'SK102'
AND Status = 'Delayed';

UPDATE Booking
SET Price = Price * 1.10
WHERE Class = 'Economy';

UPDATE Passenger
SET Phone_no = '90000000'
WHERE Passenger_id = 1;

UPDATE CrewMember
SET Role = 'Senior First Officer'
WHERE Crew_id = 3;

---DELETE statements for the airline database---

SELECT *
FROM Flight
WHERE Status = 'Cancelled'
LIMIT 1;

DELETE FROM Flight
WHERE Flight_id = (
    SELECT Flight_id
    FROM Flight
    WHERE Status = 'Cancelled'
    LIMIT 1
);

SELECT bk*
FROM Booking bk
JOIN Flight f ON b.Flight_id = f.Flight_id
WHERE f.Status = 'Cancelled'
LIMIT 1;

DELETE FROM Booking
WHERE Booking_id = (
    SELECT b.Booking_id
    FROM Booking b
    JOIN Flight f ON b.Flight_id = f.Flight_id
    WHERE f.Status = 'Cancelled'
    LIMIT 1
);

SELECT *
FROM Passenger
WHERE Passenger_id = 1;

DELETE FROM Passenger
WHERE Passenger_id = 4;


