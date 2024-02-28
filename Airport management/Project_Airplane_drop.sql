-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-02 13:34:08.173

-- foreign keys
ALTER TABLE Address
    DROP CONSTRAINT Address_City;

ALTER TABLE Airplane
    DROP CONSTRAINT Airplane_Airline;

ALTER TABLE Airplane
    DROP CONSTRAINT Airplane_Airplane_Type;

ALTER TABLE Airplane_Type
    DROP CONSTRAINT Airplane_Type_Producer;

ALTER TABLE Airport
    DROP CONSTRAINT Airport_City;

ALTER TABLE Baggage
    DROP CONSTRAINT Baggage_Ticket_Booking;

ALTER TABLE City
    DROP CONSTRAINT City_Country;

ALTER TABLE Employee
    DROP CONSTRAINT Employee_Address;

ALTER TABLE Employee
    DROP CONSTRAINT Employee_Airport;

ALTER TABLE Flight
    DROP CONSTRAINT Flight_Airplane;

ALTER TABLE Flight
    DROP CONSTRAINT Flight_Airport;

ALTER TABLE Flight
    DROP CONSTRAINT Flight_Airport2;

ALTER TABLE Flight_Employee
    DROP CONSTRAINT Flight_Employees_Employee;

ALTER TABLE Flight_Employee
    DROP CONSTRAINT Flight_Employees_Flight;

ALTER TABLE Flight_Status
    DROP CONSTRAINT Flight_Status_Flight;

ALTER TABLE Flight_Status
    DROP CONSTRAINT Flight_Status_Status;

ALTER TABLE Passenger
    DROP CONSTRAINT Passenger_Address;

ALTER TABLE Producer
    DROP CONSTRAINT Producer_Address;

ALTER TABLE Airplane_Airport
    DROP CONSTRAINT Table_24_Airplane;

ALTER TABLE Airplane_Airport
    DROP CONSTRAINT Table_24_Airport;

ALTER TABLE Ticket_Booking
    DROP CONSTRAINT Ticket_Flight;

ALTER TABLE Ticket_Booking
    DROP CONSTRAINT Ticket_Passenger;

ALTER TABLE Ticket_Booking
    DROP CONSTRAINT Ticket_Travel_Class;

-- tables
DROP TABLE Address;

DROP TABLE Airline;

DROP TABLE Airplane;

DROP TABLE Airplane_Airport;

DROP TABLE Airplane_Type;

DROP TABLE Airport;

DROP TABLE Baggage;

DROP TABLE City;

DROP TABLE Country;

DROP TABLE Employee;

DROP TABLE Flight;

DROP TABLE Flight_Employee;

DROP TABLE Flight_Status;

DROP TABLE Passenger;

DROP TABLE Producer;

DROP TABLE Status;

DROP TABLE Ticket_Booking;

DROP TABLE Travel_Class;

-- End of file.

