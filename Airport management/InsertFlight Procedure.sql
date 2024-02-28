set serveroutput on;

--A procedure for inserting new flights.
--It expects parameters: the origin airport id and destination airport id.
--It checks if given airports exist. If not it returns error. 
--Also, the flight cannot occur between airports that are in the same city.
--The departure time is the time the procedure got executed 
--and the arrival time is dependent on what airports the flight occurs between.
--The Airplane is the first (smallest id) airplane that currently resides in the origin airport.
--If there is currently no airplane in the origin airport, the flight is suspended 
--the id of the flight is the biggest id in the flight table +1


CREATE OR REPLACE PROCEDURE InsertFlight 
(origin integer, dest integer)
AS 
plane integer;
origintime timestamp;
arrivaltime timestamp;
origincheck number;
arrivecheck number;
nid integer;
BEGIN  
    SELECT COUNT(*) INTO origincheck from airport where origin=id;    
    if origincheck=0 Then
        RAISE_APPLICATION_ERROR(-20100, 'No such Airport: '||origin);
    end if;
    SELECT COUNT(*) INTO arrivecheck from airport where dest=id;   
    if arrivecheck=0 Then
        RAISE_APPLICATION_ERROR(-20100, 'No such Airport: '||dest);   
    end if;
    
    SELECT City_id INTO origincheck from airport where origin=id;
    SELECT City_id INTO arrivecheck from airport where dest=id;  
    if origincheck=arrivecheck Then
        RAISE_APPLICATION_ERROR(-20100, 'The flights do not occur between Airports of the same city');
    end if;
    
    origintime:=SYSTIMESTAMP; 
    if (origin=1 and dest=2) or (origin=2 and dest=1)
    or(origin=3 and dest=4) or (origin=4 and dest=3)
    or(origin=3 and dest=5) or (origin=5 and dest=3)
    or(origin=3 and dest=7) or (origin=7 and dest=3)
    or(origin=4 and dest=6) or (origin=6 and dest=4)
    or(origin=5 and dest=6) or (origin=6 and dest=5)
    or(origin=6 and dest=7) or (origin=7 and dest=6) then
        arrivaltime:=origintime+ interval '30' minute+ interval '1' hour;
    elsif (origin=1 and dest=4) or (origin=4 and dest=1)
    or(origin=2 and dest=5) or (origin=5 and dest=2)
    or(origin=1 and dest=5) or (origin=5 and dest=1)
    or(origin=1 and dest=7) or (origin=7 and dest=1)
    or(origin=2 and dest=3) or (origin=3 and dest=2)
    or(origin=2 and dest=6) or (origin=6 and dest=2)
    or(origin=2 and dest=7) or (origin=7 and dest=2)then
        arrivaltime:=origintime+ interval '30' minute+ interval '9' hour;
    elsif (origin=1 and dest=3) or (origin=3 and dest=1)
    or(origin=1 and dest=6) or (origin=6 and dest=1)
    or(origin=2 and dest=4) or (origin=4 and dest=2)then
        arrivaltime:=origintime+ interval '30' minute+ interval '10' hour;
    elsif (origin=4 and dest=5) or (origin=5 and dest=4)
    or(origin=7 and dest=4) or (origin=4 and dest=7)then
        arrivaltime:=origintime+ interval '2' hour;
    end if;
    
    SELECT min(id) INTO plane from airplane where id=
    (select min(Airplane_id) from Airplane_Airport a1 where Airport_id=origin
    and Airport_Change=(select max(Airport_Change)from Airplane_Airport a2 where a2.Airplane_id=a1.Airplane_id));
    
    if plane IS NULL Then
        RAISE_APPLICATION_ERROR(-20100, 'Flights are currently suspended');
    end if;
    
    select max(id)+1 into nid from flight;
    
    Insert into flight values (nid,origintime,arrivaltime,origin,dest,plane);
    
END; 

EXECUTE InsertFlight(6,2);

select * from Flight;
