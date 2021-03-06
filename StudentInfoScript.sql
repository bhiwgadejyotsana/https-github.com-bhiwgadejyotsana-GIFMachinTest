USE [StudentInfo]
GO
/****** Object:  StoredProcedure [dbo].[UspStudentList]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UspStudentList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UspStudentList]
GO
/****** Object:  StoredProcedure [dbo].[UspGetStudent]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UspGetStudent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UspGetStudent]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
DROP TABLE [dbo].[tblUser]
GO
/****** Object:  Table [dbo].[tblStudentClass]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStudentClass]') AND type in (N'U'))
DROP TABLE [dbo].[tblStudentClass]
GO
/****** Object:  Table [dbo].[tblSchoolClass]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSchoolClass]') AND type in (N'U'))
DROP TABLE [dbo].[tblSchoolClass]
GO
/****** Object:  Table [dbo].[tblParentStudent]    Script Date: 7/17/2021 6:01:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblParentStudent]') AND type in (N'U'))
DROP TABLE [dbo].[tblParentStudent]
GO
/****** Object:  Table [dbo].[tblParentStudent]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblParentStudent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblParentStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_tblParentStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblSchoolClass]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSchoolClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSchoolClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblSchoolClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblStudentClass]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblStudentClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblStudentClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_tblStudentClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[UserType] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Active] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[tblParentStudent] ON 

INSERT [dbo].[tblParentStudent] ([Id], [ParentId], [StudentId]) VALUES (1, 2, 1)
INSERT [dbo].[tblParentStudent] ([Id], [ParentId], [StudentId]) VALUES (2, 2, 3)
SET IDENTITY_INSERT [dbo].[tblParentStudent] OFF
SET IDENTITY_INSERT [dbo].[tblSchoolClass] ON 

INSERT [dbo].[tblSchoolClass] ([Id], [Name]) VALUES (1, N'KG1')
INSERT [dbo].[tblSchoolClass] ([Id], [Name]) VALUES (2, N'KG2')
SET IDENTITY_INSERT [dbo].[tblSchoolClass] OFF
SET IDENTITY_INSERT [dbo].[tblStudentClass] ON 

INSERT [dbo].[tblStudentClass] ([Id], [StudentId], [ClassId]) VALUES (1, 1, 1)
INSERT [dbo].[tblStudentClass] ([Id], [StudentId], [ClassId]) VALUES (2, 3, 2)
SET IDENTITY_INSERT [dbo].[tblStudentClass] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (1, N'Aaradhya', N'Bhivgade', N'4', N'priyab@gmail.com', N'8600873002', N'Active')
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (2, N'Jyotsna', N'Bhivgade', N'5', N'jyotsana@gmail.com', N'99999999', N'Inactive')
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (3, N'Surya', N'Bhivgade', N'4', N'Jotsna@gmail.com', N'8600873001', N'Inactive')
INSERT [dbo].[tblUser] ([Id], [FirstName], [LastName], [UserType], [Email], [Phone], [Active]) VALUES (4, NULL, NULL, NULL, NULL, NULL, N'Yes')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
/****** Object:  StoredProcedure [dbo].[UspGetStudent]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UspGetStudent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UspGetStudent] AS' 
END
GO
ALTER procedure [dbo].[UspGetStudent]
@Id int
As
BEGIN

SELECT U.Id,U.FirstName+' '+U.LastName AS StudentName,UU.FirstName+' '+UU.LastName AS ParentName,SC.Name AS StudentClass,UU.Email AS ParentEmail,UU.Phone AS ParentMobile,U.Active,CL.ClassId,PS.ParentId
From tblUser U INNER JOIN tblParentStudent PS ON U.Id=PS.StudentId
INNER JOIN tblUser UU  ON UU.Id=PS.ParentId 
INNER JOIN tblStudentClass CL ON PS.StudentId=CL.StudentId
INNER JOIN tblSchoolClass SC ON CL.ClassId=SC.Id
where U.Id=@Id
END 

GO
/****** Object:  StoredProcedure [dbo].[UspStudentList]    Script Date: 7/17/2021 6:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UspStudentList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UspStudentList] AS' 
END
GO
ALTER procedure [dbo].[UspStudentList]
As
BEGIN

SELECT U.Id,U.FirstName+' '+U.LastName AS StudentName,UU.FirstName+' '+UU.LastName AS ParentName,SC.Name AS StudentClass,UU.Email AS ParentEmail,UU.Phone AS ParentMobile,U.Active
From tblUser U INNER JOIN tblParentStudent PS ON U.Id=PS.StudentId
INNER JOIN tblUser UU  ON UU.Id=PS.ParentId 
INNER JOIN tblStudentClass CL ON PS.StudentId=CL.StudentId
INNER JOIN tblSchoolClass SC ON CL.ClassId=SC.Id

END 

GO
