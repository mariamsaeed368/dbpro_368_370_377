CREATE PROC ViewAllQuestion
@InstructorCourseId int

AS
DECLARE @InstructorId int;
DECLARE @CourseId int;
SET @InstructorId=(SELECT InstructorCourse.InstructorID FROM Instructor INNER JOIN InstructorCourse ON  Instructor.InstructorID=InstructorCourse.InstructorID   WHERE InstructorCourseID =@InstructorCourseID)
SET @CourseId=(SELECT InstructorCourse.CourseID FROM Course INNER JOIN InstructorCourse ON Course.CourseID=InstructorCourse.CourseID     WHERE  InstructorCourseID=@InstructorCourseID)


      BEGIN
	  SELECT InstructorTest.QuestionID,InstructorTest.Question,InstructorTest.Option1,InstructorTest.Option2,InstructorTest.Option3,InstructorTest.Option4,InstructorTest.CorrectAnswer FROM  InstructorTest INNER JOIN InstructorCourse
	 ON InstructorCourse.InstructorID=InstructorTest.InstructorID AND InstructorCourse.CourseID=InstructorTest.CourseID WHERE InstructorTest.CourseID=@CourseID AND InstructorTest.InstructorID=@InstructorId
      END