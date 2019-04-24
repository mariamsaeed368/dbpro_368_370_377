USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[StudentEnrolledView]    Script Date: 4/22/2019 8:08:14 PM ******/
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


