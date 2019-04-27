CREATE PROCEDURE [dbo].[DeleteInstructorCourseByID]
@InstructorCourseID int,
@InstructorID int,
@CourseID int
AS 

BEGIN
 DELETE FROM InstructorTest WHERE InstructorID=@InstructorID AND CourseID=@CourseID
 DELETE FROM InstructorCourse WHERE InstructorCourseID=@InstructorCourseID

END