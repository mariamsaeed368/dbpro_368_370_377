USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[CourseDeleteById]    Script Date: 4/22/2019 8:06:43 PM ******/
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


