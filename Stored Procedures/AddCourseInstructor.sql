CREATE PROCEDURE [dbo].[AddCourseInstructor]
@InstructorCourseID int,
@InstructorID int,

@CourseName nvarchar(50)

AS 
DECLARE @CourseDescription nvarchar(50);
DECLARE @CourseID int;
SET @CourseDescription=(SELECT CourseDescription FROM Course WHERE CourseName=@CourseName);
SET @CourseID=(SELECT CourseID FROM Course WHERE CourseName=@CourseName);
BEGIN
   INSERT INTO InstructorCourse(InstructorID,CourseID,CourseName,CourseDescription)
    VALUES(@InstructorID,@CourseID,@CourseName,@CourseDescription)
	
END