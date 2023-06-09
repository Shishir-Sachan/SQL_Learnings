USE [master]
GO

/****** Object:  Database [learning]    Script Date: 08-03-2022 14:51:58 ******/
CREATE DATABASE [learning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'learning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\learning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'learning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\learning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [learning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [learning] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [learning] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [learning] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [learning] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [learning] SET ARITHABORT OFF 
GO

ALTER DATABASE [learning] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [learning] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [learning] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [learning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [learning] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [learning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [learning] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [learning] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [learning] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [learning] SET  ENABLE_BROKER 
GO

ALTER DATABASE [learning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [learning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [learning] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [learning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [learning] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [learning] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [learning] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [learning] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [learning] SET  MULTI_USER 
GO

ALTER DATABASE [learning] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [learning] SET DB_CHAINING OFF 
GO

ALTER DATABASE [learning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [learning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [learning] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [learning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [learning] SET QUERY_STORE = OFF
GO

ALTER DATABASE [learning] SET  READ_WRITE 
GO

