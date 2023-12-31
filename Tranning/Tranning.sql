USE [master]
GO
/****** Object:  Database [Tranning]    Script Date: 11/12/2023 11:23:52 SA ******/
CREATE DATABASE [Tranning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tranning', FILENAME = N'D:\Project\MSSQL16.SQLEXPRESS03\MSSQL\DATA\Tranning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tranning_log', FILENAME = N'D:\Project\MSSQL16.SQLEXPRESS03\MSSQL\DATA\Tranning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tranning] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tranning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tranning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tranning] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tranning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tranning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tranning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tranning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tranning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tranning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tranning] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tranning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tranning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tranning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tranning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tranning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tranning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tranning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tranning] SET  MULTI_USER 
GO
ALTER DATABASE [Tranning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tranning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tranning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tranning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tranning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tranning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tranning] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tranning] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tranning]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
	[icon] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[vote] [int] NULL,
	[avatar] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[videos] [varchar](150) NULL,
	[documents] [varchar](150) NULL,
	[attack_file] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainee_course]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainee_course](
	[trainee_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainner_topic]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainner_topic](
	[trainner_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/12/2023 11:23:53 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[extra_code] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](100) NULL,
	[gender] [varchar](50) NOT NULL,
	[birthday] [date] NULL,
	[avatar] [varchar](200) NULL,
	[last_login] [datetime] NULL,
	[last_logout] [datetime] NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[full_name] [varchar](50) NOT NULL,
	[education] [varchar](50) NULL,
	[programming_language] [varchar](50) NULL,
	[toeic_score] [int] NULL,
	[experience] [text] NULL,
	[department] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [description], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, N'admin', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[roles] ([id], [name], [description], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, N'user', NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [role_id], [extra_code], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name], [education], [programming_language], [toeic_score], [experience], [department]) VALUES (1, 1, N'1231231', N'hoanganh2003', N'123456', N'hoanganh@gmail.com', N'0934282329', N'Ninh Binh', 1, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2023-10-28T00:00:00.000' AS DateTime), NULL, N'Tran Hoang Anh', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_categories_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_vote]  DEFAULT ((0)) FOR [vote]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[topics] ADD  CONSTRAINT [DF_topics_staus]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_categories]
GO
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_users] FOREIGN KEY([trainee_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_users]
GO
ALTER TABLE [dbo].[trainner_topic]  WITH CHECK ADD  CONSTRAINT [FK_trainner_topic_topics] FOREIGN KEY([topic_id])
REFERENCES [dbo].[topics] ([id])
GO
ALTER TABLE [dbo].[trainner_topic] CHECK CONSTRAINT [FK_trainner_topic_topics]
GO
ALTER TABLE [dbo].[trainner_topic]  WITH CHECK ADD  CONSTRAINT [FK_trainner_topic_users] FOREIGN KEY([trainner_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[trainner_topic] CHECK CONSTRAINT [FK_trainner_topic_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
USE [master]
GO
ALTER DATABASE [Tranning] SET  READ_WRITE 
GO
