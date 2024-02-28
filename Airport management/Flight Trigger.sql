--the Trigger, that after new flight is created it inserts the needed update to in which airport the airplane 
--will be situated in after the flight (inserting new entry to table Airplane_Airport), as well 
--keeping track of statuses of this flight (inserting proper values to Flight_Status table)
--the flight is "waiting" at the departure time
--it is "in progress" after 10 minutes of planned departure time
--it is "arrived" at the arrival time

CREATE OR REPLACE TRIGGER FlightTrigger
AFTER INSERT
ON Flight 
FOR EACH ROW
DECLARE
nid integer;
nid2 integer;
ntime timestamp;
CURSOR Stats IS SELECT id FROM Status;
BEGIN
    Select max(id)+1 into nid from Airplane_Airport;
    --updating airplane_Airport table
    Insert into Airplane_Airport 
    values(nid,
           :new.Airplane_id,
           :new.Destination_Airport,
           :new.Arrival_Time);
    --updating flight status table
    nid:=:new.id;
    OPEN Stats;
    LOOP
        FETCH Stats INTO nid2;
        EXIT WHEN Stats%NOTFOUND;
        IF nid2=1 THEN
            ntime:=:new.Departure_Time;
        ELSIF nid2=2 THEN
            ntime:=:new.Departure_Time+interval '10' minute;
        ELSIF nid2=3 THEN
            ntime:=:new.Arrival_Time; 
        END IF;
        Insert into Flight_Status 
        values(nid,nid2,ntime);
    END LOOP;
    CLOSE Stats;
END;


Insert into Flight values(13,'2022-12-31 02:22:57','2022-12-31 10:27:46',6,2,2);

SELECT * FROM Flight;
SELECT * FROM Airplane_Airport;
SELECT *FROM FLIGHT_STATUS;