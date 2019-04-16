USE [master]
GO
/****** Object:  Database [DB9]    Script Date: 4/16/2019 6:15:57 PM ******/
CREATE DATABASE [DB9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB9.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB9_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB9] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB9] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB9] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB9] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB9] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB9] SET  MULTI_USER 
GO
ALTER DATABASE [DB9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB9] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB9] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB9]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[Duration] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[Fee] [float] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NULL,
	[Salary] [float] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstructorCourse]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourse](
	[InstructorCourseID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_InstructorCourse] PRIMARY KEY CLUSTERED 
(
	[InstructorCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstructorTest]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorTest](
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Option1] [nvarchar](100) NULL,
	[Option2] [nvarchar](100) NULL,
	[Option3] [nvarchar](100) NULL,
	[Option4] [nvarchar](100) NULL,
	[CorrectAnswer] [nvarchar](100) NULL,
 CONSTRAINT [PK_InstructorTest] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConfirmPassword] [nvarchar](50) NOT NULL,
	[UserType] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[PersonID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[StudentCourseID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCourseFee]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourseFee](
	[StudentCourseFeeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[TotalFee] [float] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentCourseFee] PRIMARY KEY CLUSTERED 
(
	[StudentCourseFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/16/2019 6:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[PersonID] [int] NOT NULL,
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Person] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Person]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Course]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Instructor]
GO
ALTER TABLE [dbo].[InstructorTest]  WITH CHECK ADD  CONSTRAINT [FK_InstructorTest_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorTest] CHECK CONSTRAINT [FK_InstructorTest_Course]
GO
ALTER TABLE [dbo].[InstructorTest]  WITH CHECK ADD  CONSTRAINT [FK_InstructorTest_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[InstructorTest] CHECK CONSTRAINT [FK_InstructorTest_Instructor]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Person]
GO
ALTER TABLE [dbo].[StudentCourseFee]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseFee_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourseFee] CHECK CONSTRAINT [FK_StudentCourseFee_Course]
GO
ALTER TABLE [dbo].[StudentCourseFee]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseFee_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentCourseFee] CHECK CONSTRAINT [FK_StudentCourseFee_Person]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Person]
GO
USE [master]
GO
ALTER DATABASE [DB9] SET  READ_WRITE 
GO
