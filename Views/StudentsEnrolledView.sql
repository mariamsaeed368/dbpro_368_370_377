USE [DB9]
GO

/****** Object:  View [dbo].[StudentsEnrolledView]    Script Date: 4/28/2019 3:47:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[StudentsEnrolledView]
	AS SELECT c.CourseID,c.CourseName,c.CourseDescription,p.RegistrationNo,p.Name as StudentName
   FROM StudentCourseFee s JOIN Person p on p.PersonID=s.PersonID JOIN Course c on c.CourseID=s.CourseID
GO


