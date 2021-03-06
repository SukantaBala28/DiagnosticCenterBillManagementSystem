USE [master]
GO
/****** Object:  Database [DiagonosticCenterDB]    Script Date: 8/1/2016 9:26:12 AM ******/
CREATE DATABASE [DiagonosticCenterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagonosticCenterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagonosticCenterDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagonosticCenterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagonosticCenterDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagonosticCenterDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagonosticCenterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagonosticCenterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagonosticCenterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagonosticCenterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagonosticCenterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagonosticCenterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagonosticCenterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagonosticCenterDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiagonosticCenterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagonosticCenterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagonosticCenterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagonosticCenterDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagonosticCenterDB]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Mobile] [int] NULL,
	[BillNO] [varchar](50) NULL,
	[TotalAmount] [int] NULL,
	[BillDate] [date] NOT NULL,
	[PaidAmount] [int] NULL,
	[DueAmount] [int] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTestBill]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientTestBill](
	[Patient_id] [int] NOT NULL,
	[Test_id] [int] NOT NULL,
	[date] [date] NULL,
	[Total_Amount] [int] NULL,
	[Paid_Amount] [int] NULL,
	[Due_Amount] [int] NULL,
	[TestNameEntry] [varchar](50) NULL,
	[FeeEntry] [int] NULL,
 CONSTRAINT [PK_PatientTestBill] PRIMARY KEY CLUSTERED 
(
	[Patient_id] ASC,
	[Test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Test_Name] [varchar](100) NULL,
	[Fee] [int] NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestRequestEntryGridView]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestRequestEntryGridView](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestEntryGridView] [varchar](50) NULL,
	[FeeEntryGridView] [int] NULL,
	[PatientsID] [int] NULL,
 CONSTRAINT [PK_TestRequestEntryGridView] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [varchar](100) NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_PatientsTestRequestEntryGridView]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PatientsTestRequestEntryGridView]
AS
SELECT Patients.BillNO,TestRequestEntryGridView.TestEntryGridView,TestRequestEntryGridView.FeeEntryGridView
FROM Patients
LEFT OUTER JOIN TestRequestEntryGridView ON Patients.Id=TestRequestEntryGridView.PatientsID
GO
/****** Object:  View [dbo].[VW_Test]    Script Date: 8/1/2016 9:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Test]
AS
SELECT Test.Test_Name,Test.Fee,TestType.Type_Name 
FROM Test LEFT OUTER JOIN TestType 
ON Test.TypeId=TestType.Id
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (1, N'Sukanta', CAST(0x943B0B00 AS Date), 1738123140, N'', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (2, N'Tushar ', CAST(0x9B3B0B00 AS Date), 1812345678, N'BillNO2', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (3, N'Sumon Bala', CAST(0xA43B0B00 AS Date), 1738395511, N'', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (4, N'Mahin', CAST(0xA53B0B00 AS Date), 1563457890, N'BillNO4', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (5, N'jijjj', CAST(0x8E3B0B00 AS Date), 23030303, N'BillNO5', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (6, N'jijjj', CAST(0x8E3B0B00 AS Date), 23030303, N'BillNO5', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (7, N'Ripon', CAST(0xA33B0B00 AS Date), 18903554, N'BillNO7', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (8, N'Ripon', CAST(0x9C3B0B00 AS Date), 17895462, N'BillNO8', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (9, N'Ripon', CAST(0x9E3B0B00 AS Date), 1789673467, N'BillNO9', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (10, N'Ripon', CAST(0x8E3B0B00 AS Date), 19845664, N'BillNO10', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (11, N'sujon', CAST(0x9D3B0B00 AS Date), 1890123456, N'BillNO11', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (12, N'HIV', CAST(0x943B0B00 AS Date), 1789234567, N'BillNO12', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (13, N'give', CAST(0x943B0B00 AS Date), 87546546, N'BillNO13', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (14, N'Tuli', CAST(0xA53B0B00 AS Date), 1932456789, N'BillNO14', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (15, N'Barnali', CAST(0x953B0B00 AS Date), 1728518108, N'BillNO15', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (16, N'Suma', CAST(0x9E3B0B00 AS Date), 545890435, N'BillNO16', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (17, N'uuuu', CAST(0x953B0B00 AS Date), 8797, N'BillNO17', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (18, N'xxx', CAST(0x913B0B00 AS Date), 9876654, N'BillNO18', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (19, N'Galib', CAST(0x933B0B00 AS Date), 178953675, N'BillNO19', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (20, N'Tushar208', CAST(0x8D3B0B00 AS Date), 1789356, N'BillNO20', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (21, N'Tamil', CAST(0x953B0B00 AS Date), 17834768, N'BillNO21', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (22, N'uiuu', CAST(0x903B0B00 AS Date), 7654, N'BillNO22', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (23, N'eer', CAST(0x933B0B00 AS Date), 5345, N'BillNO23', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (24, N'rytr', CAST(0xA43B0B00 AS Date), 7987897, N'BillNO24', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (25, N'Tutul', CAST(0x953B0B00 AS Date), 15673421, N'BillNO25', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (26, N'Sujit', CAST(0x8E3B0B00 AS Date), 6678, N'BillNO26', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (27, N'564', CAST(0x963B0B00 AS Date), 57, N'BillNO27', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (29, N'Hasib', CAST(0x9A3B0B00 AS Date), 1738123140, N'BillNO28', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (30, N'Mufti Hannan', CAST(0x903B0B00 AS Date), 198000234, N'BillNO29', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (31, N'sumit', CAST(0xB03B0B00 AS Date), 1234765, N'BillNO30', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (32, N'Amitab Bala', CAST(0xB23B0B00 AS Date), 1776437934, N'BillNO31', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (33, N'Kajol', CAST(0xB33B0B00 AS Date), 1789093456, N'BillNO32', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (34, N'Kajol', CAST(0xB33B0B00 AS Date), 1789093456, N'Records inserted successfully', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (35, N'Bijan', CAST(0xB23B0B00 AS Date), 17645783, N'BillNO34', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (36, N'Pulin Mallick', CAST(0xB03B0B00 AS Date), 167812340, N'BillNO35', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (37, N'Sumon Sarker', CAST(0x953B0B00 AS Date), 1738125689, N'BillNO36', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (38, N'hhhh', CAST(0x933B0B00 AS Date), 1234765, N'BillNO37', NULL, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (39, N'Rajesh Mojumder', CAST(0x923B0B00 AS Date), 1890345678, N'BillNO38', 2200, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (40, N'Ripon Chowdhury', CAST(0x953B0B00 AS Date), 18123456, N'BillNO39', 3250, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (41, N'Sajan poddar', CAST(0x963B0B00 AS Date), 17563437, N'BillNO40', 2250, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (42, N'Ahorna Sen', CAST(0xA83B0B00 AS Date), 1678934, N'BillNO41', 1650, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (43, N'Sujon Debnath', CAST(0x9C3B0B00 AS Date), 178923456, N'BillNO42', 1650, CAST(0xAF3B0B00 AS Date), 500, 1150)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (44, N'Sahin Molla', CAST(0x8D3B0B00 AS Date), 1736567, N'BillNO43', 1150, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (45, N'Tushar Bhattachajjae', CAST(0xAD3B0B00 AS Date), 652567, N'BillNO44', 1650, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (46, N'Bijli Hasan', CAST(0xAC3B0B00 AS Date), 178345267, N'BillNO45', 2200, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (47, N'Mikel Jackson', CAST(0x9B3B0B00 AS Date), 167234589, N'BillNO46', 1200, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (48, N'Kalipodo Saha', CAST(0xB03B0B00 AS Date), 1344657, N'BillNO47', 1150, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (49, N'Soumitra', CAST(0x933B0B00 AS Date), 17345768, N'BillNO48', 900, CAST(0x5B950A00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (50, N'RR', CAST(0x11170B00 AS Date), 178384, N'BillNO75', 500, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (51, N'RR', CAST(0x11170B00 AS Date), 178384, N'BillNO76', 500, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (52, N'awasf', CAST(0xA43B0B00 AS Date), 135467867, N'BillNO51', 1150, CAST(0x5B950A00 AS Date), 600, 550)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (53, N'bill no', CAST(0xB43B0B00 AS Date), 126895, N'BillNO52', 700, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (54, N'Bokkor', CAST(0x943B0B00 AS Date), 1715051250, N'BillNO53', 1150, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (55, N'Gary ', CAST(0xA93B0B00 AS Date), 173456799, N'BillNO54', 1650, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (56, N'Hanif', CAST(0x9F3B0B00 AS Date), 167092345, N'BillNO55', 1550, CAST(0xAF3B0B00 AS Date), NULL, NULL)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (57, NULL, NULL, NULL, NULL, NULL, CAST(0xB03B0B00 AS Date), 700, 450)
INSERT [dbo].[Patients] ([Id], [Name], [Date_Of_Birth], [Mobile], [BillNO], [TotalAmount], [BillDate], [PaidAmount], [DueAmount]) VALUES (58, N'Rana', CAST(0x783B0B00 AS Date), 173457689, N'BillNO56', 1150, CAST(0xB03B0B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Patients] OFF
INSERT [dbo].[PatientTestBill] ([Patient_id], [Test_id], [date], [Total_Amount], [Paid_Amount], [Due_Amount], [TestNameEntry], [FeeEntry]) VALUES (1, 2, NULL, NULL, NULL, NULL, N'bgd', 400)
INSERT [dbo].[PatientTestBill] ([Patient_id], [Test_id], [date], [Total_Amount], [Paid_Amount], [Due_Amount], [TestNameEntry], [FeeEntry]) VALUES (1, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PatientTestBill] ([Patient_id], [Test_id], [date], [Total_Amount], [Paid_Amount], [Due_Amount], [TestNameEntry], [FeeEntry]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PatientTestBill] ([Patient_id], [Test_id], [date], [Total_Amount], [Paid_Amount], [Due_Amount], [TestNameEntry], [FeeEntry]) VALUES (2, 3, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (2, N'Echo', 1000, 1)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (3, N'Pregnancy Test', 550, 1)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (4, N'bgd', 400, 1)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (5, N'RBS', 150, 1)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (6, N'Lspine', 1100, 2)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (7, N'Pregnancy Profile', 1000, 3)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (8, N'Hand X-Ray', 200, 2)
INSERT [dbo].[Test] ([Id], [Test_Name], [Fee], [TypeId]) VALUES (9, N'Lower Abdomen', 550, 3)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestRequestEntryGridView] ON 

INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (6, N'RBS', 150, 27)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (8, N'Echo', 1000, 29)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (9, N'Pregnancy Test', 550, 30)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (10, N'Lspine', 1100, 30)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (11, N'Lspine', 1100, 31)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (12, N'Hand X-Ray', 200, 31)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (13, N'Pregnancy Profile', 1000, 31)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (14, N'Echo', 1000, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (15, N'RBS', 150, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (16, N'Pregnancy Test', 550, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (17, N'Lspine', 1100, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (18, N'Pregnancy Profile', 1000, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (19, N'Hand X-Ray', 200, 32)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (20, N'Echo', 1000, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (21, N'RBS', 150, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (22, N'Pregnancy Test', 550, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (23, N'Lspine', 1100, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (24, N'Pregnancy Profile', 1000, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (25, N'Hand X-Ray', 200, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (26, N'Pregnancy Test', 550, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (27, N'bgd', 400, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (28, N'Lspine', 1100, 33)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (29, N'Echo', 1000, 35)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (30, N'Lspine', 1100, 35)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (31, N'Pregnancy Profile', 1000, 35)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (32, N'Lspine', 1100, 36)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (33, N'bgd', 400, 36)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (34, N'Pregnancy Test', 550, 36)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (35, N'Pregnancy Test', 550, 37)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (36, N'bgd', 400, 37)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (37, N'Echo', 1000, 38)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (38, N'Pregnancy Profile', 1000, 38)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (39, N'Hand X-Ray', 200, 38)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (40, N'Echo', 1000, 39)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (41, N'RBS', 150, 39)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (42, N'Lspine', 1100, 39)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (43, N'Pregnancy Profile', 1000, 39)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (44, N'Echo', 1000, 40)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (45, N'RBS', 150, 40)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (46, N'Lspine', 1100, 40)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (47, N'Pregnancy Test', 550, 41)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (48, N'Lspine', 1100, 41)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (49, N'Pregnancy Test', 550, 43)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (50, N'Lspine', 1100, 43)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (51, N'RBS', 150, 44)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (52, N'Pregnancy Profile', 1000, 44)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (53, N'Pregnancy Test', 550, 45)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (54, N'Lspine', 1100, 45)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (55, N'Echo', 1000, 46)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (56, N'Pregnancy Profile', 1000, 46)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (57, N'Hand X-Ray', 200, 46)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (58, N'Pregnancy Profile', 1000, 47)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (59, N'Hand X-Ray', 200, 47)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (60, N'Echo', 1000, 48)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (61, N'RBS', 150, 48)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (62, N'Pregnancy Test', 550, 49)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (63, N'RBS', 150, 49)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (64, N'Hand X-Ray', 200, 49)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (65, N'Echo', 1000, 52)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (66, N'RBS', 150, 52)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (67, N'Pregnancy Test', 550, 53)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (68, N'RBS', 150, 53)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (69, N'Echo', 1000, 54)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (70, N'RBS', 150, 54)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (71, N'Pregnancy Test', 550, 55)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (72, N'Lspine', 1100, 55)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (73, N'Pregnancy Test', 550, 56)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (74, N'Pregnancy Profile', 1000, 56)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (75, N'RBS', 150, 58)
INSERT [dbo].[TestRequestEntryGridView] ([Id], [TestEntryGridView], [FeeEntryGridView], [PatientsID]) VALUES (76, N'Pregnancy Profile', 1000, 58)
SET IDENTITY_INSERT [dbo].[TestRequestEntryGridView] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (1, N'Blood')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (8, N'DNA')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (4, N'ECG')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (5, N'Echo')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (9, N'Hormon')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (10, N'Urine')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (3, N'USG')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (2, N'X-Ray')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (6, N'xyz')
INSERT [dbo].[TestType] ([Id], [Type_Name]) VALUES (11, N'xyzt')
SET IDENTITY_INSERT [dbo].[TestType] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Test]    Script Date: 8/1/2016 9:26:12 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Test] ON [dbo].[Test]
(
	[Test_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestType]    Script Date: 8/1/2016 9:26:12 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestType] ON [dbo].[TestType]
(
	[Type_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [DF__Patients__BillDa__38996AB5]  DEFAULT (getdate()) FOR [BillDate]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Patients] FOREIGN KEY([Id])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Patients]
GO
ALTER TABLE [dbo].[PatientTestBill]  WITH CHECK ADD  CONSTRAINT [FK_PatientTestBill_Patients] FOREIGN KEY([Patient_id])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientTestBill] CHECK CONSTRAINT [FK_PatientTestBill_Patients]
GO
ALTER TABLE [dbo].[PatientTestBill]  WITH CHECK ADD  CONSTRAINT [FK_PatientTestBill_Test] FOREIGN KEY([Test_id])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[PatientTestBill] CHECK CONSTRAINT [FK_PatientTestBill_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Test] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TestType] ([Id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Test]
GO
ALTER TABLE [dbo].[TestRequestEntryGridView]  WITH CHECK ADD  CONSTRAINT [FK_TestRequestEntryGridView_Patients1] FOREIGN KEY([PatientsID])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[TestRequestEntryGridView] CHECK CONSTRAINT [FK_TestRequestEntryGridView_Patients1]
GO
USE [master]
GO
ALTER DATABASE [DiagonosticCenterDB] SET  READ_WRITE 
GO
