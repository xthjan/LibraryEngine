USE [master]
GO
/****** Object:  Database [Library]    Script Date: 05/08/15 21:01:17 *********/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\Library.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\Library_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 05/08/15 21:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authors](
	[id] [uniqueidentifier] NOT NULL,
	[name] [varchar](350) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 05/08/15 21:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[id] [uniqueidentifier] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[authorId] [uniqueidentifier] NOT NULL,
	[summary] [varchar](500) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05/08/15 21:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [uniqueidentifier] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Authors] ([id], [name]) VALUES (N'6ff6ccb6-7609-4abd-ba0c-3f134e5b5c6b', N'Mario Vargas Llosa')
INSERT [dbo].[Authors] ([id], [name]) VALUES (N'7398672b-1d54-4c52-8c11-e38ffaaf2cd1', N'José Saramago')
INSERT [dbo].[Authors] ([id], [name]) VALUES (N'539d56a9-7044-4117-9dbe-e6bb3bc91dd9', N'Edgar Allan Poe')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'b0d66af2-9dc7-449a-9e1e-00d160133be9', N'Conversation in the Cathedral', N'395f2df6-869f-4961-bcf6-4ced8a01260e', N'6ff6ccb6-7609-4abd-ba0c-3f134e5b5c6b', N'Conversation in the Cathedral is a 1969 novel by Peruvian writer and essayist Mario Vargas Llosa, translated by Gregory Rabassa. One of Vargas Llosa''s major works, it is a portrayal of Peru under the dictatorship of Manuel A. Odría in the 1950s, and deals with the lives of characters from different social strata.[1] The ambitious narrative is built around the stories of Santiago Zavala and Ambrosio respectively; one the son of a minister, the other his chauffeur')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'4b614aaa-16a3-45e4-8594-20d79be95595', N'The Green House', N'395f2df6-869f-4961-bcf6-4ced8a01260e', N'6ff6ccb6-7609-4abd-ba0c-3f134e5b5c6b', N'The Green House (Original title: La Casa Verde) is the second novel by the Peruvian writer Mario Vargas Llosa, published in 1966. The novel is set over a period of forty years (from the early part of the 20th century to the 1960s) in two regions of Peru: Piura, a dusty town near the coast in the north, and Peruvian Amazonia, specifically the jungle region near the Marañón river.')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'a8dd01f7-2254-441e-8400-2cb8419ef16b', N'A Descent into the Maelström', N'aaf8a935-b601-4d83-917c-7dd8a21aa1e1', N'539d56a9-7044-4117-9dbe-e6bb3bc91dd9', N'"A Descent into the Maelström" is an 1841 short story by Edgar Allan Poe. In the tale, a man recounts how he survived a shipwreck and a whirlpool. It has been grouped with Poe''s tales of ratiocination and also labeled an early form of science fiction.')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'22d2fd8c-aac5-4c21-82e6-418ef0ab803e', N'The Gospel According to Jesus Christ', N'bccf3a0c-fb6a-4e6a-9a22-06077362b2ac', N'7398672b-1d54-4c52-8c11-e38ffaaf2cd1', N'The Gospel According to Jesus Christ  is a novel by the Portuguese author José Saramago. A fictional re-telling of Jesus Christ''s life, it depicts him as a flawed, humanised character with passions and doubts. The novel garnered controversy with some critics,[1] especially among the Roman Catholic Church, accusing Saramago of having a "substantially anti-religious vision".[2] It was also praised by other critics as a "deeply philosophical, provocative and compelling work"')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'40ef5592-65a5-4dff-8233-73618838d4d0', N'The Black Cat', N'aaf8a935-b601-4d83-917c-7dd8a21aa1e1', N'539d56a9-7044-4117-9dbe-e6bb3bc91dd9', N'"The Black Cat" is a short story by Edgar Allan Poe. It was first published in the August 19, 1843, edition of The Saturday Evening Post. It is a study of the psychology of guilt, often paired in analysis with Poe''s "The Tell-Tale Heart".[2] In both, a murderer carefully conceals his crime and believes himself unassailable, but eventually breaks down and reveals himself, impelled by a nagging reminder of his guilt.')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'0258429a-7a7d-4159-934b-7fb2adcdd6ae', N'The Facts in the Case of M. Valdemar', N'aaf8a935-b601-4d83-917c-7dd8a21aa1e1', N'539d56a9-7044-4117-9dbe-e6bb3bc91dd9', N'"The Facts in the Case of M. Valdemar" is a short story by American author Edgar Allan Poe about a mesmerist who puts a man in a suspended hypnotic state at the moment of death. An example of a tale of suspense and horror, it is also, to a certain degree, a hoax, as it was published without claiming to be fictional, and many at the time of publication (1845) took it to be a factual account. Poe toyed with this for a while before admitting it was a work of pure fiction in his marginalia.')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'630af7a8-bacf-4cdf-ab91-8b9055d2dcf8', N'The Time of the Hero', N'395f2df6-869f-4961-bcf6-4ced8a01260e', N'6ff6ccb6-7609-4abd-ba0c-3f134e5b5c6b', N'The Time of the Hero was the first novel published by Peruvian writer Mario Vargas Llosa, who won the Nobel Prize in 2010. Set among a community of cadets in a Lima military school (the Leoncio Prado Military Academy), it is notable for its experimental and complex employment of multiple perspectives. The novel was so accurate in its portraiture of the academy "that the academy''s authorities burned 1000 copies and condemned the book as a plan by Ecuador to denigrate Peru."')
INSERT [dbo].[Books] ([id], [name], [categoryId], [authorId], [summary]) VALUES (N'70c76132-86b9-43d5-beb4-c0decd840e27', N'Blindness', N'bccf3a0c-fb6a-4e6a-9a22-06077362b2ac', N'7398672b-1d54-4c52-8c11-e38ffaaf2cd1', N'Blindness (Portuguese: Ensaio sobre a cegueira, meaning Essay on Blindness) is a novel by Portuguese author José Saramago. It is one of his most famous novels, along with The Gospel According to Jesus Christ and Baltasar and Blimunda.')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (N'bccf3a0c-fb6a-4e6a-9a22-06077362b2ac', N'Narrative', N'Narrative Novels')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (N'395f2df6-869f-4961-bcf6-4ced8a01260e', N'Fiction', N'Fiction Novels')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (N'aaf8a935-b601-4d83-917c-7dd8a21aa1e1', N'Terror', N'Terror Novels')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (N'803908df-0e4d-482e-b8e3-aab352171e51', N'Romance', N'Romance Novels')
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([authorId])
REFERENCES [dbo].[Authors] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
