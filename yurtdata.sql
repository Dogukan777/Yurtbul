USE [master]
GO
/****** Object:  Database [vtys_proje]    Script Date: 23.10.2020 12:35:39 ******/
CREATE DATABASE [vtys_proje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vtys_proje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\vtys_proje.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vtys_proje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\vtys_proje_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [vtys_proje] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vtys_proje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vtys_proje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vtys_proje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vtys_proje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vtys_proje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vtys_proje] SET ARITHABORT OFF 
GO
ALTER DATABASE [vtys_proje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vtys_proje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vtys_proje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vtys_proje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vtys_proje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vtys_proje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vtys_proje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vtys_proje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vtys_proje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vtys_proje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vtys_proje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vtys_proje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vtys_proje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vtys_proje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vtys_proje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vtys_proje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vtys_proje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vtys_proje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vtys_proje] SET  MULTI_USER 
GO
ALTER DATABASE [vtys_proje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vtys_proje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vtys_proje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vtys_proje] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vtys_proje] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vtys_proje] SET QUERY_STORE = OFF
GO
USE [vtys_proje]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_login]    Script Date: 23.10.2020 12:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_login](@nickName nvarchar(15),@password nvarchar(20))
returns char(1)
as
begin
declare @isMatch char(1)
declare @Count int
set @Count = (select Count(*) from tbl_User where nickName=@nickName and password=@password)

if(@Count > 0)

begin
set @isMatch='E'
end

else
begin
set @isMatch='H'
end

return @isMatch

end
GO
/****** Object:  UserDefinedFunction [dbo].[userMatch]    Script Date: 23.10.2020 12:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[userMatch](
@nickName nvarchar(15),
@email nvarchar(250),
@phoneNo nvarchar(50))
returns nvarchar(20)
as
begin
declare @isMatch char(1)
set @isMatch = 'H'
declare @nickNo int
declare @emailNo int
declare @phone int
set @nickNo = (select  Count(*) from tbl_User where nickname = @nickname)
set @emailNo = (select  Count(*) from tbl_User where emailAddress = @email)
set @phone = (select  Count(*) from tbl_User where phoneNo = @phoneNo)

if(@nickNo>0)

begin
set @isMatch='N'
end


if(@emailNo>0 and @isMatch!='N')

begin
set @isMatch='E'
end


if(@phone>0 and @isMatch!='N' and @isMatch!='E')

begin
set @isMatch='P'
end


return @isMatch

end
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 23.10.2020 12:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[cityNo] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[cityNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryContact]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryContact](
	[dormNo] [int] NOT NULL,
	[dormAddress] [nvarchar](1000) NOT NULL,
	[dormPhone] [nvarchar](11) NOT NULL,
	[dormEmailAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_DormitoryContact] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryServices]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryServices](
	[dormNo] [int] NOT NULL,
	[roomCleaningDayWeekly] [int] NOT NULL,
	[laundryRoom] [bit] NOT NULL,
	[eveningDinner] [bit] NOT NULL,
	[breakfast] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DormitoryServices] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryPublicPlaces]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryPublicPlaces](
	[dormNo] [int] NOT NULL,
	[sportsArea] [bit] NOT NULL,
	[gym] [bit] NOT NULL,
	[pool] [bit] NOT NULL,
	[musicRoom] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DormitoryPublicPlaces] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryCharge]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryCharge](
	[dormNo] [int] NOT NULL,
	[onePersonRoomCharge] [int] NULL,
	[twoPersonRoomCharge] [int] NULL,
	[threePersonRoomCharge] [int] NULL,
	[fourPersonRoomCharge] [int] NULL,
 CONSTRAINT [PK_tbl_DormitoryCharge] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Dormitory]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Dormitory](
	[dormNo] [int] IDENTITY(1,1) NOT NULL,
	[dormName] [nvarchar](100) NOT NULL,
	[cityNo] [int] NOT NULL,
	[roomCount] [int] NULL,
	[gender] [nchar](1) NOT NULL,
 CONSTRAINT [PK_tbl_Dormitory] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_yurtGetir]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_yurtGetir](@yurtName nvarchar(50))
RETURNS TABLE

as
          RETURN(select Dr.dormNo,Dr.dormName, 
               case gender when 'E' then 'Erkek' when 'K' then 'Kız' end as gender, 
               cityName, roomCount,dormAddress,dormPhone,dormEmailAddress,
			   case sportsArea when 1 then 'Var' when 0  then 'Yok' end as sportsArea,
			   case gym when 1 then 'Var' when 0  then 'Yok' end as gym,
			   case pool when 1 then 'Var' when 0  then 'Yok' end as pool,
			   case musicRoom when 1 then 'Var' when 0  then 'Yok' end as musicRoom,
			   roomCleaningDayWeekly,
			   case laundryRoom when 1 then 'Var' when 0  then 'Yok' end as laundryRom,
			    case eveningDinner when 1 then 'Var' when 0  then 'Yok' end as eveningDinner,
				 case breakfast when 1 then 'Var' when 0  then 'Yok' end as breakfast,
				 onePersonRoomCharge,twoPersonRoomCharge,
				 threePersonRoomCharge,fourPersonRoomCharge

               from tbl_Dormitory Dr, tbl_DormitoryCharge DrCh, tbl_DormitoryContact DrCo, 
               tbl_DormitoryPublicPlaces DrPu, tbl_DormitoryServices DrSe, tbl_City Ci 
               where Dr.dormNo = DrCh.dormNo 
               and   Dr.dormNo = DrCo.dormNo 
               and   Dr.dormNo = DrPu.dormNo 
               and   Dr.dormNo = DrSe.dormNo 
               and   Dr.cityNo = Ci.cityNo
			   and   Dr.dormName=@yurtName)
GO
/****** Object:  Table [dbo].[tbl_Campus]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Campus](
	[campusNo] [int] IDENTITY(1,1) NOT NULL,
	[campusName] [nvarchar](100) NOT NULL,
	[campusAddress] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_Campus] PRIMARY KEY CLUSTERED 
(
	[campusNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OfficeContact]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OfficeContact](
	[officeNo] [int] IDENTITY(1,1) NOT NULL,
	[officeCityNo] [int] NOT NULL,
	[officeAddress] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tbl_OfficeContact] PRIMARY KEY CLUSTERED 
(
	[officeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Room](
	[dormNo] [int] NOT NULL,
	[onePersonRoom] [int] NOT NULL,
	[twoPersonRoom] [int] NOT NULL,
	[threePersonRoom] [int] NOT NULL,
	[fourPersonRoom] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Room] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_School]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_School](
	[schoolNo] [int] IDENTITY(1,1) NOT NULL,
	[schoolName] [nvarchar](50) NOT NULL,
	[campusNo] [int] NOT NULL,
	[cityNo] [int] NOT NULL,
 CONSTRAINT [PK_tbl_school] PRIMARY KEY CLUSTERED 
(
	[schoolNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SiteContact]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SiteContact](
	[siteID] [int] IDENTITY(1,1) NOT NULL,
	[siteName] [nvarchar](100) NOT NULL,
	[siteEmailAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_SiteContact] PRIMARY KEY CLUSTERED 
(
	[siteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userNo] [int] IDENTITY(1,1) NOT NULL,
	[nickName] [nvarchar](15) NOT NULL,
	[userType] [char](1) NOT NULL,
	[schoolNo] [int] NULL,
	[phoneNo] [nvarchar](20) NULL,
	[emailAddress] [nvarchar](100) NOT NULL,
	[gender] [char](1) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[personName] [nvarchar](60) NOT NULL,
	[personLastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Dormitory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dormitory_tbl_City] FOREIGN KEY([cityNo])
REFERENCES [dbo].[tbl_City] ([cityNo])
GO
ALTER TABLE [dbo].[tbl_Dormitory] CHECK CONSTRAINT [FK_tbl_Dormitory_tbl_City]
GO
ALTER TABLE [dbo].[tbl_DormitoryCharge]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryCharge_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryCharge] CHECK CONSTRAINT [FK_tbl_DormitoryCharge_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryContact]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryContact_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryContact] CHECK CONSTRAINT [FK_tbl_DormitoryContact_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryPublicPlaces]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryPublicPlaces_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryPublicPlaces] CHECK CONSTRAINT [FK_tbl_DormitoryPublicPlaces_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryServices]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryServices_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryServices] CHECK CONSTRAINT [FK_tbl_DormitoryServices_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_Room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Room_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_Room] CHECK CONSTRAINT [FK_tbl_Room_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_School]  WITH CHECK ADD  CONSTRAINT [FK_tbl_School_tbl_Campus] FOREIGN KEY([campusNo])
REFERENCES [dbo].[tbl_Campus] ([campusNo])
GO
ALTER TABLE [dbo].[tbl_School] CHECK CONSTRAINT [FK_tbl_School_tbl_Campus]
GO
ALTER TABLE [dbo].[tbl_School]  WITH CHECK ADD  CONSTRAINT [FK_tbl_School_tbl_City] FOREIGN KEY([cityNo])
REFERENCES [dbo].[tbl_City] ([cityNo])
GO
ALTER TABLE [dbo].[tbl_School] CHECK CONSTRAINT [FK_tbl_School_tbl_City]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_School] FOREIGN KEY([schoolNo])
REFERENCES [dbo].[tbl_School] ([schoolNo])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_School]
GO
/****** Object:  StoredProcedure [dbo].[userAdd]    Script Date: 23.10.2020 12:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[userAdd](
@Nickname nvarchar(50),
@CampusName nvarchar(50),
@TelNo nvarchar(50),
@Email nvarchar(250),
@gender char(1),
@password nvarchar(20),
@personName nvarchar(60),
@personLastName nvarchar(50)
)
as
begin
insert into tbl_User values(@Nickname,'K',(select schoolNo from tbl_Campus Ca,tbl_School S,tbl_City C where C.cityNo=s.cityNo and Ca.campusNo=S.campusNo 
and campusName=@CampusName),@TelNo,@Email,@gender,@password,@personName,@personLastName)
end
GO
USE [master]
GO
ALTER DATABASE [vtys_proje] SET  READ_WRITE 
GO
