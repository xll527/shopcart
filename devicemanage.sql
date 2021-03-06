USE [master]
GO
/****** Object:  Database [devicemanage]    Script Date: 2020/9/25 星期五 15:40:12 ******/
CREATE DATABASE [devicemanage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'devicemanage', FILENAME = N'F:\sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\devicemanage.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'devicemanage_log', FILENAME = N'F:\sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\devicemanage_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [devicemanage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [devicemanage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [devicemanage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [devicemanage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [devicemanage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [devicemanage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [devicemanage] SET ARITHABORT OFF 
GO
ALTER DATABASE [devicemanage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [devicemanage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [devicemanage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [devicemanage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [devicemanage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [devicemanage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [devicemanage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [devicemanage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [devicemanage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [devicemanage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [devicemanage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [devicemanage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [devicemanage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [devicemanage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [devicemanage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [devicemanage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [devicemanage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [devicemanage] SET RECOVERY FULL 
GO
ALTER DATABASE [devicemanage] SET  MULTI_USER 
GO
ALTER DATABASE [devicemanage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [devicemanage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [devicemanage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [devicemanage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [devicemanage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'devicemanage', N'ON'
GO
USE [devicemanage]
GO
/****** Object:  Table [dbo].[device]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[device](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceClassID] [int] NULL,
	[DeviceName] [varchar](50) NULL,
	[DevicePrice] [varchar](50) NULL,
 CONSTRAINT [PK_device] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[deviceclass]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deviceclass](
	[DeviceClassID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceClassName] [varchar](255) NULL,
 CONSTRAINT [PK_deviceclass] PRIMARY KEY CLUSTERED 
(
	[DeviceClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[infomation]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[infomation](
	[InformationID] [int] IDENTITY(1,1) NOT NULL,
	[InformationContent] [text] NULL,
	[InformationImage] [text] NULL,
	[InformationCreateTime] [varchar](2555) NULL,
 CONSTRAINT [PK_infomation_1] PRIMARY KEY CLUSTERED 
(
	[InformationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[information]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[information](
	[InfomationID] [int] IDENTITY(1,1) NOT NULL,
	[InfomationContent] [text] NULL,
	[InfomationImage] [text] NULL,
	[InfomationCreateTime] [varchar](2555) NULL,
 CONSTRAINT [PK_infomation] PRIMARY KEY CLUSTERED 
(
	[InfomationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shopingcart]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopingcart](
	[ShopingcartID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NULL,
	[BuyNum] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_shopingcart] PRIMARY KEY CLUSTERED 
(
	[ShopingcartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shopingorder]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shopingorder](
	[ShopingOrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Receiver] [varchar](255) NULL,
	[ReceiverAddress] [varchar](255) NULL,
	[Createtime] [varchar](255) NULL,
	[MoneyAmout] [varchar](255) NULL,
 CONSTRAINT [PK_shopingorder] PRIMARY KEY CLUSTERED 
(
	[ShopingOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shopingOrderItem]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopingOrderItem](
	[ShopingOrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[ShopingOrderID] [int] NULL,
	[DeviceID] [int] NULL,
	[BuyNum] [int] NULL,
 CONSTRAINT [PK_shopingOrderItem] PRIMARY KEY CLUSTERED 
(
	[ShopingOrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 2020/9/25 星期五 15:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[UserPassword] [varchar](255) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[device] ON 

INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (1, 1, N'打印机', N'1900')
INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (2, 2, N'耳机', N'120')
INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (3, 1, N'鼠标', N'50')
INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (4, 5, N'笔记本电脑', N'5000')
INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (5, 3, N'U盘', N'80')
INSERT [dbo].[device] ([DeviceID], [DeviceClassID], [DeviceName], [DevicePrice]) VALUES (21, 4, N'头盔', N'140')
SET IDENTITY_INSERT [dbo].[device] OFF
SET IDENTITY_INSERT [dbo].[deviceclass] ON 

INSERT [dbo].[deviceclass] ([DeviceClassID], [DeviceClassName]) VALUES (1, N'办公设备')
INSERT [dbo].[deviceclass] ([DeviceClassID], [DeviceClassName]) VALUES (2, N'生活设备')
INSERT [dbo].[deviceclass] ([DeviceClassID], [DeviceClassName]) VALUES (3, N'学习设备')
INSERT [dbo].[deviceclass] ([DeviceClassID], [DeviceClassName]) VALUES (4, N'户外设备')
INSERT [dbo].[deviceclass] ([DeviceClassID], [DeviceClassName]) VALUES (5, N'电子设备')
SET IDENTITY_INSERT [dbo].[deviceclass] OFF
SET IDENTITY_INSERT [dbo].[shopingcart] ON 

INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (1, 2, 6, 1)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (2, 4, 7, 2)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (3, 5, 4, 1)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (4, 3, 8, 1)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (5, 4, 14, 2)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (6, 3, 15, 1)
INSERT [dbo].[shopingcart] ([ShopingcartID], [DeviceID], [BuyNum], [UserID]) VALUES (7, 3, 15, 2)
SET IDENTITY_INSERT [dbo].[shopingcart] OFF
SET IDENTITY_INSERT [dbo].[shopingorder] ON 

INSERT [dbo].[shopingorder] ([ShopingOrderID], [UserID], [Receiver], [ReceiverAddress], [Createtime], [MoneyAmout]) VALUES (1, 1, N'wang', N'shaoxing', N'2017-11-11', N'10220')
INSERT [dbo].[shopingorder] ([ShopingOrderID], [UserID], [Receiver], [ReceiverAddress], [Createtime], [MoneyAmout]) VALUES (2, 1, N'wang', N'shaoxing', N'2017-12-12', N'12440')
INSERT [dbo].[shopingorder] ([ShopingOrderID], [UserID], [Receiver], [ReceiverAddress], [Createtime], [MoneyAmout]) VALUES (3, 2, N'zhang', N'hangzhou', N'2017-10-01', N'250')
INSERT [dbo].[shopingorder] ([ShopingOrderID], [UserID], [Receiver], [ReceiverAddress], [Createtime], [MoneyAmout]) VALUES (4, 2, N'zhang', N'hangzhou', N'2017-10-25', N'520')
SET IDENTITY_INSERT [dbo].[shopingorder] OFF
SET IDENTITY_INSERT [dbo].[shopingOrderItem] ON 

INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (1, 1, 1, 5)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (2, 1, 2, 6)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (3, 2, 1, 6)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (4, 2, 2, 7)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (5, 2, 3, 4)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (6, 3, 3, 5)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (7, 4, 2, 3)
INSERT [dbo].[shopingOrderItem] ([ShopingOrderItemID], [ShopingOrderID], [DeviceID], [BuyNum]) VALUES (8, 4, 5, 2)
SET IDENTITY_INSERT [dbo].[shopingOrderItem] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([UserID], [UserName], [UserPassword]) VALUES (1, N'tom', N'654321')
INSERT [dbo].[user] ([UserID], [UserName], [UserPassword]) VALUES (2, N'mary', N'123456')
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_deviceclass1] FOREIGN KEY([DeviceClassID])
REFERENCES [dbo].[deviceclass] ([DeviceClassID])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_deviceclass1]
GO
ALTER TABLE [dbo].[shopingcart]  WITH CHECK ADD  CONSTRAINT [FK_shopingcart_device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[device] ([DeviceID])
GO
ALTER TABLE [dbo].[shopingcart] CHECK CONSTRAINT [FK_shopingcart_device]
GO
ALTER TABLE [dbo].[shopingcart]  WITH CHECK ADD  CONSTRAINT [FK_shopingcart_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[shopingcart] CHECK CONSTRAINT [FK_shopingcart_user]
GO
ALTER TABLE [dbo].[shopingorder]  WITH CHECK ADD  CONSTRAINT [FK_shopingorder_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([UserID])
GO
ALTER TABLE [dbo].[shopingorder] CHECK CONSTRAINT [FK_shopingorder_user]
GO
ALTER TABLE [dbo].[shopingOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_shopingOrderItem_device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[device] ([DeviceID])
GO
ALTER TABLE [dbo].[shopingOrderItem] CHECK CONSTRAINT [FK_shopingOrderItem_device]
GO
ALTER TABLE [dbo].[shopingOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_shopingOrderItem_shopingorder] FOREIGN KEY([ShopingOrderID])
REFERENCES [dbo].[shopingorder] ([ShopingOrderID])
GO
ALTER TABLE [dbo].[shopingOrderItem] CHECK CONSTRAINT [FK_shopingOrderItem_shopingorder]
GO
USE [master]
GO
ALTER DATABASE [devicemanage] SET  READ_WRITE 
GO
