-- 1. AIRPORTS (5 different countries)

INSERT INTO Airport (iata_code, name, city, country) VALUES
('JFK', 'John F. Kennedy International Airport', 'New York', 'United States'),
('LHR', 'Heathrow Airport', 'London', 'United Kingdom'),
('HND', 'Haneda Airport', 'Tokyo', 'Japan'),
('DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates'),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France');

INSERT INTO Aircraft (registration_number, model, manufacturer, capacity) VALUES
('N101AA', 'A320neo', 'Airbus', 180),
('N202BB', '737 MAX 8', 'Boeing', 178),
('N303CC', '787-9 Dreamliner', 'Boeing', 290),
('N404DD', 'A350-900', 'Airbus', 325),
('N505EE', 'E195-E2', 'Embraer', 132);



INSERT INTO Flight (flight_number, departure_datetime, arrival_datetime, status, departure_airport_code, arrival_airport_code, aircraft_registration) VALUES
('SK101', '2026-06-01 08:00:00', '2026-06-01 16:00:00', 'Completed', 'JFK', 'LHR', 'N303CC'),
('SK102', '2026-06-01 12:00:00', '2026-06-01 20:00:00', 'Completed', 'LHR', 'CDG', 'N101AA'),
('SK201', '2026-06-02 10:00:00', '2026-06-02 23:30:00', 'Scheduled', 'HND', 'DXB', 'N404DD'),
('SK202', '2026-06-02 15:15:00', '2026-06-02 17:45:00', 'Scheduled', 'CDG', 'LHR', 'N505EE'),
('SK301', '2026-06-03 22:00:00', '2026-06-04 06:00:00', 'Delayed',   'DXB', 'JFK', 'N303CC'),
('SK302', '2026-06-03 05:00:00', '2026-06-03 14:00:00', 'Delayed',   'LHR', 'HND', 'N202BB'),
('SK401', '2026-06-04 01:00:00', '2026-06-04 09:30:00', 'Cancelled', 'JFK', 'CDG', 'N404DD'),
('SK402', '2026-06-04 18:00:00', '2026-06-05 02:00:00', 'Cancelled', 'DXB', 'LHR', 'N202BB');


ALTER TABLE Passenger ADD COLUMN phone_number VARCHAR(20) NULL;

INSERT INTO Passenger (passenger_id, full_name, national_id, email, nationality, date_of_birth, phone_number) VALUES
(1, 'Alice Smith', 'US1234567', 'alice@email.com', 'American', '1990-05-12', '+1-555-0101'),
(2, 'Bob Jones', 'UK7654321', 'bob@email.co.uk', 'British', '1985-08-22', '+44-20-7946-0192'),
(3, 'Hiroshi Tanaka', 'JP9876543', 'hiro@email.jp', 'Japanese', '1993-11-03', NULL),
(4, 'Fatima Al-Mansoori', 'AE1112223', 'fatima@email.ae', 'Emirati', '1988-02-14', '+971-4-1234567'),
(5, 'Chloe Dubois', 'FR4445556', 'chloe@email.fr', 'French', '1995-07-19', '+33-1-42277889'),
(6, 'Hans Müller', 'DE7778889', 'hans@email.de', 'German', '1972-04-30', NULL),
(7, 'Carlos Silva', 'BR3332221', 'carlos@email.br', 'Brazilian', '2001-12-25', '+55-11-99999-1111'),
(8, 'Amara Okafor', 'NG5556667', 'amara@email.ng', 'Nigerian', '1998-09-05', NULL);


INSERT INTO Booking (booking_id, seat_number, class, price, booking_date, flight_number, passenger_id) VALUES
(101, '12A', 'Economy',  450.00,  '2026-05-10', 'SK101', 1),
(102, '02B', 'Business', 1200.00, '2026-05-11', 'SK101', 2),
(103, '01A', 'First',    3500.00, '2026-05-12', 'SK102', 3),
(104, '15F', 'Economy',  380.00,  '2026-05-12', 'SK102', 4),
(105, '10C', 'Economy',  600.00,  '2026-05-14', 'SK201', 5),
(106, '04D', 'Business', 1500.00, '2026-05-15', 'SK201', 6),
(107, '22A', 'Economy',  310.00,  '2026-05-16', 'SK202', 7),
(108, '08E', 'Business', 1150.00, '2026-05-17', 'SK301', 8),
(109, '14D', 'Economy',  520.00,  '2026-05-18', 'SK302', 1),
(110, '18A', 'Economy',  400.00,  '2026-05-19', 'SK401', 2);

ALTER TABLE CrewMember DROP FOREIGN KEY crewmember_ibfk_1;
ALTER TABLE CrewMember DROP COLUMN assigned_flight_number;

INSERT INTO CrewMember (crew_id, full_name, role, license_number) VALUES
(1, 'Captain John Miller', 'Pilot', 'L-PLT9988'),
(2, 'First Officer Sarah Lee', 'Co-Pilot', 'L-CPT4455'),
(3, 'David Evans', 'Flight Attendant', 'L-FA1122'),
(4, 'Emma Watson', 'Flight Attendant', 'L-FA3344'),
(5, 'Robert Chen', 'Engineer', 'L-ENG7766'),
(6, 'Captain Marc Dubois', 'Pilot', 'L-PLT1102');

INSERT INTO FlightCrew (flight_number, crew_id) VALUES
-- SK101 Crew
('SK101', 1), ('SK101', 3),
-- SK102 Crew
('SK102', 1), ('SK102', 4),
-- SK201 Crew
('SK201', 6), ('SK201', 3), ('SK201', 5),
-- SK202 Crew
('SK202', 6), ('SK202', 4),
-- SK301 Crew
('SK301', 1), ('SK301', 2), ('SK301', 3),
-- SK302 Crew
('SK302', 6), ('SK302', 4),
-- SK401 Crew
('SK401', 1), ('SK401', 3), ('SK401', 5),
-- SK402 Crew
('SK402', 6), ('SK402', 4);