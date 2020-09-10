USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[[sp_Insert]]    Script Date: 26/08/2020 4:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

AlTER PROCEDURE [dbo].[sp_Insert] 

	@Fullname nvarchar(100),
	@EmailId nvarchar(100),
	@Address nvarchar(100),
	@PhoneNumber nvarchar(100),
	@Code int out

AS
BEGIN
		SET NOCOUNT ON;
		INSERT INTO Demo.dbo.BasicSP_Master(Fullname,EmailId,Address,PhoneNumber,valid)
		VALUES(@Fullname,@EmailId,@Address,@PhoneNumber,'1')
		SET @Code=@@IDENTITY
		RETURN @Code

END
