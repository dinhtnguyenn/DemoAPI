USE [master]
GO
/****** Object:  Database [DemoChatbot]    Script Date: 03/07/2021 9:32:28 PM ******/
CREATE DATABASE [DemoChatbot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoChatbot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoChatbot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoChatbot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoChatbot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoChatbot] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoChatbot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoChatbot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoChatbot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoChatbot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoChatbot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoChatbot] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoChatbot] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoChatbot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoChatbot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoChatbot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoChatbot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoChatbot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoChatbot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoChatbot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoChatbot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoChatbot] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoChatbot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoChatbot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoChatbot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoChatbot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoChatbot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoChatbot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoChatbot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoChatbot] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoChatbot] SET  MULTI_USER 
GO
ALTER DATABASE [DemoChatbot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoChatbot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoChatbot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoChatbot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoChatbot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoChatbot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoChatbot] SET QUERY_STORE = OFF
GO
USE [DemoChatbot]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/07/2021 9:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 03/07/2021 9:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceNo] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 03/07/2021 9:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceNo] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/07/2021 9:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Images] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (1, N'Nguyễn Văn A', N'nvana', N'nvana12345', N'0123352167')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (2, N'Trần Minh Hoàng', N'trmh', N'trmh12345', N'2153302147')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (3, N'test', NULL, NULL, N'0123456')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (4, N'Nguyên Khôi', NULL, NULL, N'0988888888')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (5, N'heelo mn', NULL, NULL, N'1654564654')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (6, N'Định Nguyễn', NULL, NULL, N'+84705070996')
INSERT [dbo].[Account] ([UserID], [Name], [Account], [Password], [Phone]) VALUES (7, N'Định Nguyễn', NULL, NULL, N'565451465')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (1, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (2, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (3, CAST(N'2021-07-03T06:57:38.500' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (4, CAST(N'2021-07-03T06:58:20.677' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (5, CAST(N'2021-07-03T06:59:15.843' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (6, CAST(N'2021-07-03T07:01:05.467' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (7, CAST(N'2021-07-03T07:02:36.793' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (8, CAST(N'2021-07-03T07:39:25.460' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (9, CAST(N'2021-07-03T07:49:16.120' AS DateTime), 4, N'HCM-ngrok')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (10, CAST(N'2021-07-03T13:37:31.743' AS DateTime), 3, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (11, CAST(N'2021-07-03T20:20:47.257' AS DateTime), 5, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (12, CAST(N'2021-07-03T20:21:43.997' AS DateTime), 5, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (13, CAST(N'2021-07-03T20:56:51.440' AS DateTime), 5, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (14, CAST(N'2021-07-03T21:00:27.367' AS DateTime), 6, N'HCM')
INSERT [dbo].[Invoice] ([InvoiceNo], [CreateDate], [UserID], [Address]) VALUES (15, CAST(N'2021-07-03T21:01:54.607' AS DateTime), 7, N'HCM')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (1, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (1, 2, 3)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (2, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (2, 3, 10)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (6, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (7, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (8, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (9, 1, 10)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (10, 1, 2)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (11, 1, 3)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (12, 3, 10)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (13, 3, 10)
INSERT [dbo].[InvoiceDetails] ([InvoiceNo], [ProductID], [Quantity]) VALUES (14, 2, 6)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Product], [Price], [Images]) VALUES (1, N'ÁO SƠ MI GIẢ DA', 699000, N'1.jpg')
INSERT [dbo].[Product] ([ProductID], [Product], [Price], [Images]) VALUES (2, N'QUẦN JEANS SLIM FIT', 799000, N'2.jpg')
INSERT [dbo].[Product] ([ProductID], [Product], [Price], [Images]) VALUES (3, N'ÁO KHOÁC DENIM KẺ DÁNG SƠ MI', 599000, N'3.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([InvoiceNo])
REFERENCES [dbo].[Invoice] ([InvoiceNo])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Product]
GO
USE [master]
GO
ALTER DATABASE [DemoChatbot] SET  READ_WRITE 
GO
