CREATE PROCEDURE [dbo].[EditInstructor]
@InstructorID int,
@Name nvarchar(50),
@Designation nvarchar(50),
@Salary float,

@Email nvarchar(50),
@Password nvarchar(50)
AS 
DECLARE @UserType nchar(10);

SET @UserType='I'
BEGIN
IF(@InstructorID>0)
   BEGIN
    UPDATE Instructor SET Name=@Name,Designation=@Designation,Salary=@Salary,UserType=@UserType,Email=@Email,Password=@Password
	WHERE InstructorID=@InstructorID
	 END
 END