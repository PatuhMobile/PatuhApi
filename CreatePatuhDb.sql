USE [master]
GO
/****** Object:  Database [Patuh]    Script Date: 12/17/2018 10:45:18 PM ******/
CREATE DATABASE [Patuh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestingFrameWork', FILENAME = N'D:\Database\TestingFrameWork.mdf' , SIZE = 17408KB , MAXSIZE = 153600KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestingFrameWork_log', FILENAME = N'D:\Database\TestingFrameWork_log.ldf' , SIZE = 123648KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Patuh] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Patuh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Patuh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Patuh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Patuh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Patuh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Patuh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Patuh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Patuh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Patuh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Patuh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Patuh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Patuh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Patuh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Patuh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Patuh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Patuh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Patuh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Patuh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Patuh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Patuh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Patuh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Patuh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Patuh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Patuh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Patuh] SET  MULTI_USER 
GO
ALTER DATABASE [Patuh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Patuh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Patuh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Patuh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Patuh] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Patuh]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[TsLog] [datetime] NOT NULL,
	[PageName] [varchar](200) NOT NULL,
	[ErrorMessage] [varchar](8000) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[IPAddress] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsCoupons]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsCoupons](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[Benefit] [varchar](max) NULL,
	[Usage] [varchar](max) NULL,
	[Tnc] [varchar](max) NULL,
	[PointNeeded] [bigint] NULL,
	[ValidUntil] [datetime] NULL,
	[CouponImage] [varbinary](max) NULL,
	[cStatus] [varchar](1) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsMenu]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsMenu](
	[ModuleID] [varchar](5) NOT NULL,
	[PageID] [varchar](5) NOT NULL,
	[MenuID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Seq] [int] NOT NULL,
	[MenuText] [varchar](50) NOT NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL DEFAULT ('Y'),
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsMobileUserProfile]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsMobileUserProfile](
	[UserID] [varchar](100) NOT NULL,
	[Pwd] [varchar](50) NOT NULL,
	[UserGuid] [uniqueidentifier] NULL,
	[UserAccountType] [varchar](20) NULL,
	[FullName] [varchar](max) NULL,
	[DOB] [datetime] NULL,
	[Location] [varchar](20) NULL,
	[PhoneNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ProfilePicPath] [varchar](255) NULL,
	[ProfilePic] [varbinary](max) NULL,
	[cCreated] [varchar](10) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_MsMobileUserProfile] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsModule]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsModule](
	[ModuleID] [varchar](5) NOT NULL,
	[ModuleDesc] [varchar](50) NOT NULL,
	[Info1] [varchar](100) NULL,
	[Info2] [varchar](100) NULL,
	[Info3] [varchar](100) NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL DEFAULT ('Y'),
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsPage]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsPage](
	[ModuleID] [varchar](5) NOT NULL,
	[PageID] [varchar](5) NOT NULL,
	[PageName] [varchar](30) NOT NULL,
	[PageDesc] [varchar](50) NOT NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL DEFAULT ('Y'),
PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsPoints]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsPoints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionCode] [varchar](20) NULL,
	[ActionDesc] [varchar](150) NULL,
	[RewardPoint] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsSerial]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsSerial](
	[SerialID] [varchar](50) NOT NULL,
	[SerialDesc] [nvarchar](255) NOT NULL,
	[Remark] [varchar](250) NOT NULL,
	[SerialLength] [int] NOT NULL CONSTRAINT [DF_MsSerial_SerialLength]  DEFAULT ((7)),
	[StartNum] [int] NOT NULL CONSTRAINT [DF_MsSerial_StartNum]  DEFAULT ((1)),
	[EndNum] [int] NOT NULL CONSTRAINT [DF_MsSerial_EndNum]  DEFAULT ((9999999)),
	[CurrentNum] [int] NOT NULL CONSTRAINT [DF_MsSerial_CurrentNum]  DEFAULT ((1)),
	[TsCrt] [datetime] NOT NULL,
	[CrtUsrID] [varchar](50) NOT NULL,
	[TsMod] [datetime] NOT NULL,
	[ModUsrID] [varchar](50) NOT NULL,
	[ActiveFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_MsSerial] PRIMARY KEY CLUSTERED 
(
	[SerialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsUser]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsUser](
	[UserID] [varchar](10) NOT NULL,
	[UserRoleID] [varchar](20) NOT NULL,
	[Pwd] [varchar](50) NULL,
	[UserGuid] [uniqueidentifier] NULL,
	[FullName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Info1] [varchar](100) NULL,
	[Info2] [varchar](100) NULL,
	[Info3] [varchar](100) NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL CONSTRAINT [DF__MsUser__TsCrt__3E52440B]  DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL CONSTRAINT [DF__MsUser__TsMod__3F466844]  DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL CONSTRAINT [DF__MsUser__ActiveFl__403A8C7D]  DEFAULT ('Y')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsUserRole]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsUserRole](
	[ModuleID] [varchar](5) NOT NULL,
	[UserRoleID] [varchar](20) NOT NULL,
	[UserRoleDesc] [varchar](50) NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL DEFAULT ('Y'),
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MsUserRoleAccess]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MsUserRoleAccess](
	[AccessID] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleID] [varchar](20) NOT NULL,
	[PageID] [varchar](5) NOT NULL,
	[CrtUsrID] [varchar](20) NOT NULL,
	[TsCrt] [datetime] NOT NULL DEFAULT (getdate()),
	[ModUsrID] [varchar](20) NULL,
	[TsMod] [datetime] NULL DEFAULT (getdate()),
	[ActiveFlag] [char](1) NOT NULL DEFAULT ('Y'),
PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrArticleReports]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrArticleReports](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ArticleId] [bigint] NULL,
	[ReportCategory] [varchar](10) NULL,
	[ReportDesc] [varchar](250) NULL,
	[cStatus] [varchar](1) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrArticleReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrArticles]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrArticles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](10) NULL,
	[Title] [varchar](20) NULL,
	[Story] [varchar](255) NULL,
	[GPSLocation] [varchar](100) NULL,
	[GPSLong] [float] NULL,
	[GPSLat] [float] NULL,
	[cStatus] [varchar](1) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrArticles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrComments]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrComments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ArticleId] [bigint] NULL,
	[Comment] [varchar](200) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrImageAttachments]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrImageAttachments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HeaderId] [bigint] NOT NULL,
	[Image] [varbinary](max) NULL,
	[Sequence] [int] NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrImageAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrLikes]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrLikes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ArticleId] [bigint] NULL,
	[cStatus] [varchar](1) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrPoints]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrPoints](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](10) NULL,
	[ArticleId] [bigint] NULL,
	[ActionCode] [varchar](20) NULL,
	[PointValue] [bigint] NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrPoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrUserCoupons]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrUserCoupons](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](10) NULL,
	[MsCouponId] [bigint] NULL,
	[CouponCode] [varchar](100) NULL,
	[IsRedeemed] [bit] NULL,
	[RedeemDate] [datetime] NULL,
	[cStatus] [varchar](1) NULL,
	[cCreated] [varchar](20) NULL,
	[dCreated] [datetime] NULL,
	[cLastUpdated] [varchar](20) NULL,
	[dLastUpdated] [datetime] NULL,
 CONSTRAINT [PK_TrUserCoupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActivityLog]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserActivityLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TsLog] [datetime] NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[FormName] [varchar](50) NOT NULL,
	[DocumentNo] [varchar](50) NOT NULL,
	[DocumentStatus] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[ErrorMessage] [varchar](2000) NOT NULL,
	[Remark] [varchar](1000) NOT NULL,
	[DebuggerID] [varchar](20) NOT NULL,
	[WindowsLogin] [varchar](30) NOT NULL,
	[AppType] [varchar](50) NOT NULL,
	[AppVersion] [varchar](15) NOT NULL,
	[ApplicationMode] [varchar](1) NOT NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[DeviceID] [varchar](30) NOT NULL,
	[WebBrowser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserActivityLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[MsMenu]  WITH CHECK ADD  CONSTRAINT [FK_Module_Menu[OneToMany]]] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[MsModule] ([ModuleID])
GO
ALTER TABLE [dbo].[MsMenu] CHECK CONSTRAINT [FK_Module_Menu[OneToMany]]]
GO
ALTER TABLE [dbo].[MsMenu]  WITH CHECK ADD  CONSTRAINT [FK_Page_Menu[OneToMany]]] FOREIGN KEY([PageID])
REFERENCES [dbo].[MsPage] ([PageID])
GO
ALTER TABLE [dbo].[MsMenu] CHECK CONSTRAINT [FK_Page_Menu[OneToMany]]]
GO
ALTER TABLE [dbo].[MsPage]  WITH CHECK ADD  CONSTRAINT [FK_Module_Page[OneToMany]]] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[MsModule] ([ModuleID])
GO
ALTER TABLE [dbo].[MsPage] CHECK CONSTRAINT [FK_Module_Page[OneToMany]]]
GO
ALTER TABLE [dbo].[MsUser]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User[OneToMany]]] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[MsUserRole] ([UserRoleID])
GO
ALTER TABLE [dbo].[MsUser] CHECK CONSTRAINT [FK_UserRole_User[OneToMany]]]
GO
ALTER TABLE [dbo].[MsUserRole]  WITH CHECK ADD  CONSTRAINT [FK_Module_UserRole[OneToMany]]] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[MsModule] ([ModuleID])
GO
ALTER TABLE [dbo].[MsUserRole] CHECK CONSTRAINT [FK_Module_UserRole[OneToMany]]]
GO
ALTER TABLE [dbo].[MsUserRoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_Module_UserRoleAccess[OneToMany]]] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[MsUserRole] ([UserRoleID])
GO
ALTER TABLE [dbo].[MsUserRoleAccess] CHECK CONSTRAINT [FK_Module_UserRoleAccess[OneToMany]]]
GO
ALTER TABLE [dbo].[MsUserRoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_Page_UserRoleAccess[OneToMany]]] FOREIGN KEY([PageID])
REFERENCES [dbo].[MsPage] ([PageID])
GO
ALTER TABLE [dbo].[MsUserRoleAccess] CHECK CONSTRAINT [FK_Page_UserRoleAccess[OneToMany]]]
GO
/****** Object:  StoredProcedure [dbo].[dto_GetMenu]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[dto_GetMenu]
(
@UserID varchar(20)
)
with execute as caller
as
begin
set nocount on;

select distinct a.MenuID,a.ParentID,a.Seq,a.MenuText,b.PageName from MsMenu a
inner join MsPage b on a.ModuleID = b.ModuleID and a.PageID = b.PageID
inner join MsUserRoleAccess c on b.PageID = c.PageID
inner join MsUser d on c.UserRoleID = d.UserRoleID
where d.UserID = @UserID and a.ActiveFlag = 'Y' and b.ActiveFlag = 'Y' and c.ActiveFlag = 'Y' and d.ActiveFlag = 'Y'
order by menuid,ParentID,seq;

end

GO
/****** Object:  StoredProcedure [dbo].[dto_GetOrderPaging]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dto_GetOrderPaging]    
(    
@Where nvarchar(255) = '',    
@OrderBy nvarchar(255) = '',    
@Start int = 0,    
@Limit int = 0    
)    
WITH EXECUTE AS CALLER    
AS    
BEGIN    
SET NOCOUNT ON;    
    
DECLARE @TOP int;    
DECLARE @SQL nvarchar(max);    
    
SET @TOP = @Start + @Limit;    
SET @Start = @Start + 1;    
    
IF(@OrderBy = '')    
BEGIN    
 SET @OrderBy = '[OrderID]';    
END    
    
SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(    
   SELECT    
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber    
      ,[OrderID]    
      ,Ord.[CustomerID]    
   ,Cus.CompanyName    
      ,[EmployeeID]    
      ,[OrderDate]    
      ,[ShipName]    
      ,[ShipAddress]    
      ,Ord.[CrtUsrID]    
      ,Ord.[TsCrt]    
      ,Ord.[ModUsrID]    
      ,Ord.[TsMod]    
      ,Ord.[ActiveFlag]    
  FROM [dbo].[Order] Ord    
  INNER JOIN [dbo].[Customers] Cus On Cus.CustomerID=Ord.CustomerID';    
    
IF(@Where <> '')    
BEGIN    
 SET @Where = N' WHERE ' + @Where;    
 SET @SQL = @SQL + @Where;    
END    
    
SET @SQL = @SQL + char(13) + N'),';    
    
IF(@TOP <> 0)    
BEGIN    
 SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(    
    SELECT * FROM SQLQUERY,    
    (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')    
    
 SELECT * FROM     
 SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);    
END    
ELSE    
BEGIN    
 SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(    
 SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';    
END    
    
print(@sql)    
EXEC sp_executesql @SQL;    
END 

GO
/****** Object:  StoredProcedure [dbo].[dto_HeaderDetailInfo]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[dto_HeaderDetailInfo]
(
@headerid integer
)
with execute as caller
as
begin
set nocount on;

select h.[HeaderID]
      ,[HeaderDesc]
      ,h.[Value]
      ,[Category]
      ,[Hobby]
	  ,d.[Value] as Detailvalue
	  ,d.tscrt as DetailCreated
	    ,d.tsmod as DetailModified
from  [dbo].[HeaderData] h
inner join DetailData d on h.headerid = d.headerid
where h.headerid = @headerid;

end

GO
/****** Object:  StoredProcedure [dbo].[dto_HeaderDetailInfo2]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create procedure [dbo].[dto_HeaderDetailInfo2]
(
@headerid integer
)
with execute as caller
as
begin
set nocount on;

select h.[HeaderID]
      ,[HeaderDesc]
      ,h.[Value]
 from  [dbo].[HeaderData] h
inner join DetailData d on h.headerid = d.headerid
where h.headerid = @headerid;

end

GO
/****** Object:  StoredProcedure [dbo].[up_DeleteDetailData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_DeleteDetailData]
(
@DETAILID Int,
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE	[dbo].[DetailData]
SET
[ACTIVEFLAG] = 'N',
[MODUSRID] = @MODUSRID, 
[TSMOD] = getdate() 
WHERE
[DETAILID] = @DETAILID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteEmployee]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteEmployee]
(
@IDEMPLOYEE VarChar(10),
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Employee]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[IDEMPLOYEE] = @IDEMPLOYEE

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteHeaderData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteHeaderData]
(
@HEADERID Int,
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[HeaderData]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[HEADERID] = @HEADERID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMsSample]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteMsSample]
(
@SAMPLEID Int,
@MODUSRID VarChar(50)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsSample]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[SAMPLEID] = @SAMPLEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMsSerial]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteMsSerial]
(
@SERIALID VarChar(50),
@MODUSRID VarChar(50)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsSerial]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[SERIALID] = @SERIALID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMsUser]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteMsUser]
(
@MODULEID VarChar(5),
@USERID VarChar(10),
@USERROLEID VarChar(20),
@AREA VarChar(4),
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsUser]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[MODULEID] = @MODULEID
AND [USERID] = @USERID
AND [USERROLEID] = @USERROLEID
AND [AREA] = @AREA

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteMsUserRole]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteMsUserRole]
(
@USERROLEID VarChar(20),
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsUserRole]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[USERROLEID] = @USERROLEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteOrder]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteOrder]
(
@ORDERID Int,
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Order]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[ORDERID] = @ORDERID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteProvince]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeleteProvince]
(
@PROVINCEID Int,
@MODUSRID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Province]
SET
ActiveFlag = 'N',
MODUSRID = @MODUSRID, 
TsMod = getdate()
WHERE
[PROVINCEID] = @PROVINCEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_DeleteTrImageAttachment]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[up_DeleteTrImageAttachment]
(
@Id bigint
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DELETE FROM [dbo].[TrImageAttachments]
WHERE
[Id] = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[up_InsertCountry]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertCountry]
(
@COUNTRYID VarChar(10),
@COUNTRYNAME VarChar(255),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].Country
VALUES
(
@COUNTRYID,
@COUNTRYNAME,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertDetailData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_InsertDetailData]
(
@HEADERID Int,
@VALUE VarChar(50),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

INSERT INTO [dbo].[DetailData]
VALUES
(
@HEADERID,
@VALUE,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG
);

SELECT SCOPE_IDENTITY();
END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertEmployee]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertEmployee]
(
@IDEMPLOYEE VarChar(10),
@FULLNAME VarChar(50),
@FIRSTNAME VarChar(50),
@LASTNAME VarChar(50),
@DESCRIPTION VarChar(100),
@DATAINT Int,
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].Employee
VALUES
(
@IDEMPLOYEE,
@FULLNAME,
@FIRSTNAME,
@LASTNAME,
@DESCRIPTION,
@DATAINT,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertHeaderData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertHeaderData]
(
@HEADERID Int,
@HEADERDESC VarChar(50),
@VALUE VarChar(50),
@CATEGORY VarChar(1),
@HOBBY VarChar(100),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].HeaderData
VALUES
(
@HEADERID,
@HEADERDESC,
@VALUE,
@CATEGORY,
@HOBBY,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertMsCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_InsertMsCoupon]
(
@Title VarChar(250),
@Benefit VarChar(MAX),
@Usage VarChar(MAX),
@Tnc VarChar(MAX),
@PointNeeded BIGINT,
@ValidUntil Datetime,
@CouponImage Varbinary(MAX),
@cStatus VarChar(1),
@cCreated VarChar(20),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].MsCoupons
VALUES
(
@Title,
@Benefit,
@Usage,
@Tnc,
@PointNeeded,
@ValidUntil,
@CouponImage,
@cStatus,
@cCreated,
getdate(),
@cLastUpdated,
getdate()
)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertMsSample]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertMsSample]
(
@SAMPLENAME VarChar(50),
@INFO1 VarChar(20),
@VALUE1 Decimal(12,2),
@VALUE2 Decimal(12,2),
@CRTUSRID VarChar(50),
@MODUSRID VarChar(50),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].MsSample
VALUES
(
@SAMPLENAME,
@INFO1,
@VALUE1,
@VALUE2,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertMsSerial]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertMsSerial]
(
@SERIALID VarChar(50),
@SERIALDESC NVarChar(510),
@REMARK VarChar(250),
@SERIALLENGTH Int,
@STARTNUM Int,
@ENDNUM Int,
@CURRENTNUM Int,
@CRTUSRID VarChar(50),
@MODUSRID VarChar(50),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].MsSerial
VALUES
(
@SERIALID,
@SERIALDESC,
@REMARK,
@SERIALLENGTH,
@STARTNUM,
@ENDNUM,
@CURRENTNUM,
getdate(),
@CRTUSRID,
getdate(),
@MODUSRID,
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertMsUser]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertMsUser]
(
@USERID VarChar(10),
@USERROLEID VarChar(20),
@PWD VarChar(50),
@USERGUID VarChar(50),
@FULLNAME VarChar(100),
@EMAIL VarChar(100),
@INFO1 VarChar(100),
@INFO2 VarChar(100),
@INFO3 VarChar(100),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].MsUser
VALUES
(
@USERID,
@USERROLEID,
@PWD,
@USERGUID,
@FULLNAME,
@EMAIL,
@INFO1,
@INFO2,
@INFO3,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertMsUserRole]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertMsUserRole]
(
@MODULEID VarChar(5),
@USERROLEID VarChar(20),
@USERROLEDESC VarChar(50),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].MsUserRole
VALUES
(
@MODULEID,
@USERROLEID,
@USERROLEDESC,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertOrder]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertOrder]
(
@ORDERID Int,
@CUSTOMERID NVarChar(10),
@EMPLOYEEID Int,
@ORDERDATE DateTime,
@SHIPNAME NVarChar(80),
@SHIPADDRESS NVarChar(120),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].[Order]
VALUES
(
@ORDERID,
@CUSTOMERID,
@EMPLOYEEID,
@ORDERDATE,
@SHIPNAME,
@SHIPADDRESS,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertProvince]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_InsertProvince]
(
@PROVINCEID Int,
@COUNTRYID NVarChar(10),
@PROVINCENAME NVarChar(510),
@CRTUSRID VarChar(20),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].Province
VALUES
(
@PROVINCEID,
@COUNTRYID,
@PROVINCENAME,
@CRTUSRID,
getdate(),
@MODUSRID,
getdate(),
@ACTIVEFLAG)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertTrArticle]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_InsertTrArticle]
(
@Category VarChar(10),
@Title VarChar(20),
@Story VarChar(255),
@GPSLocation VarChar(100),
@GPSLong float,
@GPSLat float,
@cStatus VarChar(1),
@cCreated VarChar(20),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].TrArticles
VALUES
(
@Category,
@Title,
@Story,
@GPSLocation,
@GPSLong,
@GPSLat,
@cStatus,
@cCreated,
getdate(),
@cLastUpdated,
getdate()
)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertTrImageAttachment]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_InsertTrImageAttachment]
(
@HeaderId bigint,
@Image varbinary(max),
@Sequence int,
@cCreated VarChar(20),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].TrImageAttachments
VALUES
(
@HeaderId,
@Image,
@Sequence,
@cCreated,
getdate(),
@cLastUpdated,
getdate()
)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertTrUserCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_InsertTrUserCoupon]
(
@UserID VarChar(10),
@MsCouponId BIGINT,
@CouponCode VarChar(100),
@IsRedeemed Bit,
@RedeemDate Datetime,
@cStatus VarChar(1),
@cCreated VarChar(20),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].TrUserCoupons
VALUES
(
@UserID,
@MsCouponId,
@CouponCode,
@IsRedeemed,
@RedeemDate,
@cStatus,
@cCreated,
getdate(),
@cLastUpdated,
getdate()
)
Select SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[up_InsertUserActivityLog]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Wednesday,12-10-2016
-- Created By	: ADD by using Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_InsertUserActivityLog]

@USERID varchar(20),
@ACTION varchar(50),
@FORMNAME varchar(50),
@DOCUMENTNO varchar(50),
@DOCUMENTSTATUS varchar(50),
@DESCRIPTION varchar(500),
@ERRORMESSAGE varchar(2000),
@REMARK varchar(1000),
@DEBUGGERID varchar(20),
@WINDOWSLOGIN varchar(30),
@APPTYPE varchar(50),
@APPVERSION varchar(15),
@APPLICATIONMODE varchar(1),
@IPADDRESS varchar(16),
@DEVICEID varchar(30),
@WEBBROWSER varchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
INSERT INTO [dbo].UserActivityLog
VALUES
(	getdate()
	,@USERID
	,@ACTION
	,@FORMNAME
	,isnull(@DOCUMENTNO,'-')
	,isnull(@DOCUMENTSTATUS,'-')
	,@DESCRIPTION
	,isnull(@ERRORMESSAGE,'-')
	,isnull(@REMARK,'-')
	,isnull(@DEBUGGERID,'-')
	,isnull(@WINDOWSLOGIN,'-')
	,@APPTYPE
	,@APPVERSION
	,@APPLICATIONMODE
	,@IPADDRESS
	,isnull(@DEVICEID,'-')
	,isnull(@WEBBROWSER,'-')
) 




GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveCountry]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveCountry]
(
@COUNTRYID VarChar(10)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [COUNTRYID]
	, [COUNTRYNAME]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Country]
WHERE ActiveFlag = 'Y'
AND [COUNTRYID] = @COUNTRYID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveCountryList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveCountryList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [COUNTRYID]
	, [COUNTRYNAME]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Country]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveCountryListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveCountryListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'CountryID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [COUNTRYID],
   [COUNTRYNAME],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[Country]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveDetailData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_RetrieveDetailData]
(
@DETAILID Int
)
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON;

SELECT
	[DETAILID],
	[HEADERID],
	[VALUE],
	[CRTUSRID],
	[TSCRT],
	[MODUSRID],
	[TSMOD],
	[ACTIVEFLAG]
FROM [dbo].[DetailData]
WHERE 1=1
AND [DETAILID] = @DETAILID

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveDetailDataByHeaderId]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Tuesday,14-11-2017
-- Created By	: ADD by using Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_RetrieveDetailDataByHeaderId]

@HeaderId int

AS

SET NOCOUNT ON
SELECT
	 [DETAILID]
	, [HEADERID]
	, [VALUE] 
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[DetailData]
WHERE ActiveFlag = 'Y'
AND [HEADERID] = @HeaderId




GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveDetailDataList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_RetrieveDetailDataList]
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON;

SELECT
	[DETAILID],
	[HEADERID],
	[VALUE],
	[CRTUSRID],
	[TSCRT],
	[MODUSRID],
	[TSMOD],
	[ACTIVEFLAG]
FROM [dbo].[DetailData]
WHERE ActiveFlag = 'Y'
END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveDetailDataListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_RetrieveDetailDataListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'DetailID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [DETAILID],
   [HEADERID],
   [VALUE],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[DetailData]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;
END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveEmployee]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveEmployee]
(
@IDEMPLOYEE VarChar(10)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [IDEMPLOYEE]
	, [FULLNAME]
	, [FIRSTNAME]
	, [LASTNAME]
	, [DESCRIPTION]
	, [DATAINT]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Employee]
WHERE ActiveFlag = 'Y'
AND [IDEMPLOYEE] = @IDEMPLOYEE


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveEmployeeByDataint]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[up_RetrieveEmployeeByDataint]

@DataInt int

AS

SET NOCOUNT ON
SELECT
	 [IDEMPLOYEE]
	, [FULLNAME]
	, [FIRSTNAME]
	, [LASTNAME]
	, [DESCRIPTION]
	, [DATAINT]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Employee]
WHERE ActiveFlag = 'Y'
AND [DataInt] = @DataInt





GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveEmployeeList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveEmployeeList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [IDEMPLOYEE]
	, [FULLNAME]
	, [FIRSTNAME]
	, [LASTNAME]
	, [DESCRIPTION]
	, [DATAINT]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Employee]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveEmployeeListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveEmployeeListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'IDEmployee';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [IDEMPLOYEE],
   [FULLNAME],
   [FIRSTNAME],
   [LASTNAME],
   [DESCRIPTION],
   [DATAINT],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[Employee]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveHeaderData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveHeaderData]
(
@HEADERID Int
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [HEADERID]
	, [HEADERDESC]
	, [VALUE]
	, [CATEGORY]
	, [HOBBY]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[HeaderData]
WHERE ActiveFlag = 'Y'
AND [HEADERID] = @HEADERID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveHeaderDataList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveHeaderDataList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [HEADERID]
	, [HEADERDESC]
	, [VALUE]
	, [CATEGORY]
	, [HOBBY]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[HeaderData]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveHeaderDataListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveHeaderDataListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'HeaderID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [HEADERID],
   [HEADERDESC],
   [VALUE],
   [CATEGORY],
   [HOBBY],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[HeaderData]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMostLikedContents]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_RetrieveMostLikedContents]
(
	@TopCount INT
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
  SELECT TOP (@TopCount) a.ArticleId, b.Title, b.Story, b.GPSLocation, c.Image, LikeCount
  FROM( 
	SELECT [ArticleID]  
		   ,COUNT(1) AS LikeCount
	FROM	[dbo].[TrLikes]
	WHERE cStatus = 'Y'
	GROUP BY ArticleID
  )a INNER JOIN TrArticles b ON a.ArticleId = b.Id LEFT JOIN TrImageAttachments c ON a.ArticleId = c.HeaderId AND c.Sequence = 1
  ORDER by likeCount, ArticleId
END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_RetrieveMsCoupon]
(
@Id BIGINT
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [Id]
      ,[Title]
      ,[Benefit]
      ,[Usage]
      ,[Tnc]
      ,[PointNeeded]
	  ,[ValidUntil]
	  ,[CouponImage]
      ,[cStatus]
      ,[cCreated]
      ,[dCreated]
      ,[cLastUpdated]
      ,[dLastUpdated]
FROM	[dbo].[MsCoupons]
WHERE Id = @Id


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsCouponListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_RetrieveMsCouponListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'Id';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [Id],
   [Title],
   [Benefit],
   [Usage],
   [Tnc],
   [PointNeeded],
   [ValidUntil],
   [CouponImage],
   [cStatus],
   [cCreated],
   [dCreated],
   [cLastUpdated],
   [dLastUpdated]
   FROM dbo.[MsCoupons]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP >= 0 )
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSample]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSample]
(
@SAMPLEID Int
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [SAMPLEID]
	, [SAMPLENAME]
	, [INFO1]
	, [VALUE1]
	, [VALUE2]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsSample]
WHERE ActiveFlag = 'Y'
AND [SAMPLEID] = @SAMPLEID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSampleList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSampleList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [SAMPLEID]
	, [SAMPLENAME]
	, [INFO1]
	, [VALUE1]
	, [VALUE2]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsSample]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSampleListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSampleListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'SampleID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [SAMPLEID],
   [SAMPLENAME],
   [INFO1],
   [VALUE1],
   [VALUE2],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[MsSample]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSerial]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSerial]
(
@SERIALID VarChar(50)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [SERIALID]
	, [SERIALDESC]
	, [REMARK]
	, [SERIALLENGTH]
	, [STARTNUM]
	, [ENDNUM]
	, [CURRENTNUM]
	, [TSCRT]
	, [CRTUSRID]
	, [TSMOD]
	, [MODUSRID]
	, [ACTIVEFLAG]
FROM	[dbo].[MsSerial]
WHERE ActiveFlag = 'Y'
AND [SERIALID] = @SERIALID

update MsSerial set [CURRENTNUM] = [CURRENTNUM]+1
where ActiveFlag = 'Y'
AND [SERIALID] = @SERIALID

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSerialList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSerialList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [SERIALID]
	, [SERIALDESC]
	, [REMARK]
	, [SERIALLENGTH]
	, [STARTNUM]
	, [ENDNUM]
	, [CURRENTNUM]
	, [TSCRT]
	, [CRTUSRID]
	, [TSMOD]
	, [MODUSRID]
	, [ACTIVEFLAG]
FROM	[dbo].[MsSerial]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsSerialListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsSerialListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'SerialID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [SERIALID],
   [SERIALDESC],
   [REMARK],
   [SERIALLENGTH],
   [STARTNUM],
   [ENDNUM],
   [CURRENTNUM],
   [TSCRT],
   [CRTUSRID],
   [TSMOD],
   [MODUSRID],
   [ACTIVEFLAG]
   FROM dbo.[MsSerial]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUser]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUser]
(
@USERID VarChar(10)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [USERID]
	, [USERROLEID]
	, [PWD]
	, [USERGUID]
	, [FULLNAME]
	, [EMAIL]
	, [INFO1]
	, [INFO2]
	, [INFO3]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsUser]
WHERE ActiveFlag = 'Y'
AND [USERID] = @USERID
--AND [USERROLEID] = @USERROLEID
--AND [AREA] = @AREA


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUserList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUserList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [USERID]
	, [USERROLEID]
	, [PWD]
	, [USERGUID]
	, [FULLNAME]
	, [EMAIL]
	, [INFO1]
	, [INFO2]
	, [INFO3]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsUser]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUserListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUserListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'USERID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [USERID],
   [USERROLEID],
   [PWD],
   [USERGUID],
   [FULLNAME],
   [EMAIL],
   [INFO1],
   [INFO2],
   [INFO3],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[MsUser]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP >= 0 )
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUserRole]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUserRole]
(
@USERROLEID VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [MODULEID]
	, [USERROLEID]
	, [USERROLEDESC]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsUserRole]
WHERE ActiveFlag = 'Y'
AND [USERROLEID] = @USERROLEID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUserRoleList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUserRoleList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [MODULEID]
	, [USERROLEID]
	, [USERROLEDESC]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[MsUserRole]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveMsUserRoleListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveMsUserRoleListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'UserRoleID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [MODULEID],
   [USERROLEID],
   [USERROLEDESC],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[MsUserRole]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveOrder]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveOrder]
(
@ORDERID Int
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [ORDERID]
	, [CUSTOMERID]
	, [EMPLOYEEID]
	, [ORDERDATE]
	, [SHIPNAME]
	, [SHIPADDRESS]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Order]
WHERE ActiveFlag = 'Y'
AND [ORDERID] = @ORDERID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveOrderList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveOrderList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [ORDERID]
	, [CUSTOMERID]
	, [EMPLOYEEID]
	, [ORDERDATE]
	, [SHIPNAME]
	, [SHIPADDRESS]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Order]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveOrderListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveOrderListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'OrderID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [ORDERID],
   [CUSTOMERID],
   [EMPLOYEEID],
   [ORDERDATE],
   [SHIPNAME],
   [SHIPADDRESS],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[Order]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveProvince]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveProvince]
(
@PROVINCEID Int
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [PROVINCEID]
	, [COUNTRYID]
	, [PROVINCENAME]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Province]
WHERE ActiveFlag = 'Y'
AND [PROVINCEID] = @PROVINCEID


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveProvinceList]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveProvinceList]
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT
	 [PROVINCEID]
	, [COUNTRYID]
	, [PROVINCENAME]
	, [CRTUSRID]
	, [TSCRT]
	, [MODUSRID]
	, [TSMOD]
	, [ACTIVEFLAG]
FROM	[dbo].[Province]
WHERE ActiveFlag = 'Y'

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveProvinceListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_RetrieveProvinceListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'ProvinceID';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [PROVINCEID],
   [COUNTRYID],
   [PROVINCENAME],
   [CRTUSRID],
   [TSCRT],
   [MODUSRID],
   [TSMOD],
   [ACTIVEFLAG]
   FROM dbo.[Province]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
END
ELSE
BEGIN
	SET @Where = N' WHERE ACTIVEFLAG = ''Y''';
END

SET @SQL = @SQL + @Where;
SET @SQL = @SQL + char(13) + N'),';

IF(@TOP <> 0)
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrArticle]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_RetrieveTrArticle]
(
@Id BIGINT
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [Id]
      ,[Category]
      ,[Title]
      ,[Story]
      ,[GPSLocation]
      ,[GPSLong]
      ,[GPSLat]
      ,[cStatus]
      ,[cCreated]
      ,[dCreated]
      ,[cLastUpdated]
      ,[dLastUpdated]
FROM	[dbo].[TrArticles]
WHERE Id = @Id


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrArticleListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_RetrieveTrArticleListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'Id';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [Id],
   [Category],
   [Title],
   [Story],
   [GPSLocation],
   [GPSLong],
   [GPSLat],
   [cStatus],
   [cCreated],
   [dCreated],
   [cLastUpdated],
   [dLastUpdated]
   FROM dbo.[TrArticles]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP >= 0 )
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrImageAttachment]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_RetrieveTrImageAttachment]
(
@Id BIGINT,
@HeaderId BIGINT
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [Id]
      ,[HeaderId]
      ,[Image]
      ,[Sequence]
      ,[cCreated]
      ,[dCreated]
      ,[cLastUpdated]
      ,[dLastUpdated]
FROM	[dbo].[TrImageAttachments]
WHERE (@Id = 0 OR Id = @Id)
AND (@HeaderId = 0 OR HeaderId = @HeaderId)


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrImageAttachmentListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_RetrieveTrImageAttachmentListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'Id';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [Id],
   [HeaderId],
   [Image],
   [Sequence],
   [cCreated],
   [dCreated],
   [cLastUpdated],
   [dLastUpdated]
   FROM dbo.[TrImageAttachments]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP >= 0 )
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrUserCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_RetrieveTrUserCoupon]
(
@Id BIGINT
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SELECT [Id]
      ,[UserID]
      ,[MsCouponId]
      ,[CouponCode]    
	  ,[IsRedeemed]
	  ,[RedeemDate]
      ,[cStatus]
      ,[cCreated]
      ,[dCreated]
      ,[cLastUpdated]
      ,[dLastUpdated]
FROM	[dbo].[TrUserCoupons]
WHERE Id = @Id


END


GO
/****** Object:  StoredProcedure [dbo].[up_RetrieveTrUserCouponListCustom]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[up_RetrieveTrUserCouponListCustom]
(
@Where nvarchar(255) = '',
@OrderBy nvarchar(255) = '',
@Start int = 0,
@Limit int = 0
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TOP int;
DECLARE @SQL nvarchar(max);

SET @TOP = @Start + @Limit;
SET @Start = @Start + 1;

IF(@OrderBy = '')
BEGIN
	SET @OrderBy = 'Id';
END

SET @SQL = N'WITH SQLQUERY AS' + char(13) + '(
   SELECT
   ROW_NUMBER() OVER(ORDER BY ' + @OrderBy + ') RowNumber,
   [Id],
   [UserID],
   [MsCouponId],
   [CouponCode],
   [cStatus],
   [cCreated],
   [dCreated],
   [cLastUpdated],
   [dLastUpdated]
   FROM dbo.[TrUserCoupons]';

IF(@Where <> '')
BEGIN
	SET @Where = N' WHERE ' + @Where;
	SET @SQL = @SQL + @Where;
END

SET @SQL = @SQL + char(13) + N'),';

IF(@TOP >= 0 )
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13)+ '(
	   SELECT * FROM SQLQUERY,
	   (SELECT MAX(RowNumber) AS TotalRecord FROM SQLQUERY) AS RC'+ char(13) +')

	SELECT * FROM 
	SQLQUERYTotal WHERE RowNumber BETWEEN ' + CAST(@Start AS VARCHAR) + ' AND '  + CAST(@TOP  AS VARCHAR);
END
ELSE
BEGIN
	SET @SQL = @SQL + char(13) + N'SQLQUERYTotal AS'+ char(13) +'(
	SELECT * FROM SQLQUERY'+ char(13) +')'+ char(13) +N'SELECT * FROM SQLQUERYTotal;';
END

--print(@sql)
EXEC sp_executesql @SQL;

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateCountry]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateCountry]
(
@COUNTRYID VarChar(10),
@COUNTRYNAME VarChar(255),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Country]
SET
COUNTRYNAME = @COUNTRYNAME,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[COUNTRYID] = @COUNTRYID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateDetailData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------
-- Date Created	: Monday,26-03-2018
-- Created By	: APP .NET Class Generator
-- Rev History	:
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[up_UpdateDetailData]
(
@DETAILID Int,
@HEADERID Int,
@VALUE VarChar(50),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE	[dbo].[DetailData]
SET
[HEADERID] = @HEADERID,
[VALUE] = @VALUE,
[MODUSRID] = @MODUSRID,
[TSMOD] = getdate(),
[ACTIVEFLAG] = @ACTIVEFLAG
WHERE
[DETAILID] = @DETAILID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateEmployee]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateEmployee]
(
@IDEMPLOYEE VarChar(10),
@FULLNAME VarChar(50),
@FIRSTNAME VarChar(50),
@LASTNAME VarChar(50),
@DESCRIPTION VarChar(100),
@DATAINT Int,
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Employee]
SET
FULLNAME = @FULLNAME,
FIRSTNAME = @FIRSTNAME,
LASTNAME = @LASTNAME,
DESCRIPTION = @DESCRIPTION,
DATAINT = @DATAINT,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[IDEMPLOYEE] = @IDEMPLOYEE

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateHeaderData]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateHeaderData]
(
@HEADERID Int,
@HEADERDESC VarChar(50),
@VALUE VarChar(50),
@CATEGORY VarChar(1),
@HOBBY VarChar(100),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[HeaderData]
SET
HEADERDESC = @HEADERDESC,
VALUE = @VALUE,
CATEGORY = @CATEGORY,
HOBBY = @HOBBY,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[HEADERID] = @HEADERID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMsCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_UpdateMsCoupon]
(
@Id BIGINT,
@Title VarChar(250),
@Benefit VarChar(MAX),
@Usage VarChar(MAX),
@Tnc VarChar(MAX),
@PointNeeded BIGINT,
@ValidUntil Datetime,
@CouponImage Varbinary(MAX),
@cStatus VarChar(1),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsCoupons]
SET
Title  = @Title ,
Benefit = @Benefit,
Usage = @Usage,
Tnc = @Tnc,
PointNeeded = @PointNeeded,
ValidUntil = @ValidUntil,
CouponImage = @CouponImage,
cStatus = @cStatus,
dLastUpdated = getdate(),
cLastUpdated = @cLastUpdated
WHERE [Id] = @Id

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMsSample]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateMsSample]
(
@SAMPLEID Int,
@SAMPLENAME VarChar(50),
@INFO1 VarChar(20),
@VALUE1 Decimal(12,2),
@VALUE2 Decimal(12,2),
@MODUSRID VarChar(50),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsSample]
SET
SAMPLENAME = @SAMPLENAME,
INFO1 = @INFO1,
VALUE1 = @VALUE1,
VALUE2 = @VALUE2,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[SAMPLEID] = @SAMPLEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMsSerial]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateMsSerial]
(
@SERIALID VarChar(50),
@SERIALDESC NVarChar(510),
@REMARK VarChar(250),
@SERIALLENGTH Int,
@STARTNUM Int,
@ENDNUM Int,
@CURRENTNUM Int,
@MODUSRID VarChar(50),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsSerial]
SET
SERIALDESC = @SERIALDESC,
REMARK = @REMARK,
SERIALLENGTH = @SERIALLENGTH,
STARTNUM = @STARTNUM,
ENDNUM = @ENDNUM,
CURRENTNUM = @CURRENTNUM,
TSMOD = getdate(),
MODUSRID = @MODUSRID,
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[SERIALID] = @SERIALID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMsUser]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateMsUser]
(
@USERID VarChar(10),
@USERROLEID VarChar(20),
@PWD VarChar(50),
@USERGUID UNIQUEIDENTIFIER,
@FULLNAME VarChar(100),
@EMAIL VarChar(100),
@INFO1 VarChar(100),
@INFO2 VarChar(100),
@INFO3 VarChar(100),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsUser]
SET

PWD = @PWD,
USERGUID = @USERGUID,
FULLNAME = @FULLNAME,
EMAIL = @EMAIL,
INFO1 = @INFO1,
INFO2 = @INFO2,
INFO3 = @INFO3,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE [USERID] = @USERID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateMsUserRole]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateMsUserRole]
(
@MODULEID VarChar(5),
@USERROLEID VarChar(20),
@USERROLEDESC VarChar(50),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[MsUserRole]
SET
MODULEID = @MODULEID,
USERROLEDESC = @USERROLEDESC,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[USERROLEID] = @USERROLEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateOrder]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateOrder]
(
@ORDERID Int,
@CUSTOMERID NVarChar(10),
@EMPLOYEEID Int,
@ORDERDATE DateTime,
@SHIPNAME NVarChar(80),
@SHIPADDRESS NVarChar(120),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Order]
SET
CUSTOMERID = @CUSTOMERID,
EMPLOYEEID = @EMPLOYEEID,
ORDERDATE = @ORDERDATE,
SHIPNAME = @SHIPNAME,
SHIPADDRESS = @SHIPADDRESS,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[ORDERID] = @ORDERID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateProvince]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_UpdateProvince]
(
@PROVINCEID Int,
@COUNTRYID NVarChar(10),
@PROVINCENAME NVarChar(510),
@MODUSRID VarChar(20),
@ACTIVEFLAG Char(1)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[Province]
SET
COUNTRYID = @COUNTRYID,
PROVINCENAME = @PROVINCENAME,
MODUSRID = @MODUSRID,
TSMOD = getdate(),
ACTIVEFLAG = @ACTIVEFLAG
WHERE
[PROVINCEID] = @PROVINCEID

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateTrArticle]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[up_UpdateTrArticle]
(
@Id BIGINT,
@Category VarChar(10),
@Title VarChar(20),
@Story VarChar(255),
@GPSLocation VarChar(100),
@GPSLong float,
@GPSLat float,
@cStatus VarChar(1),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[TrArticles]
SET

Category = @Category,
Title = @Title,
Story = @Story,
GPSLocation = @GPSLocation,
GPSLong = @GPSLong,
GPSLat = @GPSLat,
cStatus = @cStatus,
dLastUpdated = getdate(),
cLastUpdated = @cLastUpdated
WHERE [Id] = @Id

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateTrImageAttachment]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[up_UpdateTrImageAttachment]
(
@Id BIGINT,
@HeaderId bigint,
@Image varbinary(MAX),
@Sequence int,
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[TrImageAttachments]
SET

HeaderId = @HeaderId,
[Image] = @Image,
[Sequence] = @Sequence,
dLastUpdated = getdate(),
cLastUpdated = @cLastUpdated
WHERE [Id] = @Id

END


GO
/****** Object:  StoredProcedure [dbo].[up_UpdateTrUserCoupon]    Script Date: 12/17/2018 10:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[up_UpdateTrUserCoupon]
(
@Id BIGINT,
@UserID VarChar(10),
@MsCouponId BIGINT,
@CouponCode VarChar(100),
@IsRedeemed Bit,
@RedeemDate Datetime,
@cStatus VarChar(1),
@cLastUpdated VarChar(20)
)
WITH EXECUTE AS CALLER
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

UPDATE [dbo].[TrUserCoupons]
SET
UserID  = @UserID ,
MsCouponId = @MsCouponId,
CouponCode = @CouponCode,
IsRedeemed = @IsRedeemed,
RedeemDate = @RedeemDate,
cStatus = @cStatus,
dLastUpdated = getdate(),
cLastUpdated = @cLastUpdated
WHERE [Id] = @Id

END


GO
USE [master]
GO
ALTER DATABASE [Patuh] SET  READ_WRITE 
GO
