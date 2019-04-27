CREATE PROCEDURE [dbo].[ViewInstructorByID]
@InstructorID int
AS 

BEGIN
SELECT * FROM Instructor WHERE InstructorID=@InstructorID

END