USE [master]
GO
/****** Object:  Database [ASM3Week]    Script Date: 12/8/2021 6:09:01 PM ******/
CREATE DATABASE [ASM3Week]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM3Week', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PHUC\MSSQL\DATA\ASM3Week.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ASM3Week_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PHUC\MSSQL\DATA\ASM3Week_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ASM3Week] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM3Week].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM3Week] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM3Week] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM3Week] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM3Week] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM3Week] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM3Week] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASM3Week] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM3Week] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM3Week] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM3Week] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM3Week] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM3Week] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM3Week] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM3Week] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM3Week] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASM3Week] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM3Week] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM3Week] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM3Week] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM3Week] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM3Week] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM3Week] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM3Week] SET RECOVERY FULL 
GO
ALTER DATABASE [ASM3Week] SET  MULTI_USER 
GO
ALTER DATABASE [ASM3Week] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM3Week] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM3Week] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM3Week] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ASM3Week] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASM3Week', N'ON'
GO
USE [ASM3Week]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOders]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[dateOrder] [date] NULL,
	[totalPrice] [nvarchar](50) NULL,
	[status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[status] [nvarchar](10) NULL,
	[productName] [nvarchar](50) NULL,
	[userID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [nvarchar](50) NULL,
	[categoryID] [nvarchar](50) NULL,
	[status] [nvarchar](10) NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](2) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/8/2021 6:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[roleID] [nvarchar](2) NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Convert', N'Convertible')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Coupe', N'Coupe')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Crossover', N'Crossover')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Limo', N'Limosine')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'MPV', N'MPV')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Pickup', N'Pickup')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Sport', N'Sport')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'SUV', N'SUV')
SET IDENTITY_INSERT [dbo].[tblOders] ON 

INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1, N'admin', CAST(N'2021-08-19' AS Date), N'140000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (67, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (68, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (69, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1025, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1026, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1027, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1028, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1029, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1030, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1031, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1032, N'tuine', CAST(N'2021-10-25' AS Date), N'194000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1033, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1034, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1035, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1036, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1037, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1038, N'beanancuc', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1039, N'beanancuc', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1040, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1041, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1042, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1043, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1044, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1045, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1046, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1047, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1048, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1049, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1050, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1051, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1052, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1053, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1054, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1055, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1056, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1057, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1058, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1059, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1060, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1061, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1063, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1064, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1065, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1066, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1067, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1068, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1069, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1070, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1071, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1072, N'tuine', CAST(N'2021-10-27' AS Date), N'97000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1073, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1074, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1075, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1076, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1077, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1078, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1079, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1080, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1081, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1082, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1083, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1084, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1085, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1086, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1087, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1088, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1089, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1090, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1091, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1092, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1093, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1094, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1095, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1096, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1097, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1098, N'tuine', CAST(N'2021-10-29' AS Date), N'290000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1099, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1100, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1101, N'tuine', CAST(N'2021-10-29' AS Date), N'570000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1102, N'tuine', CAST(N'2021-10-29' AS Date), N'570000', N'active')
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1103, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1104, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1105, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1106, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1107, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1108, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1109, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1110, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1111, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1112, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1113, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1114, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1115, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1116, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1117, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1118, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1119, N'tuine', NULL, NULL, NULL)
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1120, N'tuine', NULL, NULL, NULL)
GO
INSERT [dbo].[tblOders] ([orderID], [userID], [dateOrder], [totalPrice], [status]) VALUES (1121, N'tuine', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblOders] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (50, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (51, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (52, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1015, 1, N'C6', N'123000', 1, N'disable', N'Mercedes S400', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1016, 1, N'C8', N'143000', 1, N'disable', N'BMW X4', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1017, 1, N'C7', N'97000', 1, N'disable', N'Ford Ranger', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1018, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1019, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1020, 1, N'C7', N'97000', 1, N'disable', N'Ford Ranger', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1021, 1, N'C7', N'97000', 1, N'disable', N'Ford Ranger', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1022, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1023, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1024, 1, N'C8', N'143000', 1, N'disable', N'BMW X4', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1025, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1026, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1027, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'beanancuc')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1028, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'beanancuc')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1029, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1030, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1031, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1032, 1, N'C5', N'110000', 1, N'disable', N'Ford Mustang', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1033, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1034, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1035, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1036, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1037, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1038, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1039, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1040, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1041, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1042, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1043, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1044, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1045, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1046, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1047, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1048, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1049, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1050, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1051, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1052, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1053, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1054, 1, N'C5', N'110000', 1, N'disable', N'Ford Mustang', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1055, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1056, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1057, 1, N'C5', N'110000', 1, N'disable', N'Ford Mustang', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1058, 1, N'C7', N'97000', 1, N'disable', N'Ford Ranger', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1059, 1, N'C7', N'97000', 1, N'disable', N'Ford Ranger', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1060, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1061, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1062, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1063, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1064, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1065, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1066, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1067, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1068, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1069, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1070, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1071, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1072, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1073, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1074, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1075, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1076, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1077, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1078, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1079, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1080, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1081, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1082, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1083, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1084, 1, N'C2', N'150000', 1, N'disable', N'RR Phantom Limo', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1085, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1086, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1087, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1088, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1089, 1, N'C5', N'110000', 1, N'disable', N'Ford Mustang', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1090, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1091, 1, N'C1', N'140000', 1, N'disable', N'Mercedes C300', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1092, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1093, 1, N'C4', N'100000', 1, N'disable', N'Audi Q5', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1094, 1, N'C6', N'123000', 1, N'disable', N'Mercedes S400', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1095, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1096, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1097, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1098, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1099, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1100, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1101, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1102, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1103, 1, N'C3', N'95000', 1, N'active', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1104, 1, N'C3', N'95000', 1, N'active', N'Toyota Fotuner', N'tuine')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity], [status], [productName], [userID]) VALUES (1105, 1, N'C3', N'95000', 1, N'disable', N'Toyota Fotuner', N'tuine')
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C1', N'Mercedes C300', 100, N'140000', N'MPV', N'active', N'https://mercedesvinh.com/wp-content/uploads/2018/07/Mercedes-benz-c300-amg-ma%CC%80u-tr%C4%83%CC%81ng.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C10', N'Toyota Landcruiser', 10, N'100100', N'SUV', N'active', N'https://static1.cafeland.vn/cafeautoData/upload/tintuc/thitruong/2021/07/tuan-02/1-1626193706.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C2', N'RR Phantom Limo', 0, N'150000', N'Limo', N'disable', N'https://static1.cafeauto.vn/cafeautoData/upload/tintuc/thitruong/2019/04/tuan-02/hinh-2-1554730379.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C3', N'Toyota Fotuner', 2, N'95000', N'Crossover', N'active', N'https://www.drivespark.com/images/2021-01/toyota-fortuner-exterior-9.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C4', N'Audi Q5', 1, N'100000', N'SUV', N'active', N'https://vcdn-vnexpress.vnecdn.net/2021/07/22/Audi-Q5-2021-6114-8723-1626964582.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C5', N'Ford Mustang', 2, N'110000', N'Sport', N'active', N'https://picar.vn/wp-content/uploads/2021/01/Thong-so-ky-thuat-Ford-Mustang.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C6', N'Mercedes S400', 7, N'123000', N'Coupe', N'active', N'https://i.xeoto.com.vn/auto/mercedes/s400l/2019/ngoai-that-mercedes-s400l-66656.png')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C7', N'Ford Ranger', 30, N'97000', N'Pickup', N'active', N'https://muaxegiatot.vn/wp-content/uploads/2021/09/hinh-anh-xe-Ford-Ranger-2022-Splash-Muaxegiatot-vn.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C8', N'BMW X4', 2, N'143000', N'Convert', N'active', N'https://i.xeoto.com.vn/auto/w600/bmw/x4/bmw-x4-2020.png')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [status], [image]) VALUES (N'C9', N'Mazda CX5', 1, N'99000', N'SUV', N'active', N'https://mazdamotors.vn/media/drzllb3t/cx-5_kn6alaa_46v_kd6_ext_360_36_png_0014.jpg')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'user')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'active', N'active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'disable', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'112201856169464957195', N'1', N'Hong Phuc', N' ', N'US', N'active')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'117133902576639015573', N'1', N'Phúc', N' ', N'US', N'active')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'admin', N'admin', N'admin', N'admin', N'AD', N'active')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'admin1', N'admin', N'admin ne', N'admin', N'AD', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'alskdjashd', N'lasdkfja', N'aca', N'aca', N'AD', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'beanancuc', N'tientien', N'tien tien', N'tinh bien, an giang', N'US', N'active')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'phuc', N'phuc', N'Hong Phuca', N'TG', N'AD', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'test2', N'non', N'aaaaa', N'NON', N'US', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'tuine', N'123', N'abcccc', N'abccccc', N'US', N'active')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'tuinecha', N'1', N'abcccc', N'accccba', N'US', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'user', N'admin', N'admin', N'admin', N'US', N'disable')
INSERT [dbo].[tblUsers] ([userID], [password], [fullname], [address], [roleID], [status]) VALUES (N'user1', N'admin', N'azaz', N'ABCS', N'AD', N'disable')
ALTER TABLE [dbo].[tblOders]  WITH CHECK ADD  CONSTRAINT [FK_tblOders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOders] CHECK CONSTRAINT [FK_tblOders_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [ASM3Week] SET  READ_WRITE 
GO
