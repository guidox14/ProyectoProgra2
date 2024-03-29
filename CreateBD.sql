USE [master]
GO
/****** Object:  Database [Aerolineas]    Script Date: 06/01/2014 23:19:33 ******/
CREATE DATABASE [Aerolineas] ON  PRIMARY 
( NAME = N'Aerolineas', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Aerolineas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Aerolineas_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Aerolineas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Aerolineas] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aerolineas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aerolineas] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Aerolineas] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Aerolineas] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Aerolineas] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Aerolineas] SET ARITHABORT OFF
GO
ALTER DATABASE [Aerolineas] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Aerolineas] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Aerolineas] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Aerolineas] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Aerolineas] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Aerolineas] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Aerolineas] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Aerolineas] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Aerolineas] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Aerolineas] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Aerolineas] SET  DISABLE_BROKER
GO
ALTER DATABASE [Aerolineas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Aerolineas] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Aerolineas] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Aerolineas] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Aerolineas] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Aerolineas] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Aerolineas] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Aerolineas] SET  READ_WRITE
GO
ALTER DATABASE [Aerolineas] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Aerolineas] SET  MULTI_USER
GO
ALTER DATABASE [Aerolineas] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Aerolineas] SET DB_CHAINING OFF
GO
USE [Aerolineas]
GO
/****** Object:  Table [dbo].[LineaAerea]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaAerea](
	[IdLineaAerea] [int] IDENTITY(1,1) NOT NULL,
	[NombreLineaArea] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_LineaAerea] PRIMARY KEY CLUSTERED 
(
	[IdLineaAerea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[NombrePais] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[NombreCliente] [nvarchar](30) NOT NULL,
	[Identification] [nvarchar](10) NOT NULL,
	[DireccionExacta] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[TelefonoCasa] [nvarchar](30) NOT NULL,
	[TelefonoCelular] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[NombreEstado] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[IdDestino] [int] IDENTITY(1,1) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[NombreDestino] [nvarchar](30) NOT NULL,
	[CodigoDestino] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[IdDestino] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[IdVuelo] [int] IDENTITY(1,1) NOT NULL,
	[Salida] [int] NOT NULL,
	[Llegada] [int] NOT NULL,
	[IdAerolinea] [int] NOT NULL,
	[NumeroVuelo] [int] NOT NULL,
	[HoraSalida] [nvarchar](15) NOT NULL,
	[HoraLlegada] [nvarchar](15) NOT NULL,
	[Precio] [int] NOT NULL,
	[CamposTotales] [int] NOT NULL,
	[CamposDisponibles] [int] NOT NULL,
 CONSTRAINT [PK_Vuelo] PRIMARY KEY CLUSTERED 
(
	[IdVuelo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaAerea_Destino]    Script Date: 06/01/2014 23:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaAerea_Destino](
	[IdLineaAerea] [int] NOT NULL,
	[IdDestino] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Cliente_Pais]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Pais]
GO
/****** Object:  ForeignKey [FK_Estado_Pais]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_Pais]
GO
/****** Object:  ForeignKey [FK_Destino_Estado]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Destino]  WITH CHECK ADD  CONSTRAINT [FK_Destino_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Destino] CHECK CONSTRAINT [FK_Destino_Estado]
GO
/****** Object:  ForeignKey [FK_Vuelo_Destino]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Destino] FOREIGN KEY([Salida])
REFERENCES [dbo].[Destino] ([IdDestino])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Destino]
GO
/****** Object:  ForeignKey [FK_Vuelo_Destino1]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Destino1] FOREIGN KEY([Llegada])
REFERENCES [dbo].[Destino] ([IdDestino])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Destino1]
GO
/****** Object:  ForeignKey [FK_Vuelo_LineaAerea]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_LineaAerea] FOREIGN KEY([IdAerolinea])
REFERENCES [dbo].[LineaAerea] ([IdLineaAerea])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_LineaAerea]
GO
/****** Object:  ForeignKey [FK_LineaAerea_Destino_Destino]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[LineaAerea_Destino]  WITH CHECK ADD  CONSTRAINT [FK_LineaAerea_Destino_Destino] FOREIGN KEY([IdDestino])
REFERENCES [dbo].[Destino] ([IdDestino])
GO
ALTER TABLE [dbo].[LineaAerea_Destino] CHECK CONSTRAINT [FK_LineaAerea_Destino_Destino]
GO
/****** Object:  ForeignKey [FK_LineaAerea_Destino_LineaAerea]    Script Date: 06/01/2014 23:19:34 ******/
ALTER TABLE [dbo].[LineaAerea_Destino]  WITH CHECK ADD  CONSTRAINT [FK_LineaAerea_Destino_LineaAerea] FOREIGN KEY([IdLineaAerea])
REFERENCES [dbo].[LineaAerea] ([IdLineaAerea])
GO
ALTER TABLE [dbo].[LineaAerea_Destino] CHECK CONSTRAINT [FK_LineaAerea_Destino_LineaAerea]
GO
