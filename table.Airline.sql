Creart database Airline;

USE Airline;

--- 1. Airport Table---
CREATE TABLE Airport (
    iata_code CHAR(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

--- 2. Aircraft Table---
CREATE TABLE Aircraft (
    registration_number VARCHAR(20) PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

--- 3. Flight Table ---
CREATE TABLE Flight (
    flight_number VARCHAR(10) PRIMARY KEY,
    departure_datetime DATETIME NOT NULL,
    arrival_datetime DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    -- Examples of common relational additions:
    departure_airport_code CHAR(3),
    arrival_airport_code CHAR(3),
    aircraft_registration VARCHAR(20),
    FOREIGN KEY (departure_airport_code) REFERENCES Airport(iata_code),
    FOREIGN KEY (arrival_airport_code) REFERENCES Airport(iata_code),
    FOREIGN KEY (aircraft_registration) REFERENCES Aircraft(registration_number)
);

--- 4. Passenger Table ---
CREATE TABLE Passenger (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY, 
    full_name VARCHAR(150) NOT NULL,
    national_id VARCHAR(50) NOT NULL UNIQUE,     
    email VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

--- 5. Booking Table ---
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(10) NOT NULL,
    class VARCHAR(20) NOT NULL,                 
    price DECIMAL(10, 2) NOT NULL,
    booking_date DATE NOT NULL,
    flight_number VARCHAR(10),
    passenger_id INT,
    FOREIGN KEY (flight_number) REFERENCES Flight(flight_number),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

---  6. Crew Member Table ---
CREATE TABLE CrewMember (
    crew_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    role VARCHAR(50) NOT NULL,                 
    license_number VARCHAR(50) NOT NULL UNIQUE,
    assigned_flight_number VARCHAR(10),
    FOREIGN KEY (assigned_flight_number) REFERENCES Flight(flight_number)
);