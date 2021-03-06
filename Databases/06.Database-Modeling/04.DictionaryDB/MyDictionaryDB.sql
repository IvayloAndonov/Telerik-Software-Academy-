USE [master]
GO
/****** Object:  Database [WorldDictionaryDB]    Script Date: 03-Oct-15 03:59:57 ******/
CREATE DATABASE [WorldDictionaryDB]
 CONTAINMENT = NONE
 ALTER DATABASE [WorldDictionaryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldDictionaryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldDictionaryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldDictionaryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldDictionaryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldDictionaryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldDictionaryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorldDictionaryDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorldDictionaryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldDictionaryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldDictionaryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldDictionaryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WorldDictionaryDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WorldDictionaryDB]
GO
/****** Object:  Table [dbo].[Explanations]    Script Date: 03-Oct-15 03:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanations](
	[WordID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ExplanationText] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Explanations_1] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 03-Oct-15 03:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Synonyms]    Script Date: 03-Oct-15 03:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synonyms](
	[WordID] [int] NOT NULL,
	[SynonymID] [int] NOT NULL,
 CONSTRAINT [PK_Synonyms] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC,
	[SynonymID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Translations]    Script Date: 03-Oct-15 03:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[WordTo] [int] NOT NULL,
	[WordTranslated] [int] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[WordTo] ASC,
	[WordTranslated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 03-Oct-15 03:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordID] [int] IDENTITY(1,1) NOT NULL,
	[WordName] [nvarchar](50) NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Explanations] ([WordID], [LanguageID], [ExplanationText]) VALUES (1, 1, N'A man is a male human')
INSERT [dbo].[Explanations] ([WordID], [LanguageID], [ExplanationText]) VALUES (2, 1, N'A male (♂) organism is the physiological sex that produces sperm')
INSERT [dbo].[Explanations] ([WordID], [LanguageID], [ExplanationText]) VALUES (5, 2, N'Отношение на мъжа, към жената, с която е встъпил в брак')
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (1, N'English')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (2, N'Bulgarian')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (3, N'Spanish')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (4, N'Chinese')
SET IDENTITY_INSERT [dbo].[Languages] OFF
INSERT [dbo].[Synonyms] ([WordID], [SynonymID]) VALUES (1, 2)
INSERT [dbo].[Synonyms] ([WordID], [SynonymID]) VALUES (1, 3)
INSERT [dbo].[Synonyms] ([WordID], [SynonymID]) VALUES (4, 6)
INSERT [dbo].[Synonyms] ([WordID], [SynonymID]) VALUES (7, 8)
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (1, N'Man', 1)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (2, N'Male', 1)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (3, N'Husband', 1)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (4, N'Мъж', 2)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (5, N'Съпруг', 2)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (6, N'Момче', 2)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (7, N'Hombre', 3)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (8, N'Macho', 3)
INSERT [dbo].[Words] ([WordID], [WordName], [LanguageID]) VALUES (9, N'男人', 4)
SET IDENTITY_INSERT [dbo].[Words] OFF
ALTER TABLE [dbo].[Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Explanations_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Explanations] CHECK CONSTRAINT [FK_Explanations_Languages]
GO
ALTER TABLE [dbo].[Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Explanations_Words2] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Explanations] CHECK CONSTRAINT [FK_Explanations_Words2]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words1] FOREIGN KEY([SynonymID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words1]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words] FOREIGN KEY([WordTo])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Words1] FOREIGN KEY([WordTranslated])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Words1]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages1]
GO
USE [master]
GO
ALTER DATABASE [WorldDictionaryDB] SET  READ_WRITE 
GO