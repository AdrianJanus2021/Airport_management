--the Procedure creating new Airplane of the type that has the least Airplanes
--(in case of many different types having the same lowest amount of airplanes, 
--we choose the one with the highest id number)
--The airline is given in the parameters. If no such airline exist, an error appears;
--the model number is the biggest model number of the plane of the found type +1;
--the id is the max id of all airplanes +1;

Alter PROCEDURE NewAirplane
@airline INT
AS 
BEGIN
	DECLARE @typeN1 INT,@typeN INT, @typ1 INT,@typ INT, @modelN INT, @idN INT;
	DECLARE typecursor1 CURSOR FOR SELECT count(id),Airplane_Type_id 
					FROM Airplane
					group by Airplane_Type_id;

	If NOT EXISTS(Select id from Airline where id=@airline)
	BEGIN
	ROLLBACK;
	RAISERROR ('NO such Airline', 1, 2); 
	END;

	SELECT @typeN1=count(id), @typ1=Airplane_Type_id
					FROM Airplane
					group by Airplane_Type_id
					order by count(id);
	OPEN typecursor1;    
	FETCH NEXT FROM typecursor1 INTO @typeN, @typ;
		WHILE @@Fetch_status = 0
		BEGIN
		IF @typeN<@typeN1 
		BEGIN
			set @typeN1=@typeN;
			set @typ1=@typ;
		END;
		IF @typeN=@typeN1 
		BEGIN
			IF @typ>@typ1 
			BEGIN
				set @typeN1=@typeN;
				set @typ1=@typ;
			END;
		END;
		FETCH NEXT FROM typecursor1 INTO @typeN, @typ;
		END;
	CLOSE typecursor1;
	DEALLOCATE typecursor1;

	select @modelN=max(Model_Number)+1 from Airplane where Airplane_Type_id=@typ1;
	select @idN=max(id)+1 from Airplane;

	Insert into Airplane values(@idN,@modelN,@airline,@typ1);

END;

EXEC NewAirplane 4;
EXEC NewAirplane 12;

select * from Airplane;

delete from Airplane where id=9; 

