CREATE PROC ViewAllCourseOfAInstructor
@InstructorId int
AS
      BEGIN
	  SELECT InstructorCourse.InstructorCourseID ,InstructorCourse.InstructorID,InstructorCourse.CourseID,InstructorCourse.CourseName,InstructorCourse.CourseDescription FROM ((InstructorCourse INNER JOIN Instructor  ON InstructorCourse.InstructorID=Instructor.InstructorID)INNER JOIN Course   ON InstructorCourse.CourseID=Course.CourseID)
	 WHERE InstructorCourse.InstructorID=@InstructorId
      END