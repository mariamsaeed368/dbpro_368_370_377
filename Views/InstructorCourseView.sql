USE [DB9]
GO

/****** Object:  View [dbo].[InstructorCourseView]    Script Date: 4/28/2019 3:45:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InstructorCourseView]
	AS Select t.InstructorID,i.Name as InstructorName,t.CourseID,t.CourseName,t.CourseDescription from InstructorCourse t JOIN Course c on c.CourseID=t.CourseID JOIN Instructor i on i.InstructorID=t.InstructorID
GO


