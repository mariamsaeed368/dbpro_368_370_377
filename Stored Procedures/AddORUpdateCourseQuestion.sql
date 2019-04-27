CREATE PROC AddORUpdateCourseQuestion
@InstructorCourseID int,
@QuestionID int,
@Question varchar(50),
@Option1 varchar(50),
@Option2 varchar(50),
@Option3 varchar(50),
@Option4 varchar(50),
@CorrectAnswer varchar(50)
AS
DECLARE @InstructorId int;
DECLARE @CourseId int;
SET @InstructorId=(SELECT InstructorCourse.InstructorID FROM Instructor INNER JOIN InstructorCourse ON  Instructor.InstructorID=InstructorCourse.InstructorID   WHERE InstructorCourseID =@InstructorCourseID)
SET @CourseId=(SELECT InstructorCourse.CourseID FROM Course INNER JOIN InstructorCourse ON Course.CourseID=InstructorCourse.CourseID     WHERE  InstructorCourseID=@InstructorCourseID)
BEGIN

IF(@QuestionID=0 )
   BEGIN
  
   INSERT INTO InstructorTest(InstructorID,CourseID,Question,Option1,Option2,Option3,Option4,CorrectAnswer)
   VALUES(@InstructorID,@CourseID,@Question,@Option1,@Option2,@Option3,@Option4,@CorrectAnswer)
   
   
   END
ELSE
   BEGIN
   Update InstructorTest
   SET
      InstructorID=@InstructorID,
	  CourseID=@CourseID,
      Question=@Question,
	  Option1=@Option1,
	  Option2=@Option2,
	  Option3=@Option3,
	  Option4=@Option4,
      CorrectAnswer=@CorrectAnswer
	  
	  WHERE QuestionID=@QuestionID AND CourseID=@CourseID AND InstructorID=@InstructorID
	  
	 
   END

END