USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[CourseViewAll]    Script Date: 4/22/2019 8:07:15 PM ******/
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


