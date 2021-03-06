USE [DB9]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[Duration] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[Fee] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NULL,
	[Salary] [float] NULL,
	[UserType] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[AssignedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourse]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourse](
	[InstructorCourseID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[AssignedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_InstructorCourse] PRIMARY KEY CLUSTERED 
(
	[InstructorCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorTest]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorTest](
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Option1] [nvarchar](100) NULL,
	[Option2] [nvarchar](100) NULL,
	[Option3] [nvarchar](100) NULL,
	[Option4] [nvarchar](100) NULL,
	[CorrectAnswer] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_InstructorTest] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConfirmPassword] [nvarchar](50) NOT NULL,
	[UserType] [nchar](10) NOT NULL,
	[RegistrationNo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[PersonID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[StudentCourseID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourseFee]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourseFee](
	[StudentCourseFeeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[TotalFee] [float] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentCourseFee] PRIMARY KEY CLUSTERED 
(
	[StudentCourseFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[PersonID] [int] NOT NULL,
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Course]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Instructor]
GO
ALTER TABLE [dbo].[InstructorTest]  WITH CHECK ADD  CONSTRAINT [FK_InstructorTest_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorTest] CHECK CONSTRAINT [FK_InstructorTest_Course]
GO
ALTER TABLE [dbo].[InstructorTest]  WITH CHECK ADD  CONSTRAINT [FK_InstructorTest_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[InstructorTest] CHECK CONSTRAINT [FK_InstructorTest_Instructor]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Person]
GO
ALTER TABLE [dbo].[StudentCourseFee]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseFee_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourseFee] CHECK CONSTRAINT [FK_StudentCourseFee_Course]
GO
ALTER TABLE [dbo].[StudentCourseFee]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseFee_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentCourseFee] CHECK CONSTRAINT [FK_StudentCourseFee_Person]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Person]
GO
/****** Object:  StoredProcedure [dbo].[AddCourseInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCourseInstructor]
@InstructorCourseID int,
@InstructorID int,

@CourseName nvarchar(50),
@AssignedOn nvarchar(50)
AS 
DECLARE @CourseDescription nvarchar(50);
DECLARE @CourseID int;
SET @CourseDescription=(SELECT CourseDescription FROM Course WHERE CourseName=@CourseName);
SET @CourseID=(SELECT CourseID FROM Course WHERE CourseName=@CourseName);
BEGIN
   INSERT INTO InstructorCourse(InstructorID,CourseID,CourseName,CourseDescription,AssignedOn)
    VALUES(@InstructorID,@CourseID,@CourseName,@CourseDescription,@AssignedOn)
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddInstructor]
@InstructorID int,
@Name nvarchar(50),
@Designation nvarchar(50),
@Salary float,

@Email nvarchar(50),
@Password nvarchar(50),
@AssignedOn nvarchar(50)
AS 
DECLARE @UserType nchar(10);

SET @UserType='I'
BEGIN

   INSERT INTO Instructor(Name,Designation,Salary,UserType,Email,Password,AssignedOn)
    VALUES(@Name,@Designation,@Salary,@UserType,@Email,@Password,@AssignedOn)
  
END
GO
/****** Object:  StoredProcedure [dbo].[AddORUpdateCourseInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddORUpdateCourseInstructor]
@InstructorCourseID int,
@InstructorID int,

@CourseName nvarchar(50)

AS 
DECLARE @CourseDescription nvarchar(50);
DECLARE @CourseID int;
SET @CourseDescription=(SELECT CourseDescription FROM Course WHERE CourseName=@CourseName);
SET @CourseID=(SELECT CourseID FROM Course WHERE CourseName=@CourseName);


BEGIN


IF(@InstructorCourseID=0)
   BEGIN
   INSERT INTO InstructorCourse(InstructorID,CourseID,CourseName,CourseDescription)
    VALUES(@InstructorID,@CourseID,@CourseName,@CourseDescription)
	END
ELSE 
   BEGIN
    UPDATE InstructorCourse SET InstructorID=@InstructorID,CourseID=@CourseID,CourseName=@CourseName,CourseDescription=@CourseDescription WHERE InstructorCourseID=@InstructorCourseID

	 END
END
GO
/****** Object:  StoredProcedure [dbo].[AddORUpdateCourseQuestion]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddORUpdateCourseQuestion]
@InstructorCourseID int,
@QuestionID int,
@Question nvarchar(50),
@Option1 nvarchar(50),
@Option2 nvarchar(50),
@Option3 nvarchar(50),
@Option4 nvarchar(50),
@CorrectAnswer nvarchar(50),
@CreatedOn nvarchar(50)
AS
DECLARE @InstructorId int;
DECLARE @CourseId int;
SET @InstructorId=(SELECT InstructorCourse.InstructorID FROM Instructor INNER JOIN InstructorCourse ON  Instructor.InstructorID=InstructorCourse.InstructorID   WHERE InstructorCourseID =@InstructorCourseID)
SET @CourseId=(SELECT InstructorCourse.CourseID FROM Course INNER JOIN InstructorCourse ON Course.CourseID=InstructorCourse.CourseID     WHERE  InstructorCourseID=@InstructorCourseID)
BEGIN

IF(@QuestionID=0 )
   BEGIN
  
   INSERT INTO InstructorTest(InstructorID,CourseID,Question,Option1,Option2,Option3,Option4,CorrectAnswer,CreatedOn)
   VALUES(@InstructorID,@CourseID,@Question,@Option1,@Option2,@Option3,@Option4,@CorrectAnswer,@CreatedOn)
   
   
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
      CorrectAnswer=@CorrectAnswer,
	  CreatedOn=@CreatedOn
	  
	  WHERE QuestionID=@QuestionID AND CourseID=@CourseID AND InstructorID=@InstructorID
	  
	 
   END

END
GO
/****** Object:  StoredProcedure [dbo].[AddORUpdateInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddORUpdateInstructor]
@InstructorID int,
@Name nvarchar(50),
@Designation nvarchar(50),
@Salary float,

@Email nvarchar(50),
@Password nvarchar(50)
AS 
DECLARE @UserType nchar(10);
DECLARE @EmailRepeat int;
DECLARE @EmailRepeatEdit int;
SET @UserType='I'
BEGIN


IF(@InstructorID=0 AND @EmailRepeat=0)
   BEGIN
   INSERT INTO Instructor(Name,Designation,Salary,UserType,Email,Password)
    VALUES(@Name,@Designation,@Salary,@UserType,@Email,@Password)
	END
ELSE 
   BEGIN
    UPDATE Instructor SET Name=@Name,Designation=@Designation,Salary=@Salary,UserType=@UserType,Email=@Email,Password=@Password
	WHERE InstructorID=@InstructorID
	 END
END
GO
/****** Object:  StoredProcedure [dbo].[CourseCreateOrUpdate]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CourseCreateOrUpdate]
@CourseID int,
@CourseName nvarchar(50),
@CourseDescription nvarchar(max),
@Duration nvarchar(50),
@StartTime datetime,
@Fee float
AS
BEGIN
IF(@CourseID=0)
   BEGIN
   INSERT INTO Course(CourseName,CourseDescription,Duration,StartTime,Fee)
   VALUES(@CourseName,@CourseDescription,@Duration,@StartTime,@Fee)
   END
ELSE
   BEGIN
   Update Course
   SET
      CourseName=@CourseName,
	  CourseDescription=@CourseDescription,
	  Duration=@Duration,
	  StartTime=@StartTime,
	  Fee=@Fee
	  WHERE CourseID=@CourseID
   END

END
GO
/****** Object:  StoredProcedure [dbo].[CourseDeleteById]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[CourseDeleteById]
@CourseID int
AS
      BEGIN
	  DELETE FROM Course
	  WHERE CourseID=@CourseID
      END
GO
/****** Object:  StoredProcedure [dbo].[CourseViewAll]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CourseViewAll]
AS 
   BEGIN
   SELECT *
   FROM Course
   END
GO
/****** Object:  StoredProcedure [dbo].[CourseViewById]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CourseViewById]
@CourseID int
AS
	BEGIN
	SELECT *
	FROM Course
	Where CourseID=@CourseID
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInstructorByID]
@InstructorID int
AS 

BEGIN
 DELETE FROM Instructor WHERE InstructorID=@InstructorID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorCByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInstructorCByID]
@InstructorID int,
@CourseID int

AS 

BEGIN
 
 DELETE FROM InstructorCourse WHERE InstructorID=@InstructorID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorCourseByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInstructorCourseByID]
@InstructorCourseID int,
@InstructorID int,
@CourseID int
AS 

BEGIN
 DELETE FROM InstructorTest WHERE InstructorID=@InstructorID AND CourseID=@CourseID
 DELETE FROM InstructorCourse WHERE InstructorCourseID=@InstructorCourseID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorTByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInstructorTByID]
@InstructorID int,
@CourseID int

AS 

BEGIN
 DELETE FROM InstructorTest WHERE InstructorID=@InstructorID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestionByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[EditInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditInstructor]
@InstructorID int,
@Name nvarchar(50),
@Designation nvarchar(50),
@Salary float,

@Email nvarchar(50),
@Password nvarchar(50),
@AssignedOn  nvarchar(50)
AS 
DECLARE @UserType nchar(10);

SET @UserType='I'
BEGIN
IF(@InstructorID>0)
   BEGIN
    UPDATE Instructor SET Name=@Name,Designation=@Designation,Salary=@Salary,UserType=@UserType,Email=@Email,Password=@Password,AssignedOn=@AssignedOn
	WHERE InstructorID=@InstructorID
	 END
 END
GO
/****** Object:  StoredProcedure [dbo].[InstructorOfSpecificYear]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InstructorOfSpecificYear]
@StartDate date

AS
SELECT Instructor.Name AS InstructorName,Instructor.Email AS
EmailID,Instructor.Salary AS InstructorSalary,Instructor.Designation 
AS Designation,Instructor.AssignedOn AS AssignedDate FROM Instructor  WHERE Instructor.AssignedOn = @StartDate
GO
/****** Object:  StoredProcedure [dbo].[Procedure]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Procedure]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[QuestionsOfACourseOfDifferentInstructors]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[QuestionsOfACourseOfDifferentInstructors]
@SpecificCourseName nvarchar(50)

AS
DECLARE @SpecificId int;
SET @SpecificId=(SELECT Course.CourseID FROM Course WHERE Course.CourseName=@SpecificCourseName)
BEGIN
SELECT InstructorTest.InstructorID,InstructorTest.CourseID,InstructorTest.Question,InstructorTest.Option1
,InstructorTest.Option2 ,InstructorTest.Option3,InstructorTest.Option4,InstructorTest.CorrectAnswer,InstructorTest.CreatedOn   FROM
((InstructorTest  INNER JOIN InstructorCourse AS L2 ON L2.InstructorID=InstructorTest.InstructorID)INNER JOIN InstructorCourse AS L3 ON L3.CourseID=InstructorTest.CourseID) WHERE InstructorTest.CourseID=@SpecificId
END
GO
/****** Object:  StoredProcedure [dbo].[SpecificCourseInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpecificCourseInstructor]
@SpecificCourse nvarchar(50)

AS
BEGIN
SELECT InstructorCourse.InstructorID,InstructorCourse.CourseID,InstructorCourse.CourseName,
InstructorCourse.CourseDescription,InstructorCourse.AssignedOn FROM 
((InstructorCourse INNER JOIN Instructor ON Instructor.InstructorID=InstructorCourse.InstructorID)INNER JOIN Course ON Course.CourseID=InstructorCourse.CourseID) WHERE InstructorCourse.CourseName=@SpecificCourse
END
GO
/****** Object:  StoredProcedure [dbo].[SpecificDateInstructors]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpecificDateInstructors]
@FromDate datetime,
@ToDate datetime

AS
BEGIN
SELECT Instructor.Name AS InstructorName,Instructor.Email AS
EmailID,Instructor.Salary AS InstructorSalary,Instructor.Designation 
AS Designation,Instructor.AssignedOn AS AssignedDate FROM Instructor 
WHERE Instructor.AssignedOn BETWEEN @FromDate  AND @ToDate
END
GO
/****** Object:  StoredProcedure [dbo].[SpecificYearsInstructorsReport]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpecificYearsInstructorsReport]
@SpecificYear int

AS
SELECT Instructor.Name AS InstructorName,Instructor.Email AS
EmailID,Instructor.Salary AS InstructorSalary,Instructor.Designation 
AS Designation,Instructor.AssignedOn AS AssignedDate FROM Instructor  WHERE YEAR(AssignedOn)=@SpecificYear
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterUser]
	@Name  NVARCHAR (50),
	@Password   NVARCHAR (50),
	@Email   NVARCHAR (50),
	@ConfirmPassword NVARCHAR (50),
	@Address nvarchar(50),
	@UserType NVARCHAR (10),
	@RegistrationNo NVARCHAR (100)

AS
	Begin
	Declare @count int
	Declare @ReturnCode int
	Select @count=Count(Email)
	from [Person] where Email=@Email
	if @count > 0
	Begin 
		set @ReturnCode=-1
	End
	Else
	Begin 
		set @ReturnCode=1
		insert into [Person] values(@Name,@Address,@Email,@Password,@ConfirmPassword,'U',@RegistrationNo)
	End
	select @ReturnCode as ReturnValue
	End
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[StudentEnrolledView]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentEnrolledView]
@PersonID int
AS 
   BEGIN
   SELECT c.*
   FROM StudentCourseFee s JOIN Person p on p.PersonID=s.PersonID JOIN Course c on c.CourseID=s.CourseID
   where s.PersonID=@PersonID 
   END
GO
/****** Object:  StoredProcedure [dbo].[StudentFeeView]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentFeeView]
AS 
   BEGIN
   SELECT s.*,p.RegistrationNo,c.CourseName
   FROM StudentCourseFee s JOIN Person p on p.PersonID=s.PersonID JOIN Course c on c.CourseID=s.CourseID
   END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourseInstructor]
@InstructorCourseID int,
@InstructorID int,

@CourseName nvarchar(50)

AS 
DECLARE @CourseDescription nvarchar(50);
DECLARE @CourseID int;
SET @CourseDescription=(SELECT CourseDescription FROM Course WHERE CourseName=@CourseName);
SET @CourseID=(SELECT CourseID FROM Course WHERE CourseName=@CourseName);
BEGIN
IF(@InstructorCourseID>0)
BEGIN
UPDATE InstructorCourse SET InstructorID=@InstructorID,CourseID=@CourseID,CourseName=@CourseName,CourseDescription=@CourseDescription WHERE InstructorCourseID=@InstructorCourseID

	 END
	 END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllCourseInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllCourseInstructor]
@InstructorId int
AS
      BEGIN
	  SELECT * FROM InstructorCourse INNER JOIN Instructor
	 ON InstructorCourse.InstructorID=Instructor.InstructorID WHERE InstructorCourse.InstructorID=@InstructorId
      END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllCourseOfAInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllCourseOfAInstructor]
@InstructorId int
AS
      BEGIN
	  SELECT InstructorCourse.InstructorCourseID ,InstructorCourse.InstructorID,InstructorCourse.CourseID,InstructorCourse.CourseName,InstructorCourse.CourseDescription,InstructorCourse.AssignedOn FROM ((InstructorCourse INNER JOIN Instructor  ON InstructorCourse.InstructorID=Instructor.InstructorID)INNER JOIN Course   ON InstructorCourse.CourseID=Course.CourseID)
	 WHERE InstructorCourse.InstructorID=@InstructorId
      END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllInstructor]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllInstructor]
AS 

BEGIN
SELECT * FROM Instructor
 
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllInstructorCourses]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllInstructorCourses]
@InstructorID int
	AS 
   BEGIN
   SELECT *
   FROM InstructorCourse 
   END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllQuestion]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllQuestion]
@InstructorCourseId int

AS
DECLARE @InstructorId int;
DECLARE @CourseId int;
SET @InstructorId=(SELECT InstructorCourse.InstructorID FROM Instructor INNER JOIN InstructorCourse ON  Instructor.InstructorID=InstructorCourse.InstructorID   WHERE InstructorCourseID =@InstructorCourseID)
SET @CourseId=(SELECT InstructorCourse.CourseID FROM Course INNER JOIN InstructorCourse ON Course.CourseID=InstructorCourse.CourseID     WHERE  InstructorCourseID=@InstructorCourseID)


      BEGIN
	  SELECT InstructorTest.QuestionID,InstructorTest.Question,InstructorTest.Option1,InstructorTest.Option2,InstructorTest.Option3,InstructorTest.Option4,InstructorTest.CorrectAnswer,InstructorTest.CreatedOn FROM  InstructorTest INNER JOIN InstructorCourse
	 ON InstructorCourse.InstructorID=InstructorTest.InstructorID AND InstructorCourse.CourseID=InstructorTest.CourseID WHERE InstructorTest.CourseID=@CourseID AND InstructorTest.InstructorID=@InstructorId
      END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllQuestions]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllQuestions]
@QuestionID int,
@CourseID int,
@InstructorID int
	AS 
   BEGIN
   SELECT *
   FROM InstructorTest WHERE QuestionID=@QuestionID AND InstructorID=@InstructorID AND CourseID=@CourseID
   END
GO
/****** Object:  StoredProcedure [dbo].[ViewInstructorByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewInstructorByID]
@InstructorID int
AS 

BEGIN
SELECT * FROM Instructor WHERE InstructorID=@InstructorID

END
GO
/****** Object:  StoredProcedure [dbo].[ViewInstructorCourseByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewInstructorCourseByID]
@InstructorCourseID int
AS 

BEGIN
SELECT * FROM InstructorCourse WHERE InstructorCourseID=@InstructorCourseID

END
GO
/****** Object:  StoredProcedure [dbo].[ViewQuestionByID]    Script Date: 5/5/2019 3:48:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewQuestionByID]
@QuestionID int
AS 

BEGIN
SELECT * FROM InstructorTest WHERE QuestionID=@QuestionID

END
GO
