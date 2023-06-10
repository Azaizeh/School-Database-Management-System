USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 2/5/2023 8:35:37 PM ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDB', N'ON'
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = OFF
GO
USE [SchoolDB]
GO
/****** Object:  User [SchoolUser]    Script Date: 2/5/2023 8:35:39 PM ******/
CREATE USER [SchoolUser] FOR LOGIN [SchoolUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SchoolUser]
GO
/****** Object:  Table [dbo].[ArchivedGrade]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchivedGrade](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NULL,
	[Grade] [decimal](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArchivedStudent]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchivedStudent](
	[StudentId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ClassId] [int] NULL,
	[PhoneNo] [varchar](12) NULL,
	[Gender] [char](1) NOT NULL,
	[StudentAddress] [varchar](500) NULL,
	[DOB] [date] NOT NULL,
	[Descreption] [varchar](50) NULL,
	[Age] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArchivedStudentCourse]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchivedStudentCourse](
	[CourseId] [int] NULL,
	[StudentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](150) NOT NULL,
	[SchoolId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Class__CB1927C061EB214C] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[SchoolId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Courses__C92D71A79ECA02FD] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NULL,
	[Grade] [decimal](5, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[SchoolId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [varchar](150) NOT NULL,
	[SchoolAddress] [varchar](500) NOT NULL,
	[PhoneNo] [char](12) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__School__3DA4675B92967D20] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ClassId] [int] NULL,
	[PhoneNo] [varchar](12) NULL,
	[Gender] [char](1) NOT NULL,
	[StudentAddress] [varchar](500) NULL,
	[DOB] [date] NOT NULL,
	[Descreption] [varchar](50) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK__Student__32C52B998ACF104F] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCopy]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCopy](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ClassId] [int] NULL,
	[PhoneNo] [varchar](12) NULL,
	[Gender] [char](1) NOT NULL,
	[StudentAddress] [varchar](500) NULL,
	[DOB] [date] NOT NULL,
	[Descreption] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[CourseId] [int] NULL,
	[StudentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNo] [char](12) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[TeacherAddress] [varchar](500) NULL,
	[DOB] [date] NOT NULL,
	[Salary] [decimal](10, 3) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Teacher__EDF25964E115F4C0] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourse]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourse](
	[CourseId] [int] NULL,
	[TeacherId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK__Class__SchoolId__412EB0B6] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([SchoolId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK__Class__SchoolId__412EB0B6]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK__Courses__SchoolI__440B1D61] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[School] ([SchoolId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK__Courses__SchoolI__440B1D61]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK__Grade__CourseId__52593CB8] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK__Grade__CourseId__52593CB8]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK__Grade__StudentId__534D60F1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK__Grade__StudentId__534D60F1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_ClassId]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[TeacherCourse]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherCourse]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [CHK_Grade] CHECK  (([Grade]>=(0) AND [Grade]<=(100)))
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [CHK_Grade]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CHK_Student] CHECK  (([Gender]='M' OR [Gender]='F'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CHK_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [CHK_Teacher] CHECK  (([Gender]='M' OR [Gender]='F'))
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [CHK_Teacher]
GO
/****** Object:  StoredProcedure [dbo].[Deactiveclass]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Deactiveclass]
	@Classid int
	as
	begin
	    update Class
		set IsActive = 0
		where Classid = @Classid
		end 
GO
/****** Object:  StoredProcedure [dbo].[Deactivecourses]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		create procedure [dbo].[Deactivecourses]
	@courseId int
	as
	begin
	    update Courses
		set IsActive = 0
		where courseId = @courseId
		end 
GO
/****** Object:  StoredProcedure [dbo].[Deactiveschool]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[Deactiveschool]
	@schoolId int
	as
	begin
	    update school
		set IsActive = 0
		where schoolId = @schoolId
		end 
GO
/****** Object:  StoredProcedure [dbo].[DeactiveTeacher]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeactiveTeacher]
	@TeacherId int
	as
	begin
	
	    update Teacher
		set IsActive = 0
		where TeacherId = @TeacherId
		end 
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteStudentInformation]
	@studentid int 
	 as 
	 begin
	
	insert into ArchivedStudent
	select Studentid,FirstName,LastName,ClassId,PhoneNo,Gender,
	StudentAddress,DOB,[Descreption],age
	from Student
	where studentid = @studentid

	insert into ArchivedGrade
	select CourseId,StudentId,Grade
	from Grade
	where studentid = @studentid

	insert into ArchivedStudentCourse
	select CourseId,StudentId
	from StudentCourse
	where studentid = @studentid

	delete from grade 
	where studentid = @studentid

	delete from StudentCourse 
	where studentid = @studentid

	delete from Student 
	where studentid = @studentid

	end
GO
/****** Object:  StoredProcedure [dbo].[GetClassStudentByClassId]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetClassStudentByClassId]
	@classid  int
	 as 
	 begin
	select s.StudentId,concat_ws (' ',s.FirstName,s.LastName) fullnameStudent
	from Class cl
	inner join student s on cl.ClassId = s.ClassId
	where cl.classid = @classid
	end
GO
/****** Object:  StoredProcedure [dbo].[GetSchoolStudentByStudentID]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSchoolStudentByStudentID]
	@schoolid  int
	 as 
	 begin
	select  s.StudentId,concat_ws(' ',s.FirstName,s.LastName) fullnameStudent
	from  class cl 
	inner join student s on cl.ClassId = cl.ClassId
	where cl.SchoolId = @schoolid

	end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentAVG]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetStudentAVG]
	@studentid  int
	 as 
	 begin
	select s.StudentId,concat_ws (' ',s.FirstName,s.LastName) fullnameStudent,cast ( Avg(g.grade)as decimal(10,2)) avg
	from  grade g 
	inner join student s on g.StudentId = s.StudentId
	where s.StudentId = @studentid
	group by s.StudentId,concat_ws (' ',s.FirstName,s.LastName) 

	end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentCoursesByStudentID]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[GetStudentCoursesByStudentID]
	@studentid  int
	 as 
	 begin
	select c.courseid,c.coursename
	from student s
	inner join studentcourse stdco on s.StudentId = stdco.StudentId
	inner join courses c on stdco.CourseId = c.CourseId
	where s.StudentId = @studentid
	end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	 CREATE procedure [dbo].[GetStudentInformation]
	 as 
	 begin
	select concat_ws (' ',std.FirstName,std.LastName)fullname ,std.DOB,cl.ClassName,s.SchoolName,std.StudentAddress,std.PhoneNo
	from student std
	left join class cl  on std.ClassId= cl.ClassId
	left join School s on  cl.SchoolId = s.SchoolId 
	end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentInformationByStudentID]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetStudentInformationByStudentID]
	@studentid int 
	 as 
	 begin
	select concat_ws (' ',std.FirstName,std.LastName)fullname ,std.DOB,cl.ClassName,s.SchoolName,std.StudentAddress,std.PhoneNo
	from student std
	left join class cl  on std.ClassId= cl.ClassId
	left join School s on  cl.SchoolId = s.SchoolId 
	where std.StudentId = @studentid
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTeacherInformationByTeacherID]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetTeacherInformationByTeacherID]
	@teacherid  int
	 as 
	 begin
	select concat_ws (' ',FirstName,LastName)fullname ,PhoneNo,
	case when gender = 'F' then 'Female' else 'Male' end ,TeacherAddress,convert(varchar,dob,103)DOB
	from Teacher T
	where TeacherId = @teacherid
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTeacherStudentBYTeacherID]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create procedure [dbo].[GetTeacherStudentBYTeacherID]
	@Teacherid  int
	 as 
	 begin
	select s.StudentId,concat_ws (' ',t.FirstName,t.LastName) fullname
	from teacher t
	inner join TeacherCourse tc on t.TeacherId = tc.TeacherId
	inner join StudentCourse sc on tc.CourseId = sc.CourseId
	inner join Student s on sc.StudentId = s.StudentId
	where t.teacherid = @Teacherid
	end
GO
/****** Object:  StoredProcedure [dbo].[InsertclassInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertclassInformation]
@className nvarchar(50),
@schoolid  int


as 
begin

      insert into Class
	  (ClassName,SchoolId,isactive)
	  values
	(@ClassName,@SchoolId,1)

	 END
GO
/****** Object:  StoredProcedure [dbo].[InsertcoursesInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[InsertcoursesInformation]
@courseName nvarchar(50),
@schoolid int

as 
begin

      insert into Courses
	  (CourseName,SchoolId,isactive)
	  values
	(@courseName,@SchoolId,1)
	end
GO
/****** Object:  StoredProcedure [dbo].[InsertschoolInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create procedure [dbo].[InsertschoolInformation]
@schoolName nvarchar(50),
@schooladdress varchar(500),
@phoneno char(12)

as 
begin

      insert into School
	  (SchoolName,SchoolAddress,PhoneNo,isactive)
	  values
	(@SchoolName,@SchoolAddress,@PhoneNo,1)
	end
GO
/****** Object:  StoredProcedure [dbo].[InsertTeacherInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertTeacherInformation]
@FirstName nvarchar(50),
@LastName  nvarchar(50),
@PhoneNo char(12),
@Gender char(1),
@TeacherAddress varchar(500),
@DOB date,
@Salary Decimal(10,3)

as 
begin

      insert into Teacher
	  (FirstName,LastName,PhoneNo,Gender,TeacherAddress,DOB,Salary,Isactive)
	  values
	(@FirstName,@LastName,@PhoneNo,@Gender,@TeacherAddress,@DOB,@Salary,1)

	 END
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectStudentInformation]
	 as 
	 begin
	
	select concat_ws (' ',std.FirstName,std.LastName),std.DOB,cl.ClassName,s.SchoolName,std.StudentAddress,std.PhoneNo
	from student std
	left join class cl  on std.ClassId= cl.ClassId
	left join School s on  cl.SchoolId = s.SchoolId 
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateStudentInformation]      
@studentid int,
@ClassId int,
@PhoneNo char(12),
@StudentAddress varchar(500),
@Description varchar(50)

as 
begin

      update Student
	 set phoneno = isnull (@phoneno,phoneno),
	     ClassId=isnull(@ClassId,ClassId),
		 StudentAddress = isnull(@StudentAddress,StudentAddress),
	[Descreption]= isnull(@Description, [Descreption])
where studentid = @studentid

	 END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeacherInformation]    Script Date: 2/5/2023 8:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create procedure [dbo].[UpdateTeacherInformation]
@Teacherid int,
@PhoneNo char(12),
@TeacherAddress varchar(500),
@Salary Decimal(10,3)

as 
begin

      update Teacher
	 set phoneno = isnull (@phoneno,phoneno),
		 TeacherAddress = isnull(@TeacherAddress,TeacherAddress),
		Salary = isnull (@Salary,Salary)
	
where TeacherId = @Teacherid

	 END
GO
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO
