CREATE PROCEDURE [dbo].[AddInstructor]
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

   INSERT INTO Instructor(Name,Designation,Salary,UserType,Email,Password)
    VALUES(@Name,@Designation,@Salary,@UserType,@Email,@Password)
  
END