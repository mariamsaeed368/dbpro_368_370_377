USE [DB9]
GO

/****** Object:  View [dbo].[SubmittedFeeView]    Script Date: 4/28/2019 3:47:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SubmittedFeeView]
	AS Select s.PersonID,s.CourseID,s.Status,s.TotalFee,p.RegistrationNo,p.Name from Person p join StudentCourseFee s on s.PersonID=p.PersonID and s.Status='Paid'
GO


