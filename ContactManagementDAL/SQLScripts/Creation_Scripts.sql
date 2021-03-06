USE [master]
GO

CREATE DATABASE [ContactManagementDB_Dipali]
 CONTAINMENT = NONE
 

ALTER DATABASE [ContactManagementDB_Dipali] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactManagementDB_Dipali].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ARITHABORT OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET  MULTI_USER 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ContactManagementDB_Dipali] SET  READ_WRITE 
GO




USE [ContactManagementDB_Dipali]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 14-07-2018 PM 07:19:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Status] [bit] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[CMP_AddContact]    Script Date: 14-07-2018 PM 07:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CMP_AddContact]
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@PhoneNumber VARCHAR(15),
	@Email VARCHAR(50),
	@CreatedDate DATETIME,
	@UpdatedDate DATETIME,
	@Status BIT
	
AS	
	
BEGIN
	


INSERT INTO [dbo].[Contact]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[PhoneNumber]
           ,[Status]
           ,[UpdatedDate]
           ,[CreatedDate])
     VALUES
           (@FirstName,
			   @LastName, 
			   @Email, 
			   @PhoneNumber, 
			   @Status, 
			   @UpdatedDate,
			   @CreatedDate
		   )

		SELECT  SCOPE_IDENTITY()
	END






GO

/****** Object:  StoredProcedure [dbo].[CMP_GetContact]    Script Date: 14-07-2018 PM 07:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CMP_GetContact] 	
@ContactID INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
	ContactID,
	FirstName, 
	LastName, 
	Email, 
	PhoneNumber,
	Status
	FROM 
		Contact
	Where ContactID=@ContactID
		
END


GO
/****** Object:  StoredProcedure [dbo].[CMP_GetContactList]    Script Date: 14-07-2018 PM 07:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CMP_GetContactList] 	

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
	ContactID,
	FirstName, 
	LastName, 
	Email, 
	PhoneNumber,
	Status
	FROM 
		Contact
		
END


GO
/****** Object:  StoredProcedure [dbo].[CMP_UpdateContact]    Script Date: 14-07-2018 PM 07:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CMP_UpdateContact]
	@ContactID INT,
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@PhoneNumber VARCHAR(15),
	@Email VARCHAR(50),
	@UpdatedDate DATETIME,
	@Status BIT
	
AS	
	
BEGIN
	
	SET NOCOUNT ON;

UPDATE [dbo].[Contact]
   SET [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[PhoneNumber] = @PhoneNumber
      ,[Status] = @Status
      ,[UpdatedDate] = @UpdatedDate
	 WHERE ContactID=@ContactID

		
	END






GO
/****** Object:  StoredProcedure [dbo].[CMP_UpdateContactStatus]    Script Date: 14-07-2018 PM 07:19:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CMP_UpdateContactStatus]
	@ContactID INT
	
	
AS	
	
BEGIN
	
	SET NOCOUNT OFF;
	
	DECLARE @Status BIT;

	SELECT @status=Status from [dbo].[Contact] WHERE ContactID=@ContactID
UPDATE [dbo].[Contact]
	SET 
      [Status] =  ~@Status
      WHERE ContactID=@ContactID

		
	END






GO
