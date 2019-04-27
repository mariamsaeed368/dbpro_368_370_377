CREATE PROCEDURE [dbo].[DeleteQuestionByID]
@QuestionID int,
@InstructorCourseID int
AS 
DECLARE @CourseID int;
DECLARE @InstructorID int;
SET @InstructorId=(SELECT InstructorCourse.InstructorID FROM Instructor INNER JOIN InstructorCourse ON  Instructor.InstructorID=InstructorCourse.InstructorID   WHERE InstructorCourseID =@InstructorCourseID)
SET @CourseId=(SELECT InstructorCourse.CourseID FROM Course INNER JOIN InstructorCourse ON Course.CourseID=InstructorCourse.CourseID     WHERE  InstructorCourseID=@InstructorCourseID)
BEGIN
 DELETE FROM InstructorTest WHERE QuestionID=@QuestionID AND CourseID=@CourseID AND InstructorID=@InstructorID

END