USE [master]
GO
/****** Object:  Database [SuperMarket]    Script Date: 3/6/2020 4:52:55 AM ******/
CREATE DATABASE [SuperMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SuperMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SuperMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SuperMarket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SuperMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SuperMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SuperMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [SuperMarket] SET  MULTI_USER 
GO
ALTER DATABASE [SuperMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SuperMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SuperMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SuperMarket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SuperMarket', N'ON'
GO
ALTER DATABASE [SuperMarket] SET QUERY_STORE = OFF
GO
USE [SuperMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SuperMarket]
GO
/****** Object:  Table [dbo].[CustomerInfo]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInfo](
	[Id] [bigint] NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [ntext] NULL,
	[City] [nvarchar](50) NULL,
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CustomerInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TotalItem] [int] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[CustomerId] [bigint] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Remain] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCarts]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCarts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ShopCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/6/2020 4:52:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerInfo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerInfo_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerInfo] CHECK CONSTRAINT [FK_CustomerInfo_Users]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_CustomerInfo] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomerInfo] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_CustomerInfo]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
ALTER TABLE [dbo].[ShopCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShopCarts_CustomerInfo] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomerInfo] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShopCarts] CHECK CONSTRAINT [FK_ShopCarts_CustomerInfo]
GO
ALTER TABLE [dbo].[ShopCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShopCarts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ShopCarts] CHECK CONSTRAINT [FK_ShopCarts_Products]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [SuperMarket] SET  READ_WRITE 
GO
