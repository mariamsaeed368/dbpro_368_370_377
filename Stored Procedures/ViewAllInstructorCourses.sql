CREATE PROCEDURE [dbo].[ViewAllInstructorCourses]
@InstructorID int
	AS 
   BEGIN
   SELECT *
   FROM InstructorCourse 
   END