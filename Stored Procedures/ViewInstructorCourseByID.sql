CREATE PROCEDURE [dbo].[ViewInstructorCourseByID]
@InstructorCourseID int
AS 

BEGIN
SELECT * FROM InstructorCourse WHERE InstructorCourseID=@InstructorCourseID

END