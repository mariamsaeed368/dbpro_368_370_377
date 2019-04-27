CREATE PROCEDURE [dbo].[DeleteInstructorByID]
@InstructorID int
AS 

BEGIN
 DELETE FROM Instructor WHERE InstructorID=@InstructorID

END