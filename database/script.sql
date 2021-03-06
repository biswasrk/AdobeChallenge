USE [master]
GO
/****** Object:  Database [PortfolioDB]    Script Date: 10/5/2016 5:26:01 PM ******/
CREATE DATABASE [PortfolioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PortfolioDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PortfolioDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PortfolioDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PortfolioDB_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PortfolioDB] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PortfolioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PortfolioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PortfolioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PortfolioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PortfolioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PortfolioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PortfolioDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PortfolioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PortfolioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PortfolioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PortfolioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PortfolioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PortfolioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PortfolioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PortfolioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PortfolioDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PortfolioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PortfolioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PortfolioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PortfolioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PortfolioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PortfolioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PortfolioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PortfolioDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PortfolioDB] SET  MULTI_USER 
GO
ALTER DATABASE [PortfolioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PortfolioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PortfolioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PortfolioDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PortfolioDB]
GO
/****** Object:  User [seafarer007]    Script Date: 10/5/2016 5:26:01 PM ******/
CREATE USER [seafarer007] FOR LOGIN [seafarer007] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carousel]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[User_Id] [int] NULL,
	[Portfolio_Id] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](100) NULL,
	[DocumentLocation] [nvarchar](100) NULL,
	[DocumentDescription] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Experience]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[JobStartDate] [datetime] NOT NULL,
	[JobEndDate] [datetime] NULL,
	[JobDescription] [nvarchar](max) NOT NULL,
	[JobLocation] [nvarchar](50) NOT NULL,
	[User_Id] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Portfolio_Id] [int] NOT NULL,
 CONSTRAINT [PK_Experience] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mission]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MissionStatement] [nvarchar](max) NOT NULL,
	[Highlight1] [nvarchar](100) NULL,
	[Highlight2] [nvarchar](100) NULL,
	[Highlight3] [nvarchar](100) NULL,
	[ResumeId] [int] NULL,
	[Portfolio_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Mission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [nvarchar](50) NULL,
	[OrganizationPosition] [nvarchar](50) NULL,
	[User_Id] [int] NULL,
	[Portfolio_Id] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PM_Roles]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PM_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PM_Users]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Salt] [nvarchar](200) NULL,
 CONSTRAINT [PK_PM_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PortfolioName] [nvarchar](50) NOT NULL,
	[IsActive] [nchar](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Portfolio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Image] [image] NULL,
	[ImageType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resumes]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resumes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResumeName] [nvarchar](50) NULL,
	[ResumeLocation] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[User_Id] [int] NOT NULL,
 CONSTRAINT [PK_Resumes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 10/5/2016 5:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill] [nvarchar](20) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Portfolio_Id] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Carousel]  WITH CHECK ADD  CONSTRAINT [FK_Carousel_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[Carousel] CHECK CONSTRAINT [FK_Carousel_Document]
GO
ALTER TABLE [dbo].[Carousel]  WITH CHECK ADD  CONSTRAINT [FK_Carousel_PM_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Carousel] CHECK CONSTRAINT [FK_Carousel_PM_Users]
GO
ALTER TABLE [dbo].[Carousel]  WITH CHECK ADD  CONSTRAINT [FK_Carousel_Portfolio] FOREIGN KEY([Portfolio_Id])
REFERENCES [dbo].[Portfolio] ([ID])
GO
ALTER TABLE [dbo].[Carousel] CHECK CONSTRAINT [FK_Carousel_Portfolio]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_PM_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_PM_Users]
GO
ALTER TABLE [dbo].[Experience]  WITH CHECK ADD  CONSTRAINT [FK_Experience_Experience] FOREIGN KEY([Portfolio_Id])
REFERENCES [dbo].[Portfolio] ([ID])
GO
ALTER TABLE [dbo].[Experience] CHECK CONSTRAINT [FK_Experience_Experience]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_PM_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_PM_Users]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_Portfolio] FOREIGN KEY([Portfolio_ID])
REFERENCES [dbo].[Portfolio] ([ID])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_Portfolio]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_Resumes] FOREIGN KEY([ResumeId])
REFERENCES [dbo].[Resumes] ([ID])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_Resumes]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Portfolio] FOREIGN KEY([Portfolio_Id])
REFERENCES [dbo].[Portfolio] ([ID])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_Portfolio]
GO
ALTER TABLE [dbo].[PM_Users]  WITH CHECK ADD  CONSTRAINT [FK_PM_Users_PM_Roles] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[PM_Roles] ([ID])
GO
ALTER TABLE [dbo].[PM_Users] CHECK CONSTRAINT [FK_PM_Users_PM_Roles]
GO
ALTER TABLE [dbo].[Portfolio]  WITH CHECK ADD  CONSTRAINT [FK_Portfolio_PM_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Portfolio] CHECK CONSTRAINT [FK_Portfolio_PM_Users]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Profile] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Profile]
GO
ALTER TABLE [dbo].[Resumes]  WITH CHECK ADD  CONSTRAINT [FK_Resumes_PM_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Resumes] CHECK CONSTRAINT [FK_Resumes_PM_Users]
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD  CONSTRAINT [FK_Skill_PM_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[PM_Users] ([ID])
GO
ALTER TABLE [dbo].[Skill] CHECK CONSTRAINT [FK_Skill_PM_Users]
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD  CONSTRAINT [FK_Skill_Portfolio] FOREIGN KEY([Portfolio_Id])
REFERENCES [dbo].[Portfolio] ([ID])
GO
ALTER TABLE [dbo].[Skill] CHECK CONSTRAINT [FK_Skill_Portfolio]
GO
USE [master]
GO
ALTER DATABASE [PortfolioDB] SET  READ_WRITE 
GO
