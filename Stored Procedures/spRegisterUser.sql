USE [DB9]
GO

/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 4/22/2019 8:07:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterUser]
	@Name  NVARCHAR (50),
	@Password   NVARCHAR (50),
	@Email   NVARCHAR (50),
	@ConfirmPassword NVARCHAR (50),
	@Address nvarchar(50),
	@UserType NVARCHAR (10),
	@RegistrationNo NVARCHAR (100)

AS
	Begin
	Declare @count int
	Declare @ReturnCode int
	Select @count=Count(Email)
	from [Person] where Email=@Email
	if @count > 0
	Begin 
		set @ReturnCode=-1
	End
	Else
	Begin 
		set @ReturnCode=1
		insert into [Person] values(@Name,@Address,@Email,@Password,@ConfirmPassword,'U',@RegistrationNo)
	End
	select @ReturnCode as ReturnValue
	End
RETURN 0

GO


