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
-- tables
-- Table: Address
CREATE TABLE Address (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    City_id integer  NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (id)
) ;

-- Table: Airline
CREATE TABLE Airline (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
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
    Airport_Change datetime  NOT NULL,
    CONSTRAINT Airplane_Airport_pk PRIMARY KEY (id)
) ;

-- Table: Airplane_Type
CREATE TABLE Airplane_Type (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    Capacity integer  NOT NULL,
    Producer_id integer  NOT NULL,
    CONSTRAINT Airplane_Type_pk PRIMARY KEY (id)
) ;

-- Table: Airport
CREATE TABLE Airport (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    City_id integer  NOT NULL,
    CONSTRAINT Airport_pk PRIMARY KEY (id)
) ;

-- Table: Baggage
CREATE TABLE Baggage (
    id integer  NOT NULL,
    Weight decimal(38,2)  NOT NULL,
    Ticket_Booking_id integer  NOT NULL,
    CONSTRAINT Baggage_pk PRIMARY KEY (id)
) ;

-- Table: City
CREATE TABLE City (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    Country_id integer  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (id)
) ;

-- Table: Country
CREATE TABLE Country (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (id)
) ;

-- Table: Employee
CREATE TABLE Employee (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    Surname varchar(38)  NOT NULL,
    Contact_Number char(9)  NOT NULL,
    Salary decimal(38,2)  NOT NULL,
    Hire_Date date  NOT NULL,
    Job varchar(38)  NOT NULL,
    Airport_id integer  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (id)
) ;

-- Table: Flight
CREATE TABLE Flight (
    id integer  NOT NULL,
    Departure_Time datetime  NOT NULL,
    Arrival_Time datetime  NOT NULL,
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
    Status_Change datetime  NOT NULL,
    CONSTRAINT Flight_Status_pk PRIMARY KEY (Status_id,Flight_id)
) ;

-- Table: Passenger
CREATE TABLE Passenger (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    Surname varchar(38)  NOT NULL,
    Contact_Number char(9)  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Passenger_pk PRIMARY KEY (id)
) ;

-- Table: Producer
CREATE TABLE Producer (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    Contact_number char(9)  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT Producer_pk PRIMARY KEY (id)
) ;

-- Table: Status
CREATE TABLE Status (
    id integer  NOT NULL,
    Name varchar(38)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;

-- Table: Ticket_Booking
CREATE TABLE Ticket_Booking (
    id integer  NOT NULL,
    price decimal(38,2)  NOT NULL,
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
    Name varchar(38)  NOT NULL,
    Description varchar(100)  NOT NULL,
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

--1
Insert into Country values(1,'Poland');
Insert into Country values(2,'Germany');
Insert into Country values(3,'Canada');
Insert into Country values(4,'United States');
--2
Insert into City values(1,'Warsaw',1);
Insert into City values(2,'Berlin',2);
Insert into City values(3,'New York',4);
Insert into City values(4,'Chicago',4);
Insert into City values(5,'Toronto',3);
--3
Insert into Airport values(1,'Berlin Tegel Airport',2);
Insert into Airport values(2,'Chopin Airport',1);
Insert into Airport values(3,'Toronto Pearson International Airport',5);
Insert into Airport values(4,'Chicago Dupage County Airport',4);
Insert into Airport values(5,'John F. Kennedy International Airport',3);
Insert into Airport values(6,'Buffalo Niagara International Airport',5);
Insert into Airport values(7,'Laguardia Airport',3);
--4
Insert into Address values(1,'Marszalkowska 39',1);
Insert into Address values(2,'Nowy Swiat 21',1);
Insert into Address values(3,'Gitschiner st 10',2);
Insert into Address values(4,'Fulton st 14',3);
Insert into Address values(5,'Manor rd 56',3);
Insert into Address values(6,'Golfdale rd 33',5);
Insert into Address values(7,'800 Rene-Levesque blvd West',5);
Insert into Address values(8,'Al Jerozolimskie 174',1);
Insert into Address values(9,'Lennestrasse 9',2);
Insert into Address values(10,'Fort Lauderdale',4);
Insert into Address values(11,'Cavern Lane 16',2);
Insert into Address values(12,'Shadow Route 145',2);
Insert into Address values(13,'Mount Avenue 82',2);
Insert into Address values(14,'Middle Lane 1',2);
Insert into Address values(15,'Garnet Lane 121',2);
Insert into Address values(16,'Bury Row 22',2);
Insert into Address values(17,'Peace Boulevard 32',2);
Insert into Address values(18,'Union Way 54',2);
Insert into Address values(19,'Heirloom Avenue 172',2);
Insert into Address values(20,'Sugarplum Row 23',1);
Insert into Address values(21,'Oak Route 44',1);
Insert into Address values(22,'Maple Street 78',1);
Insert into Address values(23,'Pine Row 42',1);
Insert into Address values(24,'Beachside Lane 55',1);
Insert into Address values(25,'Star Row 43',5);
Insert into Address values(26,'Vale Way 22',5);
Insert into Address values(27,'Crystal Avenue 21',5);
Insert into Address values(28,'Chapel Way 3',5);
Insert into Address values(29,'Flax Boulevard 4',5);
Insert into Address values(30,'Aurora Row 77',5);
Insert into Address values(31,'Garden Street 24',4);
Insert into Address values(32,'Underwood Route 211',4);
Insert into Address values(33,'Parkview Route 43',4);
Insert into Address values(34,'Ocean Way 62',4);
Insert into Address values(35,'Main Boulevard 81',4);
Insert into Address values(36,'Windmill Route 92',4);
Insert into Address values(37,'Honor Avenue 12',4);
Insert into Address values(38,'Water Boulevard 44',3);
Insert into Address values(39,'Ivory Boulevard 56',3);
Insert into Address values(40,'Commercial Row 72',3);
Insert into Address values(41,'Locust Avenue 99',3);
Insert into Address values(42,'Heirloom Lane 8',3);
Insert into Address values(43,'Ruby Lane 63',5);
Insert into Address values(44,'Timber Boulevard 91',5);
Insert into Address values(45,'Duchess Row 6',5);
Insert into Address values(46,'Oak Avenue 72',5);
Insert into Address values(47,'Fleet Way 71',5);
Insert into Address values(48,'Kings Boulevard 28',5);
Insert into Address values(49,'Beaver Lane 93',5);
Insert into Address values(50,'Chestnut Street 3',5);
Insert into Address values(51,'Commercial Passage 111',3);
Insert into Address values(52,'Vine Avenue 1',3);
Insert into Address values(53,'Angel Lane 54',3);
Insert into Address values(54,'Haven Street 65',3);
Insert into Address values(55,'Providence Street 83',3);
Insert into Address values(56,'Flax Row 20',3);
Insert into Address values(57,'Sycamore Route 84',3);
Insert into Address values(58,'Merchant Passage 98',1);
Insert into Address values(59,'Luna Lane 10',1);
Insert into Address values(60,'Manor Street 18',1);
Insert into Address values(61,'Feathers Row 58',1);
Insert into Address values(62,'Coastline Lane 36',1);
Insert into Address values(63,'Broad Boulevard 76',2);
Insert into Address values(64,'Dew Street 5',2);
Insert into Address values(65,'Frost Way 4',2);
Insert into Address values(66,'Aviation Route 54',2);
Insert into Address values(67,'Hind Lane 97',3);
Insert into Address values(68,'Grand Row 68',3);
Insert into Address values(69,'Senna Way 90',3);
Insert into Address values(70,'Flax Way 69',3);
Insert into Address values(71,'Juniper Lane 21',4);
Insert into Address values(72,'Sycamore Way 25',4);
Insert into Address values(73,'Mandarin Lane 58',4);
Insert into Address values(74,'Prospect Lane 11',4);
Insert into Address values(75,'Grand Street 95',5);
Insert into Address values(76,'Olive Street 72',5);
Insert into Address values(77,'Poplar Boulevard 30',5);
--5
Insert into Airline values(1,'LOT Polish Airlines');
Insert into Airline values(2,'Lufthansa');
Insert into Airline values(3,'Delta');
Insert into Airline values(4,'Air Canada');
--6
Insert into Producer values(1,'Bombardier Inc.','514855850',7);
Insert into Producer values(2,'Lagard?re','225723200',8);
Insert into Producer values(3,'Boeing','312544200',9);
Insert into Producer values(4,'Embraer','123927279',10);
--7
Insert into Airplane_Type values(1,'Bombardier CRJ-200',52,1);
Insert into Airplane_Type values(2,'Airbus A330',293,2);
Insert into Airplane_Type values(3,'Boeing 747',416,3);
Insert into Airplane_Type values(4,'Embraer 195',132,4);
--8
Insert into Airplane values(1,23045,1,1);
Insert into Airplane values(2,43563,2,1);
Insert into Airplane values(3,62626,3,2);
Insert into Airplane values(4,44322,4,2);
Insert into Airplane values(5,7281,4,2);
Insert into Airplane values(6,92837,2,3);
Insert into Airplane values(7,33234,3,4);
Insert into Airplane values(8,2736,1,4);
--9
Insert into Travel_Class values(1,'First Class','Generally the most expensive and most comfortable accommodations available.');
Insert into Travel_Class values(2,'Business Class','Traditionally purchased by business travelers (sometimes called executive class)');
Insert into Travel_Class values(3,'Economy Class','basic accommodation, commonly purchased by leisure travelers');
--10
Insert into Passenger values(1,'Alan','Corner','213777182',58);
Insert into Passenger values(2,'Molly','Melanie','987562374',59);
Insert into Passenger values(3,'Keith','Johnson','657449265',60);
Insert into Passenger values(4,'Kevin','Smart','448666721',61);
Insert into Passenger values(5,'Jerome','Burke','211356915',62);
Insert into Passenger values(6,'Tanya','Hughes','452657844',63);
Insert into Passenger values(7,'Dale','Sullivan','456527422',64);
Insert into Passenger values(8,'Misty','Harvey','455626028',65);
Insert into Passenger values(9,'Alan','Waters','452711629',66);
Insert into Passenger values(10,'Jenny','Glover','504492243',67);
Insert into Passenger values(11,'Dennis','Jones','212161410',68);
Insert into Passenger values(12,'Randal','Underwood','212004827',69);
Insert into Passenger values(13,'Bryan','Newton','515613057',70);
Insert into Passenger values(14,'Henrietta','Wagner','602174571',71);
Insert into Passenger values(15,'Lana','Smith','572576878',72);
Insert into Passenger values(16,'Kathleen','Romero','451748872',73);
Insert into Passenger values(17,'Raul','Mendez','212160827',74);
Insert into Passenger values(18,'Clinton','Brock','451226766',75);
Insert into Passenger values(19,'Joshua','Lyons','725497522',76);
Insert into Passenger values(20,'Dawn','Graves','212280715',77);
--11
Insert into Employee values(1,'Erica','Bridges','212465259',20000,'2015-12-17','Pilot',1,11);
Insert into Employee values(2,'Kim','Underwood','457086909',40000,'2014-09-22','Pilot',1,12);
Insert into Employee values(3,'Luke','Gibbs','453227136',35000,'2015-10-20','Pilot',1,13);
Insert into Employee values(4,'Ronald','Pierce','535364701',5000,'2001-05-17','Steward',1,14);
Insert into Employee values(5,'Edwin','Blair','211323575',4000,'2009-05-18','Steward',1,15);
Insert into Employee values(6,'Anne','Phillips','459294716',4500,'2020-01-17','Steward',1,16);
Insert into Employee values(7,'Albert','Webb','571788088',50000,'2003-04-17','Manager',1,17);
Insert into Employee values(8,'Natalie','Dennis','212181920',5000,'2019-11-05','Technician',1,18);
Insert into Employee values(9,'Erica','Owens','458766639',6000,'2016-04-25','Technician',1,19);
Insert into Employee values(10,'Isabel','Graves','459030622',55000,'2016-04-08','Pilot',2,20);
Insert into Employee values(11,'Miriam','Mitchell','669044429',45000,'2016-04-08','Pilot',2,21);
Insert into Employee values(12,'Jeannie','Chapman','124920331',5000,'2016-04-08','Steward',2,22);
Insert into Employee values(13,'Carmen','Schultz','453045227',3000,'2016-04-08','Technician',2,23);
Insert into Employee values(14,'Jay','Weber','607236935',4000,'2016-04-08','Technician',2,24);
Insert into Employee values(15,'Gustavo','Tate','212023720',40000,'2002-08-19','Pilot',3,25);--
Insert into Employee values(16,'Harry','Joseph','505330418',3000,'2003-07-02','Steward',3,25);
Insert into Employee values(17,'Terry','Cooper','212443113',3500,'2006-12-22','Steward',3,26);
Insert into Employee values(18,'Kirk','Burgess','452734589',5000,'2009-03-02','Steward',3,27);
Insert into Employee values(19,'Hattie','Bradley','660339970',400000,'2014-01-09','Manager',3,28);
Insert into Employee values(20,'Susie','Bowen','452129244',4000,'2016-08-19','Technician',3,29);
Insert into Employee values(21,'Diana','Todd','212131731',5500,'2017-08-24','Technician',3,30);
Insert into Employee values(22,'Jodi','Pope','211408328',50000,'2001-09-25','Pilot',4,31);
Insert into Employee values(23,'Rudy','Jenkins','212142805',54000,'2015-03-24','Pilot',4,32);
Insert into Employee values(24,'Jessie','Houston','211337218',4650,'2006-09-19','Steward',4,33);
Insert into Employee values(25,'Randal','Reese','503344980',3400,'2018-03-16','Steward',4,34);
Insert into Employee values(26,'Lionel','Reynolds','451786918',55000,'2002-07-01','Manager',4,35);
Insert into Employee values(27,'Heather','Stevens','211341526',3300,'2021-12-01','Technician',4,36);
Insert into Employee values(28,'Dennis','Glover','695057587',6000,'2013-03-07','Technician',4,37);
Insert into Employee values(29,'Blanca','Parker','211345379',47000,'2006-08-14','Pilot',5,38);
Insert into Employee values(30,'Lucia','Mendez','212476007',48500,'2007-03-08','Pilot',5,39);
Insert into Employee values(31,'Sean','Simmons','455712775',3000,'2014-03-06','Steward',5,40);
Insert into Employee values(32,'Terrence','Franklin','456798789',38000,'2015-10-27','Manager',5,41);
Insert into Employee values(33,'Patty','Townsend','693659131',8000,'2014-03-06','Technician',5,42);
Insert into Employee values(34,'Mike','Horton','510722477',50000,'2004-03-03','Pilot',6,43);
Insert into Employee values(35,'Wilbur','Floyd','211341842',52000,'2002-10-03','Pilot',6,44);
Insert into Employee values(36,'Megan','Hunter','453558479',4000,'2009-10-15','Steward',6,45);
Insert into Employee values(37,'Miguel','Luna','725369373',3500,'2009-09-14','Steward',6,46);
Insert into Employee values(38,'Josh','Lowe','604871475',2000,'2010-07-13','Steward',6,47);
Insert into Employee values(39,'Travis','Fuller','454523301',55000,'2005-06-09','Manager',6,48);
Insert into Employee values(40,'Pedro','Gibson','578012905',7000,'2008-12-04','Technician',6,49);
Insert into Employee values(41,'Jimminy','Tricket','666362752',4500,'2018-06-11','Technician',6,50);
Insert into Employee values(42,'Joanne','Diaz','738239231',65000,'2010-03-13','Pilot',7,51);
Insert into Employee values(43,'Sylvia','Rowe','451744184',5200,'2013-05-08','Steward',7,52);
Insert into Employee values(44,'Orlando','Munoz','456478615',5000,'2004-11-17','Steward',7,53);
Insert into Employee values(45,'Frederick','Watts','212289683',59000,'2013-11-08','Manager',7,54);
Insert into Employee values(46,'Alyssa','Brady','880820512',3500,'2007-07-30','Technician',7,55);
Insert into Employee values(47,'Kenneth','Welch','211540680',4800,'2016-12-15','Technician',7,56);
Insert into Employee values(48,'Sylvester','Mckinney','457498834',4000,'2005-07-05','Technician',7,57);
--12
Insert into Status values(1,'waiting');
Insert into Status values(2,'in progress');
Insert into Status values(3,'arrived');
--13
Insert into Flight values(1,'2022-10-17 23:52:42','2022-10-18 05:33:12',1,2,1);
Insert into Flight values(2,'2022-04-17 20:09:48','2022-04-18 10:42:26',3,1,2);
Insert into Flight values(3,'2022-12-28 14:14:06','2022-12-29 01:35:17',2,4,3);
Insert into Flight values(4,'2022-03-30 16:39:59','2022-03-31 03:46:09',7,6,4);
Insert into Flight values(5,'2022-04-02 06:10:08','2022-04-02 09:20:54',5,3,5);
Insert into Flight values(6,'2022-01-25 07:15:58','2022-01-25 23:00:11',4,5,6);
Insert into Flight values(7,'2022-06-25 19:01:19','2022-06-26 12:15:14',6,1,7);
Insert into Flight values(8,'2022-05-24 05:06:23','2022-05-24 22:57:31',4,3,8);
Insert into Flight values(9,'2022-01-03 11:23:29','2022-01-04 02:32:44',6,2,4);
Insert into Flight values(10,'2022-11-17 18:00:53','2022-11-18 18:06:39',2,7,5);
Insert into Flight values(11,'2022-12-19 19:10:57','2022-12-20 01:08:46',1,2,2);
--14
Insert into Airplane_Airport values(1,1,1,'2022-10-17 23:52:42');
Insert into Airplane_Airport values(2,1,2,'2022-10-18 05:33:12');
Insert into Airplane_Airport values(3,2,3,'2022-04-17 20:09:48');
Insert into Airplane_Airport values(4,2,1,'2022-04-18 10:42:26');
Insert into Airplane_Airport values(5,3,2,'2022-12-28 14:14:06');
Insert into Airplane_Airport values(6,3,4,'2022-12-29 01:35:17');
Insert into Airplane_Airport values(7,4,7,'2022-03-30 16:39:59');
Insert into Airplane_Airport values(8,4,6,'2022-03-31 03:46:09');
Insert into Airplane_Airport values(9,5,5,'2022-04-02 06:10:08');
Insert into Airplane_Airport values(10,5,3,'2022-04-02 09:20:54');
Insert into Airplane_Airport values(11,6,4,'2022-01-25 07:15:58');
Insert into Airplane_Airport values(12,6,5,'2022-01-25 23:00:11');
Insert into Airplane_Airport values(13,7,6,'2022-06-25 19:01:19');
Insert into Airplane_Airport values(14,7,1,'2022-06-26 12:15:14');
Insert into Airplane_Airport values(15,8,4,'2022-05-24 05:06:23');
Insert into Airplane_Airport values(16,8,3,'2022-05-24 22:57:31');
Insert into Airplane_Airport values(17,4,2,'2022-01-04 02:32:44');
Insert into Airplane_Airport values(18,1,7,'2022-11-18 18:06:39');
Insert into Airplane_Airport values(19,2,2,'2022-12-20 01:08:46');
--15
Insert into Flight_Status values(1,1,'2022-10-17 23:52:42');
Insert into Flight_Status values(1,2,'2022-10-17 23:59:00');
Insert into Flight_Status values(1,3,'2022-10-18 05:33:12');
Insert into Flight_Status values(2,1,'2022-04-17 20:09:48');
Insert into Flight_Status values(2,2,'2022-04-17 20:10:32');
Insert into Flight_Status values(2,3,'2022-04-18 10:42:26');
Insert into Flight_Status values(3,1,'2022-12-28 14:14:06');
Insert into Flight_Status values(3,2,'2022-12-28 14:17:53');
Insert into Flight_Status values(3,3,'2022-12-29 01:35:17');
Insert into Flight_Status values(4,1,'2022-03-30 16:39:59');
Insert into Flight_Status values(4,2,'2022-03-30 16:45:04');
Insert into Flight_Status values(4,3,'2022-03-31 03:46:09');
Insert into Flight_Status values(5,1,'2022-04-02 06:10:08');
Insert into Flight_Status values(5,2,'2022-04-02 06:12:46');
Insert into Flight_Status values(5,3,'2022-04-02 09:20:54');
Insert into Flight_Status values(6,1,'2022-01-25 07:15:58');
Insert into Flight_Status values(6,2,'2022-01-25 07:19:23');
Insert into Flight_Status values(6,3,'2022-01-25 23:00:11');
Insert into Flight_Status values(7,1,'2022-06-25 19:01:19');
Insert into Flight_Status values(7,2,'2022-06-25 19:15:58');
Insert into Flight_Status values(7,3,'2022-06-26 12:15:14');
Insert into Flight_Status values(8,1,'2022-05-24 05:06:23');
Insert into Flight_Status values(8,2,'2022-05-24 05:35:00');
Insert into Flight_Status values(8,3,'2022-05-24 22:57:31');
Insert into Flight_Status values(9,1,'2022-01-03 11:23:29');
Insert into Flight_Status values(9,2,'2022-01-03 11:30:16');
Insert into Flight_Status values(9,3,'2022-01-04 02:32:44');
Insert into Flight_Status values(10,1,'2022-11-17 18:00:53');
Insert into Flight_Status values(10,2,'2022-11-17 19:02:27');
Insert into Flight_Status values(10,3,'2022-11-18 18:06:39');
Insert into Flight_Status values(11,1,'2022-12-19 19:10:57');
Insert into Flight_Status values(11,2,'2022-12-19 19:11:30');
Insert into Flight_Status values(11,3,'2022-12-20 01:08:46');
--16
Insert into Flight_Employee values(1,1);
Insert into Flight_Employee values(1,2);
Insert into Flight_Employee values(1,4);
Insert into Flight_Employee values(1,5);
Insert into Flight_Employee values(1,6);
Insert into Flight_Employee values(2,15);
Insert into Flight_Employee values(2,16);
Insert into Flight_Employee values(2,17);
Insert into Flight_Employee values(2,18);
Insert into Flight_Employee values(3,10);
Insert into Flight_Employee values(3,11);
Insert into Flight_Employee values(3,12);
Insert into Flight_Employee values(4,42);
Insert into Flight_Employee values(4,43);
Insert into Flight_Employee values(4,44);
Insert into Flight_Employee values(5,29);
Insert into Flight_Employee values(5,30);
Insert into Flight_Employee values(5,31);
Insert into Flight_Employee values(6,22);
Insert into Flight_Employee values(6,23);
Insert into Flight_Employee values(6,24);
Insert into Flight_Employee values(6,25);
Insert into Flight_Employee values(7,34);
Insert into Flight_Employee values(7,35);
Insert into Flight_Employee values(7,36);
Insert into Flight_Employee values(7,37);
Insert into Flight_Employee values(7,38);
Insert into Flight_Employee values(8,22);
Insert into Flight_Employee values(8,23);
Insert into Flight_Employee values(8,24);
Insert into Flight_Employee values(8,25);
Insert into Flight_Employee values(9,42);
Insert into Flight_Employee values(9,43);
Insert into Flight_Employee values(9,44);
Insert into Flight_Employee values(10,10);
Insert into Flight_Employee values(10,11);
Insert into Flight_Employee values(10,12);
Insert into Flight_Employee values(11,1);
Insert into Flight_Employee values(11,2);
Insert into Flight_Employee values(11,4);
--17
Insert into Ticket_Booking values(1,200,1,'2022-08-12',6,1,3);
Insert into Ticket_Booking values(2,358,2,'2022-07-24',7,1,2);
Insert into Ticket_Booking values(3,462,3,'2022-09-06',8,1,1);
Insert into Ticket_Booking values(4,234,1,'2022-03-09',18,2,3);
Insert into Ticket_Booking values(5,389,2,'2022-04-02',19,2,2);
Insert into Ticket_Booking values(6,253,3,'2022-01-29',20,2,3);
Insert into Ticket_Booking values(7,420,1,'2022-06-30',4,3,1);
Insert into Ticket_Booking values(8,268,2,'2022-11-13',5,3,3);
Insert into Ticket_Booking values(9,330,3,'2022-09-28',2,3,2);
Insert into Ticket_Booking values(10,400,1,'2022-02-10',10,4,1);
Insert into Ticket_Booking values(11,300,2,'2022-03-01',11,4,2);
Insert into Ticket_Booking values(12,418,3,'2021-12-27',12,4,1);
Insert into Ticket_Booking values(13,367,1,'2022-03-11',13,5,1);
Insert into Ticket_Booking values(14,462,2,'2022-02-27',11,5,1);
Insert into Ticket_Booking values(15,344,3,'2022-03-03',12,5,1);
Insert into Ticket_Booking values(16,354,1,'2022-01-10',15,6,1);
Insert into Ticket_Booking values(17,273,2,'2021-11-30',14,6,2);
Insert into Ticket_Booking values(18,489,3,'2021-12-24',16,6,1);
Insert into Ticket_Booking values(19,221,1,'2022-04-16',18,7,3);
Insert into Ticket_Booking values(20,230,2,'2022-03-28',19,7,3);
Insert into Ticket_Booking values(21,398,3,'2022-05-05',20,7,1);
Insert into Ticket_Booking values(22,300,1,'2022-05-13',17,8,2);
Insert into Ticket_Booking values(23,291,2,'2022-02-26',16,8,2);
Insert into Ticket_Booking values(24,382,3,'2022-03-19',14,8,2);
Insert into Ticket_Booking values(25,417,1,'2021-11-23',18,9,1);
Insert into Ticket_Booking values(26,200,2,'2021-09-08',19,9,3);
Insert into Ticket_Booking values(27,350,3,'2021-10-27',20,9,1);
Insert into Ticket_Booking values(28,228,1,'2022-11-10',1,10,3);
Insert into Ticket_Booking values(29,250,2,'2022-10-25',3,10,3);
Insert into Ticket_Booking values(30,228,3,'2022-10-22',2,10,3);
--18
Insert into Baggage values(1,14,1);
Insert into Baggage values(2,5,2);
Insert into Baggage values(3,22,2);
Insert into Baggage values(4,19,3);
Insert into Baggage values(5,2,4);
Insert into Baggage values(6,11,5);
Insert into Baggage values(7,8,5);
Insert into Baggage values(8,1,5);
Insert into Baggage values(9,23,6);
Insert into Baggage values(10,19,7);
Insert into Baggage values(11,13,8);
Insert into Baggage values(12,5,9);
Insert into Baggage values(13,10,10);
Insert into Baggage values(14,6,11);
Insert into Baggage values(15,15,12);
Insert into Baggage values(16,9,13);
Insert into Baggage values(17,3,14);
Insert into Baggage values(18,12,14);
Insert into Baggage values(19,14,15);
Insert into Baggage values(20,24,16);
Insert into Baggage values(21,7,17);
Insert into Baggage values(22,17,18);
Insert into Baggage values(23,16,19);
Insert into Baggage values(24,21,20);
Insert into Baggage values(25,25,21);
Insert into Baggage values(26,23,22);
Insert into Baggage values(27,13,23);
Insert into Baggage values(28,8,23);
Insert into Baggage values(29,21,24);
Insert into Baggage values(30,3,25);
Insert into Baggage values(31,20,25);
Insert into Baggage values(32,18,26);
Insert into Baggage values(33,25,27);
Insert into Baggage values(34,10,28);
Insert into Baggage values(35,24,29);
Insert into Baggage values(36,22,30);