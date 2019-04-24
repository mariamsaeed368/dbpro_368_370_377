USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[CourseViewById]    Script Date: 4/22/2019 8:07:33 PM ******/
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


