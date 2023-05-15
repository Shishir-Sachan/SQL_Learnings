USE [master]
GO

/****** Object:  Database [eduin_data]    Script Date: 08-03-2022 14:50:25 ******/
CREATE DATABASE [eduin_data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eduin_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eduin_data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eduin_data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\eduin_data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eduin_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [eduin_data] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [eduin_data] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [eduin_data] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [eduin_data] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [eduin_data] SET ARITHABORT OFF 
GO

ALTER DATABASE [eduin_data] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [eduin_data] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [eduin_data] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [eduin_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [eduin_data] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [eduin_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [eduin_data] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [eduin_data] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [eduin_data] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [eduin_data] SET  ENABLE_BROKER 
GO

ALTER DATABASE [eduin_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [eduin_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [eduin_data] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [eduin_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [eduin_data] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [eduin_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [eduin_data] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [eduin_data] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [eduin_data] SET  MULTI_USER 
GO

ALTER DATABASE [eduin_data] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [eduin_data] SET DB_CHAINING OFF 
GO

ALTER DATABASE [eduin_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [eduin_data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [eduin_data] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [eduin_data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [eduin_data] SET QUERY_STORE = OFF
GO

ALTER DATABASE [eduin_data] SET  READ_WRITE 
GO

