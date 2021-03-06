USE [master]
GO
/****** Object:  Database [Test_DB]    Script Date: 09-03-2019 01:32:58 PM ******/
CREATE DATABASE [Test_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Test_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Test_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Test_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Test_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test_DB] SET QUERY_STORE = OFF
GO
USE [Test_DB]
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
USE [Test_DB]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 09-03-2019 01:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[IP_Address] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestData]    Script Date: 09-03-2019 01:32:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](150) NOT NULL,
	[LastName] [varchar](150) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[City] [varchar](200) NOT NULL,
	[Gender] [bit] NOT NULL,
	[mobile] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_TestData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ErrorLog] ([ErrorId], [IP_Address], [Date], [Message]) VALUES (N'00000000-0000-0000-0000-000000000000', N'::1', CAST(N'2019-03-09T07:46:58.590' AS DateTime), N'NullReferenceException: Object reference not set to an instance of an object.   at Test_Application.Controllers.HomeController.FormData(TestDataModel model) in C:\Users\UTkarsh\Documents\Visual Studio 2017\Projects\Test_Application\Test_Application\Controllers\HomeController.cs:line 48
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__11_0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_1.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__3()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__5(IAsyncResult asyncResult)')
SET IDENTITY_INSERT [dbo].[TestData] ON 

INSERT [dbo].[TestData] ([Id], [FirstName], [LastName], [Email], [DOB], [City], [Gender], [mobile]) VALUES (1, N'Utkarsh', N'Dalwadi', N'utk@test.com', CAST(N'1991-10-26T00:00:00.000' AS DateTime), N'Ahmedabad ', 1, CAST(9876543210 AS Numeric(10, 0)))
INSERT [dbo].[TestData] ([Id], [FirstName], [LastName], [Email], [DOB], [City], [Gender], [mobile]) VALUES (4, N'Utkarsh', N'Dalwadi', N'utkarshdalwadi0@gmail.com', CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'Ahmedabad', 1, CAST(9662175555 AS Numeric(10, 0)))
INSERT [dbo].[TestData] ([Id], [FirstName], [LastName], [Email], [DOB], [City], [Gender], [mobile]) VALUES (6, N'asd', N'asd', N'asd@asd.co', CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'Surat', 1, CAST(9874563120 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[TestData] OFF
USE [master]
GO
ALTER DATABASE [Test_DB] SET  READ_WRITE 
GO
