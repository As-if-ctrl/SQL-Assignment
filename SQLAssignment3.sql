USE [master]
GO
/****** Object:  Database [BikeStores]    Script Date: 29-10-2019 11:25:30 ******/
CREATE DATABASE [BikeStores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeStores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikeStores.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BikeStores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikeStores_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BikeStores] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeStores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeStores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeStores] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BikeStores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeStores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeStores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeStores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeStores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeStores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeStores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeStores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeStores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeStores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeStores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeStores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeStores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeStores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeStores] SET RECOVERY FULL 
GO
ALTER DATABASE [BikeStores] SET  MULTI_USER 
GO
ALTER DATABASE [BikeStores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeStores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeStores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeStores] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BikeStores]
GO
/****** Object:  Schema [production]    Script Date: 29-10-2019 11:25:31 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 29-10-2019 11:25:31 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  StoredProcedure [dbo].[usp_add_store]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_store]
@Store_name	varchar(100),
@Total_Stores INT OUTPUT
AS
BEGIN
	INSERT INTO sales.stores(store_name) VALUES(@Store_name)
	SELECT @Total_Stores=COUNT(*) FROM sales.stores
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Brand]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Brand]

AS
BEGIN
	SELECT * FROM production.brands_Details
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_DIVIDE]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DIVIDE]
@A DECIMAL,
@B DECIMAL,
@C DECIMAL OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @C=@A/@B;
		END TRY
		BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS 'ERROR NUMBER',
			ERROR_MESSAGE() AS 'ERROR MESSAGE',
			ERROR_LINE() AS 'LINE NO',
			ERROR_PROCEDURE() AS 'SP NAME'
		END CATCH

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_findproduct_by_list_price]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_findproduct_by_list_price]
@product_Count INT OUTPUT
AS
BEGIN
	
	SELECT @product_Count=COUNT(product_name) FROM production.products
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_save_brand]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_save_brand]
@Brand_Name VARCHAR(50)
AS
BEGIN
	INSERT INTO production.brands(brand_name) VALUES (@Brand_Name)
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_save_categories]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_save_categories]
@Category_Count INT OUTPUT
AS
BEGIN
	
	SELECT @Category_Count=COUNT(*) FROM production.categories
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_store_wise_sales]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_store_wise_sales]
AS
BEGIN
	SELECT SS.store_id,SS.store_name,SS.city, COUNT(SO.order_id) AS'TOTAL ORDER' FROM sales.stores SS INNER JOIN sales.orders SO 
	ON SS.store_id=SO.store_id 
	GROUP BY store_name,city,SS.store_id
	ORDER BY store_id
END;

EXEC usp_store_wise_sales
GO
/****** Object:  StoredProcedure [dbo].[USP_TRYEX]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TRYEX]
@A INT,
@B INT,
@C INT OUTPUT
AS
BEGIN 
	BEGIN TRY
		SET @C=@A+@B
		END TRY
		BEGIN CATCH
			SELECT
			ERROR_NUMBER() AS 'ERROR NO',
			ERROR_MESSAGE() AS 'ERROR MSG',
			ERROR_LINE() AS 'ERROR LINE',
			ERROR_PROCEDURE() AS 'SP NAME'
		END CATCH

END;
GO
/****** Object:  UserDefinedFunction [dbo].[udf_avg_qty]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_avg_qty]( 
@no_year INT,
@total_quantity INT
)
RETURNS DEC(10,2)
AS
BEGIN
	RETURN @total_quantity / @no_year
END
GO
/****** Object:  UserDefinedFunction [sales].[udf_count_sales]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [sales].[udf_count_sales](
@customer_id INT,
@year INT
)
RETURNS INT
AS 
BEGIN
DECLARE @count2 INT
		SELECT @count2=SUM(quantity*list_price) FROM sales.order_items WHERE order_id IN
		(SELECT order_id FROM sales.orders WHERE customer_id=@customer_id AND YEAR(order_date)=@year)
		RETURN @count2
END
GO
/****** Object:  UserDefinedFunction [sales].[UDF_NETSALE]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [sales].[UDF_NETSALE](
@QUANTITY INT,
@LIST_PRICE DEC(10,2)
)
RETURNS DEC(10,2)
AS
BEGIN
	RETURN @QUANTITY * @LIST_PRICE
END
GO
/****** Object:  Table [production].[brands]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[categories]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[parts]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[parts](
	[part_id] [int] NOT NULL,
	[part_name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[products]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[products_audits]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[products_audits](
	[change_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NULL,
	[brand_id] [int] NOT NULL,
	[CATEGORY_ID] [int] NOT NULL,
	[MODEL_YEAR] [smallint] NOT NULL,
	[LIST_PRICE] [decimal](10, 2) NOT NULL,
	[UPDATED_AT] [datetime] NOT NULL,
	[OPERATION] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[change_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [production].[stocks]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [production].[stocks](
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[OPERATION] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[customers]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[order_items]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[orders]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sales].[staffs]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sales].[stores]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [production].[brands_Details]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [production].[brands_Details]
AS 
SELECT * FROM production.brands;
GO
/****** Object:  View [sales].[sales_info]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [sales].[sales_info]
AS
SELECT PP.product_id,PP.product_name,PP.category_id,OI.order_id,OI.quantity,SO.order_date,OI.list_price,SO.order_status
FROM (production.products PP INNER JOIN sales.order_items OI ON PP.product_id=OI.product_id)
 INNER JOIN sales.orders SO ON OI.order_id=SO.order_id
GO
/****** Object:  View [sales].[staff_sales]    Script Date: 29-10-2019 11:25:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [sales].[staff_sales]
AS
SELECT O.order_id,S.staff_id,S.first_name,S.last_name,OI.list_price,OI.quantity
FROM (sales.orders O INNER JOIN sales.order_items OI ON O.order_id=OI.order_id) INNER JOIN sales.staffs S ON O.staff_id=S.staff_id
GO
/****** Object:  Index [IX_PARTS_ID]    Script Date: 29-10-2019 11:25:31 ******/
CREATE CLUSTERED INDEX [IX_PARTS_ID] ON [production].[parts]
(
	[part_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CUSTOMER_CITY]    Script Date: 29-10-2019 11:25:31 ******/
CREATE NONCLUSTERED INDEX [IX_CUSTOMER_CITY] ON [sales].[customers]
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[products_audits]  WITH CHECK ADD CHECK  (([OPERATION]='INS' OR [OPERATION]='DEL'))
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD CHECK  (([OPERATION]='INS' OR [OPERATION]='DEL'))
GO
USE [master]
GO
ALTER DATABASE [BikeStores] SET  READ_WRITE 
GO
