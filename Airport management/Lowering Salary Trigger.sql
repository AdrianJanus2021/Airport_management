--A trigger preventing lowering of salary of technician 
--if they have the lowest salary throughout all technician coming from the Airport that has the least employees.
create TRIGGER PreventTechnician ON Employee
FOR UPDATE
AS
BEGIN
	DECLARE @empid INT, @minemps INT, @portid INT, @emps INT,@minsal DECIMAL(38,2),@oldsal DECIMAL(38,2),@newsal DECIMAL(38,2);

	IF (select job from inserted)='Technician'
	BEGIN
		SELECT @minemps=count(id) from Employee group by Airport_id order by count(id) desc;
		SELECT @oldsal=Salary from deleted;
		SELECT @newsal=Salary from inserted;

		set @empid=(select id from inserted);
		set @portid=(select Airport_id from inserted);
		
		SET @emps=(SELECT count(id) from Employee where Airport_id=@portid);
		IF @emps=@minemps
		BEGIN
			SET @minsal=(SELECT min(Salary) from Employee where Job='Technician' and id!=@empid);

			IF @minsal>@oldsal
			BEGIN
				set @minsal=@oldsal;
			END;
				
			IF @oldsal=@minsal and @newsal<@oldsal
			BEGIN
				ROLLBACK;
				Raiserror ('Cannot lower the salary of this Employee', 1, 2);
			END;
		END;
	END;
END;

UPDATE Employee SET Salary = 4000 where id=12 ;--lowering steward
UPDATE Employee SET Salary = 6000 where id=12 ;--raising steward
UPDATE Employee SET Salary = 4000 where id=11 ;--lowering pilot
UPDATE Employee SET Salary = 2000 where id=41 ;--lowering technician on airport that doesn't have the lowest count of employees
UPDATE Employee SET Salary = 2000 where id=14 ;--lowering technician (not yet the lowest salary) on lowest count airport
UPDATE Employee SET Salary = 1000 where id=14 ;--lowering technician again

select * from Employee where id=13;
select * from Employee where id=14;
select * from Employee;

