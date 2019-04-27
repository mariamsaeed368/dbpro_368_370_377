CREATE PROCEDURE [dbo].[DeleteInstructorCByID]
@InstructorID int,
@CourseID int

AS 

BEGIN
 DELETE FROM InstructorTest WHERE InstructorID=@InstructorID
 DELETE FROM InstructorCourse WHERE InstructorID=@InstructorID

END