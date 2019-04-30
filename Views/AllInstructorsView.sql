USE [DB9]
GO

/****** Object:  View [dbo].[AllInstructorsView]    Script Date: 4/28/2019 3:45:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AllInstructorsView]
	AS SELECT i.Name,i.Designation,i.Salary,i.Email FROM Instructor i
GO


