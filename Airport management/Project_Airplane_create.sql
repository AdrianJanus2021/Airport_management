-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-02 13:34:08.173

-- tables
-- Table: Address
CREATE TABLE Address (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    City_id integer  NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (id)
) ;

-- Table: Airline
CREATE TABLE Airline (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    CONSTRAINT Airline_pk PRIMARY KEY (id)
) ;

-- Table: Airplane
CREATE TABLE Airplane (
    id integer  NOT NULL,
    Model_Number integer  NOT NULL,
    Airline_id integer  NOT NULL,
    Airplane_Type_id integer  NOT NULL,
    CONSTRAINT Airplane_pk PRIMARY KEY (id)
) ;

-- Table: Airplane_Airport
CREATE TABLE Airplane_Airport (
    id integer  NOT NULL,
    Airplane_id integer  NOT NULL,
    Airport_id integer  NOT NULL,
    Airport_Change timestamp  NOT NULL,
    CONSTRAINT Airplane_Airport_pk PRIMARY KEY (id)
) ;

-- Table: Airplane_Type
CREATE TABLE Airplane_Type (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Capacity integer  NOT NULL,
    Producer_id integer  NOT NULL,
    CONSTRAINT Airplane_Type_pk PRIMARY KEY (id)
) ;

-- Table: Airport
CREATE TABLE Airport (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    City_id integer  NOT NULL,
    CONSTRAINT Airport_pk PRIMARY KEY (id)
) ;

-- Table: Baggage
CREATE TABLE Baggage (
    id integer  NOT NULL,
    Weight number(38,2)  NOT NULL,
    Ticket_Booking_id integer  NOT NULL,
    CONSTRAINT Baggage_pk PRIMARY KEY (id)
) ;

-- Table: City
CREATE TABLE City (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Country_id integer  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (id)
) ;

-- Table: Country
CREATE TABLE Country (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (id)
) ;

-- Table: Employee
CREATE TABLE Employee (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Surname varchar2(38)  NOT NULL,
    Contact_Number char(9)  NOT NULL,
    Salary number(38,2)  NOT NULL,
    Hire_Date date  NOT NULL,
    Job varchar2(38)  NOT NULL,
    Airport_id integer  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (id)
) ;

-- Table: Flight
CREATE TABLE Flight (
    id integer  NOT NULL,
    Departure_Time timestamp  NOT NULL,
    Arrival_Time timestamp  NOT NULL,
    Origin_Airpport integer  NOT NULL,
    Destination_Airport integer  NOT NULL,
    Airplane_id integer  NOT NULL,
    CONSTRAINT Flight_pk PRIMARY KEY (id)
) ;

-- Table: Flight_Employee
CREATE TABLE Flight_Employee (
    Flight_id integer  NOT NULL,
    Employee_id integer  NOT NULL,
    CONSTRAINT Flight_Employee_pk PRIMARY KEY (Flight_id,Employee_id)
) ;

-- Table: Flight_Status
CREATE TABLE Flight_Status (
    Flight_id integer  NOT NULL,
    Status_id integer  NOT NULL,
    Status_Change timestamp  NOT NULL,
    CONSTRAINT Flight_Status_pk PRIMARY KEY (Status_id,Flight_id)
) ;

-- Table: Passenger
CREATE TABLE Passenger (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Surname varchar2(38)  NOT NULL,
    Contact_Number char(9)  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Passenger_pk PRIMARY KEY (id)
) ;

-- Table: Producer
CREATE TABLE Producer (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Contact_number char(9)  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Producer_pk PRIMARY KEY (id)
) ;

-- Table: Status
CREATE TABLE Status (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;

-- Table: Ticket_Booking
CREATE TABLE Ticket_Booking (
    id integer  NOT NULL,
    price number(38,2)  NOT NULL,
    seatNumber integer  NOT NULL,
    Purchase_Date date  NOT NULL,
    Passenger_id integer  NOT NULL,
    Flight_id integer  NOT NULL,
    Travel_Class_id integer  NOT NULL,
    CONSTRAINT Ticket_Booking_pk PRIMARY KEY (id)
) ;

-- Table: Travel_Class
CREATE TABLE Travel_Class (
    id integer  NOT NULL,
    Name varchar2(38)  NOT NULL,
    Description varchar2(100)  NOT NULL,
    CONSTRAINT Travel_Class_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: Address_City (table: Address)
ALTER TABLE Address ADD CONSTRAINT Address_City
    FOREIGN KEY (City_id)
    REFERENCES City (id);

-- Reference: Airplane_Airline (table: Airplane)
ALTER TABLE Airplane ADD CONSTRAINT Airplane_Airline
    FOREIGN KEY (Airline_id)
    REFERENCES Airline (id);

-- Reference: Airplane_Airplane_Type (table: Airplane)
ALTER TABLE Airplane ADD CONSTRAINT Airplane_Airplane_Type
    FOREIGN KEY (Airplane_Type_id)
    REFERENCES Airplane_Type (id);

-- Reference: Airplane_Type_Producer (table: Airplane_Type)
ALTER TABLE Airplane_Type ADD CONSTRAINT Airplane_Type_Producer
    FOREIGN KEY (Producer_id)
    REFERENCES Producer (id);

-- Reference: Airport_City (table: Airport)
ALTER TABLE Airport ADD CONSTRAINT Airport_City
    FOREIGN KEY (City_id)
    REFERENCES City (id);

-- Reference: Baggage_Ticket_Booking (table: Baggage)
ALTER TABLE Baggage ADD CONSTRAINT Baggage_Ticket_Booking
    FOREIGN KEY (Ticket_Booking_id)
    REFERENCES Ticket_Booking (id);

-- Reference: City_Country (table: City)
ALTER TABLE City ADD CONSTRAINT City_Country
    FOREIGN KEY (Country_id)
    REFERENCES Country (id);

-- Reference: Employee_Address (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Address
    FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Employee_Airport (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Airport
    FOREIGN KEY (Airport_id)
    REFERENCES Airport (id);

-- Reference: Flight_Airplane (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airplane
    FOREIGN KEY (Airplane_id)
    REFERENCES Airplane (id);

-- Reference: Flight_Airport (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airport
    FOREIGN KEY (Origin_Airpport)
    REFERENCES Airport (id);

-- Reference: Flight_Airport2 (table: Flight)
ALTER TABLE Flight ADD CONSTRAINT Flight_Airport2
    FOREIGN KEY (Destination_Airport)
    REFERENCES Airport (id);

-- Reference: Flight_Employees_Employee (table: Flight_Employee)
ALTER TABLE Flight_Employee ADD CONSTRAINT Flight_Employees_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee (id);

-- Reference: Flight_Employees_Flight (table: Flight_Employee)
ALTER TABLE Flight_Employee ADD CONSTRAINT Flight_Employees_Flight
    FOREIGN KEY (Flight_id)
    REFERENCES Flight (id);

-- Reference: Flight_Status_Flight (table: Flight_Status)
ALTER TABLE Flight_Status ADD CONSTRAINT Flight_Status_Flight
    FOREIGN KEY (Flight_id)
    REFERENCES Flight (id);

-- Reference: Flight_Status_Status (table: Flight_Status)
ALTER TABLE Flight_Status ADD CONSTRAINT Flight_Status_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);

-- Reference: Passenger_Address (table: Passenger)
ALTER TABLE Passenger ADD CONSTRAINT Passenger_Address
    FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Producer_Address (table: Producer)
ALTER TABLE Producer ADD CONSTRAINT Producer_Address
    FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Table_24_Airplane (table: Airplane_Airport)
ALTER TABLE Airplane_Airport ADD CONSTRAINT Table_24_Airplane
    FOREIGN KEY (Airplane_id)
    REFERENCES Airplane (id);

-- Reference: Table_24_Airport (table: Airplane_Airport)
ALTER TABLE Airplane_Airport ADD CONSTRAINT Table_24_Airport
    FOREIGN KEY (Airport_id)
    REFERENCES Airport (id);

-- Reference: Ticket_Flight (table: Ticket_Booking)
ALTER TABLE Ticket_Booking ADD CONSTRAINT Ticket_Flight
    FOREIGN KEY (Flight_id)
    REFERENCES Flight (id);

-- Reference: Ticket_Passenger (table: Ticket_Booking)
ALTER TABLE Ticket_Booking ADD CONSTRAINT Ticket_Passenger
    FOREIGN KEY (Passenger_id)
    REFERENCES Passenger (id);

-- Reference: Ticket_Travel_Class (table: Ticket_Booking)
ALTER TABLE Ticket_Booking ADD CONSTRAINT Ticket_Travel_Class
    FOREIGN KEY (Travel_Class_id)
    REFERENCES Travel_Class (id);

-- End of file.

