--Procedure giving a raise of salary  to the Pilots that have been on the most flights.
--new salary is calculated by adding to the current salary 10% of all tickets sold on those flights.
--If there is more than one pilot that have been on the same amount of flights as the max value, they also get a rise
--(more than one pilot can get a rise)
--If the max value is 1 or 0 noone gets a raise.

ALTER PROCEDURE PilotsRaise
AS 
BEGIN
	DECLARE @pilot INT,@pilotflight INT,@n INT,@n1 INT, @fullprice Decimal(38,2), @p Decimal(38,2), @fid int;
	DECLARE flightprices CURSOR FOR SELECT Flight_id, price from Ticket_Booking;
	DECLARE pilots CURSOR FOR SELECT distinct Employee_id from Flight_Employee where Employee_id=(select id from Employee where id=Employee_id and Job='Pilot');

	SELECT @n=count(Flight_id) FROM Flight_Employee 
	group by Employee_id
	having Employee_id=(select id from Employee where id=Employee_id and Job='Pilot')
	order by count(Flight_id);

	if @n>1
	BEGIN
		OPEN pilots;
		FETCH NEXT FROM pilots INTO @pilot;
			WHILE @@Fetch_status = 0
				BEGIN
					--PRINT CONVERT(VARCHAR, @pilot);
					SELECT @n1=count(Flight_id) FROM Flight_Employee 
					group by Employee_id
					having Employee_id=@pilot;

					SET @fullprice=0;

					if @n1=@n
					BEGIN
						OPEN flightprices;   
						FETCH NEXT FROM flightprices INTO @fid, @p;
							WHILE @@Fetch_status = 0
							BEGIN
								IF EXISTS (select 1 from Flight_Employee where @fid=Flight_id and @pilot=Employee_id)
								BEGIN
									SET @fullprice=@fullprice+@p;
								END;
							FETCH NEXT FROM flightprices INTO @fid, @p;
							END;
						CLOSE flightprices;
						UPDATE Employee SET Salary =Salary+@fullprice*0.1 WHERE id=@pilot;
					END;
				FETCH NEXT FROM pilots INTO @pilot;
				END;
		CLOSE pilots;
		DEALLOCATE flightprices;
		DEALLOCATE pilots;
	END;
END;

EXEC PilotsRaise;

select * from Employee;