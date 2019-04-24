USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[CourseCreateOrUpdate]    Script Date: 4/22/2019 8:05:20 PM ******/
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


