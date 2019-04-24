USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[StudentFeeView]    Script Date: 4/22/2019 8:08:33 PM ******/
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


