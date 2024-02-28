set serveroutput on;

--Procedure displaying the total baggage weight on each flight.

CREATE OR REPLACE PROCEDURE FlightWeight
AS 
fid INTEGER;
fid2 INTEGER;
pid INTEGER;
w number;
sumw number;
CURSOR Cur IS SELECT id FROM Flight;
CURSOR Cur2 IS SELECT Flight_id,id FROM Ticket_Booking;
BEGIN
    OPEN Cur;    
    LOOP
        FETCH Cur INTO fid;
        EXIT WHEN Cur%NOTFOUND;
        sumw:=0;
        OPEN Cur2;
        LOOP
            FETCH Cur2 INTO fid2,pid;
            EXIT WHEN Cur2%NOTFOUND;
            IF fid=fid2 then
                SELECT NVL(SUM(Weight),0) into w from Baggage where Ticket_Booking_id=pid;
                sumw:=sumw+w;
            END IF;
        END LOOP;
        CLOSE Cur2;
        dbms_output.put_line('flight: '||fid ||', Baggage weight: '|| sumw );
    END LOOP;
    CLOSE Cur;
END;

execute FlightWeight;

