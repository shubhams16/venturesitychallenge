IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER')
EXEC sys.sp_executesql N'CREATE SCHEMA [SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER] AUTHORIZATION [SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER]'

GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'##MS_AgentSigningCertificate##')
CREATE USER [##MS_AgentSigningCertificate##] FOR LOGIN [##MS_AgentSigningCertificate##]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER')
CREATE USER [SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER] FOR LOGIN [SHUBHAM-PC\SQLServer2005MSFTEUser$SHUBHAM-PC$MSSQLSERVER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insert_User]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'	CREATE PROCEDURE [dbo].[Insert_User]
   @UserId int,
    @Username NVARCHAR(50),
	@degree NVARCHAR(50),
	@percet int,
	@phnno int,
	@email NVARCHAR(50)
AS
BEGIN
      SET NOCOUNT ON;
     
      BEGIN
            INSERT INTO [Student]
                     ([UserId]
					 ,[Username]
                     ,[degree]
                     ,[percet]
                     ,[phnno]
					 ,[email])
            VALUES
                     (@UserId
					 ,@Username
                     ,@Degree
                     ,@percet
                     ,@phnno
					 ,@Email)
					  
           
            SELECT SCOPE_IDENTITY() -- UserId                 
     END
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pataint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pataint](
	[pataintno] [int] NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phno] [varchar](15) NULL,
 CONSTRAINT [PK_Pataint] PRIMARY KEY CLUSTERED 
(
	[pataintno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pataint_insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'	CREATE PROCEDURE [dbo].[pataint_insert]
    @pataintno int,
    @Firstname NVARCHAR(50),
	@Lastname NVARCHAR(50),
	@Age int,
	@Address NVARCHAR(150),
	@Email NVARCHAR(50),
	@Phno varchar(15)
AS
BEGIN
      SET NOCOUNT ON;
     
      BEGIN
            INSERT INTO [Pataint]
                     ([pataintno]
					 ,[Firstname]
                     ,[Lastname]
                     ,[Age]
                     ,[Address]
					 ,[Email]
					 ,[Phno])
            VALUES
                     (@pataintno
					 ,@Firstname
                     ,@Lastname
                     ,@Age
                     ,@Address
					 ,@Email
					 ,@Phno)
					  
           
            SELECT SCOPE_IDENTITY() -- pataintno                
     END
END' 
END
