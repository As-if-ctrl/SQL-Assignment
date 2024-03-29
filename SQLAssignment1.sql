USE [master]
GO
/****** Object:  Database [Assignment1]    Script Date: 18-10-2019 09:25:48 ******/
CREATE DATABASE [Assignment1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikesDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BikesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikesDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment1] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Assignment1]
GO
/****** Object:  Schema [production]    Script Date: 18-10-2019 09:25:48 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [Productions]    Script Date: 18-10-2019 09:25:48 ******/
CREATE SCHEMA [Productions]
GO
/****** Object:  Schema [Sales]    Script Date: 18-10-2019 09:25:48 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Schema [salesbk]    Script Date: 18-10-2019 09:25:48 ******/
CREATE SCHEMA [salesbk]
GO
/****** Object:  Table [Productions].[Brands]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Productions].[Brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Productions].[Categories]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Productions].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Productions].[Products]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Productions].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [int] NOT NULL,
	[list_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Productions].[Stocks]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productions].[Stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Customers]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Customers](
	[customers_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[phone] [numeric](10, 0) NOT NULL,
	[email] [varchar](100) NULL,
	[street] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[zip_code] [numeric](6, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[customers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[Orders]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customers_id] [int] NOT NULL,
	[order_status] [varchar](50) NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NOT NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[Orders_item]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Orders_item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [int] NOT NULL,
	[discount] [int] NULL,
	[item_amount]  AS ([quantity]*[list_price]),
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Staffs]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[phone] [numeric](10, 0) NULL,
	[email] [varchar](100) NULL,
	[active] [varchar](20) NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[Stores]    Script Date: 18-10-2019 09:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[stroe_name] [varchar](50) NOT NULL,
	[phone] [numeric](10, 0) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[street] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[zip_code] [numeric](6, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Productions].[Products]  WITH CHECK ADD  CONSTRAINT [fk_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [Productions].[Brands] ([brand_id])
GO
ALTER TABLE [Productions].[Products] CHECK CONSTRAINT [fk_Products_Brands]
GO
ALTER TABLE [Productions].[Products]  WITH CHECK ADD  CONSTRAINT [fk_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [Productions].[Categories] ([category_id])
GO
ALTER TABLE [Productions].[Products] CHECK CONSTRAINT [fk_Products_Categories]
GO
ALTER TABLE [Productions].[Stocks]  WITH CHECK ADD  CONSTRAINT [fk_Stocks_Products] FOREIGN KEY([product_id])
REFERENCES [Productions].[Products] ([product_id])
GO
ALTER TABLE [Productions].[Stocks] CHECK CONSTRAINT [fk_Stocks_Products]
GO
ALTER TABLE [Productions].[Stocks]  WITH CHECK ADD  CONSTRAINT [fk_Stocks_Stores] FOREIGN KEY([store_id])
REFERENCES [Sales].[Stores] ([store_id])
GO
ALTER TABLE [Productions].[Stocks] CHECK CONSTRAINT [fk_Stocks_Stores]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_Orders_Staffs] FOREIGN KEY([staff_id])
REFERENCES [Sales].[Staffs] ([staff_id])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [fk_Orders_Staffs]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_Orders_Stores] FOREIGN KEY([store_id])
REFERENCES [Sales].[Stores] ([store_id])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [fk_Orders_Stores]
GO
ALTER TABLE [Sales].[Orders_item]  WITH CHECK ADD  CONSTRAINT [fk_Orders_item_Orders] FOREIGN KEY([order_id])
REFERENCES [Sales].[Orders] ([order_id])
GO
ALTER TABLE [Sales].[Orders_item] CHECK CONSTRAINT [fk_Orders_item_Orders]
GO
ALTER TABLE [Sales].[Orders_item]  WITH CHECK ADD  CONSTRAINT [fk_orders_item_products] FOREIGN KEY([product_id])
REFERENCES [Productions].[Products] ([product_id])
GO
ALTER TABLE [Sales].[Orders_item] CHECK CONSTRAINT [fk_orders_item_products]
GO
ALTER TABLE [Sales].[Staffs]  WITH CHECK ADD  CONSTRAINT [fk_Staffs_Stores] FOREIGN KEY([store_id])
REFERENCES [Sales].[Stores] ([store_id])
GO
ALTER TABLE [Sales].[Staffs] CHECK CONSTRAINT [fk_Staffs_Stores]
GO
ALTER TABLE [Sales].[Orders_item]  WITH CHECK ADD CHECK  (([list_price]>(0)))
GO
ALTER TABLE [Sales].[Orders_item]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Assignment1] SET  READ_WRITE 
GO
