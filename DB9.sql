USE [master]
GO
/****** Object:  Database [DB9]    Script Date: 4/14/2019 12:17:39 AM ******/
CREATE DATABASE [DB9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FATIMAKHALIL\MSSQL\DATA\DB9.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FATIMAKHALIL\MSSQL\DATA\DB9_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB9] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [DB9] SET RECOVERY FULL 
GO
ALTER DATABASE [DB9] SET  MULTI_USER 
GO
ALTER DATABASE [DB9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB9] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB9] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB9', N'ON'
GO
ALTER DATABASE [DB9] SET QUERY_STORE = OFF
GO
USE [DB9]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 4/14/2019 12:17:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[InstructorName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[ConfirmPassword] [varchar](100) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Contact] [varchar](20) NULL,
	[Gender] [varchar](10) NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourses]    Script Date: 4/14/2019 12:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourses](
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InstructorCourses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineCourse]    Script Date: 4/14/2019 12:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineCourse](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[CourseContent] [varchar](max) NULL,
	[CourseFee] [decimal](18, 0) NOT NULL,
	[CourseDuration] [varchar](20) NOT NULL,
 CONSTRAINT [PK_OnlineCourse] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/14/2019 12:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[Password] [varchar](100) NOT NULL,
	[ConfirmPassword] [varchar](100) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Contact] [varchar](20) NULL,
	[Gender] [char](1) NULL,
	[EnrollmentDate] [datetime] NOT NULL,
	[UserType] [char](1) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 4/14/2019 12:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Option1] [nvarchar](100) NOT NULL,
	[Option2] [nvarchar](100) NOT NULL,
	[Option3] [nvarchar](100) NOT NULL,
	[Option4] [nvarchar](100) NOT NULL,
	[CorrectAnswer] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBank]    Script Date: 4/14/2019 12:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBank](
	[QuestionId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
	[Added_On] [datetime] NOT NULL,
 CONSTRAINT [PK_QuestionBank] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC,
	[CourseId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultData]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultData](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[InstuctorId] [int] NOT NULL,
	[ResultId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
 CONSTRAINT [PK_ResultData] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC,
	[InstuctorId] ASC,
	[ResultId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] NOT NULL,
	[RegistrationNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFees]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFees](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentFee] [decimal](18, 0) NOT NULL,
	[SubmissionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentFees] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestData]    Script Date: 4/14/2019 12:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestData](
	[TestId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_TestData] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC,
	[CourseId] ASC,
	[QuestionId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InstructorCourses]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourses_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[InstructorCourses] CHECK CONSTRAINT [FK_InstructorCourses_Instructor]
GO
ALTER TABLE [dbo].[InstructorCourses]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourses_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[InstructorCourses] CHECK CONSTRAINT [FK_InstructorCourses_OnlineCourse]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_QuestionBank_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK_QuestionBank_Instructor]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_QuestionBank_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK_QuestionBank_OnlineCourse]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_QuestionBank_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK_QuestionBank_Question]
GO
ALTER TABLE [dbo].[ResultData]  WITH CHECK ADD  CONSTRAINT [FK_ResultData_Instructor] FOREIGN KEY([InstuctorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[ResultData] CHECK CONSTRAINT [FK_ResultData_Instructor]
GO
ALTER TABLE [dbo].[ResultData]  WITH CHECK ADD  CONSTRAINT [FK_ResultData_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[ResultData] CHECK CONSTRAINT [FK_ResultData_OnlineCourse]
GO
ALTER TABLE [dbo].[ResultData]  WITH CHECK ADD  CONSTRAINT [FK_ResultData_Result] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([ResultId])
GO
ALTER TABLE [dbo].[ResultData] CHECK CONSTRAINT [FK_ResultData_Result]
GO
ALTER TABLE [dbo].[ResultData]  WITH CHECK ADD  CONSTRAINT [FK_ResultData_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[ResultData] CHECK CONSTRAINT [FK_ResultData_Student]
GO
ALTER TABLE [dbo].[ResultData]  WITH CHECK ADD  CONSTRAINT [FK_ResultData_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([TestId])
GO
ALTER TABLE [dbo].[ResultData] CHECK CONSTRAINT [FK_ResultData_Test]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_OnlineCourse]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Student]
GO
ALTER TABLE [dbo].[StudentFees]  WITH CHECK ADD  CONSTRAINT [FK_StudentFees_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[StudentFees] CHECK CONSTRAINT [FK_StudentFees_OnlineCourse]
GO
ALTER TABLE [dbo].[StudentFees]  WITH CHECK ADD  CONSTRAINT [FK_StudentFees_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentFees] CHECK CONSTRAINT [FK_StudentFees_Student]
GO
ALTER TABLE [dbo].[TestData]  WITH CHECK ADD  CONSTRAINT [FK_TestData_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[TestData] CHECK CONSTRAINT [FK_TestData_Instructor]
GO
ALTER TABLE [dbo].[TestData]  WITH CHECK ADD  CONSTRAINT [FK_TestData_OnlineCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[OnlineCourse] ([CourseId])
GO
ALTER TABLE [dbo].[TestData] CHECK CONSTRAINT [FK_TestData_OnlineCourse]
GO
ALTER TABLE [dbo].[TestData]  WITH CHECK ADD  CONSTRAINT [FK_TestData_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[TestData] CHECK CONSTRAINT [FK_TestData_Question]
GO
ALTER TABLE [dbo].[TestData]  WITH CHECK ADD  CONSTRAINT [FK_TestData_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([TestId])
GO
ALTER TABLE [dbo].[TestData] CHECK CONSTRAINT [FK_TestData_Test]
GO
USE [master]
GO
ALTER DATABASE [DB9] SET  READ_WRITE 
GO
