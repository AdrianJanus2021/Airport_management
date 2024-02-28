--The Trigger preventing more than 2 pilots being assigned to a flight
--Also prevents assigning employees to a flight, with job different from Steward and pilot.
--You cannot assign an employee to the flight that doesn't work at the origin airport

CREATE OR REPLACE TRIGGER FlightEmployees
BEFORE INSERT 
ON Flight_Employee
FOR EACH ROW
DECLARE
n number;
njob VARCHAR2(38);
addrA integer;
addrE integer;
nemps number;
BEGIN
    IF INSERTING THEN
       select count(:new.Employee_id) into n from Flight_Employee 
       where Flight_id=:new.Flight_id
       and Employee_id=(select id
                        from Employee
                        where id=Employee_id and Job='Pilot');
                        
       select Job into njob from Employee
       where id=:new.Employee_id;
       
       select id into addrE from City
       where id=(select City_id
                from Address
                where id=(select Address_id
                            from Employee
                            where :new.Employee_id=id));
       select id into addrA from City
       where id=(select City_id
                from Airport
                where id=(select Origin_Airpport
                            from Flight
                            where :new.Flight_id=id));
       
       IF n=2 and njob='Pilot' then
            RAISE_APPLICATION_ERROR(-20100, 'There cannot be more than two pilots on one flight');
       ELSIF njob!='Pilot' and njob!='Steward' then
            RAISE_APPLICATION_ERROR(-20100, 'There cannot be an employee of this proffesion on the flight');
       ELSIF addrA!=addrE then
            RAISE_APPLICATION_ERROR(-20100, 'Employee has to come from the city of the Origin Airport');
       END IF;
    END IF;
END;

Insert into Flight_Employee values(11,5);
Insert into Flight_Employee values(11,3);-->2 pilots check
Insert into Flight_Employee values(11,7);--wrong job check
Insert into Flight_Employee values(11,12);--wrong location


DELETE FROM Flight_Employee WHERE Flight_id=11 and Employee_id=5;