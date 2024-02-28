--A Trigger that after a new Airplane is created it assigns it to the Airport
--that has the least Airplanes currently.
--If more than one airport has the least airports we choose the one 
--that had the least airplanes for the longest time (last assigned plane was assigned to it the earliest)
--the time of assigning the airplane to the Airport is the current computer time

ALTER TRIGGER trigPlanePort ON Airplane
FOR INSERT
AS
BEGIN
	DECLARE curPlane CURSOR FOR SELECT distinct Airport_id FROM Airplane_Airport;
	DECLARE curPlane3 CURSOR FOR SELECT Airplane_id,Airport_id, Airport_Change FROM Airplane_Airport;
	DECLARE @portid1 INT,@plane2 INT,@portid2 INT, @change2 DATETIME,@n INT,@min INT, @minport INT, @d1 DATETIME,@d2 DATETIME,@idN INT,@newPlane INT;

	select @min=count(Airplane_id) from Airplane_Airport;
	select @minport=Airport_id from Airplane_Airport;
	OPEN curPlane;    
	FETCH NEXT FROM curPlane INTO @portid1;
	WHILE @@Fetch_status = 0
		BEGIN
		set @n=0;
			OPEN curPlane3;    
			FETCH NEXT FROM curPlane3 INTO @plane2,@portid2, @change2;
			WHILE @@Fetch_status = 0
					BEGIN
					IF @portid1=@portid2
					BEGIN
						If @change2=(Select max(Airport_Change) from Airplane_Airport where Airplane_id=@plane2)
							BEGIN
							set @n=@n+1;
							END;
					END;
					FETCH NEXT FROM curPlane3 INTO @plane2,@portid2, @change2;
					END;
			CLOSE curPlane3;

			IF @min>@n
			BEGIN	
				set @min=@n;
				set @minport=@portid1
			END;
			IF @min=@n
			BEGIN
				select @d1=max(Airport_Change) from Airplane_Airport where Airport_id=@minport;
				select @d2=max(Airport_Change) from Airplane_Airport where Airport_id=@portid1;
				IF @d1>@d2
				BEGIN	
					set @min=@n;
					set @minport=@portid1
				END;
			END;
		FETCH NEXT FROM curPlane INTO @portid1;
		END;
	CLOSE curPlane;
	DEALLOCATE curPlane;
	DEALLOCATE curPlane3;

	select @idN=max(id)+1 from Airplane_Airport;
	select @newPlane=id from inserted;

	INSERT INTO Airplane_Airport values(@idN, @newPlane,@minport,SYSDATETIME());

END;

Insert into Airplane values(9,92838,4,3);
delete from Airplane where id=9; 

select * from Airplane;
select * from Airplane_Airport;
