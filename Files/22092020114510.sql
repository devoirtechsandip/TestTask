USE [master]
GO
/****** Object:  Database [Excellence]    Script Date: 9/19/2020 6:32:44 PM ******/
CREATE DATABASE [Excellence]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Excellence', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Excellence.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Excellence_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Excellence_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Excellence] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Excellence].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Excellence] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Excellence] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Excellence] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Excellence] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Excellence] SET ARITHABORT OFF 
GO
ALTER DATABASE [Excellence] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Excellence] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Excellence] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Excellence] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Excellence] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Excellence] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Excellence] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Excellence] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Excellence] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Excellence] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Excellence] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Excellence] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Excellence] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Excellence] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Excellence] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Excellence] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Excellence] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Excellence] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Excellence] SET  MULTI_USER 
GO
ALTER DATABASE [Excellence] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Excellence] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Excellence] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Excellence] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Excellence] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Excellence] SET QUERY_STORE = OFF
GO
USE [Excellence]
GO
/****** Object:  Table [dbo].[AClientRegistration]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AClientRegistration](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[Locationid] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[Services] [nvarchar](50) NULL,
	[Other] [nvarchar](50) NULL,
	[Departmentid] [nvarchar](50) NULL,
	[SupervisorName] [nvarchar](50) NULL,
	[ClientUsername] [nvarchar](50) NULL,
	[ClientPassword] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_AClientRegistration] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessUnit_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnit_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnitName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_BusinessUnit_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Category_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetencyLevel_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetencyLevel_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[CompetencyLevelName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_CompetencyLevel_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreateNewTicket_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreateNewTicket_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[CategoryId] [nvarchar](100) NULL,
	[PriorityId] [nvarchar](100) NULL,
	[valid] [nvarchar](1) NULL,
	[Status] [nvarchar](100) NULL,
	[DateUpdated] [datetime] NULL,
	[DeleteIt] [nchar](1) NULL,
	[Role] [nvarchar](100) NULL,
 CONSTRAINT [PK_CreateNewTicket_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreateProject_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreateProject_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NULL,
	[ProjectDates] [nvarchar](50) NULL,
	[ProjectOwner] [nvarchar](50) NULL,
	[ProjectModerators] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_CreateProject_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dept_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dept_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[DeptCode] [nvarchar](50) NULL,
	[DeptName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Dept_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desig_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desig_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[desigid] [nvarchar](50) NULL,
	[designame] [nvarchar](50) NULL,
	[grade] [varchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Desig_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeList_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeList_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_EmployeeList_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmploymentStatus_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentStatus_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentStatusName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_EmploymentStatus_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Gender_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[GradeId] [int] NULL,
	[GradeName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Language_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Location_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaritalStatus_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritalStatus_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[MaritalStatus] [nvarchar](50) NULL,
	[valid] [nvarchar](50) NULL,
 CONSTRAINT [PK_MartitalStatus_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModeofEmployment_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModeofEmployment_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[ModeofEmploymentName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_ModeofEmployment] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NationalityCode] [nvarchar](50) NULL,
	[NationalityName] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostReply_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostReply_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[ReplyMessage] [nvarchar](100) NULL,
	[BCC] [nvarchar](100) NULL,
	[DatePosted] [datetime] NULL,
	[TicketId] [int] NULL,
 CONSTRAINT [PK_PostReply_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostReply1_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostReply1_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[ReplyMessage] [nvarchar](100) NULL,
	[BCC] [nvarchar](100) NULL,
	[DatePosted] [datetime] NULL,
	[TicketId] [int] NULL,
 CONSTRAINT [PK_PostReply1_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prefix_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prefix_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Prefix] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Prefix_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [nvarchar](100) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Priority_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NULL,
	[RoleName] [nvarchar](50) NULL,
	[Valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Role_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_Status_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](50) NULL,
	[ResponsiblePerson] [nvarchar](50) NULL,
	[CreatesBy] [nvarchar](50) NULL,
	[Participants] [nvarchar](50) NULL,
	[AssignedDate] [nvarchar](50) NULL,
	[DeadLineDate] [nvarchar](50) NULL,
	[DependentTask] [nvarchar](50) NULL,
	[SubTaskOf] [nvarchar](50) NULL,
	[valid] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Task_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketFile_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketFile_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](100) NULL,
	[TicketId] [int] NULL,
 CONSTRAINT [PK_TicketFile_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[loginid] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[DateAdded] [datetime] NULL,
	[valid] [nvarchar](1) NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 9/19/2020 6:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[loginid] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NULL,
	[password] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AClientRegistration] ON 

INSERT [dbo].[AClientRegistration] ([pk], [ClientID], [ClientName], [Locationid], [EmailID], [MobileNumber], [ContactPerson], [Services], [Other], [Departmentid], [SupervisorName], [ClientUsername], [ClientPassword], [valid]) VALUES (1, N'C1', N'Paper Fry', N'2', N'p@gmail.com', N'8365689752', N'Tushar', N'Working', N'Pending', N'2', N'Sandeep', N'Deepak', N'12343', N'1')
INSERT [dbo].[AClientRegistration] ([pk], [ClientID], [ClientName], [Locationid], [EmailID], [MobileNumber], [ContactPerson], [Services], [Other], [Departmentid], [SupervisorName], [ClientUsername], [ClientPassword], [valid]) VALUES (2, N'C2', N'Paper Fry', N'2', N'p@gmail.com', N'8365689752', N'Tushar', N'Sarve', N'C12', N'2', N'Sandeep', N'Deepak', N'12343', N'1')
INSERT [dbo].[AClientRegistration] ([pk], [ClientID], [ClientName], [Locationid], [EmailID], [MobileNumber], [ContactPerson], [Services], [Other], [Departmentid], [SupervisorName], [ClientUsername], [ClientPassword], [valid]) VALUES (1005, N'C2', N'qqqq', N'2', N'ppppp', N'98560', N'aaaaa', N'fsqqq', N'llllllllll', N'3', N'mnmnm', N'cxxxxx', N'dsdsds', N'1')
SET IDENTITY_INSERT [dbo].[AClientRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[BusinessUnit_Master] ON 

INSERT [dbo].[BusinessUnit_Master] ([pk], [BusinessUnitName], [valid]) VALUES (1, N'Grand Avenue', N'1')
INSERT [dbo].[BusinessUnit_Master] ([pk], [BusinessUnitName], [valid]) VALUES (2, N'Orange Blossom', N'1')
SET IDENTITY_INSERT [dbo].[BusinessUnit_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Category_Master] ON 

INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (1, N'General', N'1')
INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (2, N'Android Application', N'1')
INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (3, N'Website', N'1')
INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (4, N'Web Application', N'1')
INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (5, N'Windows Software', N'1')
INSERT [dbo].[Category_Master] ([pk], [Category], [valid]) VALUES (7, N'Other', N'1')
SET IDENTITY_INSERT [dbo].[Category_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[CompetencyLevel_Master] ON 

INSERT [dbo].[CompetencyLevel_Master] ([pk], [CompetencyLevelName], [valid]) VALUES (1, N'LEVEL 1', N'1')
INSERT [dbo].[CompetencyLevel_Master] ([pk], [CompetencyLevelName], [valid]) VALUES (2, N'LEVEL 2', N'1')
INSERT [dbo].[CompetencyLevel_Master] ([pk], [CompetencyLevelName], [valid]) VALUES (3, N'LEVEL 3', N'1')
INSERT [dbo].[CompetencyLevel_Master] ([pk], [CompetencyLevelName], [valid]) VALUES (4, N'LEVEL 4', N'1')
SET IDENTITY_INSERT [dbo].[CompetencyLevel_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[CreateNewTicket_Master] ON 

INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1, N'test', N'dfsdfs', N'1', N'Medium', N'1', N'Close', CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1001, N'Metro', N'Mumbai Metro', N'1', N'1', N'1', NULL, CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1002, N'Mumbai', N'Mumbai Local', N'3', N'High', N'1', N'Pending', CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1003, N'sub', N'test sub', N'1', N'1', N'1', NULL, CAST(N'2020-09-08T00:00:00.000' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1004, N'To test this project', N'Testing', N'2', N'2', N'1', NULL, CAST(N'2020-09-09T00:00:00.000' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1005, N'Working on Metro', N'Mumbai Metro One Ad-Track', N'4', N'3', N'1', NULL, CAST(N'2020-09-09T12:36:27.587' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1006, N'abcd', N'efghi', N'3', N'2', N'1', NULL, CAST(N'2020-09-09T12:54:54.063' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1007, N'pttt', N'rrrrrr', N'2', N'1', N'1', NULL, CAST(N'2020-09-09T14:32:23.360' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1008, N'pttt', N'rrrrrr', N'Android Application', N'Normal', N'1', NULL, CAST(N'2020-09-09T14:37:00.860' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1009, N'Mumbai Metro', N'Project', N'General', N'High', N'1', NULL, CAST(N'2020-09-09T14:59:43.037' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1010, N'Metro', N'Mumbai', N'Android Application', N'Normal', N'1', NULL, CAST(N'2020-09-09T15:39:31.217' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (1011, N'Mean Deviation', N'<p>About mean</p>', N'Windows Software', N'Normal', N'1', NULL, CAST(N'2020-09-09T16:16:00.123' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (2001, N'Ticket master', N'<p>New ticket</p>', N'General', N'Normal', N'1', NULL, CAST(N'2020-09-10T13:14:03.897' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (2002, N'Post reply', N'<p><i><b></b></i>Testing Post reply pg<i></i><b></b></p>', N'Windows Software', N'Medium', N'1', NULL, CAST(N'2020-09-10T13:46:46.890' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (2003, N'Srinagar', N'<p><b></b>Mumbai<b></b></p>', N'Android Application', N'Normal', N'1', NULL, CAST(N'2020-09-10T17:09:44.863' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3001, N'Test', N'<p>Test is project</p>', N'Android Application', N'Medium', N'1', N'Pending', CAST(N'2020-09-10T17:42:34.797' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3002, N'Java Developer', N'<p>.Net Developer</p>', N'Website', N'High', N'1', N'Pending', CAST(N'2020-09-10T18:42:28.020' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3003, N'Ticket Master', N'<p><i><u></u></i><i><b><u>To test TicketMaster.aspx</u></b></i></p>', N'General', N'Medium', N'1', N'Open', CAST(N'2020-09-11T11:06:12.500' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3004, N'sqxsqax', N'<p>xqxqxqx</p>', N'Website', N'Normal', N'1', NULL, CAST(N'2020-09-11T16:54:18.310' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3005, N'y65yu5t', N'<p>66666665y6t</p>', N'Windows Software', N'Low', N'1', N'Close', CAST(N'2020-09-11T17:03:12.797' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3006, N'gfg,f', N'<p>&nbsp;vbvff[fpfr</p>', N'Android Application', N'Medium', N'1', N'Open', CAST(N'2020-09-11T19:03:27.323' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3007, N'Metro', N'<p>Metro</p>', N'Android Application', N'Medium', N'1', N'Pending', CAST(N'2020-09-11T19:38:07.680' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3008, N'New Ticket', N'<p>Some Text</p>', N'General', N'High', N'1', N'Open', CAST(N'2020-09-14T17:47:47.370' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3009, N'Mumbai', N'<p>Small</p>', N'Windows Software', N'Low', N'1', N'Close', CAST(N'2020-09-17T16:03:31.603' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (3010, N'bfb', N'<p>fgf</p>', N'Android Application', N'Medium', N'1', NULL, CAST(N'2020-09-18T15:40:23.160' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4010, N'Paper Fry', N'<p>Start your work</p>', N'Android Application', N'Medium', N'1', NULL, CAST(N'2020-09-19T13:02:41.093' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4011, N'Language', N'<p>Small</p>', N'Website', N'High', N'1', NULL, CAST(N'2020-09-19T13:18:32.993' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4012, N'Marketing', N'<p>Italic</p>', N'Windows Software', N'High', N'1', NULL, CAST(N'2020-09-19T13:27:42.270' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4013, N'Marketing', N'<p>Italic</p>', N'Windows Software', N'High', N'1', NULL, CAST(N'2020-09-19T13:28:22.147' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4014, N'Marketing', N'<p>Italic</p>', N'Windows Software', N'High', N'1', NULL, CAST(N'2020-09-19T13:28:50.133' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4015, N'Marketing', N'<p>Italic</p>', N'Windows Software', N'High', N'1', NULL, CAST(N'2020-09-19T13:29:10.937' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4016, N'Aqua', N'<p>Small</p>', N'Android Application', N'Low', N'1', NULL, CAST(N'2020-09-19T15:29:21.593' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4017, N'lll', N'<p>bbbb</p>', N'General', N'High', N'1', NULL, CAST(N'2020-09-19T15:31:51.157' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4018, N'KEM', N'<p>Hospital</p>', N'General', N'Medium', N'1', NULL, CAST(N'2020-09-19T15:39:52.940' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4019, N'Paper Fry', N'<p>dwsd s</p>', N'Website', N'Medium', N'1', NULL, CAST(N'2020-09-19T16:23:07.967' AS DateTime), N'N', N'User')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4020, N'Sharp', N'<p>Batteries</p>', N'Android Application', N'High', N'1', NULL, CAST(N'2020-09-19T16:48:44.867' AS DateTime), N'Y', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4021, N'Paper Fry', N'<p>Bold</p>', N'Android Application', N'High', N'1', NULL, CAST(N'2020-09-19T16:53:36.987' AS DateTime), N'Y', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4022, N'fvmf v', N'<p>Bold</p>', N'General', N'Medium', N'1', N'Pending', CAST(N'2020-09-19T16:57:47.270' AS DateTime), N'N', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4023, N'ds', N'<p>ccdc</p>', N'Android Application', N'Low', N'1', N'Open', CAST(N'2020-09-19T17:07:22.420' AS DateTime), N'N', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4024, N'dvsddsvdsb', N'<p>vcdscdfdv</p>', N'Android Application', N'Medium', N'1', N'Open', CAST(N'2020-09-19T17:14:32.100' AS DateTime), N'N', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4025, N'Lay''s', N'<p>Classic Salted</p>', N'General', N'High', N'1', N'Open', CAST(N'2020-09-19T17:35:34.267' AS DateTime), N'N', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4026, N'Lay''s', N'<p><b><u></u></b><u><b></b></u></p><blockquote><u><b></b></u><blockquote><u><b></b></u><b><u></u></b', N'General', N'High', N'1', N'Open', CAST(N'2020-09-19T17:39:53.443' AS DateTime), N'N', N'Admin')
INSERT [dbo].[CreateNewTicket_Master] ([pk], [Subject], [Description], [CategoryId], [PriorityId], [valid], [Status], [DateUpdated], [DeleteIt], [Role]) VALUES (4027, N'Paper Fry', N'<p><b>wwe</b><br></p>', N'General', N'High', N'1', N'Open', CAST(N'2020-09-19T17:52:30.747' AS DateTime), N'N', N'Admin')
SET IDENTITY_INSERT [dbo].[CreateNewTicket_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[CreateProject_Master] ON 

INSERT [dbo].[CreateProject_Master] ([pk], [ProjectName], [ProjectDates], [ProjectOwner], [ProjectModerators], [valid]) VALUES (1, N'Excellence Project', N'13.7.2020', N'Tushar', N'Vinita', N'1')
INSERT [dbo].[CreateProject_Master] ([pk], [ProjectName], [ProjectDates], [ProjectOwner], [ProjectModerators], [valid]) VALUES (2, N'VDBS Project', N'8/10/2020', N'Tushar', N'AS', N'1')
SET IDENTITY_INSERT [dbo].[CreateProject_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Dept_Master] ON 

INSERT [dbo].[Dept_Master] ([pk], [DeptCode], [DeptName], [valid]) VALUES (2, N'D2', N'Payroll', N'1')
INSERT [dbo].[Dept_Master] ([pk], [DeptCode], [DeptName], [valid]) VALUES (3, N'D3', N'Accounts', N'1')
INSERT [dbo].[Dept_Master] ([pk], [DeptCode], [DeptName], [valid]) VALUES (4, N'D4', N'Recruitment', N'1')
INSERT [dbo].[Dept_Master] ([pk], [DeptCode], [DeptName], [valid]) VALUES (5, N'D5', N'IT', N'1')
SET IDENTITY_INSERT [dbo].[Dept_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Desig_Master] ON 

INSERT [dbo].[Desig_Master] ([pk], [desigid], [designame], [grade], [valid]) VALUES (1, N'D1', N'HOD', N'1', N'1')
INSERT [dbo].[Desig_Master] ([pk], [desigid], [designame], [grade], [valid]) VALUES (2, N'D2', N'Accounting', N'1', N'1')
INSERT [dbo].[Desig_Master] ([pk], [desigid], [designame], [grade], [valid]) VALUES (3, N'D3', N'Engineering', N'2', N'1')
SET IDENTITY_INSERT [dbo].[Desig_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeList_Master] ON 

INSERT [dbo].[EmployeeList_Master] ([pk], [FirstName], [LastName], [EmailId], [MobileNumber], [Password], [valid]) VALUES (1005, N'Priyanka', N'Patel', N'priyapatel2575@gmail.com', N'7208327190', N'123', N'1')
INSERT [dbo].[EmployeeList_Master] ([pk], [FirstName], [LastName], [EmailId], [MobileNumber], [Password], [valid]) VALUES (1006, N'Jyoti', N'Saroj', N'jyotisaroj111@gmail.com', N'9029720832', N'123', N'1')
INSERT [dbo].[EmployeeList_Master] ([pk], [FirstName], [LastName], [EmailId], [MobileNumber], [Password], [valid]) VALUES (1007, N'Jenny', N'D', N'jenny@corpay.com', N'9876543212', N'123', N'1')
SET IDENTITY_INSERT [dbo].[EmployeeList_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[EmploymentStatus_Master] ON 

INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (2, N'Contract', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (3, N'Deputation', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (4, N'Full Time', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (5, N'Part Time', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (6, N'Permanent', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (7, N'Probationary', N'1')
INSERT [dbo].[EmploymentStatus_Master] ([pk], [EmploymentStatusName], [valid]) VALUES (8, N'Temporary', N'1')
SET IDENTITY_INSERT [dbo].[EmploymentStatus_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender_Master] ON 

INSERT [dbo].[Gender_Master] ([pk], [Gender], [valid]) VALUES (1, N'Male', N'1')
INSERT [dbo].[Gender_Master] ([pk], [Gender], [valid]) VALUES (3, N'Female', N'1')
SET IDENTITY_INSERT [dbo].[Gender_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade_Master] ON 

INSERT [dbo].[Grade_Master] ([pk], [GradeId], [GradeName], [valid]) VALUES (1, 1, N'A', N'1')
INSERT [dbo].[Grade_Master] ([pk], [GradeId], [GradeName], [valid]) VALUES (2, 2, N'B', N'1')
INSERT [dbo].[Grade_Master] ([pk], [GradeId], [GradeName], [valid]) VALUES (3, 3, N'C', N'1')
INSERT [dbo].[Grade_Master] ([pk], [GradeId], [GradeName], [valid]) VALUES (5, 4, N'D', N'1')
SET IDENTITY_INSERT [dbo].[Grade_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Language_Master] ON 

INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (1, N'English', N'1')
INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (2, N'French', N'1')
INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (3, N'German', N'1')
INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (4, N'Chinese', N'1')
INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (6, N'Spanish', N'1')
INSERT [dbo].[Language_Master] ([pk], [Language], [valid]) VALUES (7, N'Hindi', N'1')
SET IDENTITY_INSERT [dbo].[Language_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Location_Master] ON 

INSERT [dbo].[Location_Master] ([pk], [LocationName], [valid]) VALUES (1, N'Worli', N'1')
INSERT [dbo].[Location_Master] ([pk], [LocationName], [valid]) VALUES (2, N'Mulund', N'1')
INSERT [dbo].[Location_Master] ([pk], [LocationName], [valid]) VALUES (4, N'Thane', N'1')
SET IDENTITY_INSERT [dbo].[Location_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus_Master] ON 

INSERT [dbo].[MaritalStatus_Master] ([pk], [MaritalStatus], [valid]) VALUES (1, N'Single', N'1')
INSERT [dbo].[MaritalStatus_Master] ([pk], [MaritalStatus], [valid]) VALUES (2, N'Married', N'1')
INSERT [dbo].[MaritalStatus_Master] ([pk], [MaritalStatus], [valid]) VALUES (3, N'Divorced', N'1')
INSERT [dbo].[MaritalStatus_Master] ([pk], [MaritalStatus], [valid]) VALUES (5, N'Widowed', N'1')
SET IDENTITY_INSERT [dbo].[MaritalStatus_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[ModeofEmployment_Master] ON 

INSERT [dbo].[ModeofEmployment_Master] ([pk], [ModeofEmploymentName], [valid]) VALUES (4, N'Direct', N'1')
INSERT [dbo].[ModeofEmployment_Master] ([pk], [ModeofEmploymentName], [valid]) VALUES (5, N'Interview', N'1')
INSERT [dbo].[ModeofEmployment_Master] ([pk], [ModeofEmploymentName], [valid]) VALUES (6, N'Reference', N'1')
INSERT [dbo].[ModeofEmployment_Master] ([pk], [ModeofEmploymentName], [valid]) VALUES (7, N'Other', N'1')
SET IDENTITY_INSERT [dbo].[ModeofEmployment_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality_Master] ON 

INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (1, N'INC', N'Indian', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (2, N'ISL', N'Iceland', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (3, N'IDN', N'Indonesia', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (4, N'BRA', N'Brazil', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (5, N'CAN', N'Canada', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (6, N'CHN', N'China', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (7, N'USA', N'United States of America', N'1')
INSERT [dbo].[Nationality_Master] ([pk], [NationalityCode], [NationalityName], [valid]) VALUES (8, N'LKA', N'Sri Lanka', N'1')
SET IDENTITY_INSERT [dbo].[Nationality_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[PostReply_Master] ON 

INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (13, N'Deepak', N'Hello Guys', N'p@gmail.com', CAST(N'2020-09-09T14:40:03.000' AS DateTime), 1)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (14, N'Deepak', N'test this', N'td@gmail.com', CAST(N'2020-09-09T15:00:26.000' AS DateTime), 1)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (15, N'Deepak', N'tets 2222', N'', CAST(N'2020-09-09T15:40:10.000' AS DateTime), 1)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1002, N'Deepak', N'', N'', CAST(N'2020-10-09T18:09:04.000' AS DateTime), 1)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1003, N'Deepak', N'', N'', CAST(N'2020-10-09T18:09:13.000' AS DateTime), 1)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1004, N'Deepak', N'Testing....', N't@gmail.com', CAST(N'2020-10-09T18:43:34.000' AS DateTime), 3002)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1005, N'Deepak', N'ddmscmf', N'ddm,sd', CAST(N'2020-11-09T19:40:07.000' AS DateTime), 3007)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1006, N'Deepak', N'Ticket', N'm@', CAST(N'2020-09-14T17:48:11.000' AS DateTime), 3008)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (1007, N'Deepak', N'<p>To Test</p>', N't@gmail.com', CAST(N'2020-09-15T10:49:40.000' AS DateTime), 3006)
INSERT [dbo].[PostReply_Master] ([pk], [Username], [ReplyMessage], [BCC], [DatePosted], [TicketId]) VALUES (2007, N'Deepak', N'<p>abc</p>', N'qq', CAST(N'2020-09-19T14:20:29.000' AS DateTime), 1002)
SET IDENTITY_INSERT [dbo].[PostReply_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Prefix_Master] ON 

INSERT [dbo].[Prefix_Master] ([pk], [Prefix], [Description], [valid]) VALUES (1, N'Miss', N'It is used for unmarried women.', N'1')
INSERT [dbo].[Prefix_Master] ([pk], [Prefix], [Description], [valid]) VALUES (3, N'Mr', N'It Is Used For Unmarried or married men.', N'1')
INSERT [dbo].[Prefix_Master] ([pk], [Prefix], [Description], [valid]) VALUES (4, N'Mrs', N'It Is Used For married Women.', N'1')
SET IDENTITY_INSERT [dbo].[Prefix_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Priority_Master] ON 

INSERT [dbo].[Priority_Master] ([pk], [Priority], [valid]) VALUES (2, N'High', N'1')
INSERT [dbo].[Priority_Master] ([pk], [Priority], [valid]) VALUES (3, N'Medium', N'1')
INSERT [dbo].[Priority_Master] ([pk], [Priority], [valid]) VALUES (5, N'Low', N'1')
SET IDENTITY_INSERT [dbo].[Priority_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Role_Master] ON 

INSERT [dbo].[Role_Master] ([pk], [RoleId], [RoleName], [Valid]) VALUES (1, N'R1', N'Admin', N'1')
INSERT [dbo].[Role_Master] ([pk], [RoleId], [RoleName], [Valid]) VALUES (3, N'R2', N'Supervisor', N'1')
INSERT [dbo].[Role_Master] ([pk], [RoleId], [RoleName], [Valid]) VALUES (1002, N'R3', N'Client', N'1')
INSERT [dbo].[Role_Master] ([pk], [RoleId], [RoleName], [Valid]) VALUES (1003, N'R4', N'Employee', N'1')
SET IDENTITY_INSERT [dbo].[Role_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Master] ON 

INSERT [dbo].[Status_Master] ([pk], [Status], [valid]) VALUES (1, N'Open', N'1')
INSERT [dbo].[Status_Master] ([pk], [Status], [valid]) VALUES (2, N'Pending', N'1')
INSERT [dbo].[Status_Master] ([pk], [Status], [valid]) VALUES (3, N'Close', N'1')
SET IDENTITY_INSERT [dbo].[Status_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Task_Master] ON 

INSERT [dbo].[Task_Master] ([pk], [TaskName], [ResponsiblePerson], [CreatesBy], [Participants], [AssignedDate], [DeadLineDate], [DependentTask], [SubTaskOf], [valid]) VALUES (2, N'Import the Files', N'Tushar', N'Sandeep', N'Vinita', N'03/08/2020', N'15:7:2020', N'Priyanka', N'Sub Files', N'1')
INSERT [dbo].[Task_Master] ([pk], [TaskName], [ResponsiblePerson], [CreatesBy], [Participants], [AssignedDate], [DeadLineDate], [DependentTask], [SubTaskOf], [valid]) VALUES (3, N'Bind Data', N'Sandeep', N'Vinita', N'Priya', N'10/08/2020', N'14/08/2020', N'Viraj', N'Sub Data', N'1')
INSERT [dbo].[Task_Master] ([pk], [TaskName], [ResponsiblePerson], [CreatesBy], [Participants], [AssignedDate], [DeadLineDate], [DependentTask], [SubTaskOf], [valid]) VALUES (4, N'Model View', N'Leena', N'Reeta', N'Suchita', N'10/08/2020', N'14/08/2020', N'Pooja', N'Mid Model', N'1')
INSERT [dbo].[Task_Master] ([pk], [TaskName], [ResponsiblePerson], [CreatesBy], [Participants], [AssignedDate], [DeadLineDate], [DependentTask], [SubTaskOf], [valid]) VALUES (5, N'Multiple Target', N'Rajesh', N'Sandeep', N'Vinita', N'05/08/2020', N'18/08/2020', N'Priya', N'Targeting to Database', N'1')
SET IDENTITY_INSERT [dbo].[Task_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketFile_Master] ON 

INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (0, N'08092020115615.jpg', 1)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (1, N'08092020172502', 1001)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2, N'08092020172818.pdf', 1002)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (3, N'08092020191832.txt', 1003)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4, N'09092020101303.txt', 1004)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (5, N'09092020123628.pdf', 1005)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (8, N'09092020125454.xlsx', 1006)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (9, N'09092020143225.txt', 1007)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (10, N'09092020143710.txt', 1008)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (11, N'09092020145943', 1009)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (12, N'09092020153932', 1010)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (13, N'09092020161600', 1011)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (1001, N'10092020131406.pdf', 2001)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (1002, N'10092020134647.pdf', 2002)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (1003, N'10092020170945.sql', 2003)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2001, N'10092020174237.txt', 3001)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2002, N'10092020174237.txt', 3001)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2003, N'10092020184229.pdf', 3002)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2004, N'10092020184229.txt', 3002)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2005, N'11092020110614.pdf', 3003)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2006, N'11092020110614.txt', 3003)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2007, N'11092020165420.txt', 3004)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2008, N'11092020165421.txt', 3004)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2009, N'11092020170314', 3005)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2010, N'11092020190328', 3006)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2011, N'11092020193809.pdf', 3007)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2012, N'11092020193810.txt', 3007)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2013, N'14092020174747.txt', 3008)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (2014, N'17092020160331.pdf', 3009)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (3018, N'18092020154023.pdf', 3010)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4016, N'19092020130241.png', 4010)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4017, N'19092020131833', 4011)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4018, N'19092020132742.txt', 4012)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4019, N'19092020132822', 4013)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4020, N'19092020132850', 4014)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4021, N'19092020132910', 4015)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4022, N'19092020152921.txt', 4016)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4023, N'19092020153151.txt', 4017)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4024, N'19092020153952', 4018)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4025, N'19092020162307', 4019)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4026, N'19092020171438.pdf', 4024)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4027, N'19092020175230.txt', 4027)
INSERT [dbo].[TicketFile_Master] ([pk], [FileName], [TicketId]) VALUES (4028, N'19092020175230.txt', 4027)
SET IDENTITY_INSERT [dbo].[TicketFile_Master] OFF
GO
INSERT [dbo].[UserLogin] ([loginid], [UserEmail], [password], [Role]) VALUES (N'Deepak Sahani', N'dmsahani@gmail.com', N'123', N'Admin')
INSERT [dbo].[UserLogin] ([loginid], [UserEmail], [password], [Role]) VALUES (N'Priyanka Patel', N'priyapatel2575@gmail.com', N'123', N'User')
GO
ALTER TABLE [dbo].[TicketFile_Master]  WITH CHECK ADD  CONSTRAINT [FK__TicketFil__Ticke__2EA5EC27] FOREIGN KEY([TicketId])
REFERENCES [dbo].[CreateNewTicket_Master] ([pk])
GO
ALTER TABLE [dbo].[TicketFile_Master] CHECK CONSTRAINT [FK__TicketFil__Ticke__2EA5EC27]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCreateNewTicket]    Script Date: 9/19/2020 6:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCreateNewTicket] 
	@pk int,
	@Subject nvarchar(100),
	@Description nvarchar(100),
	@CategoryId nvarchar(100),
	@PriorityId nvarchar(100), 
	@Status nvarchar(100),
	@DateUpdated DateTime,
	@DeleteIt nchar(1),
	@Role nvarchar(100)
	--@TicketId int output

AS
BEGIN
		SET NOCOUNT ON;

		INSERT INTO Excellence.dbo.CreateNewTicket_Master(Subject,Description,CategoryId,PriorityId,valid,Status,DateUpdated,DeleteIt,Role)
		VALUES(@Subject,@Description,@CategoryId,@PriorityId,'1',@Status,@DateUpdated,@DeleteIt,@Role)
		SET @pk=@@IDENTITY
		RETURN @pk
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTicketFileMaster]    Script Date: 9/19/2020 6:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTicketFileMaster] 

	
	@TicketId int out,
	@FileName nvarchar(100),
	--@ContentType nvarchar(200),
	--@Data varbinary(max),
	@pk int 
	

AS
BEGIN
		SET NOCOUNT ON;
		
		INSERT INTO Excellence.dbo.TicketFile_Master(FileName,TicketId)
		VALUES(@FileName,@TicketId)
		SET @pk=@@IDENTITY
		RETURN @pk
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTicketFileMaster1]    Script Date: 9/19/2020 6:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTicketFileMaster1] 

	
	@TicketId int output,
	@FileName nvarchar(100)
	--@ContentType nvarchar(200),
	--@Data varbinary(max),
	--@pk int output
	

AS
BEGIN
		SET NOCOUNT ON;
		
		INSERT INTO Excellence.dbo.TicketFile_Master(FileName,TicketId)
		VALUES(@FileName,@TicketId)
		--SET @pk=@@IDENTITY
		--RETURN @pk
END
GO
USE [master]
GO
ALTER DATABASE [Excellence] SET  READ_WRITE 
GO
