--*************************************************************
-- MANUALLY DROP THE DATABASE FIRST CLOSING CONNECTION OPTIONS
-- THIS SCRIPT WAS TESTED AND WORKES CORRECTLY
--*************************************************************



/****** Object:  Database [BikeShopDB]    Script Date: 11/23/2014 11:17:37 AM ******/
CREATE DATABASE [BikeShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012R2DEV\MSSQL\DATA\BikeShopDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BikeShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012R2DEV\MSSQL\DATA\BikeShopDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BikeShopDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeShopDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BikeShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BikeShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BikeShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [BikeShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeShopDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BikeShopDB', N'ON'
GO
USE [BikeShopDB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cookie] [nvarchar](40) NOT NULL,
	[CartDate] [datetime] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NULL,
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Error]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ErrorDate] [datetime] NULL DEFAULT (getdate()),
	[IpAddress] [nvarchar](40) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Everything] [nvarchar](max) NULL,
	[HttpReferer] [nvarchar](500) NULL,
	[PathAndQuery] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[ChangedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderNumber]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[Image] [nvarchar](50) NOT NULL DEFAULT ('no_image_available_large.gif'),
	[ListPrice] [money] NOT NULL,
	[VendorId] [int] NOT NULL,
	[QuantitySold] [int] NOT NULL DEFAULT ((0)),
	[AvgStars] [real] NOT NULL DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[ChangedBy] [int] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[CategoryId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Stars] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL,
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[City] [nvarchar](30) NULL,
	[Country] [nvarchar](30) NULL,
	[SignupDate] [datetime] NOT NULL DEFAULT (getdate()),
	[OrderCount] [int] NOT NULL DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[ChangedBy] [int] NULL,
	[AspNetUserId] [nvarchar](128) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[ChangedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[ChangedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 11/23/2014 11:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [ProductCategory]    Script Date: 11/23/2014 11:17:37 AM ******/
CREATE CLUSTERED INDEX [ProductCategory] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (1, N'Accessories', CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL, CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (2, N'Bikes', CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL, CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (3, N'Clothing', CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL, CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (4, N'Parts', CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL, CAST(N'2014-11-21 23:15:25.190' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Error] ON 

GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (1, NULL, CAST(N'2014-10-29 21:56:32.003' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oops'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oops'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oops', NULL, CAST(N'2014-10-29 21:56:32.013' AS DateTime), NULL, CAST(N'2014-10-29 21:56:32.013' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (2, NULL, CAST(N'2014-10-29 21:56:32.373' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Views/Shared/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Views/Shared/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Views/Shared/error?aspxerrorpath=/oops', NULL, CAST(N'2014-10-29 21:56:32.373' AS DateTime), NULL, CAST(N'2014-10-29 21:56:32.373' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (3, NULL, CAST(N'2014-10-29 21:57:51.330' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.NotImplementedException', N'This has not been implemented yet.  Try back later,', N'System.NotImplementedException: This has not been implemented yet.  Try back later,
   at AdvenBikeShop.Web.Areas.Home.Controllers.HomeController.About() in c:\AdventureBikeShop\AdvenBikeShop.Web\Areas\Home\Controllers\HomeController.cs:line 39
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.ActionInvocation.InvokeSynchronousActionMethod()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/about', NULL, CAST(N'2014-10-29 21:57:51.337' AS DateTime), NULL, CAST(N'2014-10-29 21:57:51.337' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (7, NULL, CAST(N'2014-10-29 22:43:40.683' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.NotImplementedException', N'This has not been implemented yet.  Try back later,', N'System.NotImplementedException: This has not been implemented yet.  Try back later,
   at AdvenBikeShop.Web.Areas.Home.Controllers.HomeController.About() in c:\AdventureBikeShop\AdvenBikeShop.Web\Areas\Home\Controllers\HomeController.cs:line 39
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.ActionInvocation.InvokeSynchronousActionMethod()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/about', NULL, CAST(N'2014-10-29 22:43:46.037' AS DateTime), NULL, CAST(N'2014-10-29 22:43:46.037' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (37, NULL, CAST(N'2014-10-30 15:12:36.470' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpCompileException', N'c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1061: ''System.Web.Mvc.HtmlHelper<dynamic>'' does not contain a definition for ''MyActionHref'' and no extension method ''MyActionHref'' accepting a first argument of type ''System.Web.Mvc.HtmlHelper<dynamic>'' could be found (are you missing a using directive or an assembly reference?)', N'System.Web.HttpCompileException (0x80004005): c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1061: ''System.Web.Mvc.HtmlHelper<dynamic>'' does not contain a definition for ''MyActionHref'' and no extension method ''MyActionHref'' accepting a first argument of type ''System.Web.Mvc.HtmlHelper<dynamic>'' could be found (are you missing a using directive or an assembly reference?)
   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(String virtualPath, Type requiredBaseType)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/', NULL, CAST(N'2014-10-30 15:12:36.473' AS DateTime), NULL, CAST(N'2014-10-30 15:12:36.473' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (4, NULL, CAST(N'2014-10-29 21:57:51.640' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Views/Shared/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Views/Shared/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Views/Shared/error?aspxerrorpath=/about', NULL, CAST(N'2014-10-29 21:57:51.640' AS DateTime), NULL, CAST(N'2014-10-29 21:57:51.640' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (5, NULL, CAST(N'2014-10-29 22:41:56.993' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oops'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oops'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oops', NULL, CAST(N'2014-10-29 22:41:57.007' AS DateTime), NULL, CAST(N'2014-10-29 22:41:57.007' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (6, NULL, CAST(N'2014-10-29 22:41:57.183' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Views/Shared/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Views/Shared/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Views/Shared/error?aspxerrorpath=/oops', NULL, CAST(N'2014-10-29 22:41:57.187' AS DateTime), NULL, CAST(N'2014-10-29 22:41:57.187' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (9, NULL, CAST(N'2014-10-29 22:57:31.333' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oops'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oops'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oops', NULL, CAST(N'2014-10-29 22:57:31.333' AS DateTime), NULL, CAST(N'2014-10-29 22:57:31.333' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (8, NULL, CAST(N'2014-10-29 22:44:50.890' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Views/Shared/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Views/Shared/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Views/Shared/error?aspxerrorpath=/about', NULL, CAST(N'2014-10-29 22:45:37.880' AS DateTime), NULL, CAST(N'2014-10-29 22:45:37.880' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (13, NULL, CAST(N'2014-10-29 23:04:40.913' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:04:40.927' AS DateTime), NULL, CAST(N'2014-10-29 23:04:40.927' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (10, NULL, CAST(N'2014-10-29 22:57:31.380' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Views/Shared/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Views/Shared/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Views/Shared/error?aspxerrorpath=/oops', NULL, CAST(N'2014-10-29 22:57:31.383' AS DateTime), NULL, CAST(N'2014-10-29 22:57:31.383' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (11, NULL, CAST(N'2014-10-29 23:01:01.473' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.NotImplementedException', N'This has not been implemented yet.  Try back later,', N'System.NotImplementedException: This has not been implemented yet.  Try back later,
   at AdvenBikeShop.Web.Areas.Home.Controllers.HomeController.About() in c:\AdventureBikeShop\AdvenBikeShop.Web\Areas\Home\Controllers\HomeController.cs:line 39
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.ActionInvocation.InvokeSynchronousActionMethod()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/about', NULL, CAST(N'2014-10-29 23:01:03.037' AS DateTime), NULL, CAST(N'2014-10-29 23:01:03.037' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (12, NULL, CAST(N'2014-10-29 23:01:19.797' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oops'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oops'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oops', NULL, CAST(N'2014-10-29 23:01:21.953' AS DateTime), NULL, CAST(N'2014-10-29 23:01:21.953' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (38, NULL, CAST(N'2014-10-30 15:12:36.683' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpCompileException', N'c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1061: ''System.Web.Mvc.HtmlHelper<dynamic>'' does not contain a definition for ''MyActionHref'' and no extension method ''MyActionHref'' accepting a first argument of type ''System.Web.Mvc.HtmlHelper<dynamic>'' could be found (are you missing a using directive or an assembly reference?)', N'System.Web.HttpCompileException (0x80004005): c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1061: ''System.Web.Mvc.HtmlHelper<dynamic>'' does not contain a definition for ''MyActionHref'' and no extension method ''MyActionHref'' accepting a first argument of type ''System.Web.Mvc.HtmlHelper<dynamic>'' could be found (are you missing a using directive or an assembly reference?)
   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(String virtualPath, Type requiredBaseType)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error?aspxerrorpath=/', NULL, CAST(N'2014-10-30 15:12:36.683' AS DateTime), NULL, CAST(N'2014-10-30 15:12:36.683' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (14, NULL, CAST(N'2014-10-29 23:05:52.920' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:05:52.923' AS DateTime), NULL, CAST(N'2014-10-29 23:05:52.923' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (15, NULL, CAST(N'2014-10-29 23:10:29.787' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:10:29.797' AS DateTime), NULL, CAST(N'2014-10-29 23:10:29.797' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (16, NULL, CAST(N'2014-10-29 23:11:46.400' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:11:46.413' AS DateTime), NULL, CAST(N'2014-10-29 23:11:46.413' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (17, NULL, CAST(N'2014-10-29 23:13:59.570' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:13:59.583' AS DateTime), NULL, CAST(N'2014-10-29 23:13:59.583' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (29, NULL, CAST(N'2014-10-30 14:22:18.863' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpCompileException', N'c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1525: Invalid expression term ''/''', N'System.Web.HttpCompileException (0x80004005): c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1525: Invalid expression term ''/''
   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(String virtualPath, Type requiredBaseType)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/', NULL, CAST(N'2014-10-30 14:22:18.870' AS DateTime), NULL, CAST(N'2014-10-30 14:22:18.870' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (30, NULL, CAST(N'2014-10-30 14:22:20.000' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpCompileException', N'c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1525: Invalid expression term ''/''', N'System.Web.HttpCompileException (0x80004005): c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml(34): error CS1525: Invalid expression term ''/''
   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(String virtualPath, Type requiredBaseType)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error?aspxerrorpath=/', NULL, CAST(N'2014-10-30 14:22:20.000' AS DateTime), NULL, CAST(N'2014-10-30 14:22:20.000' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (18, NULL, CAST(N'2014-10-29 23:23:04.150' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:23:04.160' AS DateTime), NULL, CAST(N'2014-10-29 23:23:04.160' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (19, NULL, CAST(N'2014-10-29 23:24:48.700' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:24:48.713' AS DateTime), NULL, CAST(N'2014-10-29 23:24:48.713' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (20, NULL, CAST(N'2014-10-29 23:27:09.347' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:27:09.347' AS DateTime), NULL, CAST(N'2014-10-29 23:27:09.347' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (21, NULL, CAST(N'2014-10-29 23:28:44.127' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:28:44.137' AS DateTime), NULL, CAST(N'2014-10-29 23:28:44.137' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (22, NULL, CAST(N'2014-10-29 23:35:46.450' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:35:46.460' AS DateTime), NULL, CAST(N'2014-10-29 23:35:46.460' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (42, NULL, CAST(N'2014-10-30 22:21:51.237' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/login'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/login'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/login', NULL, CAST(N'2014-10-30 22:21:51.250' AS DateTime), NULL, CAST(N'2014-10-30 22:21:51.250' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (23, NULL, CAST(N'2014-10-29 23:37:18.550' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:37:18.560' AS DateTime), NULL, CAST(N'2014-10-29 23:37:18.560' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (27, NULL, CAST(N'2014-10-30 12:46:28.913' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-30 12:46:28.923' AS DateTime), NULL, CAST(N'2014-10-30 12:46:28.923' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (32, NULL, CAST(N'2014-10-30 15:02:04.453' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'Path ''/Areas/Home/Views/Home/Index.cshtml'' was not found.', N'System.Web.HttpException (0x80004005): Path ''/Areas/Home/Views/Home/Index.cshtml'' was not found.
   at System.Web.HttpNotFoundHandler.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Areas/Home/Views/Home/Index.cshtml', NULL, CAST(N'2014-10-30 15:02:04.460' AS DateTime), NULL, CAST(N'2014-10-30 15:02:04.460' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (33, NULL, CAST(N'2014-10-30 15:02:23.730' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'Path ''/Areas/Home/Views/Home/Index.cshtml'' was not found.', N'System.Web.HttpException (0x80004005): Path ''/Areas/Home/Views/Home/Index.cshtml'' was not found.
   at System.Web.HttpNotFoundHandler.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/about', N'/Areas/Home/Views/Home/Index.cshtml', NULL, CAST(N'2014-10-30 15:02:23.730' AS DateTime), NULL, CAST(N'2014-10-30 15:02:23.730' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (24, NULL, CAST(N'2014-10-29 23:39:39.747' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:39:39.757' AS DateTime), NULL, CAST(N'2014-10-29 23:39:39.757' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (34, NULL, CAST(N'2014-10-30 15:03:08.593' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Index.cshtml'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Index.cshtml'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/about', N'/Index.cshtml', NULL, CAST(N'2014-10-30 15:03:08.600' AS DateTime), NULL, CAST(N'2014-10-30 15:03:08.600' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (39, NULL, CAST(N'2014-10-30 15:14:00.290' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.InvalidOperationException', N'The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Home/Index.aspx
~/Views/Home/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Home/Index.cshtml
~/Views/Home/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml', N'System.InvalidOperationException: The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Home/Index.aspx
~/Views/Home/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Home/Index.cshtml
~/Views/Home/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml
   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Home/Index', NULL, CAST(N'2014-10-30 15:14:00.297' AS DateTime), NULL, CAST(N'2014-10-30 15:14:00.297' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (40, NULL, CAST(N'2014-10-30 15:14:08.380' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.InvalidOperationException', N'The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Home/Index.aspx
~/Views/Home/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Home/Index.cshtml
~/Views/Home/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml', N'System.InvalidOperationException: The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Home/Index.aspx
~/Views/Home/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Home/Index.cshtml
~/Views/Home/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml
   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/about', N'/Home/Index', NULL, CAST(N'2014-10-30 15:14:08.380' AS DateTime), NULL, CAST(N'2014-10-30 15:14:08.380' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (25, NULL, CAST(N'2014-10-29 23:43:18.607' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-29 23:43:18.620' AS DateTime), NULL, CAST(N'2014-10-29 23:43:18.620' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (35, NULL, CAST(N'2014-10-30 15:03:48.310' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Index'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Index'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/about', N'/Index', NULL, CAST(N'2014-10-30 15:03:48.317' AS DateTime), NULL, CAST(N'2014-10-30 15:03:48.317' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (26, NULL, CAST(N'2014-10-30 10:17:31.400' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-30 10:17:31.407' AS DateTime), NULL, CAST(N'2014-10-30 10:17:31.407' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (31, NULL, CAST(N'2014-10-30 14:36:12.367' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'A potentially dangerous Request.Path value was detected from the client (<).', N'System.Web.HttpException (0x80004005): A potentially dangerous Request.Path value was detected from the client (<).
   at System.Web.HttpRequest.ValidateInputIfRequiredByConfig()
   at System.Web.HttpApplication.PipelineStepManager.ValidateHelper(HttpContext context)', N'/', N'/%3Ca%20class=', NULL, CAST(N'2014-10-30 14:36:12.407' AS DateTime), NULL, CAST(N'2014-10-30 14:36:12.407' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (41, NULL, CAST(N'2014-10-30 15:19:27.550' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oops'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oops'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oops', NULL, CAST(N'2014-10-30 15:19:27.567' AS DateTime), NULL, CAST(N'2014-10-30 15:19:27.567' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (28, NULL, CAST(N'2014-10-30 13:29:27.513' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/oppsagain'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/oppsagain'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/oppsagain', NULL, CAST(N'2014-10-30 13:29:27.513' AS DateTime), NULL, CAST(N'2014-10-30 13:29:27.513' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (36, NULL, CAST(N'2014-10-30 15:04:19.933' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/~'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/~'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/about', N'/~', NULL, CAST(N'2014-10-30 15:04:19.940' AS DateTime), NULL, CAST(N'2014-10-30 15:04:19.940' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (43, NULL, CAST(N'2014-10-30 22:22:10.553' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/signup'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/signup'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/signup', NULL, CAST(N'2014-10-30 22:22:10.553' AS DateTime), NULL, CAST(N'2014-10-30 22:22:10.553' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (44, NULL, CAST(N'2014-10-30 22:42:11.267' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Login'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Login'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Login', NULL, CAST(N'2014-10-30 22:42:11.277' AS DateTime), NULL, CAST(N'2014-10-30 22:42:11.277' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (45, NULL, CAST(N'2014-10-30 23:18:47.250' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/cart'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/cart'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/cart', NULL, CAST(N'2014-10-30 23:18:47.260' AS DateTime), NULL, CAST(N'2014-10-30 23:18:47.260' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (46, NULL, CAST(N'2014-10-30 23:30:40.580' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/cart'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/cart'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/cart', NULL, CAST(N'2014-10-30 23:30:40.593' AS DateTime), NULL, CAST(N'2014-10-30 23:30:40.593' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (47, NULL, CAST(N'2014-10-30 23:39:29.750' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/cart'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/cart'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/cart', NULL, CAST(N'2014-10-30 23:39:29.763' AS DateTime), NULL, CAST(N'2014-10-30 23:39:29.763' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (48, NULL, CAST(N'2014-10-31 11:12:39.073' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/cart'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/cart'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/cart', NULL, CAST(N'2014-10-31 11:12:39.073' AS DateTime), NULL, CAST(N'2014-10-31 11:12:39.073' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (49, NULL, CAST(N'2014-11-03 22:29:03.640' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Home/Auth/Signup'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Home/Auth/Signup'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Home/Auth/Signup', NULL, CAST(N'2014-11-03 22:29:03.657' AS DateTime), NULL, CAST(N'2014-11-03 22:29:03.657' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (50, NULL, CAST(N'2014-11-03 22:29:18.363' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Home/Auth/Login'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Home/Auth/Login'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/error?aspxerrorpath=/Home/Auth/Signup', N'/Home/Auth/Login', NULL, CAST(N'2014-11-03 22:29:18.363' AS DateTime), NULL, CAST(N'2014-11-03 22:29:18.363' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (51, NULL, CAST(N'2014-11-03 22:46:38.953' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.InvalidOperationException', N'The matched route does not include a ''controller'' route value, which is required.', N'System.InvalidOperationException: The matched route does not include a ''controller'' route value, which is required.
   at System.Web.Mvc.MvcRouteHandler.GetSessionStateBehavior(RequestContext requestContext)
   at System.Web.Mvc.MvcRouteHandler.GetHttpHandler(RequestContext requestContext)
   at System.Web.Mvc.MvcRouteHandler.System.Web.Routing.IRouteHandler.GetHttpHandler(RequestContext requestContext)
   at System.Web.Routing.UrlRoutingModule.PostResolveRequestCache(HttpContextBase context)
   at System.Web.Routing.UrlRoutingModule.OnApplicationPostResolveRequestCache(Object sender, EventArgs e)
   at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Signup', NULL, CAST(N'2014-11-03 22:46:38.967' AS DateTime), NULL, CAST(N'2014-11-03 22:46:38.967' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (53, NULL, CAST(N'2014-11-12 22:55:38.330' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/error?aspxerrorpath=/Admin/Account/LogOff', NULL, CAST(N'2014-11-12 22:55:38.330' AS DateTime), NULL, CAST(N'2014-11-12 22:55:38.330' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (52, NULL, CAST(N'2014-11-12 22:55:37.917' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-12 22:55:37.930' AS DateTime), NULL, CAST(N'2014-11-12 22:55:37.930' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (54, NULL, CAST(N'2014-11-12 23:11:34.987' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Error', NULL, CAST(N'2014-11-12 23:11:34.997' AS DateTime), NULL, CAST(N'2014-11-12 23:11:34.997' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (55, NULL, CAST(N'2014-11-12 23:11:35.130' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error?aspxerrorpath=/Error', NULL, CAST(N'2014-11-12 23:11:35.130' AS DateTime), NULL, CAST(N'2014-11-12 23:11:35.130' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (56, NULL, CAST(N'2014-11-12 23:12:25.740' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error', NULL, CAST(N'2014-11-12 23:12:25.750' AS DateTime), NULL, CAST(N'2014-11-12 23:12:25.750' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (57, NULL, CAST(N'2014-11-12 23:12:25.883' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error?aspxerrorpath=/error', NULL, CAST(N'2014-11-12 23:12:25.883' AS DateTime), NULL, CAST(N'2014-11-12 23:12:25.883' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (58, NULL, CAST(N'2014-11-12 23:13:18.007' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-12 23:13:18.007' AS DateTime), NULL, CAST(N'2014-11-12 23:13:18.007' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (59, NULL, CAST(N'2014-11-12 23:13:18.287' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/error?aspxerrorpath=/Admin/Account/LogOff', NULL, CAST(N'2014-11-12 23:13:18.290' AS DateTime), NULL, CAST(N'2014-11-12 23:13:18.290' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (61, NULL, CAST(N'2014-11-12 23:13:55.387' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/error'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/error'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/error?aspxerrorpath=/admin/account/LogOff', NULL, CAST(N'2014-11-12 23:13:55.387' AS DateTime), NULL, CAST(N'2014-11-12 23:13:55.387' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (60, NULL, CAST(N'2014-11-12 23:13:55.200' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/admin/account/LogOff', NULL, CAST(N'2014-11-12 23:13:55.200' AS DateTime), NULL, CAST(N'2014-11-12 23:13:55.200' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (62, NULL, CAST(N'2014-11-12 23:17:50.980' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-12 23:17:50.993' AS DateTime), NULL, CAST(N'2014-11-12 23:17:50.993' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (77, 999, CAST(N'2014-11-14 14:02:18.930' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpCompileException', N'c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_LoginPartial.cshtml(5): error CS0118: ''System.NullReferenceException'' is a ''type'' but is used like a ''variable''', N'System.Web.HttpCompileException (0x80004005): c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_LoginPartial.cshtml(5): error CS0118: ''System.NullReferenceException'' is a ''type'' but is used like a ''variable''
   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.HtmlHelper.RenderPartialInternal(String partialViewName, ViewDataDictionary viewData, Object model, TextWriter writer, ViewEngineCollection viewEngineCollection)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName, Object model, ViewDataDictionary viewData)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName)
   at ASP._Page_Views_Shared__Layout_cshtml.Execute() in c:\AdventureBikeShop\AdvenBikeShop.Web\Views\Shared\_Layout.cshtml:line 45
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass3.<RenderPageCore>b__2(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/', NULL, CAST(N'2014-11-14 14:02:18.937' AS DateTime), NULL, CAST(N'2014-11-14 14:02:18.937' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (63, NULL, CAST(N'2014-11-13 09:05:07.513' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-13 09:05:07.520' AS DateTime), NULL, CAST(N'2014-11-13 09:05:07.520' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (64, NULL, CAST(N'2014-11-13 12:42:26.067' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-13 12:42:26.070' AS DateTime), NULL, CAST(N'2014-11-13 12:42:26.070' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (65, NULL, CAST(N'2014-11-13 12:47:09.810' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-13 12:47:09.817' AS DateTime), NULL, CAST(N'2014-11-13 12:47:09.817' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (66, 999, CAST(N'2014-11-13 23:06:23.867' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/LogOff', NULL, CAST(N'2014-11-13 23:06:23.880' AS DateTime), NULL, CAST(N'2014-11-13 23:06:23.880' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (67, 999, CAST(N'2014-11-14 12:38:45.813' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 12:38:45.817' AS DateTime), NULL, CAST(N'2014-11-14 12:38:45.817' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (68, 999, CAST(N'2014-11-14 12:41:14.617' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 12:41:14.620' AS DateTime), NULL, CAST(N'2014-11-14 12:41:14.620' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (69, 999, CAST(N'2014-11-14 12:45:58.337' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 12:45:58.343' AS DateTime), NULL, CAST(N'2014-11-14 12:45:58.343' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (70, 999, CAST(N'2014-11-14 13:43:37.823' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:43:37.830' AS DateTime), NULL, CAST(N'2014-11-14 13:43:37.830' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (71, 999, CAST(N'2014-11-14 13:43:46.157' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/home/error?aspxerrorpath=/Admin/Account/logoff', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:43:46.157' AS DateTime), NULL, CAST(N'2014-11-14 13:43:46.157' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (72, 999, CAST(N'2014-11-14 13:44:42.207' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:44:42.217' AS DateTime), NULL, CAST(N'2014-11-14 13:44:42.217' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (73, 999, CAST(N'2014-11-14 13:45:34.430' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:45:34.440' AS DateTime), NULL, CAST(N'2014-11-14 13:45:34.440' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (74, 999, CAST(N'2014-11-14 13:46:34.303' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:46:34.307' AS DateTime), NULL, CAST(N'2014-11-14 13:46:34.307' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (75, 999, CAST(N'2014-11-14 13:57:41.500' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 13:57:41.507' AS DateTime), NULL, CAST(N'2014-11-14 13:57:41.507' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (76, 999, CAST(N'2014-11-14 13:59:24.073' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/admin/account/logoff', NULL, CAST(N'2014-11-14 13:59:24.080' AS DateTime), NULL, CAST(N'2014-11-14 13:59:24.080' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (78, 999, CAST(N'2014-11-14 14:02:55.653' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.', N'System.Web.HttpException (0x80004005): No matching action was found on controller ''AdvenBikeShop.Web.Areas.Administration.Controllers.AccountController''. This can happen when a controller uses RouteAttribute for routing, but no action on that controller matches the request.
   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<BeginExecuteCore>b__1d(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<BeginExecute>b__15(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<BeginProcessRequest>b__5(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', N'/', N'/Admin/Account/logoff', NULL, CAST(N'2014-11-14 14:02:55.663' AS DateTime), NULL, CAST(N'2014-11-14 14:02:55.663' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (79, 999, CAST(N'2014-11-18 15:41:03.707' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/about'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/about'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/about', NULL, CAST(N'2014-11-18 15:41:03.710' AS DateTime), NULL, CAST(N'2014-11-18 15:41:03.710' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (80, 999, CAST(N'2014-11-20 15:14:31.963' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/products'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/products'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/products', NULL, CAST(N'2014-11-20 15:14:31.970' AS DateTime), NULL, CAST(N'2014-11-20 15:14:31.970' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (81, 999, CAST(N'2014-11-20 15:19:01.430' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Products'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Products'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Products', NULL, CAST(N'2014-11-20 15:19:01.433' AS DateTime), NULL, CAST(N'2014-11-20 15:19:01.433' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (82, 999, CAST(N'2014-11-20 15:21:50.547' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/Products'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/Products'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/Products', NULL, CAST(N'2014-11-20 15:21:50.553' AS DateTime), NULL, CAST(N'2014-11-20 15:21:50.553' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (83, 999, CAST(N'2014-11-20 15:22:53.983' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/contacts'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/contacts'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/contacts', NULL, CAST(N'2014-11-20 15:22:53.987' AS DateTime), NULL, CAST(N'2014-11-20 15:22:53.987' AS DateTime))
GO
INSERT [dbo].[Error] ([Id], [UserId], [ErrorDate], [IpAddress], [UserAgent], [Exception], [Message], [Everything], [HttpReferer], [PathAndQuery], [CreatedBy], [CreatedOn], [ChangedBy], [ChangedOn]) VALUES (84, 999, CAST(N'2014-11-20 15:23:07.123' AS DateTime), N'::1', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko', N'System.Web.HttpException', N'The controller for path ''/contact'' was not found or does not implement IController.', N'System.Web.HttpException (0x80004005): The controller for path ''/contact'' was not found or does not implement IController.
   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', NULL, N'/contact', NULL, CAST(N'2014-11-20 15:23:07.123' AS DateTime), NULL, CAST(N'2014-11-20 15:23:07.123' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Error] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (77, N'Handlebar Tube', N'HT-2981', N'', N'no_image_available_large.gif', 35.7700, 4, 365, 3.64547038, CAST(N'1953-01-01 00:01:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (78, N'Head Tube', N'HT-8019', N'', N'no_image_available_large.gif', 13.7700, 4, 359, 3.59225345, CAST(N'1953-01-01 00:01:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:17.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (79, N'LL Hub', N'HU-6280', N'', N'no_image_available_large.gif', 45.6500, 1, 62, 0.627636254, CAST(N'1953-01-01 00:01:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:18.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (80, N'HL Hub', N'HU-8998', N'', N'no_image_available_large.gif', 45.6500, 5, 453, 4.525882, CAST(N'1953-01-01 00:01:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:19.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (141, N'Lower Head Race', N'LR-8520', N'', N'no_image_available_large.gif', 1.3500, 3, 201, 2.00938082, CAST(N'1953-01-01 00:02:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:20.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (177, N'Cup-Shaped Race', N'RA-2345', N'', N'no_image_available_large.gif', 13.8800, 2, 115, 1.15120339, CAST(N'1953-01-01 00:02:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:56.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (178, N'Cone-Shaped Race', N'RA-7490', N'', N'no_image_available_large.gif', 11.2300, 1, 75, 0.754163265, CAST(N'1953-01-01 00:02:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:57.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (179, N'Reflector', N'RF-9198', N'', N'no_image_available_large.gif', 5.7700, 3, 223, 2.23449922, CAST(N'1953-01-01 00:02:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:58.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (180, N'LL Mountain Rim', N'RM-M464', N'', N'no_image_available_large.gif', 55.7600, 3, 225, 2.25539684, CAST(N'1953-01-01 00:02:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:59.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (181, N'ML Mountain Rim', N'RM-M692', N'', N'no_image_available_large.gif', 55.7600, 1, 9, 0.09924668, CAST(N'1953-01-01 00:03:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:00.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (182, N'HL Mountain Rim', N'RM-M823', N'', N'no_image_available_large.gif', 55.7600, 2, 194, 1.94418931, CAST(N'1953-01-01 00:03:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:01.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (183, N'LL Road Rim', N'RM-R436', N'', N'no_image_available_large.gif', 35.4400, 5, 408, 4.080224, CAST(N'1953-01-01 00:03:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:02.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (184, N'ML Road Rim', N'RM-R600', N'', N'no_image_available_large.gif', 35.4400, 2, 101, 1.013021, CAST(N'1953-01-01 00:03:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:03.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (185, N'HL Road Rim', N'RM-R800', N'', N'no_image_available_large.gif', 35.4400, 5, 457, 4.568146, CAST(N'1953-01-01 00:03:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:04.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (186, N'Touring Rim', N'RM-T801', N'', N'no_image_available_large.gif', 35.4400, 1, 14, 0.147884965, CAST(N'1953-01-01 00:03:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:05.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (187, N'LL Mountain Seat Assembly', N'SA-M198', N'', N'no_image_available_large.gif', 133.3400, 3, 255, 2.54730678, CAST(N'1953-01-01 00:03:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:06.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (188, N'ML Mountain Seat Assembly', N'SA-M237', N'', N'no_image_available_large.gif', 147.1400, 5, 482, 4.81444836, CAST(N'1953-01-01 00:03:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:07.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (189, N'HL Mountain Seat Assembly', N'SA-M687', N'', N'no_image_available_large.gif', 196.9200, 5, 497, 4.967859, CAST(N'1953-01-01 00:03:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:08.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (190, N'LL Road Seat Assembly', N'SA-R127', N'', N'no_image_available_large.gif', 133.3400, 1, 8, 0.08434946, CAST(N'1953-01-01 00:03:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:09.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (191, N'ML Road Seat Assembly', N'SA-R430', N'', N'no_image_available_large.gif', 147.1400, 4, 327, 3.26759338, CAST(N'1953-01-01 00:03:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:10.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (192, N'HL Road Seat Assembly', N'SA-R522', N'', N'no_image_available_large.gif', 196.9200, 2, 139, 1.39164758, CAST(N'1953-01-01 00:03:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:11.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (193, N'LL Touring Seat Assembly', N'SA-T467', N'', N'no_image_available_large.gif', 133.3400, 5, 484, 4.835839, CAST(N'1953-01-01 00:03:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:12.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (194, N'ML Touring Seat Assembly', N'SA-T612', N'', N'no_image_available_large.gif', 147.1400, 3, 294, 2.93896246, CAST(N'1953-01-01 00:03:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:13.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (195, N'HL Touring Seat Assembly', N'SA-T872', N'', N'no_image_available_large.gif', 196.9200, 4, 386, 3.86100864, CAST(N'1953-01-01 00:03:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:14.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (196, N'LL Spindle/Axle', N'SD-2342', N'', N'no_image_available_large.gif', 21.7600, 2, 162, 1.62083471, CAST(N'1953-01-01 00:03:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:15.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (197, N'HL Spindle/Axle', N'SD-9872', N'', N'no_image_available_large.gif', 21.7600, 3, 210, 2.10212636, CAST(N'1953-01-01 00:03:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (217, N'AWC Logo Cap', N'CA-1098', N'Multi', N'no_image_available_large.gif', 8.9900, 2, 131, 1.30832207, CAST(N'1953-01-01 00:03:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:36.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (203, N'Seat Post', N'SP-2981', N'', N'no_image_available_large.gif', 7.3200, 5, 449, 4.48626661, CAST(N'1953-01-01 00:03:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:22.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (204, N'Steerer', N'SR-2098', N'', N'no_image_available_large.gif', 9.5600, 1, 89, 0.8911059, CAST(N'1953-01-01 00:03:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:23.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (205, N'Seat Stays', N'SS-2985', N'', N'no_image_available_large.gif', 1.6600, 5, 442, 4.41446, CAST(N'1953-01-01 00:03:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:24.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (206, N'Seat Tube', N'ST-9828', N'', N'no_image_available_large.gif', 7.6600, 3, 272, 2.72328615, CAST(N'1953-01-01 00:03:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:25.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (207, N'Top Tube', N'TO-2301', N'', N'no_image_available_large.gif', 5.7700, 4, 393, 3.92522621, CAST(N'1953-01-01 00:03:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:26.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (208, N'Tension Pulley', N'TP-0923', N'', N'no_image_available_large.gif', 16.8800, 3, 257, 2.57020354, CAST(N'1953-01-01 00:03:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:27.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (209, N'Rear Derailleur Cage', N'RC-0291', N'Silver', N'no_image_available_large.gif', 15.6800, 2, 176, 1.76191735, CAST(N'1953-01-01 00:03:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:28.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (310, N'LL Headset', N'HS-0296', N'', N'no_image_available_large.gif', 34.2000, 4, 351, 3.51093984, CAST(N'1953-01-01 00:05:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:09.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (311, N'ML Headset', N'HS-2451', N'', N'no_image_available_large.gif', 102.2900, 4, 320, 3.2033658, CAST(N'1953-01-01 00:05:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:10.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (312, N'HL Headset', N'HS-3479', N'', N'no_image_available_large.gif', 124.7300, 1, 7, 0.07754602, CAST(N'1953-01-01 00:05:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:11.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (313, N'LL Mountain Handlebars', N'HB-M243', N'', N'handlebar_large.gif', 44.5400, 3, 285, 2.84720778, CAST(N'1953-01-01 00:05:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:12.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (314, N'ML Mountain Handlebars', N'HB-M763', N'', N'no_image_available_large.gif', 61.9200, 3, 229, 2.28978419, CAST(N'1953-01-01 00:05:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:13.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (315, N'HL Mountain Handlebars', N'HB-M918', N'', N'no_image_available_large.gif', 120.2700, 5, 497, 4.96706438, CAST(N'1953-01-01 00:05:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:14.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (316, N'LL Road Handlebars', N'HB-R504', N'', N'no_image_available_large.gif', 44.5400, 1, 61, 0.6117118, CAST(N'1953-01-01 00:05:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:15.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (317, N'ML Road Handlebars', N'HB-R720', N'', N'no_image_available_large.gif', 61.9200, 1, 60, 0.6024988, CAST(N'1953-01-01 00:05:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (5, N'Blade', N'BL-2036', N'', N'no_image_available_large.gif', 9.7900, 2, 103, 1.03016579, CAST(N'1953-01-01 00:00:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:04.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (6, N'LL Crankarm', N'CA-5965', N'Black', N'no_image_available_large.gif', 25.9900, 3, 280, 2.794424, CAST(N'1953-01-01 00:00:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:05.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (7, N'ML Crankarm', N'CA-6738', N'Black', N'no_image_available_large.gif', 25.9900, 5, 453, 4.530135, CAST(N'1953-01-01 00:00:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:06.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (8, N'HL Crankarm', N'CA-7457', N'Black', N'no_image_available_large.gif', 25.9900, 3, 221, 2.21088934, CAST(N'1953-01-01 00:00:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:07.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (9, N'Chainring Bolts', N'CB-2903', N'Silver', N'no_image_available_large.gif', 25.9900, 5, 489, 4.88774872, CAST(N'1953-01-01 00:00:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:08.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (10, N'Chainring Nut', N'CN-6137', N'Silver', N'no_image_available_large.gif', 25.9900, 2, 137, 1.36852229, CAST(N'1953-01-01 00:00:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:09.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (11, N'Chainring', N'CR-7833', N'Black', N'no_image_available_large.gif', 25.9900, 2, 146, 1.45953143, CAST(N'1953-01-01 00:00:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:10.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (12, N'Crown Race', N'CR-9981', N'', N'no_image_available_large.gif', 2.9900, 3, 234, 2.3365736, CAST(N'1953-01-01 00:00:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:11.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (13, N'Chain Stays', N'CS-2812', N'', N'no_image_available_large.gif', 2.9900, 4, 316, 3.16329527, CAST(N'1953-01-01 00:00:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:12.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (14, N'Decal 1', N'DC-8732', N'', N'no_image_available_large.gif', 2.9900, 3, 235, 2.34755945, CAST(N'1953-01-01 00:00:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:13.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (15, N'Decal 2', N'DC-9824', N'', N'no_image_available_large.gif', 2.9900, 5, 492, 4.910756, CAST(N'1953-01-01 00:00:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:14.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (16, N'Down Tube', N'DT-2377', N'', N'no_image_available_large.gif', 2.9900, 1, 15, 0.15183495, CAST(N'1953-01-01 00:00:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:15.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (17, N'Mountain End Caps', N'EC-M092', N'', N'no_image_available_large.gif', 2.9900, 5, 432, 4.31185055, CAST(N'1953-01-01 00:00:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (18, N'Road End Caps', N'EC-R098', N'', N'no_image_available_large.gif', 2.9900, 5, 498, 4.97673559, CAST(N'1953-01-01 00:00:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:17.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (19, N'Touring End Caps', N'EC-T209', N'', N'no_image_available_large.gif', 2.9900, 4, 339, 3.38590574, CAST(N'1953-01-01 00:00:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:18.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (20, N'Fork End', N'FE-3760', N'', N'no_image_available_large.gif', 2.9900, 2, 157, 1.572959, CAST(N'1953-01-01 00:00:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:19.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (21, N'Freewheel', N'FH-2981', N'Silver', N'wheel_large.gif', 60.9900, 5, 409, 4.08453941, CAST(N'1953-01-01 00:00:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:20.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (31, N'Fork Crown', N'FC-3654', N'', N'no_image_available_large.gif', 1.1500, 1, 93, 0.9356229, CAST(N'1953-01-01 00:00:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:30.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (32, N'Front Derailleur Cage', N'FC-3982', N'Silver', N'no_image_available_large.gif', 250.8800, 3, 227, 2.266636, CAST(N'1953-01-01 00:00:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:31.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (33, N'Front Derailleur Linkage', N'FL-2301', N'Silver', N'no_image_available_large.gif', 250.8800, 2, 148, 1.48585927, CAST(N'1953-01-01 00:00:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:32.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (34, N'Guide Pulley', N'GP-0982', N'', N'no_image_available_large.gif', 30.8800, 5, 495, 4.942719, CAST(N'1953-01-01 00:00:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:33.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (35, N'LL Grip Tape', N'GT-0820', N'', N'no_image_available_large.gif', 12.2500, 4, 321, 3.21348739, CAST(N'1953-01-01 00:00:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:34.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (36, N'ML Grip Tape', N'GT-1209', N'', N'no_image_available_large.gif', 12.2500, 4, 382, 3.814818, CAST(N'1953-01-01 00:00:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:35.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (37, N'HL Grip Tape', N'GT-2908', N'', N'no_image_available_large.gif', 12.2500, 1, 15, 0.151971459, CAST(N'1953-01-01 00:00:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:36.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (328, N'LL Mountain Rear Wheel', N'RW-M423', N'Black', N'wheel_large.gif', 87.7450, 3, 265, 2.65259743, CAST(N'1953-01-01 00:05:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:27.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (329, N'ML Mountain Rear Wheel', N'RW-M762', N'Black', N'wheel_large.gif', 236.0250, 5, 476, 4.75781631, CAST(N'1953-01-01 00:05:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:28.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (330, N'HL Mountain Rear Wheel', N'RW-M928', N'Black', N'wheel_large.gif', 327.2150, 2, 101, 1.01073432, CAST(N'1953-01-01 00:05:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:29.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (331, N'LL Road Rear Wheel', N'RW-R623', N'Black', N'wheel_large.gif', 112.5650, 5, 473, 4.72693539, CAST(N'1953-01-01 00:05:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:30.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (332, N'ML Road Rear Wheel', N'RW-R762', N'Black', N'wheel_large.gif', 275.3850, 5, 426, 4.25867939, CAST(N'1953-01-01 00:05:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:31.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (333, N'HL Road Rear Wheel', N'RW-R820', N'Black', N'wheel_large.gif', 357.0600, 5, 448, 4.480617, CAST(N'1953-01-01 00:05:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:32.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (334, N'Touring Rear Wheel', N'RW-T905', N'Black', N'wheel_large.gif', 245.0100, 3, 233, 2.334505, CAST(N'1953-01-01 00:05:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:33.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (140, N'Lock Ring', N'LR-2398', N'Silver', N'no_image_available_large.gif', 12.2000, 4, 371, 3.71164513, CAST(N'1953-01-01 00:02:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:19.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (318, N'HL Road Handlebars', N'HB-R956', N'', N'no_image_available_large.gif', 120.2700, 2, 141, 1.41604173, CAST(N'1953-01-01 00:05:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:17.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (347, N'Touring-Panniers Large', N'PA-T100', N'Grey', N'no_image_available_large.gif', 125.0000, 4, 340, 3.40254521, CAST(N'1953-01-01 00:05:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:46.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (348, N'Cable Lock', N'LO-C100', N'', N'bike_lock_large.gif', 25.0000, 2, 171, 1.713367, CAST(N'1953-01-01 00:05:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:47.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (349, N'Minipump', N'PU-0452', N'', N'handpump_large.gif', 19.9900, 3, 233, 2.33359265, CAST(N'1953-01-01 00:05:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:48.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (350, N'Mountain Pump', N'PU-M044', N'', N'bikepump_large.gif', 24.9900, 4, 400, 3.996292, CAST(N'1953-01-01 00:05:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:49.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (351, N'Taillights - Battery-Powered', N'LT-T990', N'', N'tail_lights_large.gif', 13.9900, 2, 108, 1.08448672, CAST(N'1953-01-01 00:05:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:50.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (352, N'Headlights - Dual-Beam', N'LT-H902', N'', N'double_headlight_large.gif', 34.9900, 5, 455, 4.54522, CAST(N'1953-01-01 00:05:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:51.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (353, N'Headlights - Weatherproof', N'LT-H903', N'', N'single_headlight_large.gif', 44.9900, 3, 260, 2.59826922, CAST(N'1953-01-01 00:05:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:52.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (499, N'LL Bottom Bracket', N'BB-7421', N'', N'no_image_available_large.gif', 53.9900, 4, 321, 3.20666814, CAST(N'1953-01-01 00:08:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:18.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (500, N'ML Bottom Bracket', N'BB-8107', N'', N'no_image_available_large.gif', 101.2400, 4, 391, 3.90838027, CAST(N'1953-01-01 00:08:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:19.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (501, N'HL Bottom Bracket', N'BB-9108', N'', N'no_image_available_large.gif', 121.4900, 5, 467, 4.66514063, CAST(N'1953-01-01 00:08:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:20.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (171, N'Paint - Black', N'PA-187B', N'', N'no_image_available_large.gif', 8.9500, 2, 151, 1.50820386, CAST(N'1953-01-01 00:02:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:50.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (172, N'Paint - Red', N'PA-361R', N'', N'no_image_available_large.gif', 8.9500, 1, 32, 0.322268367, CAST(N'1953-01-01 00:02:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:51.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (173, N'Paint - Silver', N'PA-529S', N'', N'no_image_available_large.gif', 8.9500, 3, 233, 2.32851553, CAST(N'1953-01-01 00:02:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:52.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (174, N'Paint - Blue', N'PA-632U', N'', N'no_image_available_large.gif', 8.9500, 3, 242, 2.41537046, CAST(N'1953-01-01 00:02:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:53.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (175, N'Paint - Yellow', N'PA-823Y', N'', N'no_image_available_large.gif', 8.9500, 2, 108, 1.08153, CAST(N'1953-01-01 00:02:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:54.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (375, N'Water Bottle - 30 oz.', N'WB-H098', N'', N'water_bottle_large.gif', 4.9900, 2, 189, 1.88744676, CAST(N'1953-01-01 00:06:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:14.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (376, N'Mountain Bottle Cage', N'BC-M005', N'', N'no_image_available_large.gif', 9.9900, 3, 296, 2.96373487, CAST(N'1953-01-01 00:06:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:15.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (377, N'Road Bottle Cage', N'BC-R205', N'', N'water_bottle_cage_large.gif', 8.9900, 4, 332, 3.31727934, CAST(N'1953-01-01 00:06:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (378, N'Patch Kit/8 Patches', N'PK-7098', N'', N'tirepatch_kit_large.gif', 2.2900, 1, 40, 0.404953718, CAST(N'1953-01-01 00:06:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:17.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (381, N'Hitch Rack - 4-Bike', N'RA-H123', N'', N'no_image_available_large.gif', 120.0000, 1, 79, 0.7962262, CAST(N'1953-01-01 00:06:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:20.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (382, N'Bike Wash - Dissolver', N'CL-9009', N'', N'no_image_available_large.gif', 7.9500, 3, 240, 2.402686, CAST(N'1953-01-01 00:06:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:21.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (383, N'Fender Set - Mountain', N'FE-6654', N'', N'no_image_available_large.gif', 21.9800, 1, 31, 0.319004834, CAST(N'1953-01-01 00:06:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:22.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (384, N'All-Purpose Bike Stand', N'ST-1401', N'', N'no_image_available_large.gif', 159.0000, 1, 76, 0.76152426, CAST(N'1953-01-01 00:06:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:23.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (385, N'Hydration Pack - 70 oz.', N'HY-1023-70', N'Silver', N'no_image_available_large.gif', 54.9900, 5, 493, 4.9262476, CAST(N'1953-01-01 00:06:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:24.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (399, N'Rear Derailleur', N'RD-2308', N'Silver', N'sprocket_large.gif', 121.4600, 1, 87, 0.875982463, CAST(N'1953-01-01 00:06:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:38.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (412, N'Rear Brakes', N'RB-9231', N'Silver', N'no_image_available_large.gif', 106.5000, 3, 208, 2.07995534, CAST(N'1953-01-01 00:06:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:51.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (413, N'LL Mountain Seat/Saddle', N'SE-M236', N'', N'saddle_large.gif', 27.1200, 4, 397, 3.97134161, CAST(N'1953-01-01 00:06:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:52.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (414, N'ML Mountain Seat/Saddle', N'SE-M798', N'', N'no_image_available_large.gif', 39.1400, 1, 96, 0.9639998, CAST(N'1953-01-01 00:06:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:53.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (415, N'HL Mountain Seat/Saddle', N'SE-M940', N'', N'no_image_available_large.gif', 52.6400, 1, 51, 0.511039853, CAST(N'1953-01-01 00:06:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:54.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (416, N'LL Road Seat/Saddle', N'SE-R581', N'', N'no_image_available_large.gif', 27.1200, 1, 67, 0.6745696, CAST(N'1953-01-01 00:06:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:55.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (417, N'ML Road Seat/Saddle', N'SE-R908', N'', N'no_image_available_large.gif', 39.1400, 3, 263, 2.62545347, CAST(N'1953-01-01 00:06:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:56.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (418, N'HL Road Seat/Saddle', N'SE-R995', N'', N'no_image_available_large.gif', 52.6400, 4, 378, 3.77882433, CAST(N'1953-01-01 00:06:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:57.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (419, N'LL Touring Seat/Saddle', N'SE-T312', N'', N'no_image_available_large.gif', 27.1200, 2, 187, 1.87491751, CAST(N'1953-01-01 00:06:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:58.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (420, N'ML Touring Seat/Saddle', N'SE-T762', N'', N'no_image_available_large.gif', 39.1400, 4, 360, 3.602289, CAST(N'1953-01-01 00:06:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:59.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (421, N'HL Touring Seat/Saddle', N'SE-T924', N'', N'no_image_available_large.gif', 52.6400, 3, 228, 2.28427672, CAST(N'1953-01-01 00:07:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:00.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (450, N'Front Derailleur', N'FD-2342', N'Silver', N'no_image_available_large.gif', 91.4900, 4, 320, 3.20304871, CAST(N'1953-01-01 00:07:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:29.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (451, N'LL Touring Handlebars', N'HB-T721', N'', N'no_image_available_large.gif', 46.0900, 2, 154, 1.539044, CAST(N'1953-01-01 00:07:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:30.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (452, N'HL Touring Handlebars', N'HB-T928', N'', N'no_image_available_large.gif', 91.5700, 5, 500, 4.995216, CAST(N'1953-01-01 00:07:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:31.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (453, N'Front Brakes', N'FB-9873', N'Silver', N'no_image_available_large.gif', 106.5000, 5, 433, 4.326564, CAST(N'1953-01-01 00:07:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:32.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (454, N'LL Crankset', N'CS-4759', N'Black', N'no_image_available_large.gif', 175.4900, 3, 227, 2.27369356, CAST(N'1953-01-01 00:07:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:33.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (455, N'ML Crankset', N'CS-6583', N'Black', N'no_image_available_large.gif', 256.4900, 4, 334, 3.33384156, CAST(N'1953-01-01 00:07:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:34.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (456, N'HL Crankset', N'CS-9183', N'Black', N'no_image_available_large.gif', 404.9900, 1, 47, 0.471956, CAST(N'1953-01-01 00:07:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:35.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (457, N'Chain', N'CH-0234', N'Silver', N'silver_chain_large.gif', 20.2400, 5, 497, 4.963311, CAST(N'1953-01-01 00:07:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:36.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (433, N'LL Mountain Tire', N'TI-M267', N'', N'no_image_available_large.gif', 24.9900, 5, 453, 4.528971, CAST(N'1953-01-01 00:07:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:12.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (434, N'ML Mountain Tire', N'TI-M602', N'', N'no_image_available_large.gif', 29.9900, 3, 205, 2.04793644, CAST(N'1953-01-01 00:07:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:13.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (435, N'HL Mountain Tire', N'TI-M823', N'', N'mb_tires_large.gif', 35.0000, 5, 408, 4.077532, CAST(N'1953-01-01 00:07:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:14.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (436, N'LL Road Tire', N'TI-R092', N'', N'no_image_available_large.gif', 21.4900, 3, 291, 2.90638375, CAST(N'1953-01-01 00:07:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:15.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (437, N'ML Road Tire', N'TI-R628', N'', N'no_image_available_large.gif', 24.9900, 4, 376, 3.75740457, CAST(N'1953-01-01 00:07:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:16.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (438, N'HL Road Tire', N'TI-R982', N'', N'street_tires_large.gif', 32.6000, 2, 117, 1.17148745, CAST(N'1953-01-01 00:07:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:17.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (439, N'Touring Tire', N'TI-T723', N'', N'no_image_available_large.gif', 28.9900, 5, 462, 4.61805439, CAST(N'1953-01-01 00:07:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:18.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (440, N'LL Mountain Pedal', N'PD-M282', N'Silver/Black', N'pedal_large.gif', 40.4900, 3, 292, 2.922803, CAST(N'1953-01-01 00:07:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:19.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (441, N'ML Mountain Pedal', N'PD-M340', N'Silver/Black', N'pedal_large.gif', 62.0900, 5, 496, 4.958775, CAST(N'1953-01-01 00:07:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:20.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (442, N'HL Mountain Pedal', N'PD-M562', N'Silver/Black', N'pedal_large.gif', 80.9900, 1, 26, 0.260306358, CAST(N'1953-01-01 00:07:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:21.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (443, N'LL Road Pedal', N'PD-R347', N'Silver/Black', N'clipless_pedals_large.gif', 40.4900, 3, 275, 2.747449, CAST(N'1953-01-01 00:07:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:22.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (444, N'ML Road Pedal', N'PD-R563', N'Silver/Black', N'clipless_pedals_large.gif', 62.0900, 1, 80, 0.801572442, CAST(N'1953-01-01 00:07:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:23.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (445, N'HL Road Pedal', N'PD-R853', N'Silver/Black', N'clipless_pedals_large.gif', 80.9900, 5, 483, 4.829861, CAST(N'1953-01-01 00:07:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:24.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (446, N'Touring Pedal', N'PD-T852', N'Silver/Black', N'clipless_pedals_large.gif', 80.9900, 3, 222, 2.216125, CAST(N'1953-01-01 00:07:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:25.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (426, N'Mountain Tire Tube', N'TT-M928', N'', N'no_image_available_large.gif', 4.9900, 2, 173, 1.7313292, CAST(N'1953-01-01 00:07:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:05.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (427, N'Road Tire Tube', N'TT-R982', N'', N'no_image_available_large.gif', 3.9900, 4, 350, 3.49969172, CAST(N'1953-01-01 00:07:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:06.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (428, N'Touring Tire Tube', N'TT-T092', N'', N'innertube_large.gif', 4.9900, 4, 354, 3.53578258, CAST(N'1953-01-01 00:07:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:07.000' AS DateTime), 34, N'Accessories', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (458, N'Touring-2000 Blue 60', N'BK-T44U-60', N'Blue', N'julianax_r_02_blue_large.gif', 1214.8500, 4, 345, 3.44433641, CAST(N'1953-01-01 00:07:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:37.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (459, N'Touring-1000 Yellow 46', N'BK-T79Y-46', N'Yellow', N'julianax_r_02_yellow_large.gif', 2384.0700, 1, 25, 0.257522434, CAST(N'1953-01-01 00:07:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:38.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (460, N'Touring-1000 Yellow 50', N'BK-T79Y-50', N'Yellow', N'julianax_r_02_yellow_large.gif', 2384.0700, 5, 442, 4.41214037, CAST(N'1953-01-01 00:07:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:39.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (461, N'Touring-1000 Yellow 54', N'BK-T79Y-54', N'Yellow', N'julianax_r_02_yellow_large.gif', 2384.0700, 4, 351, 3.503753, CAST(N'1953-01-01 00:07:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:40.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (462, N'Touring-1000 Yellow 60', N'BK-T79Y-60', N'Yellow', N'julianax_r_02_yellow_large.gif', 2384.0700, 2, 169, 1.687158, CAST(N'1953-01-01 00:07:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:41.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (463, N'Touring-3000 Blue 54', N'BK-T18U-54', N'Blue', N'julianax_r_02_blue_large.gif', 742.3500, 5, 408, 4.07955647, CAST(N'1953-01-01 00:07:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:42.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (464, N'Touring-3000 Blue 58', N'BK-T18U-58', N'Blue', N'julianax_r_02_blue_large.gif', 742.3500, 5, 470, 4.699911, CAST(N'1953-01-01 00:07:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:43.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (465, N'Touring-3000 Blue 62', N'BK-T18U-62', N'Blue', N'julianax_r_02_blue_large.gif', 742.3500, 3, 260, 2.59490442, CAST(N'1953-01-01 00:07:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:44.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (466, N'Touring-3000 Yellow 44', N'BK-T18Y-44', N'Yellow', N'julianax_r_02_yellow_large.gif', 742.3500, 1, 92, 0.9214811, CAST(N'1953-01-01 00:07:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:45.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (467, N'Touring-3000 Yellow 50', N'BK-T18Y-50', N'Yellow', N'julianax_r_02_yellow_large.gif', 742.3500, 3, 255, 2.55098414, CAST(N'1953-01-01 00:07:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:46.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (468, N'Touring-3000 Yellow 54', N'BK-T18Y-54', N'Yellow', N'julianax_r_02_yellow_large.gif', 742.3500, 2, 192, 1.92340529, CAST(N'1953-01-01 00:07:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:47.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (469, N'Touring-3000 Yellow 58', N'BK-T18Y-58', N'Yellow', N'julianax_r_02_yellow_large.gif', 742.3500, 2, 189, 1.886468, CAST(N'1953-01-01 00:07:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:48.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (470, N'Touring-3000 Yellow 62', N'BK-T18Y-62', N'Yellow', N'julianax_r_02_yellow_large.gif', 742.3500, 3, 260, 2.60465622, CAST(N'1953-01-01 00:07:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:49.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (471, N'Touring-1000 Blue 46', N'BK-T79U-46', N'Blue', N'julianax_r_02_blue_large.gif', 2384.0700, 2, 192, 1.91716516, CAST(N'1953-01-01 00:07:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:50.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (472, N'Touring-1000 Blue 50', N'BK-T79U-50', N'Blue', N'julianax_r_02_blue_large.gif', 2384.0700, 2, 145, 1.4539659, CAST(N'1953-01-01 00:07:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:51.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (473, N'Touring-1000 Blue 54', N'BK-T79U-54', N'Blue', N'julianax_r_02_blue_large.gif', 2384.0700, 5, 416, 4.16076946, CAST(N'1953-01-01 00:07:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:52.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (474, N'Touring-1000 Blue 60', N'BK-T79U-60', N'Blue', N'julianax_r_02_blue_large.gif', 2384.0700, 4, 396, 3.95211458, CAST(N'1953-01-01 00:07:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:53.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (475, N'Touring-2000 Blue 46', N'BK-T44U-46', N'Blue', N'julianax_r_02_blue_large.gif', 1214.8500, 4, 365, 3.643514, CAST(N'1953-01-01 00:07:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:54.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (476, N'Touring-2000 Blue 50', N'BK-T44U-50', N'Blue', N'julianax_r_02_blue_large.gif', 1214.8500, 3, 202, 2.02397037, CAST(N'1953-01-01 00:07:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:55.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (477, N'Touring-2000 Blue 54', N'BK-T44U-54', N'Blue', N'julianax_r_02_blue_large.gif', 1214.8500, 3, 268, 2.67917013, CAST(N'1953-01-01 00:07:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:56.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (478, N'Road-350-W Yellow 40', N'BK-R79Y-40', N'Yellow', N'roadster_yellow_f_large.gif', 1700.9900, 3, 212, 2.12495875, CAST(N'1953-01-01 00:07:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:57.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (479, N'Road-350-W Yellow 42', N'BK-R79Y-42', N'Yellow', N'roadster_yellow_f_large.gif', 1700.9900, 1, 37, 0.371083766, CAST(N'1953-01-01 00:07:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:58.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (480, N'Road-350-W Yellow 44', N'BK-R79Y-44', N'Yellow', N'roadster_yellow_f_large.gif', 1700.9900, 2, 167, 1.67387009, CAST(N'1953-01-01 00:07:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:59.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (481, N'Road-350-W Yellow 48', N'BK-R79Y-48', N'Yellow', N'roadster_yellow_f_large.gif', 1700.9900, 5, 459, 4.58117771, CAST(N'1953-01-01 00:08:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:00.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (482, N'Road-750 Black 58', N'BK-R19B-58', N'Black', N'roadster_black_large.gif', 539.9900, 4, 389, 3.88234138, CAST(N'1953-01-01 00:08:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:01.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (483, N'Touring-3000 Blue 44', N'BK-T18U-44', N'Blue', N'julianax_r_02_blue_large.gif', 742.3500, 4, 326, 3.260326, CAST(N'1953-01-01 00:08:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:02.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (484, N'Touring-3000 Blue 50', N'BK-T18U-50', N'Blue', N'julianax_r_02_blue_large.gif', 742.3500, 5, 412, 4.117499, CAST(N'1953-01-01 00:08:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:03.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (485, N'Mountain-400-W Silver 38', N'BK-M38S-38', N'Silver', N'hotrodbike_f_large.gif', 769.4900, 2, 118, 1.18390548, CAST(N'1953-01-01 00:08:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:04.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (486, N'Mountain-400-W Silver 40', N'BK-M38S-40', N'Silver', N'hotrodbike_f_large.gif', 769.4900, 5, 420, 4.19447851, CAST(N'1953-01-01 00:08:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:05.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (487, N'Mountain-400-W Silver 42', N'BK-M38S-42', N'Silver', N'hotrodbike_f_large.gif', 769.4900, 3, 279, 2.78923416, CAST(N'1953-01-01 00:08:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:06.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (488, N'Mountain-400-W Silver 46', N'BK-M38S-46', N'Silver', N'hotrodbike_f_large.gif', 769.4900, 3, 225, 2.25527763, CAST(N'1953-01-01 00:08:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:07.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (489, N'Mountain-500 Silver 40', N'BK-M18S-40', N'Silver', N'no_image_available_large.gif', 564.9900, 4, 372, 3.71409488, CAST(N'1953-01-01 00:08:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:08.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (490, N'Mountain-500 Silver 42', N'BK-M18S-42', N'Silver', N'no_image_available_large.gif', 564.9900, 4, 361, 3.6055758, CAST(N'1953-01-01 00:08:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:09.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (491, N'Mountain-500 Silver 44', N'BK-M18S-44', N'Silver', N'no_image_available_large.gif', 564.9900, 3, 294, 2.94307232, CAST(N'1953-01-01 00:08:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:10.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (492, N'Mountain-500 Silver 48', N'BK-M18S-48', N'Silver', N'no_image_available_large.gif', 564.9900, 1, 31, 0.313068122, CAST(N'1953-01-01 00:08:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:11.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (493, N'Mountain-500 Silver 52', N'BK-M18S-52', N'Silver', N'no_image_available_large.gif', 564.9900, 1, 91, 0.913965, CAST(N'1953-01-01 00:08:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:12.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (494, N'Mountain-500 Black 40', N'BK-M18B-40', N'Black', N'no_image_available_large.gif', 539.9900, 1, 20, 0.20591417, CAST(N'1953-01-01 00:08:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:13.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (495, N'Mountain-500 Black 42', N'BK-M18B-42', N'Black', N'no_image_available_large.gif', 539.9900, 5, 442, 4.41904974, CAST(N'1953-01-01 00:08:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:14.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (496, N'Mountain-500 Black 44', N'BK-M18B-44', N'Black', N'no_image_available_large.gif', 539.9900, 4, 327, 3.271617, CAST(N'1953-01-01 00:08:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:15.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (497, N'Mountain-500 Black 48', N'BK-M18B-48', N'Black', N'no_image_available_large.gif', 539.9900, 2, 118, 1.18075013, CAST(N'1953-01-01 00:08:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:16.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (498, N'Mountain-500 Black 52', N'BK-M18B-52', N'Black', N'no_image_available_large.gif', 539.9900, 4, 305, 3.0475378, CAST(N'1953-01-01 00:08:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:17.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (502, N'Road-750 Black 44', N'BK-R19B-44', N'Black', N'roadster_black_large.gif', 539.9900, 1, 22, 0.226746246, CAST(N'1953-01-01 00:08:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:21.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (503, N'Road-750 Black 48', N'BK-R19B-48', N'Black', N'roadster_black_large.gif', 539.9900, 3, 273, 2.73088241, CAST(N'1953-01-01 00:08:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:22.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (504, N'Road-750 Black 52', N'BK-R19B-52', N'Black', N'roadster_black_large.gif', 539.9900, 3, 267, 2.67080069, CAST(N'1953-01-01 00:08:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:08:23.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (254, N'Road-150 Red 62', N'BK-R93R-62', N'Red', N'superlight_red_large.gif', 3578.2700, 1, 51, 0.5096193, CAST(N'1953-01-01 00:04:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:13.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (255, N'Road-150 Red 44', N'BK-R93R-44', N'Red', N'superlight_red_large.gif', 3578.2700, 5, 420, 4.19913626, CAST(N'1953-01-01 00:04:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:14.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (256, N'Road-150 Red 48', N'BK-R93R-48', N'Red', N'superlight_red_large.gif', 3578.2700, 4, 321, 3.21335363, CAST(N'1953-01-01 00:04:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:15.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (257, N'Road-150 Red 52', N'BK-R93R-52', N'Red', N'superlight_red_large.gif', 3578.2700, 3, 287, 2.86487317, CAST(N'1953-01-01 00:04:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:16.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (258, N'Road-150 Red 56', N'BK-R93R-56', N'Red', N'superlight_red_large.gif', 3578.2700, 2, 121, 1.20817, CAST(N'1953-01-01 00:04:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:17.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (259, N'Road-450 Red 58', N'BK-R68R-58', N'Red', N'roadster_red_large.gif', 1457.9900, 5, 419, 4.185967, CAST(N'1953-01-01 00:04:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:18.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (260, N'Road-450 Red 60', N'BK-R68R-60', N'Red', N'roadster_red_large.gif', 1457.9900, 5, 430, 4.29790354, CAST(N'1953-01-01 00:04:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:19.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (261, N'Road-450 Red 44', N'BK-R68R-44', N'Red', N'roadster_red_large.gif', 1457.9900, 3, 224, 2.23685646, CAST(N'1953-01-01 00:04:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:20.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (262, N'Road-450 Red 48', N'BK-R68R-48', N'Red', N'roadster_red_large.gif', 1457.9900, 5, 454, 4.535673, CAST(N'1953-01-01 00:04:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:21.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (263, N'Road-450 Red 52', N'BK-R68R-52', N'Red', N'roadster_red_large.gif', 1457.9900, 5, 402, 4.015842, CAST(N'1953-01-01 00:04:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:22.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (264, N'Road-650 Red 58', N'BK-R50R-58', N'Red', N'superlight_red_large.gif', 782.9900, 3, 230, 2.301222, CAST(N'1953-01-01 00:04:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:23.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (265, N'Road-650 Red 60', N'BK-R50R-60', N'Red', N'superlight_red_large.gif', 782.9900, 2, 170, 1.70241356, CAST(N'1953-01-01 00:04:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:24.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (266, N'Road-650 Red 62', N'BK-R50R-62', N'Red', N'superlight_red_large.gif', 782.9900, 4, 389, 3.890677, CAST(N'1953-01-01 00:04:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:25.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (267, N'Road-650 Red 44', N'BK-R50R-44', N'Red', N'superlight_red_large.gif', 782.9900, 3, 213, 2.134472, CAST(N'1953-01-01 00:04:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:26.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (268, N'Road-650 Red 48', N'BK-R50R-48', N'Red', N'superlight_red_large.gif', 782.9900, 4, 324, 3.2358675, CAST(N'1953-01-01 00:04:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:27.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (269, N'Road-650 Red 52', N'BK-R50R-52', N'Red', N'superlight_red_large.gif', 782.9900, 5, 500, 4.99502945, CAST(N'1953-01-01 00:04:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:28.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (270, N'Road-650 Black 58', N'BK-R50B-58', N'Black', N'superlight_black_large.gif', 782.9900, 4, 305, 3.044661, CAST(N'1953-01-01 00:04:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:29.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (271, N'Road-650 Black 60', N'BK-R50B-60', N'Black', N'superlight_black_large.gif', 782.9900, 1, 44, 0.448524237, CAST(N'1953-01-01 00:04:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:30.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (272, N'Road-650 Black 62', N'BK-R50B-62', N'Black', N'superlight_black_large.gif', 782.9900, 4, 312, 3.119204, CAST(N'1953-01-01 00:04:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:31.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (273, N'Road-650 Black 44', N'BK-R50B-44', N'Black', N'superlight_black_large.gif', 782.9900, 5, 496, 4.9532547, CAST(N'1953-01-01 00:04:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:32.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (274, N'Road-650 Black 48', N'BK-R50B-48', N'Black', N'superlight_black_large.gif', 782.9900, 5, 437, 4.36582, CAST(N'1953-01-01 00:04:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:33.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (275, N'Road-650 Black 52', N'BK-R50B-52', N'Black', N'superlight_black_large.gif', 782.9900, 3, 270, 2.69771981, CAST(N'1953-01-01 00:04:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:34.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (276, N'Mountain-100 Silver 38', N'BK-M82S-38', N'Silver', N'superlight_silver_large.gif', 3399.9900, 1, 68, 0.688196659, CAST(N'1953-01-01 00:04:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:35.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (277, N'Mountain-100 Silver 42', N'BK-M82S-42', N'Silver', N'superlight_silver_large.gif', 3399.9900, 1, 1, 0.009987967, CAST(N'1953-01-01 00:04:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:36.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (278, N'Mountain-100 Silver 44', N'BK-M82S-44', N'Silver', N'superlight_silver_large.gif', 3399.9900, 3, 279, 2.787327, CAST(N'1953-01-01 00:04:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:37.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (279, N'Mountain-100 Silver 48', N'BK-M82S-48', N'Silver', N'superlight_silver_large.gif', 3399.9900, 4, 336, 3.36096239, CAST(N'1953-01-01 00:04:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:38.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (280, N'Mountain-100 Black 38', N'BK-M82B-38', N'Black', N'superlight_black_large.gif', 3374.9900, 2, 189, 1.89618289, CAST(N'1953-01-01 00:04:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:39.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (281, N'Mountain-100 Black 42', N'BK-M82B-42', N'Black', N'superlight_black_large.gif', 3374.9900, 5, 433, 4.330839, CAST(N'1953-01-01 00:04:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:40.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (282, N'Mountain-100 Black 44', N'BK-M82B-44', N'Black', N'superlight_black_large.gif', 3374.9900, 2, 162, 1.62514472, CAST(N'1953-01-01 00:04:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:41.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (283, N'Mountain-100 Black 48', N'BK-M82B-48', N'Black', N'superlight_black_large.gif', 3374.9900, 4, 394, 3.93317437, CAST(N'1953-01-01 00:04:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:42.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (284, N'Mountain-200 Silver 38', N'BK-M68S-38', N'Silver', N'hotrodbike_silver_large.gif', 2319.9900, 3, 260, 2.5998, CAST(N'1953-01-01 00:04:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:43.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (285, N'Mountain-200 Silver 42', N'BK-M68S-42', N'Silver', N'hotrodbike_silver_large.gif', 2319.9900, 5, 415, 4.14818239, CAST(N'1953-01-01 00:04:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:44.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (286, N'Mountain-200 Silver 46', N'BK-M68S-46', N'Silver', N'hotrodbike_silver_large.gif', 2319.9900, 3, 271, 2.7060113, CAST(N'1953-01-01 00:04:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:45.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (287, N'Mountain-200 Black 38', N'BK-M68B-38', N'Black', N'hotrodbike_black_large.gif', 2294.9900, 3, 261, 2.6125536, CAST(N'1953-01-01 00:04:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:46.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (288, N'Mountain-200 Black 42', N'BK-M68B-42', N'Black', N'hotrodbike_black_large.gif', 2294.9900, 1, 81, 0.814546, CAST(N'1953-01-01 00:04:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:47.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (289, N'Mountain-200 Black 46', N'BK-M68B-46', N'Black', N'hotrodbike_black_large.gif', 2294.9900, 4, 317, 3.17092681, CAST(N'1953-01-01 00:04:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:48.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (290, N'Mountain-300 Black 38', N'BK-M47B-38', N'Black', N'hotrodbike_black_large.gif', 1079.9900, 3, 277, 2.7661705, CAST(N'1953-01-01 00:04:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:49.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (291, N'Mountain-300 Black 40', N'BK-M47B-40', N'Black', N'hotrodbike_black_large.gif', 1079.9900, 2, 157, 1.57305, CAST(N'1953-01-01 00:04:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:50.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (292, N'Mountain-300 Black 44', N'BK-M47B-44', N'Black', N'hotrodbike_black_large.gif', 1079.9900, 2, 125, 1.24975288, CAST(N'1953-01-01 00:04:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:51.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (293, N'Mountain-300 Black 48', N'BK-M47B-48', N'Black', N'hotrodbike_black_large.gif', 1079.9900, 5, 401, 4.003151, CAST(N'1953-01-01 00:04:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:52.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (294, N'Road-250 Red 44', N'BK-R89R-44', N'Red', N'racer_red_large.gif', 2443.3500, 3, 230, 2.30065727, CAST(N'1953-01-01 00:04:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:53.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (295, N'Road-250 Red 48', N'BK-R89R-48', N'Red', N'racer_red_large.gif', 2443.3500, 5, 461, 4.60800362, CAST(N'1953-01-01 00:04:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:54.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (296, N'Road-250 Red 52', N'BK-R89R-52', N'Red', N'racer_red_large.gif', 2443.3500, 2, 169, 1.68698549, CAST(N'1953-01-01 00:04:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:55.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (297, N'Road-250 Red 58', N'BK-R89R-58', N'Red', N'racer_red_large.gif', 2443.3500, 1, 96, 0.9612614, CAST(N'1953-01-01 00:04:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:56.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (298, N'Road-250 Black 44', N'BK-R89B-44', N'Black', N'racer_black_large.gif', 2443.3500, 1, 75, 0.7513088, CAST(N'1953-01-01 00:04:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:57.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (299, N'Road-250 Black 48', N'BK-R89B-48', N'Black', N'racer_black_large.gif', 2443.3500, 4, 331, 3.30670977, CAST(N'1953-01-01 00:04:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:58.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (300, N'Road-250 Black 52', N'BK-R89B-52', N'Black', N'racer_black_large.gif', 2443.3500, 2, 102, 1.02645719, CAST(N'1953-01-01 00:04:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:59.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (301, N'Road-250 Black 58', N'BK-R89B-58', N'Black', N'racer_black_large.gif', 2443.3500, 3, 267, 2.67448425, CAST(N'1953-01-01 00:05:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:00.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (302, N'Road-550-W Yellow 38', N'BK-R64Y-38', N'Yellow', N'racer02_yellow_f_large.gif', 1120.4900, 3, 255, 2.54984975, CAST(N'1953-01-01 00:05:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:01.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (303, N'Road-550-W Yellow 40', N'BK-R64Y-40', N'Yellow', N'racer02_yellow_f_large.gif', 1120.4900, 4, 387, 3.86625528, CAST(N'1953-01-01 00:05:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:02.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (304, N'Road-550-W Yellow 42', N'BK-R64Y-42', N'Yellow', N'racer02_yellow_f_large.gif', 1120.4900, 3, 241, 2.41171765, CAST(N'1953-01-01 00:05:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:03.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (305, N'Road-550-W Yellow 44', N'BK-R64Y-44', N'Yellow', N'racer02_yellow_f_large.gif', 1120.4900, 1, 50, 0.5060374, CAST(N'1953-01-01 00:05:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:04.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (306, N'Road-550-W Yellow 48', N'BK-R64Y-48', N'Yellow', N'racer02_yellow_f_large.gif', 1120.4900, 3, 219, 2.19330859, CAST(N'1953-01-01 00:05:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:05.000' AS DateTime), 34, N'Bikes', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (307, N'LL Fork', N'FK-1639', N'', N'fork_large.gif', 148.2200, 1, 59, 0.5970557, CAST(N'1953-01-01 00:05:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:06.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (308, N'ML Fork', N'FK-5136', N'', N'fork_large.gif', 175.4900, 5, 430, 4.298165, CAST(N'1953-01-01 00:05:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:07.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (309, N'HL Fork', N'FK-9939', N'', N'fork_large.gif', 229.4900, 3, 281, 2.81189942, CAST(N'1953-01-01 00:05:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:08.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (218, N'Long-Sleeve Logo Jersey S', N'LJ-0192-S', N'Multi', N'awc_jersey_male_large.gif', 49.9900, 2, 155, 1.55181575, CAST(N'1953-01-01 00:03:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (219, N'Long-Sleeve Logo Jersey M', N'LJ-0192-M', N'Multi', N'awc_jersey_male_large.gif', 49.9900, 2, 121, 1.21068025, CAST(N'1953-01-01 00:03:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:38.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (220, N'Long-Sleeve Logo Jersey L', N'LJ-0192-L', N'Multi', N'awc_jersey_male_large.gif', 49.9900, 4, 392, 3.92037868, CAST(N'1953-01-01 00:03:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (221, N'Long-Sleeve Logo Jersey XL', N'LJ-0192-X', N'Multi', N'awc_jersey_male_large.gif', 49.9900, 1, 66, 0.665299833, CAST(N'1953-01-01 00:03:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (222, N'HL Road Frame - Red 62', N'FR-R92R-62', N'Red', N'no_image_available_large.gif', 1431.5000, 4, 306, 3.06251884, CAST(N'1953-01-01 00:03:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (223, N'HL Road Frame - Red 44', N'FR-R92R-44', N'Red', N'no_image_available_large.gif', 1431.5000, 3, 280, 2.79645061, CAST(N'1953-01-01 00:03:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (224, N'HL Road Frame - Red 48', N'FR-R92R-48', N'Red', N'no_image_available_large.gif', 1431.5000, 4, 328, 3.27809644, CAST(N'1953-01-01 00:03:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (225, N'HL Road Frame - Red 52', N'FR-R92R-52', N'Red', N'no_image_available_large.gif', 1431.5000, 2, 170, 1.70513892, CAST(N'1953-01-01 00:03:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (226, N'HL Road Frame - Red 56', N'FR-R92R-56', N'Red', N'no_image_available_large.gif', 1431.5000, 1, 11, 0.11655625, CAST(N'1953-01-01 00:03:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:45.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (227, N'LL Road Frame - Black 58', N'FR-R38B-58', N'Black', N'no_image_available_large.gif', 337.2200, 1, 48, 0.4864296, CAST(N'1953-01-01 00:03:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:46.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (228, N'LL Road Frame - Black 60', N'FR-R38B-60', N'Black', N'no_image_available_large.gif', 337.2200, 5, 439, 4.389553, CAST(N'1953-01-01 00:03:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:47.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (229, N'LL Road Frame - Black 62', N'FR-R38B-62', N'Black', N'no_image_available_large.gif', 337.2200, 4, 356, 3.55436182, CAST(N'1953-01-01 00:03:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:48.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (230, N'LL Road Frame - Red 44', N'FR-R38R-44', N'Red', N'no_image_available_large.gif', 337.2200, 5, 446, 4.46069527, CAST(N'1953-01-01 00:03:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:49.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (231, N'LL Road Frame - Red 48', N'FR-R38R-48', N'Red', N'no_image_available_large.gif', 337.2200, 4, 326, 3.25632167, CAST(N'1953-01-01 00:03:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:50.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (232, N'LL Road Frame - Red 52', N'FR-R38R-52', N'Red', N'no_image_available_large.gif', 337.2200, 2, 127, 1.27653825, CAST(N'1953-01-01 00:03:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:51.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (233, N'LL Road Frame - Red 58', N'FR-R38R-58', N'Red', N'no_image_available_large.gif', 337.2200, 2, 132, 1.32416534, CAST(N'1953-01-01 00:03:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:52.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (234, N'LL Road Frame - Red 60', N'FR-R38R-60', N'Red', N'no_image_available_large.gif', 337.2200, 3, 237, 2.370063, CAST(N'1953-01-01 00:03:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:53.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (235, N'LL Road Frame - Red 62', N'FR-R38R-62', N'Red', N'no_image_available_large.gif', 337.2200, 1, 98, 0.9795242, CAST(N'1953-01-01 00:03:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:54.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (236, N'ML Road Frame - Red 44', N'FR-R72R-44', N'Red', N'no_image_available_large.gif', 594.8300, 5, 444, 4.437923, CAST(N'1953-01-01 00:03:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:55.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (237, N'ML Road Frame - Red 48', N'FR-R72R-48', N'Red', N'no_image_available_large.gif', 594.8300, 3, 246, 2.457923, CAST(N'1953-01-01 00:03:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:56.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (238, N'ML Road Frame - Red 52', N'FR-R72R-52', N'Red', N'no_image_available_large.gif', 594.8300, 4, 319, 3.189118, CAST(N'1953-01-01 00:03:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:57.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (239, N'ML Road Frame - Red 58', N'FR-R72R-58', N'Red', N'no_image_available_large.gif', 594.8300, 2, 160, 1.598561, CAST(N'1953-01-01 00:03:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:58.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (240, N'ML Road Frame - Red 60', N'FR-R72R-60', N'Red', N'no_image_available_large.gif', 594.8300, 2, 184, 1.8448602, CAST(N'1953-01-01 00:03:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:59.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (241, N'LL Road Frame - Black 44', N'FR-R38B-44', N'Black', N'no_image_available_large.gif', 337.2200, 2, 122, 1.22265875, CAST(N'1953-01-01 00:04:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:00.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (242, N'LL Road Frame - Black 48', N'FR-R38B-48', N'Black', N'no_image_available_large.gif', 337.2200, 5, 498, 4.977103, CAST(N'1953-01-01 00:04:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:01.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (243, N'LL Road Frame - Black 52', N'FR-R38B-52', N'Black', N'no_image_available_large.gif', 337.2200, 4, 305, 3.05253077, CAST(N'1953-01-01 00:04:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:02.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (244, N'HL Mountain Frame - Silver 42', N'FR-M94S-42', N'Silver', N'frame_silver_large.gif', 1364.5000, 1, 0, 0.00912344549, CAST(N'1953-01-01 00:04:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:03.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (245, N'HL Mountain Frame - Silver 44', N'FR-M94S-44', N'Silver', N'frame_silver_large.gif', 1364.5000, 5, 492, 4.91713428, CAST(N'1953-01-01 00:04:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:04.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (246, N'HL Mountain Frame - Silver 48', N'FR-M94S-52', N'Silver', N'frame_silver_large.gif', 1364.5000, 5, 481, 4.808956, CAST(N'1953-01-01 00:04:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:05.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (247, N'HL Mountain Frame - Silver 46', N'FR-M94S-46', N'Silver', N'frame_silver_large.gif', 1364.5000, 1, 78, 0.7857171, CAST(N'1953-01-01 00:04:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:06.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (248, N'HL Mountain Frame - Black 42', N'FR-M94B-42', N'Black', N'frame_black_large.gif', 1349.6000, 4, 386, 3.861285, CAST(N'1953-01-01 00:04:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:07.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (249, N'HL Mountain Frame - Black 44', N'FR-M94B-44', N'Black', N'frame_black_large.gif', 1349.6000, 1, 45, 0.4563785, CAST(N'1953-01-01 00:04:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:08.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (250, N'HL Mountain Frame - Black 48', N'FR-M94B-48', N'Black', N'frame_black_large.gif', 1349.6000, 1, 95, 0.954561651, CAST(N'1953-01-01 00:04:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:09.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (251, N'HL Mountain Frame - Black 46', N'FR-M94B-46', N'Black', N'frame_black_large.gif', 1349.6000, 1, 31, 0.3125127, CAST(N'1953-01-01 00:04:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:10.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (252, N'HL Mountain Frame - Black 38', N'FR-M94B-38', N'Black', N'frame_black_large.gif', 1349.6000, 1, 55, 0.5503105, CAST(N'1953-01-01 00:04:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:11.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (253, N'HL Mountain Frame - Silver 38', N'FR-M94S-38', N'Silver', N'frame_silver_large.gif', 1364.5000, 4, 367, 3.66398478, CAST(N'1953-01-01 00:04:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:04:12.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (198, N'LL Shell', N'SH-4562', N'', N'no_image_available_large.gif', 14.2600, 5, 488, 4.87466526, CAST(N'1953-01-01 00:03:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:17.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (199, N'HL Shell', N'SH-9312', N'', N'no_image_available_large.gif', 14.2600, 5, 443, 4.429998, CAST(N'1953-01-01 00:03:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:18.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (200, N'Spokes', N'SK-9283', N'', N'no_image_available_large.gif', 4.5500, 5, 487, 4.864436, CAST(N'1953-01-01 00:03:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:19.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (201, N'Seat Lug', N'SL-0931', N'', N'no_image_available_large.gif', 2.5500, 2, 127, 1.27587259, CAST(N'1953-01-01 00:03:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:20.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (202, N'Stem', N'SM-9087', N'', N'no_image_available_large.gif', 8.6600, 1, 66, 0.661323547, CAST(N'1953-01-01 00:03:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:21.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (142, N'Lock Washer 4', N'LW-1000', N'', N'no_image_available_large.gif', 1.3500, 5, 467, 4.666963, CAST(N'1953-01-01 00:02:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:21.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (143, N'Lock Washer 5', N'LW-1200', N'', N'no_image_available_large.gif', 1.3500, 1, 65, 0.6534917, CAST(N'1953-01-01 00:02:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:22.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (144, N'Lock Washer 10', N'LW-1201', N'', N'no_image_available_large.gif', 1.3500, 4, 350, 3.49826145, CAST(N'1953-01-01 00:02:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:23.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (145, N'Lock Washer 6', N'LW-1400', N'', N'no_image_available_large.gif', 1.3500, 4, 308, 3.07704282, CAST(N'1953-01-01 00:02:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:24.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (146, N'Lock Washer 13', N'LW-3400', N'', N'no_image_available_large.gif', 1.3500, 5, 416, 4.15283966, CAST(N'1953-01-01 00:02:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:25.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (147, N'Lock Washer 8', N'LW-3800', N'', N'no_image_available_large.gif', 1.3500, 4, 343, 3.42563272, CAST(N'1953-01-01 00:02:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:26.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (148, N'Lock Washer 1', N'LW-4000', N'', N'no_image_available_large.gif', 1.3500, 3, 285, 2.84871244, CAST(N'1953-01-01 00:02:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:27.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (149, N'Lock Washer 7', N'LW-5160', N'', N'no_image_available_large.gif', 1.3500, 1, 86, 0.863838136, CAST(N'1953-01-01 00:02:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:28.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (150, N'Lock Washer 12', N'LW-5800', N'', N'no_image_available_large.gif', 1.3500, 1, 92, 0.9226638, CAST(N'1953-01-01 00:02:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:29.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (151, N'Lock Washer 2', N'LW-6000', N'', N'no_image_available_large.gif', 1.3500, 4, 305, 3.0455544, CAST(N'1953-01-01 00:02:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:30.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (152, N'Lock Washer 9', N'LW-7160', N'', N'no_image_available_large.gif', 1.3500, 2, 125, 1.25374162, CAST(N'1953-01-01 00:02:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:31.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (153, N'Lock Washer 3', N'LW-8000', N'', N'no_image_available_large.gif', 1.3500, 5, 499, 4.985574, CAST(N'1953-01-01 00:02:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:32.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (154, N'Lock Washer 11', N'LW-9160', N'', N'no_image_available_large.gif', 1.3500, 3, 284, 2.84344721, CAST(N'1953-01-01 00:02:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:33.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (155, N'Metal Angle', N'MA-7075', N'', N'no_image_available_large.gif', 23.9900, 1, 31, 0.317183256, CAST(N'1953-01-01 00:02:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:34.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (156, N'Metal Bar 1', N'MB-2024', N'', N'no_image_available_large.gif', 31.4300, 2, 132, 1.31841874, CAST(N'1953-01-01 00:02:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:35.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (157, N'Metal Bar 2', N'MB-6061', N'', N'no_image_available_large.gif', 31.4300, 5, 422, 4.2128005, CAST(N'1953-01-01 00:02:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:36.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (158, N'Metal Plate 2', N'MP-2066', N'', N'no_image_available_large.gif', 20.3300, 3, 284, 2.84042978, CAST(N'1953-01-01 00:02:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (159, N'Metal Plate 1', N'MP-2503', N'', N'no_image_available_large.gif', 20.3300, 4, 323, 3.22995067, CAST(N'1953-01-01 00:02:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:38.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (160, N'Metal Plate 3', N'MP-4960', N'', N'no_image_available_large.gif', 20.3300, 3, 258, 2.58183074, CAST(N'1953-01-01 00:02:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (161, N'Metal Sheet 2', N'MS-0253', N'', N'no_image_available_large.gif', 20.3300, 5, 486, 4.85063648, CAST(N'1953-01-01 00:02:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (162, N'Metal Sheet 3', N'MS-1256', N'', N'no_image_available_large.gif', 20.3300, 1, 38, 0.38854596, CAST(N'1953-01-01 00:02:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (163, N'Metal Sheet 7', N'MS-1981', N'', N'no_image_available_large.gif', 20.3300, 3, 256, 2.56483674, CAST(N'1953-01-01 00:02:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (164, N'Metal Sheet 4', N'MS-2259', N'', N'no_image_available_large.gif', 20.3300, 1, 78, 0.7788266, CAST(N'1953-01-01 00:02:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (165, N'Metal Sheet 5', N'MS-2341', N'', N'no_image_available_large.gif', 20.3300, 5, 407, 4.06826353, CAST(N'1953-01-01 00:02:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (166, N'Metal Sheet 6', N'MS-2348', N'', N'no_image_available_large.gif', 20.3300, 4, 321, 3.21260643, CAST(N'1953-01-01 00:02:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:45.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (167, N'Metal Sheet 1', N'MS-6061', N'', N'no_image_available_large.gif', 20.3300, 3, 288, 2.876967, CAST(N'1953-01-01 00:02:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:46.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (168, N'Metal Tread Plate', N'MT-1000', N'', N'no_image_available_large.gif', 20.3300, 3, 276, 2.76430917, CAST(N'1953-01-01 00:02:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:47.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (169, N'LL Nipple', N'NI-4127', N'', N'no_image_available_large.gif', 3.4400, 4, 336, 3.36244583, CAST(N'1953-01-01 00:02:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:48.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (170, N'HL Nipple', N'NI-9522', N'', N'no_image_available_large.gif', 3.4400, 5, 498, 4.972732, CAST(N'1953-01-01 00:02:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:49.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (81, N'Keyed Washer', N'KW-4091', N'', N'no_image_available_large.gif', 1.3500, 1, 94, 0.945619, CAST(N'1953-01-01 00:01:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:20.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (82, N'External Lock Washer 3', N'LE-1000', N'', N'no_image_available_large.gif', 1.3500, 3, 238, 2.38404942, CAST(N'1953-01-01 00:01:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:21.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (83, N'External Lock Washer 4', N'LE-1200', N'', N'no_image_available_large.gif', 1.3500, 3, 270, 2.70397615, CAST(N'1953-01-01 00:01:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:22.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (84, N'External Lock Washer 9', N'LE-1201', N'', N'no_image_available_large.gif', 1.3500, 2, 163, 1.62750351, CAST(N'1953-01-01 00:01:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:23.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (85, N'External Lock Washer 5', N'LE-1400', N'', N'no_image_available_large.gif', 1.3500, 4, 336, 3.35518336, CAST(N'1953-01-01 00:01:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:24.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (86, N'External Lock Washer 7', N'LE-3800', N'', N'no_image_available_large.gif', 1.3500, 3, 234, 2.3419888, CAST(N'1953-01-01 00:01:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:25.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (87, N'External Lock Washer 6', N'LE-5160', N'', N'no_image_available_large.gif', 1.3500, 5, 417, 4.16748428, CAST(N'1953-01-01 00:01:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:26.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (88, N'External Lock Washer 1', N'LE-6000', N'', N'no_image_available_large.gif', 1.3500, 5, 405, 4.046019, CAST(N'1953-01-01 00:01:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:27.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (89, N'External Lock Washer 8', N'LE-7160', N'', N'no_image_available_large.gif', 1.3500, 4, 397, 3.96815181, CAST(N'1953-01-01 00:01:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:28.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (90, N'External Lock Washer 2', N'LE-8000', N'', N'no_image_available_large.gif', 1.3500, 4, 383, 3.82253, CAST(N'1953-01-01 00:01:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:29.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (91, N'Internal Lock Washer 3', N'LI-1000', N'', N'no_image_available_large.gif', 1.3500, 5, 469, 4.687702, CAST(N'1953-01-01 00:01:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:30.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (92, N'Internal Lock Washer 4', N'LI-1200', N'', N'no_image_available_large.gif', 1.3500, 2, 147, 1.474984, CAST(N'1953-01-01 00:01:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:31.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (93, N'Internal Lock Washer 9', N'LI-1201', N'', N'no_image_available_large.gif', 1.3500, 3, 261, 2.61392641, CAST(N'1953-01-01 00:01:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:32.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (94, N'Internal Lock Washer 5', N'LI-1400', N'', N'no_image_available_large.gif', 1.3500, 4, 332, 3.31696415, CAST(N'1953-01-01 00:01:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:33.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (48, N'Thin-Jam Hex Nut 13', N'HJ-5811', N'', N'no_image_available_large.gif', 1.3500, 3, 229, 2.286044, CAST(N'1953-01-01 00:00:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:47.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (49, N'Thin-Jam Hex Nut 14', N'HJ-5818', N'', N'no_image_available_large.gif', 1.3500, 1, 73, 0.7341252, CAST(N'1953-01-01 00:00:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:48.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (50, N'Thin-Jam Hex Nut 7', N'HJ-7161', N'', N'no_image_available_large.gif', 1.3500, 2, 110, 1.1065737, CAST(N'1953-01-01 00:00:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:49.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (51, N'Thin-Jam Hex Nut 8', N'HJ-7162', N'', N'no_image_available_large.gif', 1.3500, 3, 205, 2.0503664, CAST(N'1953-01-01 00:00:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:50.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (52, N'Thin-Jam Hex Nut 12', N'HJ-9080', N'', N'no_image_available_large.gif', 1.3500, 4, 360, 3.59363413, CAST(N'1953-01-01 00:00:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:51.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (53, N'Thin-Jam Hex Nut 11', N'HJ-9161', N'', N'no_image_available_large.gif', 1.3500, 4, 310, 3.09915137, CAST(N'1953-01-01 00:00:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:52.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (54, N'Hex Nut 5', N'HN-1024', N'', N'no_image_available_large.gif', 1.3500, 3, 244, 2.43984032, CAST(N'1953-01-01 00:00:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:53.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (55, N'Hex Nut 6', N'HN-1032', N'', N'no_image_available_large.gif', 1.3500, 1, 97, 0.9745672, CAST(N'1953-01-01 00:00:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:54.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (56, N'Hex Nut 16', N'HN-1213', N'', N'no_image_available_large.gif', 1.3500, 5, 439, 4.39095736, CAST(N'1953-01-01 00:00:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:55.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (57, N'Hex Nut 17', N'HN-1220', N'', N'no_image_available_large.gif', 1.3500, 5, 413, 4.12711573, CAST(N'1953-01-01 00:00:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:56.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (58, N'Hex Nut 7', N'HN-1224', N'', N'no_image_available_large.gif', 1.3500, 4, 368, 3.67698741, CAST(N'1953-01-01 00:00:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:57.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (59, N'Hex Nut 8', N'HN-1420', N'', N'no_image_available_large.gif', 1.3500, 5, 429, 4.291096, CAST(N'1953-01-01 00:00:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:58.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (60, N'Hex Nut 9', N'HN-1428', N'', N'no_image_available_large.gif', 1.3500, 4, 340, 3.398745, CAST(N'1953-01-01 00:00:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:59.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (61, N'Hex Nut 22', N'HN-3410', N'', N'no_image_available_large.gif', 1.3500, 4, 313, 3.12433076, CAST(N'1953-01-01 00:01:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:00.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (62, N'Hex Nut 23', N'HN-3416', N'', N'no_image_available_large.gif', 1.3500, 2, 109, 1.09203386, CAST(N'1953-01-01 00:01:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:01.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (63, N'Hex Nut 12', N'HN-3816', N'', N'no_image_available_large.gif', 1.3500, 5, 448, 4.47681236, CAST(N'1953-01-01 00:01:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:02.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (64, N'Hex Nut 13', N'HN-3824', N'', N'no_image_available_large.gif', 1.3500, 5, 449, 4.482199, CAST(N'1953-01-01 00:01:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:03.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (65, N'Hex Nut 1', N'HN-4402', N'', N'no_image_available_large.gif', 1.3500, 1, 43, 0.432899415, CAST(N'1953-01-01 00:01:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:04.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (66, N'Hex Nut 10', N'HN-5161', N'', N'no_image_available_large.gif', 1.3500, 5, 420, 4.19289541, CAST(N'1953-01-01 00:01:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:05.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (67, N'Hex Nut 11', N'HN-5162', N'', N'no_image_available_large.gif', 1.3500, 1, 85, 0.850714147, CAST(N'1953-01-01 00:01:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:06.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (68, N'Hex Nut 2', N'HN-5400', N'', N'no_image_available_large.gif', 1.3500, 4, 322, 3.22057652, CAST(N'1953-01-01 00:01:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:07.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (69, N'Hex Nut 20', N'HN-5811', N'', N'no_image_available_large.gif', 1.3500, 5, 414, 4.134072, CAST(N'1953-01-01 00:01:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:08.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (70, N'Hex Nut 21', N'HN-5818', N'', N'no_image_available_large.gif', 1.3500, 2, 109, 1.09593832, CAST(N'1953-01-01 00:01:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:09.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (71, N'Hex Nut 3', N'HN-6320', N'', N'no_image_available_large.gif', 1.3500, 5, 500, 4.99986362, CAST(N'1953-01-01 00:01:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:10.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (72, N'Hex Nut 14', N'HN-7161', N'', N'no_image_available_large.gif', 1.3500, 3, 241, 2.40682817, CAST(N'1953-01-01 00:01:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:11.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (73, N'Hex Nut 15', N'HN-7162', N'', N'no_image_available_large.gif', 1.3500, 4, 326, 3.26102614, CAST(N'1953-01-01 00:01:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:12.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (74, N'Hex Nut 4', N'HN-8320', N'', N'no_image_available_large.gif', 1.3500, 4, 360, 3.59863, CAST(N'1953-01-01 00:01:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:13.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (75, N'Hex Nut 18', N'HN-9161', N'', N'no_image_available_large.gif', 1.3500, 5, 405, 4.04731274, CAST(N'1953-01-01 00:01:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:14.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (76, N'Hex Nut 19', N'HN-9168', N'', N'no_image_available_large.gif', 1.3500, 1, 50, 0.504677, CAST(N'1953-01-01 00:01:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:15.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (361, N'Men''s Bib-Shorts M', N'SB-M891-M', N'Multi', N'no_image_available_large.gif', 89.9900, 4, 308, 3.07725573, CAST(N'1953-01-01 00:06:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:00.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (362, N'Men''s Bib-Shorts L', N'SB-M891-L', N'Multi', N'no_image_available_large.gif', 89.9900, 3, 295, 2.94445825, CAST(N'1953-01-01 00:06:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:01.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (363, N'Half-Finger Gloves S', N'GL-H102-S', N'Black', N'no_image_available_large.gif', 24.4900, 5, 454, 4.54034853, CAST(N'1953-01-01 00:06:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:02.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (364, N'Half-Finger Gloves M', N'GL-H102-M', N'Black', N'no_image_available_large.gif', 24.4900, 2, 180, 1.8011651, CAST(N'1953-01-01 00:06:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:03.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (365, N'Half-Finger Gloves L', N'GL-H102-L', N'Black', N'no_image_available_large.gif', 24.4900, 4, 379, 3.78400445, CAST(N'1953-01-01 00:06:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:04.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (366, N'Full-Finger Gloves S', N'GL-F110-S', N'Black', N'no_image_available_large.gif', 37.9900, 4, 395, 3.94468665, CAST(N'1953-01-01 00:06:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:05.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (367, N'Full-Finger Gloves M', N'GL-F110-M', N'Black', N'no_image_available_large.gif', 37.9900, 1, 59, 0.596928835, CAST(N'1953-01-01 00:06:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:06.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (368, N'Full-Finger Gloves L', N'GL-F110-L', N'Black', N'no_image_available_large.gif', 37.9900, 1, 51, 0.5127026, CAST(N'1953-01-01 00:06:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:07.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (369, N'Classic Vest S', N'VE-C304-S', N'Blue', N'no_image_available_large.gif', 63.5000, 4, 307, 3.06808543, CAST(N'1953-01-01 00:06:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:08.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (370, N'Classic Vest M', N'VE-C304-M', N'Blue', N'no_image_available_large.gif', 63.5000, 4, 319, 3.18607521, CAST(N'1953-01-01 00:06:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:09.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (371, N'Classic Vest L', N'VE-C304-L', N'Blue', N'no_image_available_large.gif', 63.5000, 3, 285, 2.8528223, CAST(N'1953-01-01 00:06:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:10.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (372, N'Women''s Mountain Shorts S', N'SH-W890-S', N'Black', N'shorts_female_large.gif', 69.9900, 5, 408, 4.081042, CAST(N'1953-01-01 00:06:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:11.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (373, N'Women''s Mountain Shorts M', N'SH-W890-M', N'Black', N'shorts_female_large.gif', 69.9900, 5, 433, 4.322279, CAST(N'1953-01-01 00:06:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:12.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (374, N'Women''s Mountain Shorts L', N'SH-W890-L', N'Black', N'shorts_female_large.gif', 69.9900, 2, 120, 1.19816566, CAST(N'1953-01-01 00:06:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:13.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (379, N'Racing Socks M', N'SO-R809-M', N'White', N'no_image_available_large.gif', 8.9900, 3, 267, 2.66605449, CAST(N'1953-01-01 00:06:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:18.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (380, N'Racing Socks L', N'SO-R809-L', N'White', N'no_image_available_large.gif', 8.9900, 5, 498, 4.97610664, CAST(N'1953-01-01 00:06:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:19.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (176, N'Pinch Bolt', N'PB-6109', N'', N'no_image_available_large.gif', 4.5500, 1, 35, 0.358447969, CAST(N'1953-01-01 00:02:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:55.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (354, N'Men''s Sports Shorts M', N'SH-M897-M', N'Black', N'shorts_male_large.gif', 59.9900, 5, 431, 4.3103075, CAST(N'1953-01-01 00:05:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:53.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (355, N'Men''s Sports Shorts L', N'SH-M897-L', N'Black', N'shorts_male_large.gif', 59.9900, 5, 475, 4.748334, CAST(N'1953-01-01 00:05:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:54.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (356, N'Men''s Sports Shorts XL', N'SH-M897-X', N'Black', N'shorts_male_large.gif', 59.9900, 2, 135, 1.35455835, CAST(N'1953-01-01 00:05:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:55.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (357, N'Women''s Tights S', N'TG-W091-S', N'Black', N'no_image_available_large.gif', 74.9900, 3, 248, 2.484909, CAST(N'1953-01-01 00:05:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:56.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (358, N'Women''s Tights M', N'TG-W091-M', N'Black', N'no_image_available_large.gif', 74.9900, 2, 164, 1.6373961, CAST(N'1953-01-01 00:05:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:57.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (359, N'Women''s Tights L', N'TG-W091-L', N'Black', N'no_image_available_large.gif', 74.9900, 1, 94, 0.9401067, CAST(N'1953-01-01 00:05:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:58.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (360, N'Men''s Bib-Shorts S', N'SB-M891-S', N'Multi', N'no_image_available_large.gif', 89.9900, 2, 130, 1.30726612, CAST(N'1953-01-01 00:05:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:59.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (319, N'ML Mountain Frame - Black 38', N'FR-M63B-38', N'Black', N'no_image_available_large.gif', 348.7600, 4, 315, 3.15303946, CAST(N'1953-01-01 00:05:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:18.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (320, N'LL Mountain Front Wheel', N'FW-M423', N'Black', N'wheel_large.gif', 60.7450, 4, 400, 3.99640226, CAST(N'1953-01-01 00:05:19.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:19.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (321, N'ML Mountain Front Wheel', N'FW-M762', N'Black', N'wheel_large.gif', 209.0250, 2, 128, 1.2781235, CAST(N'1953-01-01 00:05:20.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:20.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (322, N'HL Mountain Front Wheel', N'FW-M928', N'Black', N'wheel_large.gif', 300.2150, 2, 132, 1.3199259, CAST(N'1953-01-01 00:05:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:21.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (323, N'LL Road Front Wheel', N'FW-R623', N'Black', N'wheel_large.gif', 85.5650, 1, 6, 0.06494069, CAST(N'1953-01-01 00:05:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:22.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (324, N'ML Road Front Wheel', N'FW-R762', N'Black', N'wheel_large.gif', 248.3850, 3, 223, 2.22885919, CAST(N'1953-01-01 00:05:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:23.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (325, N'HL Road Front Wheel', N'FW-R820', N'Black', N'wheel_large.gif', 330.0600, 2, 147, 1.4716109, CAST(N'1953-01-01 00:05:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:24.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (326, N'Touring Front Wheel', N'FW-T905', N'Black', N'wheel_large.gif', 218.0100, 5, 420, 4.19877148, CAST(N'1953-01-01 00:05:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:25.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (327, N'ML Road Frame-W - Yellow 38', N'FR-R72Y-38', N'Yellow', N'no_image_available_large.gif', 594.8300, 5, 412, 4.116053, CAST(N'1953-01-01 00:05:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:26.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (335, N'ML Mountain Frame - Black 40', N'FR-M63B-40', N'Black', N'no_image_available_large.gif', 348.7600, 5, 423, 4.22169876, CAST(N'1953-01-01 00:05:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:34.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (336, N'ML Mountain Frame - Black 44', N'FR-M63B-44', N'Black', N'no_image_available_large.gif', 348.7600, 2, 178, 1.78098929, CAST(N'1953-01-01 00:05:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:35.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (337, N'ML Mountain Frame - Black 48', N'FR-M63B-48', N'Black', N'no_image_available_large.gif', 348.7600, 3, 276, 2.75888944, CAST(N'1953-01-01 00:05:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:36.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (338, N'ML Road Frame-W - Yellow 40', N'FR-R72Y-40', N'Yellow', N'no_image_available_large.gif', 594.8300, 2, 152, 1.52145684, CAST(N'1953-01-01 00:05:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (339, N'ML Road Frame-W - Yellow 42', N'FR-R72Y-42', N'Yellow', N'no_image_available_large.gif', 594.8300, 3, 209, 2.09376264, CAST(N'1953-01-01 00:05:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:38.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (340, N'ML Road Frame-W - Yellow 44', N'FR-R72Y-44', N'Yellow', N'no_image_available_large.gif', 594.8300, 2, 195, 1.95487392, CAST(N'1953-01-01 00:05:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (341, N'ML Road Frame-W - Yellow 48', N'FR-R72Y-48', N'Yellow', N'no_image_available_large.gif', 594.8300, 3, 211, 2.10895562, CAST(N'1953-01-01 00:05:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (342, N'HL Road Frame - Black 62', N'FR-R92B-62', N'Black', N'no_image_available_large.gif', 1431.5000, 4, 332, 3.31438875, CAST(N'1953-01-01 00:05:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (343, N'HL Road Frame - Black 44', N'FR-R92B-44', N'Black', N'no_image_available_large.gif', 1431.5000, 4, 300, 3.00264645, CAST(N'1953-01-01 00:05:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (344, N'HL Road Frame - Black 48', N'FR-R92B-48', N'Black', N'no_image_available_large.gif', 1431.5000, 5, 466, 4.659987, CAST(N'1953-01-01 00:05:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (345, N'HL Road Frame - Black 52', N'FR-R92B-52', N'Black', N'no_image_available_large.gif', 1431.5000, 5, 457, 4.5628047, CAST(N'1953-01-01 00:05:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (346, N'Men''s Sports Shorts S', N'SH-M897-S', N'Black', N'shorts_male_large.gif', 59.9900, 2, 149, 1.495504, CAST(N'1953-01-01 00:05:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:05:45.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (38, N'Thin-Jam Hex Nut 9', N'HJ-1213', N'', N'no_image_available_large.gif', 1.3500, 2, 190, 1.9050225, CAST(N'1953-01-01 00:00:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (39, N'Thin-Jam Hex Nut 10', N'HJ-1220', N'', N'no_image_available_large.gif', 1.3500, 2, 171, 1.71570921, CAST(N'1953-01-01 00:00:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:38.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (40, N'Thin-Jam Hex Nut 1', N'HJ-1420', N'', N'no_image_available_large.gif', 1.3500, 5, 479, 4.787276, CAST(N'1953-01-01 00:00:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (41, N'Thin-Jam Hex Nut 2', N'HJ-1428', N'', N'no_image_available_large.gif', 1.3500, 3, 253, 2.525646, CAST(N'1953-01-01 00:00:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (42, N'Thin-Jam Hex Nut 15', N'HJ-3410', N'', N'no_image_available_large.gif', 1.3500, 4, 358, 3.57986259, CAST(N'1953-01-01 00:00:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (43, N'Thin-Jam Hex Nut 16', N'HJ-3416', N'', N'no_image_available_large.gif', 1.3500, 1, 59, 0.5947887, CAST(N'1953-01-01 00:00:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (44, N'Thin-Jam Hex Nut 5', N'HJ-3816', N'', N'no_image_available_large.gif', 1.3500, 2, 136, 1.36725748, CAST(N'1953-01-01 00:00:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (45, N'Thin-Jam Hex Nut 6', N'HJ-3824', N'', N'no_image_available_large.gif', 1.3500, 5, 454, 4.53548956, CAST(N'1953-01-01 00:00:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (46, N'Thin-Jam Hex Nut 3', N'HJ-5161', N'', N'no_image_available_large.gif', 1.3500, 4, 398, 3.973828, CAST(N'1953-01-01 00:00:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:45.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (47, N'Thin-Jam Hex Nut 4', N'HJ-5162', N'', N'no_image_available_large.gif', 1.3500, 2, 168, 1.68580174, CAST(N'1953-01-01 00:00:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:46.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (95, N'Internal Lock Washer 7', N'LI-3800', N'', N'no_image_available_large.gif', 1.3500, 2, 166, 1.66294515, CAST(N'1953-01-01 00:01:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:34.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (96, N'Internal Lock Washer 6', N'LI-5160', N'', N'no_image_available_large.gif', 1.3500, 2, 143, 1.43361211, CAST(N'1953-01-01 00:01:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:35.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (97, N'Internal Lock Washer 10', N'LI-5800', N'', N'no_image_available_large.gif', 1.3500, 5, 411, 4.10305, CAST(N'1953-01-01 00:01:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:36.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (98, N'Internal Lock Washer 1', N'LI-6000', N'', N'no_image_available_large.gif', 1.3500, 2, 111, 1.1125896, CAST(N'1953-01-01 00:01:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (99, N'Internal Lock Washer 8', N'LI-7160', N'', N'no_image_available_large.gif', 1.3500, 1, 93, 0.934358, CAST(N'1953-01-01 00:01:38.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:38.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (100, N'Internal Lock Washer 2', N'LI-8000', N'', N'no_image_available_large.gif', 1.3500, 1, 34, 0.342594266, CAST(N'1953-01-01 00:01:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (101, N'Thin-Jam Lock Nut 9', N'LJ-1213', N'', N'no_image_available_large.gif', 1.3500, 4, 312, 3.12311387, CAST(N'1953-01-01 00:01:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (102, N'Thin-Jam Lock Nut 10', N'LJ-1220', N'', N'no_image_available_large.gif', 1.3500, 4, 347, 3.46522522, CAST(N'1953-01-01 00:01:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (103, N'Thin-Jam Lock Nut 1', N'LJ-1420', N'', N'no_image_available_large.gif', 1.3500, 4, 315, 3.15197182, CAST(N'1953-01-01 00:01:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (104, N'Thin-Jam Lock Nut 2', N'LJ-1428', N'', N'no_image_available_large.gif', 1.3500, 5, 464, 4.638187, CAST(N'1953-01-01 00:01:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (105, N'Thin-Jam Lock Nut 15', N'LJ-3410', N'', N'no_image_available_large.gif', 1.3500, 2, 110, 1.1067102, CAST(N'1953-01-01 00:01:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (106, N'Thin-Jam Lock Nut 16', N'LJ-3416', N'', N'no_image_available_large.gif', 1.3500, 5, 465, 4.643538, CAST(N'1953-01-01 00:01:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:45.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (107, N'Thin-Jam Lock Nut 5', N'LJ-3816', N'', N'no_image_available_large.gif', 1.3500, 1, 33, 0.332607985, CAST(N'1953-01-01 00:01:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:46.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (108, N'Thin-Jam Lock Nut 6', N'LJ-3824', N'', N'no_image_available_large.gif', 1.3500, 5, 450, 4.50052166, CAST(N'1953-01-01 00:01:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:47.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (109, N'Thin-Jam Lock Nut 3', N'LJ-5161', N'', N'no_image_available_large.gif', 1.3500, 4, 339, 3.39252734, CAST(N'1953-01-01 00:01:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:48.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (110, N'Thin-Jam Lock Nut 4', N'LJ-5162', N'', N'no_image_available_large.gif', 1.3500, 1, 47, 0.4698902, CAST(N'1953-01-01 00:01:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:49.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (111, N'Thin-Jam Lock Nut 13', N'LJ-5811', N'', N'no_image_available_large.gif', 1.3500, 1, 74, 0.745487154, CAST(N'1953-01-01 00:01:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:50.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (112, N'Thin-Jam Lock Nut 14', N'LJ-5818', N'', N'no_image_available_large.gif', 1.3500, 1, 53, 0.534862459, CAST(N'1953-01-01 00:01:51.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:51.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (113, N'Thin-Jam Lock Nut 7', N'LJ-7161', N'', N'no_image_available_large.gif', 1.3500, 4, 305, 3.04935122, CAST(N'1953-01-01 00:01:52.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:52.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (114, N'Thin-Jam Lock Nut 8', N'LJ-7162', N'', N'no_image_available_large.gif', 1.3500, 5, 477, 4.765214, CAST(N'1953-01-01 00:01:53.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:53.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (115, N'Thin-Jam Lock Nut 12', N'LJ-9080', N'', N'no_image_available_large.gif', 1.3500, 3, 245, 2.453126, CAST(N'1953-01-01 00:01:54.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:54.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (116, N'Thin-Jam Lock Nut 11', N'LJ-9161', N'', N'no_image_available_large.gif', 1.3500, 1, 74, 0.740281343, CAST(N'1953-01-01 00:01:55.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:55.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (117, N'Lock Nut 5', N'LN-1024', N'', N'no_image_available_large.gif', 1.3500, 4, 339, 3.38805771, CAST(N'1953-01-01 00:01:56.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:56.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (118, N'Lock Nut 6', N'LN-1032', N'', N'no_image_available_large.gif', 1.3500, 3, 285, 2.84930873, CAST(N'1953-01-01 00:01:57.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:57.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (119, N'Lock Nut 16', N'LN-1213', N'', N'no_image_available_large.gif', 1.3500, 2, 112, 1.12701571, CAST(N'1953-01-01 00:01:58.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:58.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (120, N'Lock Nut 17', N'LN-1220', N'', N'no_image_available_large.gif', 1.3500, 4, 309, 3.09091067, CAST(N'1953-01-01 00:01:59.000' AS DateTime), 34, CAST(N'1953-01-01 00:01:59.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (121, N'Lock Nut 7', N'LN-1224', N'', N'no_image_available_large.gif', 1.3500, 1, 2, 0.02541099, CAST(N'1953-01-01 00:02:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:00.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (122, N'Lock Nut 8', N'LN-1420', N'', N'no_image_available_large.gif', 1.3500, 2, 180, 1.80469513, CAST(N'1953-01-01 00:02:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:01.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (123, N'Lock Nut 9', N'LN-1428', N'', N'no_image_available_large.gif', 1.3500, 5, 426, 4.25242472, CAST(N'1953-01-01 00:02:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:02.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (124, N'Lock Nut 22', N'LN-3410', N'', N'no_image_available_large.gif', 1.3500, 1, 31, 0.3115421, CAST(N'1953-01-01 00:02:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:03.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (125, N'Lock Nut 23', N'LN-3416', N'', N'no_image_available_large.gif', 1.3500, 2, 141, 1.40823627, CAST(N'1953-01-01 00:02:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:04.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (126, N'Lock Nut 12', N'LN-3816', N'', N'no_image_available_large.gif', 1.3500, 4, 353, 3.52487946, CAST(N'1953-01-01 00:02:05.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:05.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (127, N'Lock Nut 13', N'LN-3824', N'', N'no_image_available_large.gif', 1.3500, 5, 480, 4.79290152, CAST(N'1953-01-01 00:02:06.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:06.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (128, N'Lock Nut 1', N'LN-4400', N'', N'no_image_available_large.gif', 1.3500, 5, 495, 4.944062, CAST(N'1953-01-01 00:02:07.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:07.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (129, N'Lock Nut 10', N'LN-5161', N'', N'no_image_available_large.gif', 1.3500, 2, 193, 1.9356848, CAST(N'1953-01-01 00:02:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:08.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (130, N'Lock Nut 11', N'LN-5162', N'', N'no_image_available_large.gif', 1.3500, 3, 261, 2.61370087, CAST(N'1953-01-01 00:02:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:09.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (131, N'Lock Nut 2', N'LN-5400', N'', N'no_image_available_large.gif', 1.3500, 2, 140, 1.40162659, CAST(N'1953-01-01 00:02:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:10.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (132, N'Lock Nut 20', N'LN-5811', N'', N'no_image_available_large.gif', 1.3500, 3, 253, 2.53288054, CAST(N'1953-01-01 00:02:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:11.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (133, N'Lock Nut 21', N'LN-5818', N'', N'no_image_available_large.gif', 1.3500, 3, 266, 2.65789557, CAST(N'1953-01-01 00:02:12.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:12.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (134, N'Lock Nut 3', N'LN-6320', N'', N'no_image_available_large.gif', 1.3500, 1, 28, 0.285042, CAST(N'1953-01-01 00:02:13.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:13.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (135, N'Lock Nut 14', N'LN-7161', N'', N'no_image_available_large.gif', 1.3500, 2, 140, 1.40276814, CAST(N'1953-01-01 00:02:14.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:14.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (136, N'Lock Nut 15', N'LN-7162', N'', N'no_image_available_large.gif', 1.3500, 3, 248, 2.480394, CAST(N'1953-01-01 00:02:15.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:15.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (137, N'Lock Nut 4', N'LN-8320', N'', N'no_image_available_large.gif', 1.3500, 5, 424, 4.2320776, CAST(N'1953-01-01 00:02:16.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:16.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (138, N'Lock Nut 19', N'LN-9080', N'', N'no_image_available_large.gif', 1.3500, 4, 307, 3.06578922, CAST(N'1953-01-01 00:02:17.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:17.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (139, N'Lock Nut 18', N'LN-9161', N'', N'no_image_available_large.gif', 1.3500, 1, 52, 0.520793259, CAST(N'1953-01-01 00:02:18.000' AS DateTime), 34, CAST(N'1953-01-01 00:02:18.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (22, N'Flat Washer 1', N'FW-1000', N'', N'no_image_available_large.gif', 1.1500, 5, 424, 4.24025869, CAST(N'1953-01-01 00:00:21.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:21.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (23, N'Flat Washer 6', N'FW-1200', N'', N'no_image_available_large.gif', 1.1500, 5, 496, 4.959511, CAST(N'1953-01-01 00:00:22.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:22.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (24, N'Flat Washer 2', N'FW-1400', N'', N'no_image_available_large.gif', 1.1500, 1, 16, 0.163125992, CAST(N'1953-01-01 00:00:23.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:23.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (25, N'Flat Washer 9', N'FW-3400', N'', N'no_image_available_large.gif', 1.1500, 4, 350, 3.49970984, CAST(N'1953-01-01 00:00:24.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:24.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (26, N'Flat Washer 4', N'FW-3800', N'', N'no_image_available_large.gif', 1.1500, 3, 263, 2.63142061, CAST(N'1953-01-01 00:00:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:25.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (27, N'Flat Washer 3', N'FW-5160', N'', N'no_image_available_large.gif', 1.1500, 5, 467, 4.670093, CAST(N'1953-01-01 00:00:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:26.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (28, N'Flat Washer 8', N'FW-5800', N'', N'no_image_available_large.gif', 1.1500, 4, 344, 3.43810153, CAST(N'1953-01-01 00:00:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:27.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (29, N'Flat Washer 5', N'FW-7160', N'', N'no_image_available_large.gif', 1.1500, 3, 273, 2.73407722, CAST(N'1953-01-01 00:00:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:28.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (30, N'Flat Washer 7', N'FW-9160', N'', N'no_image_available_large.gif', 1.1500, 1, 40, 0.405549735, CAST(N'1953-01-01 00:00:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:29.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (1, N'Adjustable Race', N'AR-5381', N'', N'no_image_available_large.gif', 1.2300, 4, 363, 3.63121629, CAST(N'1953-01-01 00:00:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:00.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (2, N'Bearing Ball', N'BA-8327', N'', N'no_image_available_large.gif', 1.2300, 5, 409, 4.086627, CAST(N'1953-01-01 00:00:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:01.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (3, N'BB Ball Bearing', N'BE-2349', N'', N'no_image_available_large.gif', 1.2300, 4, 384, 3.8401134, CAST(N'1953-01-01 00:00:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:02.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (4, N'Headset Ball Bearings', N'BE-2908', N'', N'no_image_available_large.gif', 1.2300, 3, 279, 2.790806, CAST(N'1953-01-01 00:00:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:03.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (210, N'HL Road Frame - Black 58', N'FR-R92B-58', N'Black', N'no_image_available_large.gif', 1431.5000, 5, 496, 4.95873547, CAST(N'1953-01-01 00:03:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:29.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (211, N'HL Road Frame - Red 58', N'FR-R92R-58', N'Red', N'no_image_available_large.gif', 1431.5000, 1, 16, 0.167215288, CAST(N'1953-01-01 00:03:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:30.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (212, N'Sport-100 Helmet Red', N'HL-U509-R', N'Red', N'no_image_available_large.gif', 34.9900, 4, 346, 3.45863724, CAST(N'1953-01-01 00:03:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:31.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (213, N'Sport-100 Helmet Black', N'HL-U509', N'Black', N'no_image_available_large.gif', 34.9900, 1, 60, 0.6059305, CAST(N'1953-01-01 00:03:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:32.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (214, N'Mountain Bike Socks M', N'SO-B909-M', N'White', N'no_image_available_large.gif', 9.5000, 1, 97, 0.9745538, CAST(N'1953-01-01 00:03:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:33.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (215, N'Mountain Bike Socks L', N'SO-B909-L', N'White', N'no_image_available_large.gif', 9.5000, 3, 248, 2.482584, CAST(N'1953-01-01 00:03:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:34.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (216, N'Sport-100 Helmet Blue', N'HL-U509-B', N'Blue', N'no_image_available_large.gif', 34.9900, 3, 291, 2.90644717, CAST(N'1953-01-01 00:03:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:03:35.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (422, N'LL Mountain Frame - Silver 42', N'FR-M21S-42', N'Silver', N'no_image_available_large.gif', 264.0500, 1, 42, 0.426619172, CAST(N'1953-01-01 00:07:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:01.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (423, N'LL Mountain Frame - Silver 44', N'FR-M21S-44', N'Silver', N'no_image_available_large.gif', 264.0500, 3, 293, 2.92653131, CAST(N'1953-01-01 00:07:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:02.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (424, N'LL Mountain Frame - Silver 48', N'FR-M21S-48', N'Silver', N'no_image_available_large.gif', 264.0500, 1, 20, 0.200945124, CAST(N'1953-01-01 00:07:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:03.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (425, N'LL Mountain Frame - Silver 52', N'FR-M21S-52', N'Silver', N'no_image_available_large.gif', 264.0500, 4, 389, 3.889995, CAST(N'1953-01-01 00:07:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:04.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (400, N'LL Touring Frame - Blue 50', N'FR-T67U-50', N'Blue', N'no_image_available_large.gif', 333.4200, 1, 61, 0.6181181, CAST(N'1953-01-01 00:06:39.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:39.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (401, N'LL Touring Frame - Blue 54', N'FR-T67U-54', N'Blue', N'no_image_available_large.gif', 333.4200, 1, 90, 0.8985752, CAST(N'1953-01-01 00:06:40.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:40.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (402, N'LL Touring Frame - Blue 58', N'FR-T67U-58', N'Blue', N'no_image_available_large.gif', 333.4200, 3, 289, 2.88984251, CAST(N'1953-01-01 00:06:41.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:41.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (403, N'LL Touring Frame - Blue 62', N'FR-T67U-62', N'Blue', N'no_image_available_large.gif', 333.4200, 4, 365, 3.64528155, CAST(N'1953-01-01 00:06:42.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:42.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (404, N'LL Touring Frame - Yellow 44', N'FR-T67Y-44', N'Yellow', N'frame_large.gif', 333.4200, 5, 415, 4.147517, CAST(N'1953-01-01 00:06:43.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:43.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (405, N'LL Touring Frame - Yellow 50', N'FR-T67Y-50', N'Yellow', N'frame_large.gif', 333.4200, 2, 114, 1.14346957, CAST(N'1953-01-01 00:06:44.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:44.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (406, N'LL Touring Frame - Yellow 54', N'FR-T67Y-54', N'Yellow', N'frame_large.gif', 333.4200, 3, 200, 2.00344467, CAST(N'1953-01-01 00:06:45.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:45.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (407, N'LL Touring Frame - Yellow 58', N'FR-T67Y-58', N'Yellow', N'frame_large.gif', 333.4200, 1, 22, 0.222940564, CAST(N'1953-01-01 00:06:46.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:46.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (408, N'LL Touring Frame - Blue 44', N'FR-T67U-44', N'Blue', N'no_image_available_large.gif', 333.4200, 2, 140, 1.40010357, CAST(N'1953-01-01 00:06:47.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:47.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (409, N'ML Mountain Frame-W - Silver 40', N'FR-M63S-40', N'Silver', N'no_image_available_large.gif', 364.0900, 3, 242, 2.42286062, CAST(N'1953-01-01 00:06:48.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:48.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (410, N'ML Mountain Frame-W - Silver 42', N'FR-M63S-42', N'Silver', N'no_image_available_large.gif', 364.0900, 2, 178, 1.784599, CAST(N'1953-01-01 00:06:49.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:49.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (411, N'ML Mountain Frame-W - Silver 46', N'FR-M63S-46', N'Silver', N'no_image_available_large.gif', 364.0900, 4, 304, 3.037279, CAST(N'1953-01-01 00:06:50.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:50.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (386, N'Short-Sleeve Classic Jersey S', N'SJ-0194-S', N'Yellow', N'awc_tee_male_yellow_large.gif', 53.9900, 1, 18, 0.181715563, CAST(N'1953-01-01 00:06:25.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:25.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (387, N'Short-Sleeve Classic Jersey M', N'SJ-0194-M', N'Yellow', N'awc_tee_male_yellow_large.gif', 53.9900, 2, 166, 1.66040993, CAST(N'1953-01-01 00:06:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:26.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (388, N'Short-Sleeve Classic Jersey L', N'SJ-0194-L', N'Yellow', N'awc_tee_male_yellow_large.gif', 53.9900, 1, 17, 0.170309663, CAST(N'1953-01-01 00:06:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:27.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (389, N'Short-Sleeve Classic Jersey XL', N'SJ-0194-X', N'Yellow', N'awc_tee_male_yellow_large.gif', 53.9900, 3, 259, 2.58617139, CAST(N'1953-01-01 00:06:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:28.000' AS DateTime), 34, N'Clothing', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (390, N'HL Touring Frame - Yellow 60', N'FR-T98Y-60', N'Yellow', N'no_image_available_large.gif', 1003.9100, 3, 287, 2.86714029, CAST(N'1953-01-01 00:06:29.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:29.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (391, N'LL Touring Frame - Yellow 62', N'FR-T67Y-62', N'Yellow', N'frame_large.gif', 333.4200, 5, 430, 4.29608, CAST(N'1953-01-01 00:06:30.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:30.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (392, N'HL Touring Frame - Yellow 46', N'FR-T98Y-46', N'Yellow', N'no_image_available_large.gif', 1003.9100, 2, 112, 1.12149322, CAST(N'1953-01-01 00:06:31.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:31.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (393, N'HL Touring Frame - Yellow 50', N'FR-T98Y-50', N'Yellow', N'no_image_available_large.gif', 1003.9100, 1, 58, 0.5813502, CAST(N'1953-01-01 00:06:32.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:32.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (394, N'HL Touring Frame - Yellow 54', N'FR-T98Y-54', N'Yellow', N'no_image_available_large.gif', 1003.9100, 1, 78, 0.7864966, CAST(N'1953-01-01 00:06:33.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:33.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (395, N'HL Touring Frame - Blue 46', N'FR-T98U-46', N'Blue', N'no_image_available_large.gif', 1003.9100, 4, 388, 3.87761831, CAST(N'1953-01-01 00:06:34.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:34.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (396, N'HL Touring Frame - Blue 50', N'FR-T98U-50', N'Blue', N'no_image_available_large.gif', 1003.9100, 5, 417, 4.16449738, CAST(N'1953-01-01 00:06:35.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:35.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (397, N'HL Touring Frame - Blue 54', N'FR-T98U-54', N'Blue', N'no_image_available_large.gif', 1003.9100, 4, 378, 3.77404022, CAST(N'1953-01-01 00:06:36.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:36.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (398, N'HL Touring Frame - Blue 60', N'FR-T98U-60', N'Blue', N'no_image_available_large.gif', 1003.9100, 2, 120, 1.20148134, CAST(N'1953-01-01 00:06:37.000' AS DateTime), 34, CAST(N'1953-01-01 00:06:37.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (429, N'LL Mountain Frame - Black 42', N'FR-M21B-42', N'Black', N'no_image_available_large.gif', 249.7900, 3, 232, 2.32054734, CAST(N'1953-01-01 00:07:08.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:08.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (430, N'LL Mountain Frame - Black 44', N'FR-M21B-44', N'Black', N'no_image_available_large.gif', 249.7900, 3, 272, 2.7229495, CAST(N'1953-01-01 00:07:09.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:09.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (431, N'LL Mountain Frame - Black 48', N'FR-M21B-48', N'Black', N'no_image_available_large.gif', 249.7900, 5, 419, 4.1896944, CAST(N'1953-01-01 00:07:10.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:10.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (432, N'LL Mountain Frame - Black 52', N'FR-M21B-52', N'Black', N'no_image_available_large.gif', 249.7900, 3, 212, 2.115798, CAST(N'1953-01-01 00:07:11.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:11.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (447, N'ML Mountain Frame-W - Silver 38', N'FR-M63S-38', N'Silver', N'no_image_available_large.gif', 364.0900, 3, 215, 2.15015149, CAST(N'1953-01-01 00:07:26.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:26.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (448, N'LL Mountain Frame - Black 40', N'FR-M21B-40', N'Black', N'no_image_available_large.gif', 249.7900, 5, 462, 4.61735058, CAST(N'1953-01-01 00:07:27.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:27.000' AS DateTime), 34, N'Parts', 3)
GO
INSERT [dbo].[Product] ([Id], [Name], [ProductNumber], [Color], [Image], [ListPrice], [VendorId], [QuantitySold], [AvgStars], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [CategoryName], [CategoryId]) VALUES (449, N'LL Mountain Frame - Silver 40', N'FR-M21S-40', N'Silver', N'no_image_available_large.gif', 264.0500, 1, 27, 0.275456727, CAST(N'1953-01-01 00:07:28.000' AS DateTime), 34, CAST(N'1953-01-01 00:07:28.000' AS DateTime), 34, N'Parts', 3)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (1, N'Terry', N'Vandenberge', N'terryvb@bp.com', N'Houston', N'USA', CAST(N'2013-01-01 00:11:03.000' AS DateTime), 3, CAST(N'2013-01-01 00:11:03.000' AS DateTime), NULL, CAST(N'2013-01-01 00:11:03.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (3, N'Debbie', N'Anderson', N'debbie@company.com', N'New York', N'USA', CAST(N'2013-01-08 21:46:32.000' AS DateTime), 0, CAST(N'2013-01-08 21:46:32.000' AS DateTime), NULL, CAST(N'2013-05-06 15:05:56.097' AS DateTime), 3, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (4, N'Timothy', N'King', N'timx@360market.com', N'Austin', N'USA', CAST(N'2013-01-17 21:46:32.000' AS DateTime), 4, CAST(N'2013-01-17 21:46:32.000' AS DateTime), NULL, CAST(N'2013-01-17 21:46:32.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (15, N'Henry', N'Liversidge', N'hlsidge@zappos.com', N'Flagstaff', N'USA', CAST(N'2013-01-18 21:46:32.000' AS DateTime), 3, CAST(N'2013-01-18 21:46:32.000' AS DateTime), NULL, CAST(N'2013-01-18 21:46:32.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (16, N'Loes', N'Derksen', N'jahoor@loeshier.nl', N'Groningen', N'Netherlands', CAST(N'2013-01-29 21:48:28.000' AS DateTime), 1, CAST(N'2013-01-29 21:48:28.000' AS DateTime), NULL, CAST(N'2013-01-29 21:48:28.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (23, N'Bike', N'Lover', N'bikelover@gmail.com', N'San Diego', N'USA', CAST(N'2013-02-01 16:50:04.000' AS DateTime), 5, CAST(N'2013-02-01 16:50:04.000' AS DateTime), NULL, CAST(N'2013-05-09 11:05:40.510' AS DateTime), 23, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (24, N'Joyce', N'Petrus', N'joyce@gmail.com', N'Columbus', N'USA', CAST(N'2013-02-02 13:19:32.000' AS DateTime), 1, CAST(N'2013-02-02 13:19:32.000' AS DateTime), NULL, CAST(N'2013-02-02 13:19:32.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (25, N'Charly', N'Guzman', N'chguz@amc.org', N'San Antonio', N'USA', CAST(N'2013-02-06 13:20:37.000' AS DateTime), 1, CAST(N'2013-02-06 13:20:37.000' AS DateTime), NULL, CAST(N'2013-02-06 13:20:37.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (26, N'Brandy', N'Geier', N'brand.g@hotmail.com', N'Chicago', N'USA', CAST(N'2013-02-14 13:21:25.000' AS DateTime), 0, CAST(N'2013-02-14 13:21:25.000' AS DateTime), NULL, CAST(N'2013-02-14 13:21:25.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (27, N'Sharon', N'Erickson', N'sharone@finnish.org', N'New York', N'USA', CAST(N'2013-02-21 13:21:57.000' AS DateTime), 5, CAST(N'2013-02-21 13:21:57.000' AS DateTime), NULL, CAST(N'2013-02-21 13:21:57.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (28, N'Helmut', N'Gantt', N'helmut@hgantt.com', N'Munich', N'Germany', CAST(N'2013-02-22 13:22:46.000' AS DateTime), 3, CAST(N'2013-02-22 13:22:46.000' AS DateTime), NULL, CAST(N'2013-02-22 13:22:46.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (29, N'Leticia', N'Costa', N'lhcosta@mezzo.br', N'Barbecena', N'Brazil', CAST(N'2013-02-28 13:23:51.000' AS DateTime), 1, CAST(N'2013-02-28 13:23:51.000' AS DateTime), NULL, CAST(N'2013-02-28 13:23:51.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (30, N'Indra', N'Van Vlijmen', N'indra1980@live.nl', N'Badhoevedorp', N'Netherlands', CAST(N'2013-03-02 13:24:54.000' AS DateTime), 5, CAST(N'2013-03-02 13:24:54.000' AS DateTime), NULL, CAST(N'2013-03-02 13:24:54.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (31, N'Klaas Jan', N'Handels', N'kjhandels@rietenmand.nl', N'Amsterdam', N'Netherlands', CAST(N'2013-03-03 13:25:28.000' AS DateTime), 0, CAST(N'2013-03-03 13:25:28.000' AS DateTime), NULL, CAST(N'2013-03-03 13:25:28.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (32, N'Shane', N'Lyon', N'shane90@yahoo.com', N'St Louis', N'USA', CAST(N'2013-03-04 13:26:14.000' AS DateTime), 2, CAST(N'2013-03-04 13:26:14.000' AS DateTime), NULL, CAST(N'2013-03-04 13:26:14.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (33, N'Ricky', N'Perez', N'rperez@deloitte.com', N'Chicago', N'USA', CAST(N'2013-03-08 13:26:43.000' AS DateTime), 1, CAST(N'2013-03-08 13:26:43.000' AS DateTime), NULL, CAST(N'2013-03-08 13:26:43.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (34, N'Phillip', N'Kuster', N'pkuster@volkswagen.de', N'Bonn', N'Germany', CAST(N'2013-03-09 13:27:43.000' AS DateTime), 2, CAST(N'2013-03-09 13:27:43.000' AS DateTime), NULL, CAST(N'2013-03-09 13:27:43.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (35, N'Thad', N'Vargas', N'vargast@google.com', N'San Mateo', N'USA', CAST(N'2013-03-11 13:28:20.000' AS DateTime), 2, CAST(N'2013-03-11 13:28:20.000' AS DateTime), NULL, CAST(N'2013-03-11 13:28:20.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (36, N'Sue', N'Nigel', N'snig@softscreen.com', N'Los Angeles', N'USA', CAST(N'2013-03-12 13:29:08.000' AS DateTime), 1, CAST(N'2013-03-12 13:29:08.000' AS DateTime), NULL, CAST(N'2013-03-12 13:29:08.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (37, N'Diana', N'Trommler', N'ditromm@hertz.com', N'Berlin', N'Germany', CAST(N'2013-03-18 13:29:46.000' AS DateTime), 2, CAST(N'2013-03-18 13:29:46.000' AS DateTime), NULL, CAST(N'2013-03-18 13:29:46.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (38, N'Hans', N'De Knegt', N'hansgriet@knegtje.nl', N'The Hague', N'Netherlands', CAST(N'2013-03-22 13:30:43.000' AS DateTime), 3, CAST(N'2013-03-22 13:30:43.000' AS DateTime), NULL, CAST(N'2013-03-22 13:30:43.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (39, N'Maria', N'McKnight', N'mariem12@yahoo.com', N'Houston', N'USA', CAST(N'2013-03-28 13:31:26.000' AS DateTime), 1, CAST(N'2013-03-28 13:31:26.000' AS DateTime), NULL, CAST(N'2013-03-28 13:31:26.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (40, N'Terry', N'Knight', N'thn@financehelp.com', N'Miami', N'USA', CAST(N'2013-04-01 13:32:01.000' AS DateTime), 2, CAST(N'2013-04-01 13:32:01.000' AS DateTime), NULL, CAST(N'2013-04-01 13:32:01.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (41, N'Rémy', N'Chauvin', N'remych@boule.fr', N'Lyon', N'France', CAST(N'2013-04-02 13:33:22.000' AS DateTime), 2, CAST(N'2013-04-02 13:33:22.000' AS DateTime), NULL, CAST(N'2013-04-28 00:14:31.503' AS DateTime), 3, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (42, N'Claudia', N'Gómez', N'gomezcl@terra.com.ar', N'Buenos Aires', N'Argentina', CAST(N'2013-04-04 13:38:06.000' AS DateTime), 0, CAST(N'2013-04-04 13:38:06.000' AS DateTime), NULL, CAST(N'2013-04-04 13:38:06.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (43, N'Jon', N'Halden', N'jonhalden@cosco.com', N'Seattle', N'USA', CAST(N'2013-04-06 13:41:41.000' AS DateTime), 1, CAST(N'2013-04-06 13:41:41.000' AS DateTime), NULL, CAST(N'2013-04-06 13:41:41.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (44, N'Núñez', N'Partida', N'npartida@bc.gov.br', N'Sao Paolo', N'Brazil', CAST(N'2013-04-08 13:43:08.000' AS DateTime), 0, CAST(N'2013-04-08 13:43:08.000' AS DateTime), NULL, CAST(N'2013-04-08 13:43:08.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (46, N'Michael', N'Hall', N'michaelh@hotmail.com', N'Buffalo', N'USA', CAST(N'2013-04-11 14:49:46.000' AS DateTime), 0, CAST(N'2013-04-11 14:49:46.000' AS DateTime), NULL, CAST(N'2013-04-11 14:49:46.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (47, N'Assunta', N'Pirozzi', N'assunta@tempori.com.ar', N'Cordoba', N'Argentina', CAST(N'2013-04-13 15:17:52.000' AS DateTime), 1, CAST(N'2013-04-13 15:17:52.000' AS DateTime), NULL, CAST(N'2013-04-13 15:17:52.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (48, N'Kauã', N'Melo', N'kmelo@yahoo.br', N'Rio de Janeiro', N'Brazil', CAST(N'2013-04-14 15:19:31.000' AS DateTime), 0, CAST(N'2013-04-13 15:19:31.000' AS DateTime), NULL, CAST(N'2013-04-13 15:19:31.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (49, N'Helen', N'Park', N'helen@parktech.com', N'Washington', N'USA', CAST(N'2013-04-19 15:20:27.000' AS DateTime), 0, CAST(N'2013-04-14 15:20:27.000' AS DateTime), NULL, CAST(N'2013-04-14 15:20:27.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (50, N'James', N'Flores', N'jamesf3@live.com', N'Atlanta', N'USA', CAST(N'2013-04-22 15:21:43.000' AS DateTime), 1, CAST(N'2013-04-18 15:21:43.000' AS DateTime), NULL, CAST(N'2013-04-18 15:21:43.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (52, N'Jose', N'Redden', N'joredden@netflix.com', N'San Francisco', N'USA', CAST(N'2013-04-29 15:24:30.000' AS DateTime), 0, CAST(N'2013-04-22 15:24:30.000' AS DateTime), NULL, CAST(N'2013-05-06 15:05:45.420' AS DateTime), 3, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (53, N'Ron', N'Garlit', N'ron.garlit@company.com', N'National Park', N'USA', CAST(N'2013-08-01 00:00:00.000' AS DateTime), 0, CAST(N'2013-08-01 00:00:00.000' AS DateTime), NULL, CAST(N'2013-08-01 00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [City], [Country], [SignupDate], [OrderCount], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy], [AspNetUserId]) VALUES (54, N'admin', N'example', N'admin@example.com', N'National Park', N'USA', CAST(N'2014-11-13 10:47:03.600' AS DateTime), 0, CAST(N'2014-11-13 10:47:03.600' AS DateTime), NULL, CAST(N'2014-11-13 10:47:03.600' AS DateTime), 53, N'45008d4b-3d4b-412e-89ff-17675c43275b')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

GO
INSERT [dbo].[Vendor] ([Id], [AccountNumber], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (1, N'LITWARE0001', N'Litware Inc.', CAST(N'1953-01-01 00:00:00.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:00.000' AS DateTime), 34)
GO
INSERT [dbo].[Vendor] ([Id], [AccountNumber], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (2, N'TREYRE0001', N'Trey Research', CAST(N'1953-01-01 00:00:01.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:01.000' AS DateTime), 34)
GO
INSERT [dbo].[Vendor] ([Id], [AccountNumber], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (3, N'ADATUM0001', N'A. Datum Corporation', CAST(N'1953-01-01 00:00:02.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:02.000' AS DateTime), 34)
GO
INSERT [dbo].[Vendor] ([Id], [AccountNumber], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (4, N'NORTHW0001', N'Northwind Traders', CAST(N'1953-01-01 00:00:03.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:03.000' AS DateTime), 34)
GO
INSERT [dbo].[Vendor] ([Id], [AccountNumber], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy]) VALUES (5, N'WIDEWOR0001', N'Wide World Importers', CAST(N'1953-01-01 00:00:04.000' AS DateTime), 34, CAST(N'1953-01-01 00:00:04.000' AS DateTime), 34)
GO
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(N'2014-05-05 03:00:49.437' AS DateTime), NULL, 1, NULL, 0, N'AKgpEzvsSNEh20U0h4o+qb3/FXWU9zdO6EzXgDyZI0b7zj/RQ3BXiJclS453gvEBIw==', CAST(N'2014-05-05 03:00:49.437' AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (23, CAST(N'2014-05-05 03:00:49.650' AS DateTime), NULL, 1, NULL, 0, N'ABPzyqyoLDxzzb068qFygab5T2EiY2hCyb8oNUKwyNq7LECp7T5Jcp8ixvj1lIDJvA==', CAST(N'2014-05-05 03:00:49.650' AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (53, CAST(N'2014-05-05 03:00:49.547' AS DateTime), NULL, 1, NULL, 0, N'AKuvGWTHwnOhetYgyAHL5n7tAmZOYKnxI98o6b4vhUdxJ9iiyyw7jV/bRakoHK3DiQ==', CAST(N'2014-05-05 03:00:49.547' AS DateTime), N'', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Member')
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (3, 1)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (3, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (23, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (53, 1)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (53, 2)
GO
/****** Object:  Index [PK_CART]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [PK_CART] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CARTITEM]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[CartItem] ADD  CONSTRAINT [PK_CARTITEM] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_CATEGORYID]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [PK_CATEGORYID] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ERROR]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Error] ADD  CONSTRAINT [PK_ERROR] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDER]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [PK_ORDER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDERDETAIL]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [PK_ORDERDETAIL] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDERNUMBER]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[OrderNumber] ADD  CONSTRAINT [PK_ORDERNUMBER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PRODUCT]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [PK_PRODUCT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RATING]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [PK_RATING] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_USER]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [PK_USER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_VENDOR]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [PK_VENDOR] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61604120F48A]    Script Date: 11/23/2014 11:17:37 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CartDate]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[CartItem] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[OrderNumber] ADD  DEFAULT ((203317)) FOR [Number]
GO
ALTER TABLE [dbo].[OrderNumber] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[OrderNumber] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT (getdate()) FOR [ChangedOn]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CARTITEM_REFERENCE_CART] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CARTITEM_REFERENCE_CART]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_REFERENCE_USER] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_REFERENCE_USER]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDET_REFERENCE_ORDER] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_ORDERDET_REFERENCE_ORDER]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDET_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_ORDERDET_REFERENCE_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_REFERENCE_VENDOR] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRODUCT_REFERENCE_VENDOR]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_RATING_REFERENCE_PRODUCT] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_RATING_REFERENCE_PRODUCT]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_RATING_REFERENCE_USER] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_RATING_REFERENCE_USER]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [BikeShopDB] SET  READ_WRITE 
GO
