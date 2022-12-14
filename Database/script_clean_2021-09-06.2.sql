USE [master]
GO
/****** Object:  Database [ScaleAddonClean]    Script Date: 07/09/2021 13:36:19 ******/
CREATE DATABASE [ScaleAddonClean]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScaleAddonClean', FILENAME = N'C:\ULT-Addon\Database\ScaleAddonClean.ndf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ScaleAddonClean_log', FILENAME = N'C:\ULT-Addon\Database\ScaleAddonClean_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ScaleAddonClean] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScaleAddonClean].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScaleAddonClean] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ScaleAddonClean] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScaleAddonClean] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScaleAddonClean] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ScaleAddonClean] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScaleAddonClean] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ScaleAddonClean] SET  MULTI_USER 
GO
ALTER DATABASE [ScaleAddonClean] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScaleAddonClean] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScaleAddonClean] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScaleAddonClean] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ScaleAddonClean] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ScaleAddonClean] SET QUERY_STORE = OFF
GO
USE [ScaleAddonClean]
GO
/****** Object:  Table [dbo].[AppSettings]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSettings](
	[SettingID] [nvarchar](50) NOT NULL,
	[Val] [nvarchar](255) NULL,
	[ClientID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__AppSetin__54372AFDC51B14C3] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[VendorID] [nvarchar](30) NULL,
	[VendorDetails] [nvarchar](max) NULL,
	[RegistrationNumber] [nvarchar](30) NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[InventoryID] [nvarchar](30) NULL,
	[VendorClass] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[InvoiceID] [nvarchar](30) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[CostGross] [decimal](25, 2) NULL,
	[NTRM] [smallint] NULL,
	[CostNTRM] [decimal](25, 2) NULL,
	[CostNett] [decimal](25, 2) NULL,
	[MC] [smallint] NULL,
	[Remark] [nvarchar](255) NULL,
	[StatusReject] [smallint] NULL,
	[SyncDetail] [smallint] NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[NoKontrak] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[GradeDraft] [nvarchar](30) NULL,
	[QCLock] [smallint] NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49] PRIMARY KEY CLUSTERED 
(
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingQC]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingQC](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[VendorID] [nvarchar](30) NULL,
	[VendorDetails] [nvarchar](max) NULL,
	[RegistrationNumber] [nvarchar](30) NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[InventoryID] [nvarchar](30) NULL,
	[VendorClass] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalLot] [int] NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[SamplingRange] [int] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy2_copy3] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingQCDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingQCDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Remark] [nvarchar](255) NULL,
	[StatusReject] [smallint] NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[NoKontrak] [nvarchar](255) NULL,
	[LotNbrSample] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy3] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyingRegistration]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyingRegistration](
	[RegistrationNumber] [nvarchar](30) NOT NULL,
	[VendorID] [nvarchar](30) NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[InventoryID] [nvarchar](30) NULL,
	[RegistrationDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[OrderType] [nvarchar](30) NULL,
	[NoKontrak] [nvarchar](255) NULL,
	[EstWeight] [decimal](19, 6) NULL,
	[EstLot] [int] NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationDate] ASC,
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectPackingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectPackingLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectPackingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectPackingLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](19, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldLotNbr] [nvarchar](40) NULL,
	[OldNetto] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[OldSubitem] [nvarchar](30) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy4] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectTempPackingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectTempPackingLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1_copy2_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectTempPackingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectTempPackingLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](19, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldLotNbr] [nvarchar](40) NULL,
	[OldNetto] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[OldSubitem] [nvarchar](30) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy4_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchINLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchINLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseIDFrom] [nvarchar](30) NULL,
	[WarehouseIDTo] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[TotalWeight] [decimal](19, 2) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[TransType] [nvarchar](30) NULL,
	[Note] [nvarchar](255) NULL,
	[DispatchOUTNbr] [nvarchar](30) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[LogisticService] [nvarchar](150) NULL,
	[LisencePlate] [nvarchar](30) NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy3_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchINLineData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchINLineData](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[UnitCost] [decimal](19, 2) NULL,
	[ExtCost] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy1_copy5_copy2_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchINLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchINLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[UnitCost] [decimal](19, 2) NULL,
	[ExtCost] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy1_copy5_copy2_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchOUTLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchOUTLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseIDFrom] [nvarchar](30) NULL,
	[WarehouseIDTo] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[TotalWeight] [decimal](19, 2) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[LogisticService] [nvarchar](150) NULL,
	[LisencePlate] [nvarchar](30) NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy3_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchOUTLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchOUTLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[UnitCost] [decimal](19, 2) NULL,
	[ExtCost] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy2_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FermentDirectLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FermentDirectLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[FermentType] [nvarchar](30) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy3_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FermentDirectLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FermentDirectLineINDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[UnitCost] [decimal](19, 2) NULL,
	[ExtCost] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FermentDirectLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FermentDirectLineOUTDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy1_copy5_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryImport]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryImport](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy1_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryImportDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryImportDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryItem]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItem](
	[InventoryID] [nvarchar](30) NOT NULL,
	[Descr] [nvarchar](255) NULL,
	[ItemStatus] [nvarchar](30) NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK__Inventor__F5FDE6D3C621CEB2] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransHistory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransHistory](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[NettoIN] [decimal](19, 2) NULL,
	[NettoOUT] [decimal](19, 2) NULL,
	[TransactionDate] [datetime] NULL,
	[Process] [nvarchar](30) NULL,
	[Notes] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemAttribute]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemAttribute](
	[CodeID] [nvarchar](4) NOT NULL,
	[CodeType] [nvarchar](20) NOT NULL,
	[CodeDescription] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK__ULTItemA__CBD96A69A8172FBC] PRIMARY KEY CLUSTERED 
(
	[CodeID] ASC,
	[CodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberingSetting]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberingSetting](
	[NumberingID] [nvarchar](50) NOT NULL,
	[LastIncrementValue] [int] NULL,
	[NumberingDate] [date] NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK__Numberin__0A40A24A06F56EAC] PRIMARY KEY CLUSTERED 
(
	[NumberingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingLineIN]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingLineIN](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[TotalWeight] [decimal](19, 2) NULL,
	[ProcessType] [nvarchar](30) NULL,
	[UnappliedBalance] [decimal](19, 2) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Notes] [nvarchar](255) NULL,
	[ShrinkBalance] [decimal](19, 2) NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy3] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingLineINDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
	[LotGroup] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingLineOUT]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingLineOUT](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[RefINNbr] [nvarchar](255) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[TotalWeight] [decimal](19, 2) NULL,
	[ProcessType] [nvarchar](30) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Notes] [nvarchar](255) NULL,
 CONSTRAINT [PK__Bir2Line__49B3095021D202B0_copy1_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingLineOUTDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[ZeroCost] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy1_copy5_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingLineOUTDonor]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingLineOUTDonor](
	[DocumentID] [nvarchar](30) NULL,
	[RefINNbr] [nvarchar](255) NULL,
	[RefINDonor] [nvarchar](255) NULL,
	[TotalWeight] [decimal](19, 2) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoice]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoice](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[VendorID] [nvarchar](30) NULL,
	[VendorDetails] [nvarchar](max) NULL,
	[TotalCashAdvance] [decimal](25, 2) NULL,
	[TotaxTaxDeduct] [decimal](25, 2) NULL,
	[TotalPaymentDeduct] [decimal](25, 2) NULL,
	[TotalPayment] [decimal](25, 2) NULL,
	[Status] [nvarchar](30) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[NPWP] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
	[AdminName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInvoiceDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoiceDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[ReceiptID] [nvarchar](30) NOT NULL,
	[ReceiptAmount] [decimal](25, 2) NULL,
	[TaxPercentage] [decimal](19, 6) NULL,
	[TaxAmount] [decimal](25, 2) NULL,
	[DeductPercentage] [decimal](19, 6) NULL,
	[DeductAmount] [decimal](25, 2) NULL,
	[PaymentAmount] [decimal](25, 2) NULL,
	[SyncDetail] [smallint] NULL,
	[VolumeVariable] [decimal](19, 2) NULL,
	[VolumeCurrent] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReclassLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReclassLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReclassLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReclassLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[CostGross] [decimal](25, 2) NULL,
	[NTRM] [smallint] NULL,
	[CostNTRM] [decimal](25, 2) NULL,
	[CostNett] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[StatusReject] [smallint] NULL,
	[SyncDetail] [smallint] NULL,
	[OrderNbr] [nvarchar](15) NULL,
	[NoKontrak] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldLotNbr] [nvarchar](40) NULL,
	[OldGrade] [nvarchar](30) NULL,
	[MC] [smallint] NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReclassProcessLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReclassProcessLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalCost] [decimal](25, 2) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReclassProcessLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReclassProcessLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldLotNbr] [nvarchar](40) NULL,
	[OldGrade] [nvarchar](30) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReworkLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReworkLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[TotalCost] [decimal](25, 2) NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReworkLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReworkLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldWeightReceive] [decimal](19, 2) NULL,
	[OldWeightTare] [decimal](19, 2) NULL,
	[OldWeightNetto] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleData](
	[RoleID] [nvarchar](30) NOT NULL,
	[RoleDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK__UserRole__8AFACE3A7D6D5672] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScaleCalibration]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScaleCalibration](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [datetime] NOT NULL,
	[WarehouseID] [nvarchar](30) NOT NULL,
	[ClientID] [nvarchar](30) NOT NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy2_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[WarehouseID] ASC,
	[ClientID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SegmentValue]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SegmentValue](
	[SegmentKeyID] [nvarchar](30) NOT NULL,
	[SegmentID] [smallint] NOT NULL,
	[SegmentDescr] [nvarchar](30) NULL,
	[SegmentValue] [nvarchar](30) NOT NULL,
	[Descr] [nvarchar](255) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK__SegmentV__BB4AC40EBBF05F88] PRIMARY KEY CLUSTERED 
(
	[SegmentKeyID] ASC,
	[SegmentID] ASC,
	[SegmentValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentInfo]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentInfo](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[TotalQty] [decimal](25, 2) NULL,
	[TotalAllocation] [decimal](19, 2) NULL,
	[AcumaticaRefNbr] [nvarchar](255) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerLocation] [nvarchar](255) NULL,
	[AcumaticaShipmentNbr] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[SODescription] [nvarchar](255) NULL,
	[LogisticService] [nvarchar](150) NULL,
	[LisencePlate] [nvarchar](30) NULL,
	[ShippingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentInfoAllocation]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentInfoAllocation](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[SyncDetail] [smallint] NULL,
	[SOLine] [int] NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1_copy1_copy1_copy1_copy2_copy2_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentInfoDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentInfoDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[Weight] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[SOLine] [int] NULL,
 CONSTRAINT [PK__Shipment__1ABEEF6FEF7E6428] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[SubItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItem]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItem](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[Remark] [nvarchar](255) NULL,
	[StatusStock] [smallint] NULL,
	[LastModified] [datetime] NULL,
	[BuyerName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[LocationInfo] [nvarchar](50) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TobaccoGrade]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TobaccoGrade](
	[InventoryID] [nvarchar](5) NOT NULL,
	[WarehouseID] [nvarchar](30) NOT NULL,
	[ProcessID] [nvarchar](2) NOT NULL,
	[Grade] [nvarchar](25) NOT NULL,
	[ReclassGrade] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TobaccoPrice]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TobaccoPrice](
	[InventoryID] [nvarchar](5) NOT NULL,
	[Source] [nvarchar](30) NOT NULL,
	[Area] [nvarchar](5) NOT NULL,
	[Grade] [nvarchar](25) NOT NULL,
	[Form] [nvarchar](5) NOT NULL,
	[CropYear] [nvarchar](5) NOT NULL,
	[Price] [decimal](19, 2) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TobaccoProcess]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TobaccoProcess](
	[ProcessCode] [nvarchar](2) NOT NULL,
	[ProcessName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcessCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnpackLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnpackLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1_copy1_copy2] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnpackLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnpackLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldSubItem] [nvarchar](50) NOT NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy3] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Password] [nvarchar](255) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK__UserData__1788CCAC108E5600] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserID] [int] NOT NULL,
	[RoleID] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorContract]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorContract](
	[VendorID] [nvarchar](30) NOT NULL,
	[NoKontrak] [nvarchar](255) NOT NULL,
	[Area] [nvarchar](20) NULL,
	[SubArea] [nvarchar](20) NULL,
	[Seri] [nvarchar](20) NULL,
	[InventoryID] [nvarchar](30) NULL,
	[NoKTP] [nvarchar](16) NULL,
	[Active] [bit] NULL,
	[FarmerID] [nvarchar](50) NULL,
	[VolumeTotal] [decimal](19, 2) NULL,
	[VolumePercentage] [decimal](19, 2) NULL,
	[VolumeVariable] [decimal](19, 2) NULL,
 CONSTRAINT [PK__ULTVendo__0201F21EFFB50EAB] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[NoKontrak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorData](
	[VendorID] [nvarchar](30) NOT NULL,
	[VendorName] [nvarchar](255) NULL,
	[Status] [nvarchar](30) NULL,
	[DisplayName] [nvarchar](255) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](50) NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](30) NULL,
	[VendorClass] [nvarchar](30) NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK__Vendor__F96EE5238B21E4FC_copy1] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorPO]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorPO](
	[VendorID] [nvarchar](30) NOT NULL,
	[OrderNbr] [nvarchar](15) NOT NULL,
	[NoKontrak] [nvarchar](255) NULL,
	[Status] [nvarchar](30) NULL,
	[OrderType] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[OrderNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorPODetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorPODetail](
	[OrderNbr] [nvarchar](15) NOT NULL,
	[LineNbr] [int] NOT NULL,
	[InventoryID] [nvarchar](30) NULL,
	[Subitem] [nvarchar](15) NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[OrderQty] [decimal](19, 2) NULL,
	[QtyOnReceipts] [decimal](19, 2) NULL,
 CONSTRAINT [PK__VendorPO__22D272D1C5A77DBC_copy1] PRIMARY KEY CLUSTERED 
(
	[OrderNbr] ASC,
	[LineNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorPrepayment]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorPrepayment](
	[VendorID] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[PaymentAmount] [decimal](25, 2) NULL,
	[PaymentRef] [nvarchar](30) NULL,
	[ReferenceNbr] [nvarchar](30) NOT NULL,
	[Status] [nvarchar](30) NULL,
	[Type] [nvarchar](30) NULL,
	[UnappliedBalance] [decimal](25, 2) NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK__Vendor__F96EE5238B21E4FC_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[ReferenceNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseLocation]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseLocation](
	[WarehouseID] [nvarchar](30) NOT NULL,
	[LocationID] [nvarchar](30) NOT NULL,
	[Descr] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Warehous__2608AFD9ACBAF2E5_copy1] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseSite]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseSite](
	[WarehouseID] [nvarchar](30) NOT NULL,
	[Descr] [nvarchar](30) NOT NULL,
	[SyncDate] [datetime2](0) NULL,
	[Company] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[Phone1] [nvarchar](30) NULL,
	[Phone2] [nvarchar](30) NULL,
	[Branch] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightAdjustLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightAdjustLine](
	[DocumentID] [nvarchar](30) NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[WarehouseID] [nvarchar](30) NULL,
	[Status] [nvarchar](30) NULL,
	[AcumaticaIssueRefNbr] [nvarchar](255) NULL,
	[AcumaticaReceiptRefNbr] [nvarchar](255) NULL,
	[CreatorID] [nvarchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__ReceiptL__CC08C400376CCA7B_copy1_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[DocumentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightAdjustLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightAdjustLineDetail](
	[DocumentID] [nvarchar](30) NOT NULL,
	[InventoryID] [nvarchar](30) NOT NULL,
	[SubItem] [nvarchar](50) NOT NULL,
	[LotNbr] [nvarchar](40) NOT NULL,
	[Source] [nvarchar](30) NULL,
	[Stage] [nvarchar](30) NULL,
	[Form] [nvarchar](30) NULL,
	[CropYear] [nvarchar](30) NULL,
	[Grade] [nvarchar](30) NULL,
	[Area] [nvarchar](30) NULL,
	[Color] [nvarchar](30) NULL,
	[Fermentation] [nvarchar](30) NULL,
	[Length] [nvarchar](30) NULL,
	[Process] [nvarchar](30) NULL,
	[StalkPosition] [nvarchar](30) NULL,
	[WeightRope] [decimal](19, 2) NULL,
	[WeightShipping] [decimal](19, 2) NULL,
	[WeightReceive] [decimal](19, 2) NULL,
	[WeightTare] [decimal](19, 2) NULL,
	[WeightNetto] [decimal](19, 2) NULL,
	[UoM] [nvarchar](6) NULL,
	[CostUnit] [decimal](25, 2) NULL,
	[Remark] [nvarchar](255) NULL,
	[SyncDetail] [smallint] NULL,
	[OldDocumentID] [nvarchar](30) NULL,
	[OldWeightReceive] [decimal](19, 2) NULL,
	[OldWeightTare] [decimal](19, 2) NULL,
	[OldWeightNetto] [decimal](19, 2) NULL,
	[BuyerName] [nvarchar](100) NULL,
 CONSTRAINT [PK__ReceiptL__E6C578B660556E49_copy2_copy1_copy1] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC,
	[LotNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaEndpointName', N'ULT', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaEndpointName', N'ULT', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaEndpointVersion', N'18.200.001', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaEndpointVersion', N'18.200.001', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaInvLocation', N'MAIN', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaPassword', N'Demo1234', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaPassword', N'Demo1234', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaSiteURL', N'https://universalleaf.acumatica.com/', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaSiteURL', N'http://localhost/UniversalLeaf', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaTenant', N'Tobacco', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaTenant', N'ULT4.1', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaUser', N'wahyu-sunartha', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'AcumaticaUser', N'wahyu-sunartha', N'CLIENT002')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComBaudrate', N'9600', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComDatabits', N'8', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComManual', N'True', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComParity', N'None', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComPort', N'COM4', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComPostfix', N' KG', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComPrefix', N'', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComStopbits', N'1', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'ComTerminator', N'', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'FiscalMonth', N'7', N'CLIENT001')
INSERT [dbo].[AppSettings] ([SettingID], [Val], [ClientID]) VALUES (N'WarehouseID', N'GG', N'CLIENT001')
GO
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'ADMIN', N'Administrator')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'BUYING-BUY', N'Buying Operator - Buying')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'BUYING-INV', N'Buying Operator - Invoice')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'BUYING-REG', N'Buying Operator - Registration')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'INVENTORY', N'Inventory')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'PROCESS', N'Processing Operator')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'SETTING', N'Settings')
INSERT [dbo].[RoleData] ([RoleID], [RoleDesc]) VALUES (N'SHIPMENT', N'Shipment Info & Allocation')
GO
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([UserID], [UserName], [FullName], [Password], [Status]) VALUES (1, N'admin', N'Administrator', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', N'Active')
INSERT [dbo].[UserData] ([UserID], [UserName], [FullName], [Password], [Status]) VALUES (2, N'setya', N'Wahyu Setya', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', N'Active')
INSERT [dbo].[UserData] ([UserID], [UserName], [FullName], [Password], [Status]) VALUES (3, N'isnaeni', N'Isnaeni P', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', N'Active')
SET IDENTITY_INSERT [dbo].[UserData] OFF
GO
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'ADMIN')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'BUYING-REG')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'PROCESS')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'SETTING')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'INVENTORY')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'BUYING-BUY')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'BUYING-INV')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (1, N'SHIPMENT')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (2, N'ADMIN')
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (2, N'SETTING')
GO
ALTER TABLE [dbo].[BuyingLine] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[BuyingLine] ADD  DEFAULT ('') FOR [InvoiceID]
GO
ALTER TABLE [dbo].[BuyingLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BuyingLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[BuyingLineDetail] ADD  DEFAULT ((0)) FOR [QCLock]
GO
ALTER TABLE [dbo].[BuyingQC] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BuyingQCDetail] ADD  DEFAULT ((0)) FOR [StatusReject]
GO
ALTER TABLE [dbo].[BuyingRegistration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DirectPackingLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[DirectPackingLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[DirectPackingLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DirectPackingLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[DirectTempPackingLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[DirectTempPackingLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[DirectTempPackingLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DirectTempPackingLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[DispatchINLine] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[DispatchINLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DispatchINLineData] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[DispatchINLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[DispatchOUTLine] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[DispatchOUTLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DispatchOUTLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[FermentDirectLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[FermentDirectLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[FermentDirectLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FermentDirectLineINDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[FermentDirectLineOUTDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[InventoryImport] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InventoryImportDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[InventoryTransHistory] ADD  DEFAULT ((0)) FOR [NettoIN]
GO
ALTER TABLE [dbo].[InventoryTransHistory] ADD  DEFAULT ((0)) FOR [NettoOUT]
GO
ALTER TABLE [dbo].[ProcessingLineIN] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[ProcessingLineIN] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProcessingLineIN] ADD  DEFAULT ((0)) FOR [ShrinkBalance]
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProcessingLineOUT] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[ProcessingLineOUT] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ADD  DEFAULT ((0)) FOR [ZeroCost]
GO
ALTER TABLE [dbo].[ProcessingLineOUTDonor] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PurchaseInvoice] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[PurchaseInvoice] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PurchaseInvoiceDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ReclassLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[ReclassLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[ReclassLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReclassLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ReclassProcessLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[ReclassProcessLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[ReclassProcessLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReclassProcessLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ReworkLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[ReworkLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[ReworkLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReworkLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[ScaleCalibration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ShipmentInfo] ADD  DEFAULT ('') FOR [AcumaticaRefNbr]
GO
ALTER TABLE [dbo].[ShipmentInfo] ADD  DEFAULT ('') FOR [AcumaticaShipmentNbr]
GO
ALTER TABLE [dbo].[ShipmentInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ShipmentInfoAllocation] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[StockItem] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[StockItem] ADD  CONSTRAINT [DF__StockItem__Locat__2077C861]  DEFAULT ('MAIN') FOR [LocationInfo]
GO
ALTER TABLE [dbo].[UnpackLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[UnpackLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[UnpackLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UnpackLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[WeightAdjustLine] ADD  DEFAULT ('') FOR [AcumaticaIssueRefNbr]
GO
ALTER TABLE [dbo].[WeightAdjustLine] ADD  DEFAULT ('') FOR [AcumaticaReceiptRefNbr]
GO
ALTER TABLE [dbo].[WeightAdjustLine] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[WeightAdjustLineDetail] ADD  DEFAULT ((0)) FOR [SyncDetail]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [fk_UserRole_RoleData_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleData] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [fk_UserRole_RoleData_RoleID]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [fk_UserRole_UserData_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserData] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [fk_UserRole_UserData_UserID]
GO
/****** Object:  StoredProcedure [dbo].[Clear_ShipmentInfoDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Clear_ShipmentInfoDetail]
(
		@DocumentID nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfoDetail
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM ShipmentInfoDetail	
				WHERE DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_DispatchINLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_DispatchINLineDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchINLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM DispatchINLineDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_DispatchOUTLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_DispatchOUTLineDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM DispatchOUTLineDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_DispatchOUTLineDetail_All]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_DispatchOUTLineDetail_All]
(
		@DocumentID nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM DispatchOUTLineDetail	
				WHERE DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_FermentDirectLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_FermentDirectLineINDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM FermentDirectLineINDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_FermentDirectLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_FermentDirectLineOUTDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM FermentDirectLineOUTDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_InventoryTransHistory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_InventoryTransHistory]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM InventoryTransHistory
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM InventoryTransHistory	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ProcessingLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_ProcessingLineINDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM ProcessingLineINDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ProcessingLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_ProcessingLineOUTDetail]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM ProcessingLineOUTDetail	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_PurchaseInvoiceDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_PurchaseInvoiceDetail]
(
		@DocumentID nvarchar(30),
		@ReceiptID nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM PurchaseInvoiceDetail
        WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM PurchaseInvoiceDetail	
				WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ShipmentInfoAllocation]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_ShipmentInfoAllocation]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfoAllocation
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        DELETE FROM ShipmentInfoAllocation	
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

    
END
GO
/****** Object:  StoredProcedure [dbo].[Get_InventoryHistory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_InventoryHistory]
(
		@StartDate nvarchar(50),
    @EndDate nvarchar(50)
)
AS
BEGIN
SELECT
*
FROM
	dbo.InventoryTransHistory InvTrans
WHERE
	InvTrans.TransactionDate between  CONCAT(@StartDate,' 00:00:00') and  CONCAT(@EndDate,' 23:59:59')
ORDER BY InvTrans.TransactionDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Get_InventoryMovement]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_InventoryMovement]
(
		@StartDate nvarchar(50),
    @EndDate nvarchar(50)
)
AS
BEGIN
SELECT
	InvTrans.InventoryID,
	InvTrans.SubItem,
	InvTrans.Process,
	ISNULL((select sum(NettoIn - NettoOUT) from InventoryTransHistory Where InventoryID = InvTrans.InventoryID and Subitem = InvTrans.Subitem and Process = InvTrans.Process and TransactionDate <= CONCAT(@StartDate,' 00:00:00') ),0) as BegBalance,
	SUM(InvTrans.NettoIN) as SumNettoIN,
	SUM(InvTrans.NettoOUT) as SumNettoOUT,
	ISNULL((select sum(NettoIn - NettoOUT) from InventoryTransHistory Where InventoryID = InvTrans.InventoryID and Subitem = InvTrans.Subitem and Process = InvTrans.Process and TransactionDate <= CURRENT_TIMESTAMP),0) as EndBalance
FROM
	dbo.InventoryTransHistory InvTrans
WHERE
	InvTrans.TransactionDate between  CONCAT(@StartDate,' 00:00:00') and  CONCAT(@EndDate,' 23:59:59')
GROUP BY
	InvTrans.InventoryID, InvTrans.SubItem,InvTrans.Process
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_AppSettings]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_AppSettings]
(
    @SettingID nvarchar(50),
    @Val nvarchar(255),
    @ClientID nvarchar(50)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM AppSettings
        WHERE SettingID=@SettingID and ClientID=@ClientID
    )
    BEGIN
        UPDATE AppSettings	SET Val=@Val WHERE SettingID=@SettingID and ClientID=@ClientID
    END
ELSE
    BEGIN
        INSERT into AppSettings (SettingID,Val,ClientID) Values (@SettingID,@Val,@ClientID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
    @VendorID nvarchar(30),
    @VendorDetails nvarchar(max),
		@RegistrationNumber nvarchar(30),
		@OrderNbr nvarchar(15),
    @InventoryID nvarchar(30),
		@VendorClass nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingLine	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, RegistrationNumber=@RegistrationNumber, OrderNbr=@OrderNbr, InventoryID=@InventoryID, VendorClass=@VendorClass, Status=@Status, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into BuyingLine (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,RegistrationNumber,OrderNbr,InventoryID,VendorClass,Status,AcumaticaRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@RegistrationNumber,@OrderNbr,@InventoryID,@VendorClass,@Status,@AcumaticaRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLine_v2]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
    @VendorID nvarchar(30),
    @VendorDetails nvarchar(max),
		@RegistrationNumber nvarchar(30),
		@OrderNbr nvarchar(15),
    @InventoryID nvarchar(30),
		@VendorClass nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM BuyingLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
					    UPDATE BuyingLine	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, RegistrationNumber=@RegistrationNumber, OrderNbr=@OrderNbr, InventoryID=@InventoryID, VendorClass=@VendorClass, Status=@Status, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
							WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into BuyingLine (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,RegistrationNumber,OrderNbr,InventoryID,VendorClass,Status,AcumaticaRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@RegistrationNumber,@OrderNbr,@InventoryID,@VendorClass,@Status,@AcumaticaRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@CostGross DECIMAL(25,2),
		@NTRM SMALLINT,
		@CostNTRM DECIMAL(25,2),
		@CostNett DECIMAL(25,2),
		@MC SMALLINT,
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@SyncDetail SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@BuyerName nvarchar(100),
		@GradeDraft nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, StalkPosition=@StalkPosition,WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett,MC=@MC, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak,BuyerName=@BuyerName, GradeDraft=@GradeDraft
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into BuyingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,MC,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,BuyerName,GradeDraft)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@StalkPOsition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@MC,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@BuyerName,@GradeDraft)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetail_v2]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLineDetail_v2]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@CostGross DECIMAL(25,2),
		@NTRM SMALLINT,
		@CostNTRM DECIMAL(25,2),
		@CostNett DECIMAL(25,2),
		@MC SMALLINT,
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@SyncDetail SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@BuyerName nvarchar(100),
		@GradeDraft nvarchar(30),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM BuyingLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
					    UPDATE BuyingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, StalkPosition=@StalkPosition,WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett,MC=@MC, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak,BuyerName=@BuyerName, GradeDraft=@GradeDraft
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into BuyingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,MC,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,BuyerName,GradeDraft)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@StalkPOsition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@MC,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@BuyerName,@GradeDraft)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetailQC]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLineDetailQC]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@CostGross DECIMAL(25,2),
		@NTRM SMALLINT,
		@CostNTRM DECIMAL(25,2),
		@CostNett DECIMAL(25,2),
		@MC SMALLINT,
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@SyncDetail SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@BuyerName nvarchar(100),
		@GradeDraft nvarchar(30),
		@QCLock SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, StalkPosition=@StalkPosition,WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett,MC=@MC, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak,BuyerName=@BuyerName, GradeDraft=@GradeDraft, QCLock=@QCLock
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into BuyingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,MC,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,BuyerName,GradeDraft,QCLock)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@StalkPOsition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@MC,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@BuyerName,@GradeDraft,@QCLock)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetailQC_v2]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingLineDetailQC_v2]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@CostGross DECIMAL(25,2),
		@NTRM SMALLINT,
		@CostNTRM DECIMAL(25,2),
		@CostNett DECIMAL(25,2),
		@MC SMALLINT,
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@SyncDetail SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@BuyerName nvarchar(100),
		@GradeDraft nvarchar(30),
		@QCLock SMALLINT,
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM BuyingLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
					    UPDATE BuyingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, StalkPosition=@StalkPosition,WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett,MC=@MC, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak,BuyerName=@BuyerName, GradeDraft=@GradeDraft, QCLock=@QCLock
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into BuyingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,MC,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,BuyerName,GradeDraft,QCLock)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@StalkPOsition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@MC,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@BuyerName,@GradeDraft,@QCLock)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingQC]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingQC]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
    @VendorID nvarchar(30),
    @VendorDetails nvarchar(max),
		@RegistrationNumber nvarchar(30),
		@OrderNbr nvarchar(15),
    @InventoryID nvarchar(30),
		@VendorClass nvarchar(30),
		@Status nvarchar(30),
		@TotalLot INT,
		@CreatorID nvarchar(50),
		@SamplingRange INT
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingQC
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingQC	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, RegistrationNumber=@RegistrationNumber, OrderNbr=@OrderNbr, InventoryID=@InventoryID, VendorClass=@VendorClass, Status=@Status, TotalLot=@TotalLot, CreatorID=@CreatorID,SamplingRange=@SamplingRange
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into BuyingQC (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,RegistrationNumber,OrderNbr,InventoryID,VendorClass,Status,TotalLot,CreatorID,SamplingRange)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@RegistrationNumber,@OrderNbr,@InventoryID,@VendorClass,@Status,@TotalLot,@CreatorID,@SamplingRange)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingQCDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingQCDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@LotNbr nvarchar(40),
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@LotNbrSample nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingQCDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingQCDetail	SET InventoryID=@InventoryID, Remark=@Remark, StatusReject=@StatusReject, OrderNbr=@OrderNbr,NoKontrak=@NoKontrak,LotNbrSample=@LotNbrSample
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into BuyingQCDetail (DocumentID,InventoryID,LotNbr,Remark,StatusReject,OrderNbr,NoKontrak,LotNbrSample)
				Values (@DocumentID,@InventoryID,@LotNbr,@Remark,@StatusReject,@OrderNbr,@NoKontrak,@LotNbrSample)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingRegistration]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingRegistration]
(
    @RegistrationNumber nvarchar(30),
    @VendorID nvarchar(30),
    @OrderNbr nvarchar(15),
    @InventoryID nvarchar(30),
    @RegistrationDate date,
    @WarehouseID nvarchar(30),
    @OrderType nvarchar(30),
		@NoKontrak nvarchar(255),
		@EstWeight decimal(19,6),
		@EstLot INT,
		@CreatorID nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingRegistration
        WHERE RegistrationDate=@RegistrationDate AND RegistrationNumber=@RegistrationNumber
    )
    BEGIN
        UPDATE BuyingRegistration	SET VendorID=@VendorID, OrderNbr=@OrderNbr, InventoryID=@InventoryID, WarehouseID=@WarehouseID, OrderType=@OrderType, NoKontrak=@NoKontrak, EstWeight=@EstWeight, EstLot=@EstLot, CreatorID=@CreatorID
				WHERE RegistrationDate=@RegistrationDate AND RegistrationNumber=@RegistrationNumber
    END
ELSE
    BEGIN
        INSERT into BuyingRegistration (RegistrationNumber,VendorID,OrderNbr,InventoryID,RegistrationDate,WarehouseID,OrderType,NoKontrak,EstWeight,EstLot,CreatorID)
				Values (@RegistrationNumber,@VendorID,@OrderNbr,@InventoryID,@RegistrationDate,@WarehouseID,@OrderType,@NoKontrak,@EstWeight,@EstLot,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectPackingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectPackingLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectPackingLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectPackingLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into DirectPackingLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectPackingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectPackingLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@OldNetto nvarchar(30),
		@BuyerName nvarchar(100),
		@OldSubitem nvarchar(30)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectPackingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectPackingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldNetto=@OldNetto,BuyerName=@BuyerName,OldSubitem=@OldSubitem
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into DirectPackingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldNetto,BuyerName,OldSubitem)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldNetto,@BuyerName,@OldSubitem)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectTempPackingLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectTempPackingLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectTempPackingLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectTempPackingLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into DirectTempPackingLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectTempPackingLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectTempPackingLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@OldNetto nvarchar(30),
		@BuyerName nvarchar(100),
		@OldSubitem nvarchar(30)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectTempPackingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectTempPackingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldNetto=@OldNetto,BuyerName=@BuyerName,OldSubitem=@OldSubitem
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into DirectTempPackingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldNetto,BuyerName,OldSubitem)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldNetto,@BuyerName,@OldSubitem)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseIDFrom nvarchar(30),
    @WarehouseIDTo nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
		@TotalWeight decimal(19,2),
    @AcumaticaRefNbr nvarchar(255),
    @Note nvarchar(255),
    @DispatchOUTNbr nvarchar(30),
		@CreatorID nvarchar(50),
		@LogisticService nvarchar(150),
		@LisencePlate nvarchar(30)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchINLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchINLine	SET WarehouseIDFrom=@WarehouseIDFrom , WarehouseIDTo=@WarehouseIDTo ,Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight,  AcumaticaRefNbr=@AcumaticaRefNbr, Note=@Note, DispatchOUTNbr=@DispatchOUTNbr, CreatorID=@CreatorID, LogisticService=@LogisticService, LisencePlate=@LisencePlate
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into DispatchINLine (DocumentID,DocumentDate,WarehouseIDFrom,WarehouseIDTo,Status,TotalCost,TotalWeight,AcumaticaRefNbr,Note,DispatchOUTNbr,CreatorID, LogisticService, LisencePlate)
				Values (@DocumentID,@DocumentDate,@WarehouseIDFrom,@WarehouseIDTo,@Status,@TotalCost,@TotalWeight,@AcumaticaRefNbr,@Note,@DispatchOUTNbr,@CreatorID, @LogisticService, @LisencePlate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLineData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLineData]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@SyncDetail smallint,
		@UnitCost Decimal(19,2),
		@ExtCost Decimal(19,2),
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchINLineData
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchINLineData	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				SyncDetail=@SyncDetail,
				UnitCost=@UnitCost,
				ExtCost=@ExtCost,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into DispatchINLineData (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@UnitCost Decimal(19,2),
		@ExtCost Decimal(19,2),
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchINLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchINLineDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail,
				UnitCost=@UnitCost,
				ExtCost=@ExtCost,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into DispatchINLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchOUTLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchOUTLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseIDFrom nvarchar(30),
    @WarehouseIDTo nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
		@TotalWeight decimal(19,2),
    @AcumaticaRefNbr nvarchar(255),
    @Note nvarchar(255),
		@CreatorID nvarchar(50),
		@LogisticService nvarchar(150),
		@LisencePlate nvarchar(30)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchOUTLine	SET WarehouseIDFrom=@WarehouseIDFrom , WarehouseIDTo=@WarehouseIDTo ,Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight,  AcumaticaRefNbr=@AcumaticaRefNbr, Note=@Note, CreatorID=@CreatorID, LogisticService=@LogisticService, LisencePlate=@LisencePlate
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into DispatchOUTLine (DocumentID,DocumentDate,WarehouseIDFrom,WarehouseIDTo,Status,TotalCost,TotalWeight,AcumaticaRefNbr,Note,CreatorID, LogisticService, LisencePlate)
				Values (@DocumentID,@DocumentDate,@WarehouseIDFrom,@WarehouseIDTo,@Status,@TotalCost,@TotalWeight,@AcumaticaRefNbr,@Note,@CreatorID, @LogisticService, @LisencePlate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchOUTLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchOUTLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@UnitCost Decimal(19,2),
		@ExtCost Decimal(19,2),
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchOUTLineDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail,
				UnitCost=@UnitCost,
				ExtCost=@ExtCost,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into DispatchOUTLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_FermentDirectLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_FermentDirectLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@FermentType nvarchar(30),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE FermentDirectLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, FermentType=@FermentType, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into FermentDirectLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,FermentType,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@FermentType,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_FermentDirectLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_FermentDirectLineINDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE FermentDirectLineINDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into FermentDirectLineINDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_FermentDirectLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_FermentDirectLineOUTDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE FermentDirectLineOUTDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into FermentDirectLineOUTDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Inventory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Inventory]
(
    @InventoryID nvarchar(30),
    @Descr nvarchar(255),
    @ItemStatus nvarchar(30),
    @LastModifiedDateTime datetime
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM InventoryItem
        WHERE InventoryID=@InventoryID
    )
    BEGIN
        UPDATE InventoryItem set Descr=@Descr, ItemStatus=@ItemStatus, LastModifiedDateTime=@LastModifiedDateTime
        WHERE InventoryID=@InventoryID
    END
ELSE
    BEGIN
        INSERT into InventoryItem (InventoryID, Descr, ItemStatus, LastModifiedDateTime)Values (@InventoryID,@Descr,@ItemStatus,@LastModifiedDateTime)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InventoryImport]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_InventoryImport]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM InventoryImport
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE InventoryImport	SET WarehouseID=@WarehouseID , CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into InventoryImport (DocumentID,DocumentDate,WarehouseID,Status,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,'SYNCED',@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InventoryImportDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_InventoryImportDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(19,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM InventoryImportDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE InventoryImportDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, Process=@Process, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail, BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into InventoryImportDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, Process, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length, @Process, @StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InventoryTransHistory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_InventoryTransHistory]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@NettoIN DECIMAL(19,2),
		@NettoOUT DECIMAL(19,2),
		@Process nvarchar(30),
		@Notes nvarchar(255)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM InventoryTransHistory
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE InventoryTransHistory	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				NettoIN=@NettoIN, 
				NettoOUT=@NettoOUT, 
				Process=@Process, 
				Notes=@Notes,
				TransactionDate=CURRENT_TIMESTAMP
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into InventoryTransHistory (DocumentID,InventoryID,SubItem,LotNbr,NettoIN,NettoOUT,Process,TransactionDate,Notes)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@NettoIN,@NettoOUT,@Process,CURRENT_TIMESTAMP,@Notes)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ItemAttribute]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ItemAttribute]
(
    @CodeID nvarchar(5),
    @CodeType nvarchar(20),
    @CodeDescription nvarchar(255),
    @Active bit,
		@CreatedDateTime datetime2,
		@LastModifiedDateTime datetime2
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ItemAttribute
        WHERE CodeID=@CodeID AND CodeType=@CodeType
    )
    BEGIN
        UPDATE ItemAttribute 
					set CodeDescription=@CodeDescription,
							Active=@Active,
							CreatedDateTime=@CreatedDateTime,
							LastModifiedDateTime=@LastModifiedDateTime
        WHERE CodeID=@CodeID AND CodeType=@CodeType
    END
ELSE
    BEGIN
        INSERT into ItemAttribute (CodeID,CodeType,CodeDescription,Active,CreatedDateTime,LastModifiedDateTime ) 
					Values (@CodeID,@CodeType,@CodeDescription,@Active,@CreatedDateTime,@LastModifiedDateTime )
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_NumberingSetting]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_NumberingSetting]
(
    @NumberingID nvarchar(50),
    @LastIncrementValue INT,
    @NumberingDate DATE
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM NumberingSetting
        WHERE NumberingID=@NumberingID
    )
    BEGIN
        UPDATE NumberingSetting 
					set LastIncrementValue=@LastIncrementValue,
							NumberingDate=@NumberingDate
        WHERE NumberingID=@NumberingID
    END
ELSE
    BEGIN
        INSERT into NumberingSetting (NumberingID,LastIncrementValue,NumberingDate)
					Values (@NumberingID,@LastIncrementValue,@NumberingDate)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineIN]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineIN]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
		@TotalWeight decimal(19,2),
    @ProcessType nvarchar(30),
    @AcumaticaRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@Notes nvarchar(255)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineIN
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineIN	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight, ProcessType=@ProcessType, UnappliedBalance=@TotalWeight, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID, Notes=@Notes
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ProcessingLineIN (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,TotalWeight,ProcessType,UnappliedBalance,AcumaticaRefNbr,BuyerName,CreatorID,Notes)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@TotalWeight,@ProcessType,@TotalWeight,@AcumaticaRefNbr,@BuyerName,@CreatorID,@Notes)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineINDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineINDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@BuyerName nvarchar(100),
		@LotGroup nvarchar(20)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineINDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail,
				BuyerName=@BuyerName,
				LotGroup=@LotGroup
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ProcessingLineINDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,BuyerName,LotGroup)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@BuyerName,@LotGroup)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineOUT]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineOUT]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@RefINNbr nvarchar(255),
		@TotalCost decimal(25,2),
		@TotalWeight decimal(19,2),
    @ProcessType nvarchar(30),
    @AcumaticaRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@Notes nvarchar(255)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineOUT
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineOUT	SET WarehouseID=@WarehouseID , Status=@Status, RefINNbr=@RefINNbr,TotalCost=@TotalCost, TotalWeight=@TotalWeight, ProcessType=@ProcessType, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID, Notes=@Notes
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ProcessingLineOUT (DocumentID,DocumentDate,WarehouseID,Status,RefINNbr,TotalCost,TotalWeight,ProcessType,AcumaticaRefNbr,BuyerName,CreatorID, Notes)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@RefINNbr,@TotalCost,@TotalWeight,@ProcessType,@AcumaticaRefNbr,@BuyerName,@CreatorID, @Notes)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineOUTDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineOUTDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@ZeroCost smallint,
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineOUTDetail	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail, 
				ZeroCost=@ZeroCost,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ProcessingLineOUTDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,ZeroCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@ZeroCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineOUTDonor]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineOUTDonor]
(
    @DocumentID nvarchar(30),
		@RefINNbr nvarchar(255),
		@RefINDonor nvarchar(255),
		@TotalWeight decimal(19,2),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
        INSERT into ProcessingLineOUTDonor (DocumentID,RefINNbr,RefINDonor,TotalWeight,CreatorID)
				Values (@DocumentID,@RefINNbr,@RefINDonor,@TotalWeight,@CreatorID)
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PurchaseInvoice]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_PurchaseInvoice]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
    @VendorID nvarchar(30),
    @VendorDetails nvarchar(max),
		@TotalCashAdvance decimal(25,2),
		@TotaxTaxDeduct decimal(25,2),
		@TotalPaymentDeduct decimal(25,2),
		@TotalPayment decimal(25,2),
		@Status nvarchar(30),
    @AcumaticaRefNbr nvarchar(255),
    @NPWP nvarchar(255),
		@BuyerName nvarchar(100),
		@AdminName nvarchar(100),
		@CreatorID nvarchar(50)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM PurchaseInvoice
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE PurchaseInvoice	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, TotalCashAdvance=@TotalCashAdvance, TotaxTaxDeduct=@TotaxTaxDeduct, TotalPaymentDeduct=@TotalPaymentDeduct, TotalPayment=@TotalPayment, Status=@Status, AcumaticaRefNbr=@AcumaticaRefNbr, NPWP=@NPWP, BuyerName=@BuyerName, AdminName=@AdminName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into PurchaseInvoice (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,TotalCashAdvance,TotaxTaxDeduct,TotalPaymentDeduct,TotalPayment,Status,AcumaticaRefNbr,NPWP,BuyerName,AdminName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@TotalCashAdvance,@TotaxTaxDeduct,@TotalPaymentDeduct,@TotalPayment,@Status,@AcumaticaRefNbr,@NPWP,@BuyerName,@AdminName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PurchaseInvoiceDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_PurchaseInvoiceDetail]
(
    @DocumentID nvarchar(30),
    @ReceiptID nvarchar(30),
		@ReceiptAmount decimal(25,2),
		@TaxPercentage decimal(19,6),
		@TaxAmount decimal(25,2),
		@DeductPercentage decimal(19,6),
		@DeductAmount decimal(25,2),
		@PaymentAmount decimal(25,2),
		@SyncDetail SMALLINT,
		@VolumeVariable decimal(19,2),
		@VolumeCurrent decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM PurchaseInvoiceDetail
        WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE PurchaseInvoiceDetail	SET ReceiptAmount=@ReceiptAmount , TaxPercentage=@TaxPercentage, TaxAmount=@TaxAmount, DeductPercentage=@DeductPercentage, DeductAmount=@DeductAmount, PaymentAmount=@PaymentAmount, SyncDetail=@SyncDetail, VolumeVariable=@VolumeVariable, VolumeCurrent=@VolumeCurrent
				WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into PurchaseInvoiceDetail (DocumentID,ReceiptID,ReceiptAmount,TaxPercentage,TaxAmount,DeductPercentage,DeductAmount,PaymentAmount,SyncDetail,VolumeVariable,VolumeCurrent)
				Values (@DocumentID,@ReceiptID,@ReceiptAmount,@TaxPercentage,@TaxAmount,@DeductPercentage,@DeductAmount,@PaymentAmount,@SyncDetail,@VolumeVariable,@VolumeCurrent)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReceiptDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReceiptDetail]
(
		@ReceiptID nvarchar(30),
		@ReceiptDate datetime,
		@WarehouseID nvarchar(30),
		@VendorID nvarchar(30),
		
    @InventoryID nvarchar(30),
		@SubItem nvarchar(50),
		@LotNbr nvarchar(40),
		@ReceiptQty decimal(19,6),
		@UoM nvarchar(6),
		@UnitCost int,
		@Remark nvarchar(255)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ReceiptLine
        WHERE ReceiptID=@ReceiptID
    )
    BEGIN
        INSERT into ReceiptLineDetail Values (@ReceiptID,@InventoryID,@SubItem,@LotNbr,@ReceiptQty,@UoM,@UnitCost,@Remark,'0');
    END
ELSE
    BEGIN
        INSERT into ReceiptLine Values (@ReceiptID,@ReceiptDate,@WarehouseID,@VendorID,'0','0');
        INSERT into ReceiptLineDetail Values (@ReceiptID,@InventoryID,@SubItem,@LotNbr,@ReceiptQty,@UoM,@UnitCost,@Remark,'0');
				
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReceiptSubItem]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReceiptSubItem]
(
		@ReceiptID nvarchar(30),
		@LotNbr nvarchar(40),
		@SegmentID smallint,
		@SegmentValue nvarchar(30)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM ReceiptLineSubItem
        WHERE ReceiptID=@ReceiptID
					and LotNbr=@LotNbr
					and SegmentID=@SegmentID
					
    )
    BEGIN
        UPDATE ReceiptLineSubItem SET SegmentValue=@SegmentValue 
				WHERE ReceiptID=@ReceiptID
					and LotNbr=@LotNbr
					and SegmentID=@SegmentID
    END
ELSE
    BEGIN
        INSERT into ReceiptLineSubItem Values (@ReceiptID,@LotNbr,@SegmentID,@SegmentValue);
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ReclassLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@CostGross DECIMAL(25,2),
		@NTRM SMALLINT,
		@CostNTRM DECIMAL(25,2),
		@CostNett DECIMAL(25,2),
		@Remark nvarchar(255),
		@StatusReject SMALLINT,
		@SyncDetail SMALLINT,
		@OrderNbr nvarchar(15),
		@NoKontrak nvarchar(15),
		@OldDocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@OldGrade nvarchar(30),
		@MC SMALLINT,
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak, OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldGrade=@OldGrade, MC=@MC,BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ReclassLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,OldDocumentID,OldLotNbr,OldGrade,MC,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@OldDocumentID,@OldLotNbr,@OldGrade,@MC,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassProcessLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassProcessLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassProcessLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassProcessLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ReclassProcessLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassProcessLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassProcessLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@OldGrade nvarchar(30),
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassProcessLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassProcessLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldGrade=@OldGrade,BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ReclassProcessLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldGrade,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldGrade,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReworkLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReworkLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@CreatorID nvarchar(50),
		@TotalCost decimal(25,2)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReworkLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReworkLine	SET WarehouseID=@WarehouseID , Status=@Status, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, CreatorID=@CreatorID, TotalCost = @TotalCost
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ReworkLine (DocumentID,DocumentDate,WarehouseID,Status,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,CreatorID, TotalCost)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@CreatorID, @TotalCost)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReworkLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReworkLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldWeightReceive DECIMAL(19,2),
		@OldWeightTare DECIMAL(19,2),
		@OldWeightNetto DECIMAL(19,2),
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReworkLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReworkLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, Process=@Process,StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldWeightReceive=@OldWeightReceive, OldWeightTare=@OldWeightTare, OldWeightNetto=@OldWeightNetto,BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ReworkLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, Process, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldWeightReceive,OldWeightTare,OldWeightNetto,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldWeightReceive,@OldWeightTare,@OldWeightNetto,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ScaleCalibration]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ScaleCalibration]
(
    @DocumentID nvarchar(30),
    @DocumentDate Datetime,
    @WarehouseID nvarchar(30),
    @ClientID nvarchar(30),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ScaleCalibration
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID AND WarehouseID=@WarehouseID AND ClientID=@ClientID
    )
    BEGIN
        UPDATE ScaleCalibration	SET CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID AND WarehouseID=@WarehouseID AND ClientID=@ClientID
    END
ELSE
    BEGIN
        INSERT into ScaleCalibration (DocumentID,DocumentDate,WarehouseID,ClientID,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@ClientID,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_SegmentValue]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_SegmentValue]
(
		@SegmentKeyID nvarchar(30),
		@SegmentID smallint,
		@SegmentDescr nvarchar(30),
    @SegmentValue nvarchar(30),
    @Descr nvarchar(255),
    @Active nvarchar(30)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM SegmentValue
        WHERE SegmentID=@SegmentID
					and SegmentValue=@SegmentValue
					and SegmentKeyID=@SegmentKeyID
					
    )
    BEGIN
        UPDATE SegmentValue set Descr=@Descr, Active=@Active, SegmentDescr=@SegmentDescr
        WHERE SegmentID=@SegmentID
					and SegmentValue=@SegmentValue
					and SegmentKeyID=@SegmentKeyID
    END
ELSE
    BEGIN
        INSERT into SegmentValue (SegmentKeyID,SegmentID,SegmentDescr,SegmentValue,Descr,Active)  Values (@SegmentKeyID,@SegmentID,@SegmentDescr,@SegmentValue,@Descr,@Active)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfo]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfo]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalQty decimal(25,2),
		@TotalAllocation decimal(19,2),
    @AcumaticaRefNbr nvarchar(255),
    @CustomerName nvarchar(255),
    @CustomerLocation nvarchar(255),
		@CreatorID nvarchar(50),
    @AcumaticaShipmentNbr nvarchar(255),
    @SODescription nvarchar(255),
    @LogisticService nvarchar(150),
    @LisencePlate nvarchar(30),
    @ShippingDate date
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfo
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ShipmentInfo	SET WarehouseID=@WarehouseID , Status=@Status, TotalQty=@TotalQty, TotalAllocation=@TotalAllocation,AcumaticaRefNbr=@AcumaticaRefNbr,CustomerName=@CustomerName,CustomerLocation=@CustomerLocation, CreatorID=@CreatorID,AcumaticaShipmentNbr=@AcumaticaShipmentNbr,SODescription=@SODescription,LogisticService=@LogisticService,LisencePlate=@LisencePlate,ShippingDate=@ShippingDate
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into ShipmentInfo (DocumentID,DocumentDate,WarehouseID,Status,TotalQty,TotalAllocation,AcumaticaRefNbr,CustomerName,CustomerLocation,CreatorID,AcumaticaShipmentNbr,SODescription,LogisticService,LisencePlate,ShippingDate)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalQty,@TotalAllocation,@AcumaticaRefNbr,@CustomerName,@CustomerLocation,@CreatorID,@AcumaticaShipmentNbr,@SODescription,@LogisticService,@LisencePlate,@ShippingDate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfoAllocation]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfoAllocation]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@OldDocumentID nvarchar (30),
		@SyncDetail smallint,
		@SOLine INT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfoAllocation
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ShipmentInfoAllocation	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				OldDocumentID=@OldDocumentID, 
				SyncDetail=@SyncDetail, 
				SOLine=@SOLine
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ShipmentInfoAllocation (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,SOLine)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@SOLine)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfoDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfoDetail]
(
		@DocumentID nvarchar(30),
		@WarehouseID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@Weight DECIMAL(19,2),
		@UoM nvarchar(6),
		@SOLine INT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfoDetail
        WHERE SubItem=@SubItem AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ShipmentInfoDetail	
				SET WarehouseID=@WarehouseID, 
				InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Weight=@Weight, 
				UoM=@UoM, 
				SOLine=@SOLine
				WHERE SubItem=@SubItem AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into ShipmentInfoDetail (DocumentID,WarehouseID,InventoryID,SubItem,Weight,UoM,SOLine)
				Values (@DocumentID,@WarehouseID,@InventoryID,@SubItem,@Weight,@UoM,@SOLine)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_StockItem]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_StockItem]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@Remark nvarchar(255),
		@StatusStock SMALLINT,
		@BuyerName nvarchar(100)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM StockItem
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE StockItem	
				SET InventoryID=@InventoryID, 
				SubItem=@SubItem, 
				Source=@Source, 
				Stage=@Stage, 
				Form=@tForm, 
				CropYear=@CropYear,
				Grade=@Grade, 
				Area=@Area, 
				Color=@Color, 
				Fermentation=@Fermentation, 
				Length=@Length, 
				Process=@Process, 
				StalkPosition=@StalkPosition, 
				WeightRope=@WeightRope,
				WeightShipping=@WeightShipping, 
				WeightReceive=@WeightReceive, 
				WeightTare=@WeightTare, 
				WeightNetto=@WeightNetto, 
				UoM=@UoM, 
				Remark=@Remark, 
				StatusStock=@StatusStock,
				LastModified=CURRENT_TIMESTAMP,
				BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into StockItem (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,StatusStock,LastModified,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,CURRENT_TIMESTAMP,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TobaccoGrade]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_TobaccoGrade]
(
    @InventoryID nvarchar(5),
    @WarehouseID nvarchar(30),
    @ProcessID nvarchar(2),
    @Grade nvarchar(25),
    @ReclassGrade nvarchar(25)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TobaccoGrade
        WHERE InventoryID=@InventoryID AND WarehouseID=@WarehouseID AND ProcessID=@ProcessID AND Grade=@Grade
    )
    BEGIN
        UPDATE TobaccoGrade 
					set ReclassGrade=@ReclassGrade
        WHERE InventoryID=@InventoryID AND WarehouseID=@WarehouseID AND ProcessID=@ProcessID  AND Grade=@Grade
    END
ELSE
    BEGIN
        INSERT into TobaccoGrade (InventoryID,WarehouseID,ProcessID,Grade,ReclassGrade)
					Values (@InventoryID,@WarehouseID,@ProcessID,@Grade,@ReclassGrade)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TobaccoPrice]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_TobaccoPrice]
(
    @InventoryID nvarchar(5),
    @Source nvarchar(30),
    @Area nvarchar(5),
    @Grade nvarchar(25),
    @Form nvarchar(5),
    @CropYear nvarchar(5),
    @Price DECIMAL(25,2),
    @EffectiveDate datetime
)		
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TobaccoPrice
        WHERE InventoryID=@InventoryID AND Source=@Source AND Area=@Area 
							AND Grade=@Grade AND Form=@Form AND CropYear=@CropYear AND EffectiveDate=@EffectiveDate
    )
    BEGIN
        UPDATE TobaccoPrice 
					set Price=@Price
        WHERE InventoryID=@InventoryID AND Source=@Source AND Area=@Area 
							AND Grade=@Grade AND Form=@Form AND CropYear=CropYear AND EffectiveDate=@EffectiveDate
    END
ELSE
    BEGIN
        INSERT into TobaccoPrice (InventoryID,Source,Area,Grade,Form,CropYear,Price,EffectiveDate)
					Values (@InventoryID,@Source,@Area,@Grade,@Form,@CropYear,@Price,@EffectiveDate)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TobaccoProcess]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_TobaccoProcess]
(
    @ProcessCode nvarchar(2),
		@ProcessName nvarchar(50)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TobaccoProcess
        WHERE ProcessCode=@ProcessCode
					
    )
    BEGIN
        UPDATE TobaccoProcess set ProcessName=@ProcessName
        WHERE ProcessCode=@ProcessCode
    END
ELSE
    BEGIN
        INSERT into TobaccoProcess (ProcessCode, ProcessName) Values (@ProcessCode,@ProcessName)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UnpackLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_UnpackLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM UnpackLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE UnpackLine	SET WarehouseID=@WarehouseID , Status=@Status, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into UnpackLine (DocumentID,DocumentDate,WarehouseID,Status,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UnpackLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_UnpackLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldSubItem nvarchar(30),
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM UnpackLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE UnpackLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID,OldSubItem=@OldSubItem,BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into UnpackLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldSubItem,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldSubItem,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_UserData]
(
    @UserName nvarchar(50),
    @FullName nvarchar(150),
		@Password nvarchar(255)
)
AS
BEGIN
    INSERT into UserData (UserName,FullName,Password,Status) Values (@UserName,@FullName,@Password,'Active')
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserRole]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_UserRole]
(
    @UserID int,
    @RoleID nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM UserRole
        WHERE UserID=@UserID and  RoleID=@RoleID
    )
    BEGIN
        DELETE from UserRole WHERE UserID=@UserID and  RoleID=@RoleID
    END
ELSE
    BEGIN
        INSERT into UserRole (UserID,RoleID) Values (@UserID,@RoleID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_VendorContract]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_VendorContract]
(
    @VendorID nvarchar(30),
    @NoKontrak nvarchar(255),
    @Area nvarchar(20),
    @SubArea nvarchar(20),
    @Seri nvarchar(20),
    @InventoryID nvarchar(30),
    @NoKTP nvarchar(16),
    @Active bit,
		@FarmerID nvarchar(50),
		@VolumeTotal decimal(19,2),
		@VolumePercentage decimal(19,2),
		@VolumeVariable decimal(19,2)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VendorContract
        WHERE VendorID=@VendorID And NoKontrak=@NoKontrak
    )
    BEGIN
        UPDATE VendorContract
					set NoKontrak=@NoKontrak, 
							Area=@Area, 
							SubArea=@SubArea,
							Seri=@Seri,
							InventoryID=@InventoryID,
							NoKTP=@NoKTP,
							Active=@Active,
							FarmerID=@FarmerID,
							VolumeTotal=@VolumeTotal,
							VolumePercentage=@VolumePercentage,
							VolumeVariable=@VolumeVariable
        WHERE VendorID=@VendorID And NoKontrak=@NoKontrak
    END
ELSE
    BEGIN
        INSERT into VendorContract (VendorID,NoKontrak,Area,SubArea,Seri,InventoryID,NoKTP,Active,FarmerID,VolumeTotal,VolumePercentage,VolumeVariable) 
				Values (@VendorID,@NoKontrak,@Area,@SubArea,@Seri,@InventoryID,@NoKTP,@Active,@FarmerID,@VolumeTotal,@VolumePercentage,@VolumeVariable)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_VendorData]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_VendorData]
(
    @VendorID nvarchar(30),
    @VendorName nvarchar(255),
    @Status nvarchar(30),
    @DisplayName nvarchar(255),
    @Phone1 nvarchar(50),
    @Phone2 nvarchar(50),
    @AddressLine1 nvarchar(50),
    @AddressLine2 nvarchar(50),
    @City nvarchar(50),
    @Country nvarchar(50),
    @State nvarchar(50),
    @PostalCode nvarchar(30),
    @VendorClass nvarchar(30),
    @LastModifiedDateTime datetime
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VendorData
        WHERE VendorID=@VendorID
    )
    BEGIN
        UPDATE VendorData 
					set VendorName=@VendorName, 
							Status=@Status, 
							DisplayName=@DisplayName,
							Phone1=@Phone1,
							Phone2=@Phone2,
							AddressLine1=@AddressLine1,
							AddressLine2=@AddressLine2,
							City=@City,
							Country=@Country,
							State=@State,
							PostalCode=@PostalCode,
							VendorClass=@VendorClass,
							LastModifiedDateTime=@LastModifiedDateTime
        WHERE VendorID=@VendorID
    END
ELSE
    BEGIN
        INSERT into VendorData (VendorID,VendorName,Status,DisplayName,Phone1,Phone2,AddressLine1,AddressLine2,City,Country,State,PostalCode,VendorClass,LastModifiedDateTime)
					Values (@VendorID,@VendorName,@Status,@DisplayName,@Phone1,@Phone2,@AddressLine1,@AddressLine2,@City,@Country,@State,@PostalCode,@VendorClass,@LastModifiedDateTime)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_VendorPO]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_VendorPO]
(
    @VendorID nvarchar(30),
    @OrderNbr nvarchar(15),
    @NoKontrak nvarchar(255),
    @Status nvarchar(30),
    @OrderType nvarchar(30)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VendorPO
        WHERE VendorID=@VendorID And OrderNbr=@OrderNbr
    )
    BEGIN
        UPDATE VendorPO
					set NoKontrak=@NoKontrak, Status=@Status, OrderType=@OrderType
        WHERE VendorID=@VendorID And OrderNbr=@OrderNbr
    END
ELSE
    BEGIN
        INSERT into VendorPO (VendorID,OrderNbr,NoKontrak,Status,OrderType) Values (@VendorID,@OrderNbr,@NoKontrak,@Status,@OrderType)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_VendorPODetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_VendorPODetail]
(
    @OrderNbr nvarchar(15),
    @LineNbr int,
    @InventoryID nvarchar(30),
    @Subitem nvarchar(15),
    @WarehouseID nvarchar(30),
    @OrderQty decimal(19,2),
    @QtyOnReceipts decimal(19,2)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VendorPODetail
        WHERE OrderNbr=@OrderNbr And LineNbr=@LineNbr
    )
    BEGIN
        UPDATE VendorPODetail
					set InventoryID=@InventoryID, Subitem=@Subitem, WarehouseID=@WarehouseID, OrderQty=@OrderQty, QtyOnReceipts=@QtyOnReceipts
        WHERE OrderNbr=@OrderNbr And LineNbr=@LineNbr
    END
ELSE
    BEGIN
        INSERT into VendorPODetail (OrderNbr,LineNbr,InventoryID,Subitem,WarehouseID,OrderQty,QtyOnReceipts) Values (@OrderNbr,@LineNbr,@InventoryID,@Subitem,@WarehouseID,@OrderQty,@QtyOnReceipts)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_VendorPrepayment]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_VendorPrepayment]
(
    @VendorID nvarchar(30),
    @Description nvarchar(255),
    @PaymentAmount DECIMAL(25,2),
    @PaymentRef nvarchar(30),
    @ReferenceNbr nvarchar(30),
    @Status nvarchar(30),
    @Type nvarchar(30),
    @UnappliedBalance DECIMAL(25,2)
		


)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VendorPrepayment
        WHERE VendorID=@VendorID and ReferenceNbr=@ReferenceNbr
    )
    BEGIN
        UPDATE VendorPrepayment 
					set Description=@Description, 
							PaymentAmount=@PaymentAmount, 
							PaymentRef=@PaymentRef,
							ReferenceNbr=@ReferenceNbr,
							Status=@Status,
							Type=@Type,
							UnappliedBalance=@UnappliedBalance
        WHERE VendorID=@VendorID and ReferenceNbr=@ReferenceNbr
    END
ELSE
    BEGIN
        INSERT into VendorPrepayment (VendorID,Description,PaymentAmount,PaymentRef,ReferenceNbr,Status,Type,UnappliedBalance)
					Values (@VendorID,@Description,@PaymentAmount,@PaymentRef,@ReferenceNbr,@Status,@Type,@UnappliedBalance)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Warehouse]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Warehouse]
(
    @WarehouseID nvarchar(30),
    @Descr nvarchar(30),
		@SyncDate datetime2,
    @Company nvarchar(255),
    @AddressLine1 nvarchar(255),
    @AddressLine2 nvarchar(255),
    @Phone1 nvarchar(30),
    @Phone2 nvarchar(30),
    @Branch nvarchar(30)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM WarehouseSite
        WHERE WarehouseID=@WarehouseID
    )
    BEGIN
        UPDATE WarehouseSite 
					set Descr=@Descr,
							SyncDate=@SyncDate,
							Company=@Company,
							AddressLine1=@AddressLine1,
							AddressLine2=@AddressLine2,
							Phone1=@Phone1,
							Phone2=@Phone2,
							Branch=@Branch
        WHERE WarehouseID=@WarehouseID
    END
ELSE
    BEGIN
        INSERT into WarehouseSite (WarehouseID,Descr,SyncDate,Company, AddressLine1, AddressLine2,Phone1 ,Phone2,Branch ) 
				Values (@WarehouseID,@Descr,@SyncDate,@Company, @AddressLine1, @AddressLine2,@Phone1 ,@Phone2,@Branch  )
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_WarehouseLocation]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_WarehouseLocation]
(
    @WarehouseID nvarchar(30),
		@LocationID nvarchar(30),
    @Descr nvarchar(30)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM WarehouseLocation
        WHERE WarehouseID=@WarehouseID AND LocationID=@LocationID
    )
    BEGIN
        UPDATE WarehouseLocation 
					set Descr=@Descr
        WHERE WarehouseID=@WarehouseID  AND LocationID=@LocationID
    END
ELSE
    BEGIN
        INSERT into WarehouseLocation (WarehouseID,LocationID,Descr) 
				Values (@WarehouseID,@LocationID,@Descr)
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_WeightAdjustLine]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_WeightAdjustLine]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@CreatorID nvarchar(50)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM WeightAdjustLine
        WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE WeightAdjustLine	SET WarehouseID=@WarehouseID , Status=@Status, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, CreatorID=@CreatorID
				WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
    END
ELSE
    BEGIN
        INSERT into WeightAdjustLine (DocumentID,DocumentDate,WarehouseID,Status,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_WeightAdjustLineDetail]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_WeightAdjustLineDetail]
(
		@DocumentID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@LotNbr nvarchar(40),
		@Source nvarchar(30),
		@Stage nvarchar(30),
		@tForm nvarchar(30),
		@CropYear nvarchar(30),
		@Grade nvarchar(30),
		@Area nvarchar(30),
		@Color nvarchar(30),
		@Fermentation nvarchar(30),
		@Length nvarchar(30),
		@Process nvarchar(30),
		@StalkPosition nvarchar(30),
		@WeightRope DECIMAL(19,2),
		@WeightShipping DECIMAL(19,2),
		@WeightReceive DECIMAL(19,2),
		@WeightTare DECIMAL(19,2),
		@WeightNetto DECIMAL(19,2),
		@UoM nvarchar(6),
		@CostUnit DECIMAL(25,2),
		@Remark nvarchar(255),
		@SyncDetail SMALLINT,
		@OldDocumentID nvarchar(30),
		@OldWeightReceive DECIMAL(19,2),
		@OldWeightTare DECIMAL(19,2),
		@OldWeightNetto DECIMAL(19,2),
		@BuyerName nvarchar(100)
		

)
AS
BEGIN
IF EXISTS (SELECT 1 FROM WeightAdjustLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE WeightAdjustLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, Process=@Process,StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldWeightReceive=@OldWeightReceive, OldWeightTare=@OldWeightTare, OldWeightNetto=@OldWeightNetto,BuyerName=@BuyerName
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END
	
ELSE
    BEGIN
        INSERT into WeightAdjustLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, Process, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldWeightReceive,OldWeightTare,OldWeightNetto,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldWeightReceive,@OldWeightTare,@OldWeightNetto,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Select_FermentDirectGroup]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_FermentDirectGroup]
(
	@DocumentID nvarchar(30)
)
AS
BEGIN
	SELECT
		DocumentID,
		InventoryID,
		MAX ( SubItem ) AS SubItem,
		( SELECT '99XXXXXXXXXX-XXXXX9999999' ) AS LotNbr,
		MAX ( Source ) AS Source,
		MAX ( Stage ) AS Stage,
		MAX ( Form ) AS Form,
		MAX ( CropYear ) AS CropYear,
		MAX ( Grade ) AS Grade,
		MAX ( Area ) AS Area,
		MAX ( Color ) AS Color,
		( SELECT '<NEW>' ) AS Fermentation,
		MAX ( Length ) AS Length,
		( SELECT 'FM' ) AS Process,
		MAX ( StalkPosition ) AS StalkPosition,
		SUM ( WeightRope ) AS SumRope,
		SUM ( WeightShipping ) AS SumShipping,
		SUM ( WeightReceive ) AS SumReceive,
		SUM ( WeightTare ) AS SumTare,
		SUM ( WeightNetto ) AS SumNetto,
		MAX ( UoM ) AS UoM,
		MAX ( Remark ) AS Remark,
		MAX ( DocumentID ) AS OldDocumentID,
		( SELECT 0 ) AS SyncDetail 
	FROM
		dbo.FermentDirectLineINDetail 
	WHERE
		DocumentID = @DocumentID
	GROUP BY
		DocumentID,
		InventoryID,
		SubItem
	ORDER BY
		InventoryID ASC,
		SubItem ASC
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Status]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Status]
(
	@DocumentID nvarchar(30)
)
AS
BEGIN
	select 
		Status from BuyingLine where DocumentID = @DocumentID
    union 
			select Status from ReclassLine where DocumentID = @DocumentID
    union 
			select Status from ReclassProcessLine where DocumentID = @DocumentID
    union 
			select Status from DirectPackingLine where DocumentID = @DocumentID
    union 
			select Status from DirectTempPackingLine where DocumentID = @DocumentID
    union 
			select Status from ReclassProcessLine where DocumentID = @DocumentID
    union 
			select Status from FermentDirectLine where DocumentID = @DocumentID
    union 
			select Status from ProcessingLineIN where DocumentID = @DocumentID
    union 
			select Status from ProcessingLineOUT where DocumentID = @DocumentID
    union 
			select Status from WeightAdjustLine where DocumentID = @DocumentID
    union 
			select Status from UnpackLine where DocumentID = @DocumentID
    union 
			select Status from ReworkLine where DocumentID = @DocumentID
    union 
			select Status from InventoryImport where DocumentID = @DocumentID
    union 
			select Status from DispatchINLine where DocumentID = @DocumentID
END
GO
/****** Object:  StoredProcedure [dbo].[Update_BuyingLine_Invoice]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BuyingLine_Invoice]
(
		@DocumentID nvarchar(30),
		@InvoiceID nvarchar(30)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingLine
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingLine	SET InvoiceID=@InvoiceID
				WHERE DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_BuyingLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BuyingLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM BuyingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE BuyingLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_DirectPackingLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DirectPackingLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@CostExt decimal(19,2)
)
AS
BEGIN
	DECLARE
		@NewNetto DECIMAL ( 19, 2 );
	IF
		EXISTS ( SELECT 1 FROM DirectPackingLineDetail WHERE OldLotNbr =@OldLotNbr  AND DocumentID =@DocumentID ) BEGIN
		
		SELECT
			@NewNetto = WeightNetto 
		FROM
			DirectPackingLineDetail 
		WHERE
			OldLotNbr = @OldLotNbr 
			AND DocumentID = @DocumentID;
		UPDATE DirectPackingLineDetail 
		SET CostUnit = (@CostExt/@newnetto)
		WHERE
			OldLotNbr = @OldLotNbr 
			AND DocumentID = @DocumentID;

	END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_DirectPackingLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DirectPackingLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectPackingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectPackingLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_DirectTempPackingLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DirectTempPackingLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@CostExt decimal(19,2)
)
AS
BEGIN
	DECLARE
		@NewNetto DECIMAL ( 19, 2 );
	IF
		EXISTS ( SELECT 1 FROM DirectTempPackingLineDetail WHERE OldLotNbr =@OldLotNbr  AND DocumentID =@DocumentID ) BEGIN
		
		SELECT
			@NewNetto = WeightNetto 
		FROM
			DirectTempPackingLineDetail 
		WHERE
			OldLotNbr = @OldLotNbr 
			AND DocumentID = @DocumentID;
		UPDATE DirectTempPackingLineDetail 
		SET CostUnit = (@CostExt/@newnetto)
		WHERE
			OldLotNbr = @OldLotNbr 
			AND DocumentID = @DocumentID;

	END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_DirectTempPackingLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DirectTempPackingLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DirectTempPackingLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DirectTempPackingLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_DispatchINLineData_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DispatchINLineData_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchINLineData
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchINLineData	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_DispatchOUTLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DispatchOUTLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@UnitCost decimal(19,2),
		@ExtCost decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchOUTLineDetail	SET UnitCost=@UnitCost,ExtCost=@ExtCost
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_DispatchOUTLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_DispatchOUTLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE DispatchOUTLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_FermentDirectLineINDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_FermentDirectLineINDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE FermentDirectLineINDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_FermentDirectLineOUTDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_FermentDirectLineOUTDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM FermentDirectLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE FermentDirectLineOUTDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_InventoryImportDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_InventoryImportDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM InventoryImportDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE InventoryImportDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Issue_Balance]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Issue_Balance]
(
	@DocumentID nvarchar(30),
	@UnappliedBalance decimal(19,2)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM ProcessingLineIN
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineIN SET UnappliedBalance = @UnappliedBalance WHERE DocumentID=@DocumentID
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_ProcessingLineIN_Balance]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ProcessingLineIN_Balance]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@UnappliedBalance decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineIN
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineIN	SET UnappliedBalance=@UnappliedBalance
				WHERE DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ProcessingLineIN_ShrinkBalance]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ProcessingLineIN_ShrinkBalance]
(
		@DocumentID nvarchar(30),
		@Process nvarchar(30),
		@UnappliedBalance decimal(19,2)
		
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineIN
        WHERE DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineIN	SET ShrinkBalance=@UnappliedBalance, UnappliedBalance = 0
				WHERE DocumentID=@DocumentID;
				EXEC Insert_InventoryTransHistory @DocumentID,"-","ADJUSTMENT","-",0,@UnappliedBalance,@Process,"Shrink Balance Adjustment";
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ProcessingLineINDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ProcessingLineINDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineINDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineINDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ProcessingLineOUTDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ProcessingLineOUTDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ProcessingLineOUTDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ProcessingLineOUTDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_PurchaseInvoiceDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_PurchaseInvoiceDetail_Sync]
(
		@DocumentID nvarchar(30),
		@ReceiptID nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM PurchaseInvoiceDetail
        WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE PurchaseInvoiceDetail	SET SyncDetail=@SyncDetail
				WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReceiptFinal]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReceiptFinal]
(
	@ReceiptID nvarchar(30),
	@ReceiptFinal smallint
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM ReceiptLine
        WHERE ReceiptID=@ReceiptID
    )
    BEGIN
        UPDATE ReceiptLine SET ReceiptFinal = @ReceiptFinal WHERE ReceiptID=@ReceiptID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReclassLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReclassLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReclassProcessLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReclassProcessLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@OldLotNbr nvarchar(40),
		@CostUnit decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassProcessLineDetail
        WHERE OldLotNbr=@OldLotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassProcessLineDetail	SET CostUnit=@CostUnit
				WHERE OldLotNbr=@OldLotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReclassProcessLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReclassProcessLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReclassProcessLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReclassProcessLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReworkLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReworkLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@CostUnit decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReworkLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReworkLineDetail	SET CostUnit=@CostUnit
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ReworkLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ReworkLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ReworkLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ReworkLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_ShipmentInfoAllocation_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_ShipmentInfoAllocation_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM ShipmentInfoAllocation
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE ShipmentInfoAllocation	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_StockItemLocationInfo]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_StockItemLocationInfo]
(
	@LotNbr nvarchar(30),
	@LocationInfo nvarchar(50)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM StockItem
        WHERE LotNbr=@LotNbr
    )
    BEGIN
        UPDATE StockItem SET LocationInfo = @LocationInfo WHERE LotNbr=@LotNbr
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_StockItemStatus]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_StockItemStatus]
(
	@DocumentID nvarchar(30),
	@LotNbr nvarchar(30),
	@StatusStock smallint
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM StockItem
        WHERE DocumentID=@DocumentID and LotNbr=@LotNbr
    )
    BEGIN
        UPDATE StockItem SET StatusStock = @StatusStock WHERE DocumentID=@DocumentID and LotNbr=@LotNbr
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_UnpackLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_UnpackLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@CostUnit decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM UnpackLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE UnpackLineDetail	SET CostUnit=@CostUnit
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_UnpackLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_UnpackLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM UnpackLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE UnpackLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserData_Password]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_UserData_Password]
(
	@UserID int,
	@Password nvarchar(255)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM UserData
        WHERE UserID=@UserID
    )
    BEGIN
        UPDATE UserData SET Password = @Password WHERE UserID=@UserID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserData_Status]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_UserData_Status]
(
	@UserID int,
	@Status nvarchar(30)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM UserData
        WHERE UserID=@UserID
    )
    BEGIN
        UPDATE UserData SET Status = @Status WHERE UserID=@UserID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Update_WeightAdjustLineDetail_Cost]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_WeightAdjustLineDetail_Cost]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@CostUnit decimal(19,2)
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM WeightAdjustLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE WeightAdjustLineDetail	SET CostUnit=@CostUnit
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_WeightAdjustLineDetail_Sync]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_WeightAdjustLineDetail_Sync]
(
		@DocumentID nvarchar(30),
		@LotNbr nvarchar(40),
		@SyncDetail SMALLINT
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM WeightAdjustLineDetail
        WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    )
    BEGIN
        UPDATE WeightAdjustLineDetail	SET SyncDetail=@SyncDetail
				WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
    END

END
GO
/****** Object:  Trigger [dbo].[BuyingLine_modifiedDate]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BuyingLine_modifiedDate]
ON [dbo].[BuyingLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE BuyingLine 
    SET ModifiedDate = GETDATE()
    FROM BuyingLine
    JOIN inserted ON BuyingLine.DocumentID = inserted.DocumentID AND  BuyingLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[BuyingLine] ENABLE TRIGGER [BuyingLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[by2stock]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[by2stock]
ON [dbo].[BuyingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
		If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
	
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,
						@Grade=Grade,@Area=Area,@StalkPosition=StalkPosition, @WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=ABS(StatusReject - 1),@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,'','','','BY',@StalkPosition,
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
END
GO
ALTER TABLE [dbo].[BuyingLineDetail] ENABLE TRIGGER [by2stock]
GO
/****** Object:  Trigger [dbo].[byHistory]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[byHistory]
ON [dbo].[BuyingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process='BY',@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,@Process,"Buying Process"
END
GO
ALTER TABLE [dbo].[BuyingLineDetail] ENABLE TRIGGER [byHistory]
GO
/****** Object:  Trigger [dbo].[BuyingLine_modifiedDate_copy1]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BuyingLine_modifiedDate_copy1]
ON [dbo].[BuyingQC]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE BuyingLine 
    SET ModifiedDate = GETDATE()
    FROM BuyingLine
    JOIN inserted ON BuyingLine.DocumentID = inserted.DocumentID AND  BuyingLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[BuyingQC] ENABLE TRIGGER [BuyingLine_modifiedDate_copy1]
GO
/****** Object:  Trigger [dbo].[Registration_modifiedDate]    Script Date: 07/09/2021 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Registration_modifiedDate]
ON [dbo].[BuyingRegistration]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE BuyingRegistration 
    SET ModifiedDate = GETDATE()
    FROM BuyingRegistration
    JOIN inserted ON BuyingRegistration.RegistrationNumber = inserted.RegistrationNumber AND  BuyingRegistration.RegistrationDate = inserted.RegistrationDate
END
GO
ALTER TABLE [dbo].[BuyingRegistration] ENABLE TRIGGER [Registration_modifiedDate]
GO
/****** Object:  Trigger [dbo].[DirectPackingLine_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DirectPackingLine_modifiedDate]
ON [dbo].[DirectPackingLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE DirectPackingLine 
    SET ModifiedDate = GETDATE()
    FROM DirectPackingLine
    JOIN inserted ON DirectPackingLine.DocumentID = inserted.DocumentID AND  DirectPackingLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[DirectPackingLine] ENABLE TRIGGER [DirectPackingLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[directpack2stock]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[directpack2stock]
ON [dbo].[DirectPackingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@OldNetto nvarchar(30)
	Declare @BuyerName nvarchar(100)
	Declare	@OldSubItem nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@OldLotNbr=OldLotNbr,@OldNetto=OldNetto,@BuyerName=BuyerName,@OldSubItem=OldSubItem
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,'PC',@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@OldLotNbr,0
END
GO
ALTER TABLE [dbo].[DirectPackingLineDetail] ENABLE TRIGGER [directpack2stock]
GO
/****** Object:  Trigger [dbo].[directpackHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[directpackHistory]
ON [dbo].[DirectPackingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@OldDocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@OldSubItem nvarchar(40)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@OldWeightNetto DECIMAL(19,2)
	Declare	@OldProcess nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@WeightNetto=WeightNetto,@OldSubItem=OldSubitem,@OldLotNbr=OldLotNbr,@OldDocumentID=OldDocumentID,@OldWeightNetto=OldNetto
		From Inserted
		
		select @OldProcess=st.Process  From StockItem st Where st.DocumentID=@OldDocumentID and st.InventoryID=@InventoryID
		
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@OldSubItem,@OldLotNbr,0,@OldWeightNetto,@OldProcess,"Direct Packing"
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,"PC","Direct Packing"

END
GO
ALTER TABLE [dbo].[DirectPackingLineDetail] ENABLE TRIGGER [directpackHistory]
GO
/****** Object:  Trigger [dbo].[DirectTempPackingLine_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DirectTempPackingLine_modifiedDate]
ON [dbo].[DirectTempPackingLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE DirectTempPackingLine 
    SET ModifiedDate = GETDATE()
    FROM DirectTempPackingLine
    JOIN inserted ON DirectTempPackingLine.DocumentID = inserted.DocumentID AND  DirectTempPackingLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[DirectTempPackingLine] ENABLE TRIGGER [DirectTempPackingLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[directtemppack2stock]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[directtemppack2stock]
ON [dbo].[DirectTempPackingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@OldNetto nvarchar(30)
	Declare @BuyerName nvarchar(100)
	Declare	@OldSubItem nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@OldLotNbr=OldLotNbr,@OldNetto=OldNetto,@BuyerName=BuyerName,@OldSubItem=OldSubItem
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,'TP',@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@OldLotNbr,0
END
GO
ALTER TABLE [dbo].[DirectTempPackingLineDetail] ENABLE TRIGGER [directtemppack2stock]
GO
/****** Object:  Trigger [dbo].[directtemppackHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[directtemppackHistory]
ON [dbo].[DirectTempPackingLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@OldDocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@OldSubItem nvarchar(40)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@OldWeightNetto DECIMAL(19,2)
	Declare	@OldProcess nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@WeightNetto=WeightNetto,@OldSubItem=OldSubitem,@OldLotNbr=OldLotNbr,@OldDocumentID=OldDocumentID,@OldWeightNetto=OldNetto
		From Inserted
		
		select @OldProcess=st.Process  From StockItem st Where st.DocumentID=@OldDocumentID and st.InventoryID=@InventoryID
		
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@OldSubItem,@OldLotNbr,0,@OldWeightNetto,@OldProcess,"Direct Temp Packing"
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,"TP","Direct Temp Packing"

END
GO
ALTER TABLE [dbo].[DirectTempPackingLineDetail] ENABLE TRIGGER [directtemppackHistory]
GO
/****** Object:  Trigger [dbo].[DispatchIN_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchIN_modifiedDate]
ON [dbo].[DispatchINLine]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE DispatchINLine 
    SET ModifiedDate = GETDATE()
    FROM DispatchINLine
    JOIN inserted ON DispatchINLine.DocumentID = inserted.DocumentID AND  DispatchINLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[DispatchINLine] ENABLE TRIGGER [DispatchIN_modifiedDate]
GO
/****** Object:  Trigger [dbo].[dispatchINHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[dispatchINHistory]
ON [dbo].[DispatchINLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,@Process,"Dispatch IN"
END
GO
ALTER TABLE [dbo].[DispatchINLineDetail] ENABLE TRIGGER [dispatchINHistory]
GO
/****** Object:  Trigger [dbo].[dispatchINHistoryDel]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[dispatchINHistoryDel]
ON [dbo].[DispatchINLineDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr
		From Deleted
    EXEC Delete_InventoryTransHistory @DocumentID,@LotNbr
END
GO
ALTER TABLE [dbo].[DispatchINLineDetail] ENABLE TRIGGER [dispatchINHistoryDel]
GO
/****** Object:  Trigger [dbo].[dispatchINstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[dispatchINstock01]
ON [dbo].[DispatchINLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare @BuyerName nvarchar (100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@OldDocumentID=OldDocumentID,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
													
		EXEC Update_DispatchINLineData_Sync @OldDocumentID,@LotNbr,1
END
GO
ALTER TABLE [dbo].[DispatchINLineDetail] ENABLE TRIGGER [dispatchINstock01]
GO
/****** Object:  Trigger [dbo].[dispatchINstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[dispatchINstock02]
ON [dbo].[DispatchINLineDetail]
WITH EXECUTE AS CALLER
AFTER DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @DocumentID,@LotNbr,0
		EXEC Update_DispatchINLineData_Sync @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[DispatchINLineDetail] ENABLE TRIGGER [dispatchINstock02]
GO
/****** Object:  Trigger [dbo].[DispatchOut_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchOut_modifiedDate]
ON [dbo].[DispatchOUTLine]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE DispatchOUTLine 
    SET ModifiedDate = GETDATE()
    FROM DispatchOUTLine
    JOIN inserted ON DispatchOUTLine.DocumentID = inserted.DocumentID AND  DispatchOUTLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[DispatchOUTLine] ENABLE TRIGGER [DispatchOut_modifiedDate]
GO
/****** Object:  Trigger [dbo].[DispatchOUTHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchOUTHistory]
ON [dbo].[DispatchOUTLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,0,@WeightNetto,@Process,"Dispatch OUT"
END
GO
ALTER TABLE [dbo].[DispatchOUTLineDetail] ENABLE TRIGGER [DispatchOUTHistory]
GO
/****** Object:  Trigger [dbo].[DispatchOUTHistoryDel]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchOUTHistoryDel]
ON [dbo].[DispatchOUTLineDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr
		From Deleted
    EXEC Delete_InventoryTransHistory @DocumentID,@LotNbr
END
GO
ALTER TABLE [dbo].[DispatchOUTLineDetail] ENABLE TRIGGER [DispatchOUTHistoryDel]
GO
/****** Object:  Trigger [dbo].[DispatchOUTstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchOUTstock01]
ON [dbo].[DispatchOUTLineDetail]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[DispatchOUTLineDetail] ENABLE TRIGGER [DispatchOUTstock01]
GO
/****** Object:  Trigger [dbo].[DispatchOUTstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[DispatchOUTstock02]
ON [dbo].[DispatchOUTLineDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,1
END
GO
ALTER TABLE [dbo].[DispatchOUTLineDetail] ENABLE TRIGGER [DispatchOUTstock02]
GO
/****** Object:  Trigger [dbo].[FermentDirect_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FermentDirect_modifiedDate]
ON [dbo].[FermentDirectLine]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE FermentDirectLine 
    SET ModifiedDate = GETDATE()
    FROM FermentDirectLine
    JOIN inserted ON FermentDirectLine.DocumentID = inserted.DocumentID AND  FermentDirectLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[FermentDirectLine] ENABLE TRIGGER [FermentDirect_modifiedDate]
GO
/****** Object:  Trigger [dbo].[FermentINstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FermentINstock01]
ON [dbo].[FermentDirectLineINDetail]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[FermentDirectLineINDetail] ENABLE TRIGGER [FermentINstock01]
GO
/****** Object:  Trigger [dbo].[FermentINstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FermentINstock02]
ON [dbo].[FermentDirectLineINDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,1
END
GO
ALTER TABLE [dbo].[FermentDirectLineINDetail] ENABLE TRIGGER [FermentINstock02]
GO
/****** Object:  Trigger [dbo].[fermentoutstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[fermentoutstock01]
ON [dbo].[FermentDirectLineOUTDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@OldDocumentID=OldDocumentID,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
END
GO
ALTER TABLE [dbo].[FermentDirectLineOUTDetail] ENABLE TRIGGER [fermentoutstock01]
GO
/****** Object:  Trigger [dbo].[fermentoutstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[fermentoutstock02]
ON [dbo].[FermentDirectLineOUTDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @DocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[FermentDirectLineOUTDetail] ENABLE TRIGGER [fermentoutstock02]
GO
/****** Object:  Trigger [dbo].[InventoryImport_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InventoryImport_modifiedDate]
ON [dbo].[InventoryImport]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE InventoryImport 
    SET ModifiedDate = GETDATE()
    FROM InventoryImport
    JOIN inserted ON InventoryImport.DocumentID = inserted.DocumentID AND  InventoryImport.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[InventoryImport] ENABLE TRIGGER [InventoryImport_modifiedDate]
GO
/****** Object:  Trigger [dbo].[import2stock]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[import2stock]
ON [dbo].[InventoryImportDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
END
GO
ALTER TABLE [dbo].[InventoryImportDetail] ENABLE TRIGGER [import2stock]
GO
/****** Object:  Trigger [dbo].[importHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[importHistory]
ON [dbo].[InventoryImportDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,@Process,"Import Inventory"
END
GO
ALTER TABLE [dbo].[InventoryImportDetail] ENABLE TRIGGER [importHistory]
GO
/****** Object:  Trigger [dbo].[Numbering_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------
-- Triggers structure for table NumberingSetting
-- ----------------------------
CREATE TRIGGER [dbo].[Numbering_modifiedDate]
ON [dbo].[NumberingSetting]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE NumberingSetting 
    SET ModifiedDate = GETDATE()
    FROM NumberingSetting
    JOIN inserted ON NumberingSetting.NumberingID = inserted.NumberingID 
END
GO
ALTER TABLE [dbo].[NumberingSetting] ENABLE TRIGGER [Numbering_modifiedDate]
GO
/****** Object:  Trigger [dbo].[ProcessingLineIN_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ProcessingLineIN_modifiedDate]
ON [dbo].[ProcessingLineIN]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE ProcessingLineIN 
    SET ModifiedDate = GETDATE()
    FROM ProcessingLineIN
    JOIN inserted ON ProcessingLineIN.DocumentID = inserted.DocumentID AND  ProcessingLineIN.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ProcessingLineIN] ENABLE TRIGGER [ProcessingLineIN_modifiedDate]
GO
/****** Object:  Trigger [dbo].[LineINHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineINHistory]
ON [dbo].[ProcessingLineINDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,0,@WeightNetto,@Process,"Processing IN"
END
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ENABLE TRIGGER [LineINHistory]
GO
/****** Object:  Trigger [dbo].[LineINHistoryDel]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineINHistoryDel]
ON [dbo].[ProcessingLineINDetail]
WITH EXECUTE AS CALLER
AFTER DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr
		From Deleted
    EXEC Delete_InventoryTransHistory @DocumentID,@LotNbr
END
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ENABLE TRIGGER [LineINHistoryDel]
GO
/****** Object:  Trigger [dbo].[LineINstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineINstock01]
ON [dbo].[ProcessingLineINDetail]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ENABLE TRIGGER [LineINstock01]
GO
/****** Object:  Trigger [dbo].[LineINstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineINstock02]
ON [dbo].[ProcessingLineINDetail]
WITH EXECUTE AS CALLER
AFTER DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,1
END
GO
ALTER TABLE [dbo].[ProcessingLineINDetail] ENABLE TRIGGER [LineINstock02]
GO
/****** Object:  Trigger [dbo].[ProcessingLineOUT_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ProcessingLineOUT_modifiedDate]
ON [dbo].[ProcessingLineOUT]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE ProcessingLineOUT 
    SET ModifiedDate = GETDATE()
    FROM ProcessingLineOUT
    JOIN inserted ON ProcessingLineOUT.DocumentID = inserted.DocumentID AND  ProcessingLineOUT.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ProcessingLineOUT] ENABLE TRIGGER [ProcessingLineOUT_modifiedDate]
GO
/****** Object:  Trigger [dbo].[LineOUTHistory]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineOUTHistory]
ON [dbo].[ProcessingLineOUTDetail]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
		From Inserted
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,@Process,"Processing OUT"
END
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ENABLE TRIGGER [LineOUTHistory]
GO
/****** Object:  Trigger [dbo].[LineOUTHistoryDel]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[LineOUTHistoryDel]
ON [dbo].[ProcessingLineOUTDetail]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr
		From Deleted
    EXEC Delete_InventoryTransHistory @DocumentID,@LotNbr
END
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ENABLE TRIGGER [LineOUTHistoryDel]
GO
/****** Object:  Trigger [dbo].[lineoutstock01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[lineoutstock01]
ON [dbo].[ProcessingLineOUTDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@OldDocumentID=OldDocumentID,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
END
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ENABLE TRIGGER [lineoutstock01]
GO
/****** Object:  Trigger [dbo].[lineoutstock02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[lineoutstock02]
ON [dbo].[ProcessingLineOUTDetail]
WITH EXECUTE AS CALLER
AFTER DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @DocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[ProcessingLineOUTDetail] ENABLE TRIGGER [lineoutstock02]
GO
/****** Object:  Trigger [dbo].[ProcessingLineOUT_modifiedDate_copy1]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ProcessingLineOUT_modifiedDate_copy1]
ON [dbo].[ProcessingLineOUTDonor]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE ProcessingLineOUTDonor 
    SET ModifiedDate = GETDATE()
    FROM ProcessingLineOUTDonor
    JOIN inserted ON ProcessingLineOUTDonor.DocumentID = inserted.DocumentID AND  ProcessingLineOUTDonor.CreatedDate = inserted.CreatedDate
END
GO
ALTER TABLE [dbo].[ProcessingLineOUTDonor] ENABLE TRIGGER [ProcessingLineOUT_modifiedDate_copy1]
GO
/****** Object:  Trigger [dbo].[Invoice_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Invoice_modifiedDate]
ON [dbo].[PurchaseInvoice]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE PurchaseInvoice 
    SET ModifiedDate = GETDATE()
    FROM PurchaseInvoice
    JOIN inserted ON PurchaseInvoice.DocumentID = inserted.DocumentID AND  PurchaseInvoice.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[PurchaseInvoice] ENABLE TRIGGER [Invoice_modifiedDate]
GO
/****** Object:  Trigger [dbo].[inv2buying01]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[inv2buying01]
ON [dbo].[PurchaseInvoiceDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@ReceiptID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@ReceiptID=ReceiptID
		From Inserted
		EXEC Update_BuyingLine_Invoice @ReceiptID,@DocumentID
END
GO
ALTER TABLE [dbo].[PurchaseInvoiceDetail] ENABLE TRIGGER [inv2buying01]
GO
/****** Object:  Trigger [dbo].[inv2Buying02]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[inv2Buying02]
ON [dbo].[PurchaseInvoiceDetail]
WITH EXECUTE AS CALLER
AFTER DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@ReceiptID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @ReceiptID=ReceiptID
		From Deleted
		EXEC Update_BuyingLine_Invoice @ReceiptID,''
END
GO
ALTER TABLE [dbo].[PurchaseInvoiceDetail] ENABLE TRIGGER [inv2Buying02]
GO
/****** Object:  Trigger [dbo].[ReclassLine_modifiedDate]    Script Date: 07/09/2021 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ReclassLine_modifiedDate]
ON [dbo].[ReclassLine]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE ReclassLine 
    SET ModifiedDate = GETDATE()
    FROM ReclassLine
    JOIN inserted ON ReclassLine.DocumentID = inserted.DocumentID AND  ReclassLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ReclassLine] ENABLE TRIGGER [ReclassLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[rec2stock]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[rec2stock]
ON [dbo].[ReclassLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@OldGrade nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=ABS(StatusReject - 1),
						@OldDocumentID=OldDocumentID,@OldLotNbr=OldLotNbr,@OldGrade=OldGrade,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,'','','','RC','',
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@OldLotNbr,0
END
GO
ALTER TABLE [dbo].[ReclassLineDetail] ENABLE TRIGGER [rec2stock]
GO
/****** Object:  Trigger [dbo].[recHistory]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[recHistory]
ON [dbo].[ReclassLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@OldDocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@OldSubItem nvarchar(40)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@OldProcess nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@WeightNetto=WeightNetto,@OldSubItem=CONCAT(Stage,'.',Form,'.',CropYear,'.',OldGrade),@OldLotNbr=OldLotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		
		select @OldProcess=st.Process  From StockItem st Where st.DocumentID=@OldDocumentID and st.InventoryID=@InventoryID
		
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@OldSubItem,@OldLotNbr,0,@WeightNetto,@OldProcess,"Direct Reclass"
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,"RC","Direct Reclass"

END
GO
ALTER TABLE [dbo].[ReclassLineDetail] ENABLE TRIGGER [recHistory]
GO
/****** Object:  Trigger [dbo].[ReclassLine_modifiedDate_copy1]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ReclassLine_modifiedDate_copy1]
ON [dbo].[ReclassProcessLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE ReclassProcessLine 
    SET ModifiedDate = GETDATE()
    FROM ReclassProcessLine
    JOIN inserted ON ReclassProcessLine.DocumentID = inserted.DocumentID AND  ReclassProcessLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ReclassProcessLine] ENABLE TRIGGER [ReclassLine_modifiedDate_copy1]
GO
/****** Object:  Trigger [dbo].[recpro2stock]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[recpro2stock]
ON [dbo].[ReclassProcessLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@OldGrade nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@OldLotNbr=OldLotNbr,@OldGrade=OldGrade,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,'RC',@StalkPosition,
													@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@OldLotNbr,0
END
GO
ALTER TABLE [dbo].[ReclassProcessLineDetail] ENABLE TRIGGER [recpro2stock]
GO
/****** Object:  Trigger [dbo].[recproHistory]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[recproHistory]
ON [dbo].[ReclassProcessLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@OldDocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@OldSubItem nvarchar(40)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldLotNbr nvarchar(40)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@OldProcess nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@WeightNetto=WeightNetto,@OldSubItem=CONCAT(Stage,'.',Form,'.',CropYear,'.',OldGrade),@OldLotNbr=OldLotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		
		select @OldProcess=st.Process  From StockItem st Where st.DocumentID=@OldDocumentID and st.InventoryID=@InventoryID
		
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@OldSubItem,@OldLotNbr,0,@WeightNetto,@OldProcess,"Regrade"
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightNetto,0,"RC","Regrade"

END
GO
ALTER TABLE [dbo].[ReclassProcessLineDetail] ENABLE TRIGGER [recproHistory]
GO
/****** Object:  Trigger [dbo].[reworkLine_modifiedDate]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[reworkLine_modifiedDate]
ON [dbo].[ReworkLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE ReworkLine
    SET ModifiedDate = GETDATE()
    FROM ReworkLine
    JOIN inserted ON ReworkLine.DocumentID = inserted.DocumentID AND  ReworkLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ReworkLine] ENABLE TRIGGER [reworkLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[rework2stock]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[rework2stock]
ON [dbo].[ReworkLineDetail]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,@Process,@StalkPosition, @WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[ReworkLineDetail] ENABLE TRIGGER [rework2stock]
GO
/****** Object:  Trigger [dbo].[ShipmentInfo_modifiedDate]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ShipmentInfo_modifiedDate]
ON [dbo].[ShipmentInfo]
FOR INSERT, UPDATE
AS
BEGIN
    UPDATE ShipmentInfo 
    SET ModifiedDate = GETDATE()
    FROM ShipmentInfo
    JOIN inserted ON ShipmentInfo.DocumentID = inserted.DocumentID AND  ShipmentInfo.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[ShipmentInfo] ENABLE TRIGGER [ShipmentInfo_modifiedDate]
GO
/****** Object:  Trigger [dbo].[shipmentallocstock01]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[shipmentallocstock01]
ON [dbo].[ShipmentInfoAllocation]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
					Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
					From Inserted
					EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Inserted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,2
END
GO
ALTER TABLE [dbo].[ShipmentInfoAllocation] ENABLE TRIGGER [shipmentallocstock01]
GO
/****** Object:  Trigger [dbo].[shipmentallocstock02]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[shipmentallocstock02]
ON [dbo].[ShipmentInfoAllocation]
WITH EXECUTE AS CALLER
FOR DELETE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@OldDocumentID nvarchar(30)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Deleted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@LotNbr=LotNbr,@OldDocumentID=OldDocumentID
		From Deleted
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,1
END
GO
ALTER TABLE [dbo].[ShipmentInfoAllocation] ENABLE TRIGGER [shipmentallocstock02]
GO
/****** Object:  Trigger [dbo].[shipmentHistory]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[shipmentHistory]
ON [dbo].[ShipmentInfoAllocation]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
					Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto
					From Inserted
					EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,0,@WeightNetto,@Process,"Shipment"
      End

END
GO
ALTER TABLE [dbo].[ShipmentInfoAllocation] ENABLE TRIGGER [shipmentHistory]
GO
/****** Object:  Trigger [dbo].[unpackLine_modifiedDate]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[unpackLine_modifiedDate]
ON [dbo].[UnpackLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE UnpackLine 
    SET ModifiedDate = GETDATE()
    FROM UnpackLine
    JOIN inserted ON UnpackLine.DocumentID = inserted.DocumentID AND  UnpackLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[UnpackLine] ENABLE TRIGGER [unpackLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[unpack2stock]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[unpack2stock]
ON [dbo].[UnpackLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare	@OldSubItem nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@OldSubItem=OldSubItem,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,'PC',@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[UnpackLineDetail] ENABLE TRIGGER [unpack2stock]
GO
/****** Object:  Trigger [dbo].[weightadjustmentLine_modifiedDate]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[weightadjustmentLine_modifiedDate]
ON [dbo].[WeightAdjustLine]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE WeightAdjustLine 
    SET ModifiedDate = GETDATE()
    FROM WeightAdjustLine
    JOIN inserted ON WeightAdjustLine.DocumentID = inserted.DocumentID AND  WeightAdjustLine.DocumentDate = inserted.DocumentDate
END
GO
ALTER TABLE [dbo].[WeightAdjustLine] ENABLE TRIGGER [weightadjustmentLine_modifiedDate]
GO
/****** Object:  Trigger [dbo].[adjust2stock]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[adjust2stock]
ON [dbo].[WeightAdjustLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Source nvarchar(30)
	Declare	@Stage nvarchar(30)
	Declare	@tForm nvarchar(30)
	Declare	@CropYear nvarchar(30)
	Declare	@Grade nvarchar(30)
	Declare	@Area nvarchar(30)
	Declare	@Color nvarchar(30)
	Declare	@Fermentation nvarchar(30)
	Declare	@Length nvarchar(30)
	Declare	@Process nvarchar(30)
	Declare	@StalkPosition nvarchar(30)
	Declare	@WeightRope DECIMAL(19,2)
	Declare	@WeightShipping DECIMAL(19,2)
	Declare	@WeightReceive DECIMAL(19,2)
	Declare	@WeightTare DECIMAL(19,2)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@UoM nvarchar(6)
	Declare	@Remark nvarchar(255)
	Declare	@StatusStock SMALLINT
	Declare	@OldDocumentID nvarchar(30)
	Declare @BuyerName nvarchar(100)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Source=Source,@Stage=Stage,@tForm=Form,@CropYear=CropYear,@Grade=Grade,
						@Area=Area,@Color=Color,@Fermentation=Fermentation,@Length=Length,@Process=Process,@StalkPosition=StalkPosition,
						@WeightRope=WeightRope,@WeightShipping=WeightShipping,@WeightReceive=WeightReceive,
            @WeightTare=WeightTare,@WeightNetto=WeightNetto,@UoM=UoM,@Remark=Remark,@StatusStock=1,
						@OldDocumentID=OldDocumentID,@BuyerName=BuyerName
		From Inserted
    EXEC insert_StockItem @DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@COlor,@Fermentation,@Length,@Process,@StalkPosition, @WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@StatusStock,@BuyerName
		EXEC Update_StockItemStatus @OldDocumentID,@LotNbr,0
END
GO
ALTER TABLE [dbo].[WeightAdjustLineDetail] ENABLE TRIGGER [adjust2stock]
GO
/****** Object:  Trigger [dbo].[adjustHistory]    Script Date: 07/09/2021 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[adjustHistory]
ON [dbo].[WeightAdjustLineDetail]
WITH EXECUTE AS CALLER
AFTER INSERT, UPDATE
AS
BEGIN
	Declare	@DocumentID nvarchar(30)
	Declare	@InventoryID nvarchar(30)
	Declare	@SubItem nvarchar(30)
	Declare	@LotNbr nvarchar(40)
	Declare	@Process nvarchar(30)
	Declare	@WeightNetto DECIMAL(19,2)
	Declare	@OldWeightNetto DECIMAL(19,2)
	Declare	@WeightDiff DECIMAL(19,2)
	
	-- Insert statements for trigger here
			If (SELECT SyncDetail FROM Inserted) = 1
      Begin
          Return
      End
    Select @DocumentID=DocumentID,@InventoryID=InventoryID,@SubItem=SubItem,@LotNbr=LotNbr,@Process=Process,@WeightNetto=WeightNetto,@OldWeightNetto=OldWeightNetto, @WeightDiff = Abs(OldWeightNetto-WeightNetto)
		From Inserted
		/*
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,0,@WeightNetto,@Process,"Weight Adjustment"
    EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@OldWeightNetto,0,@Process,"Weight Adjustment"
		*/
		
			if @OldWeightNetto > @WeightNetto
				begin
					EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,0,@WeightDiff,@Process,"Weight Adjustment"
				end
			else
				begin
					EXEC Insert_InventoryTransHistory @DocumentID,@InventoryID,@SubItem,@LotNbr,@WeightDiff,0,@Process,"Weight Adjustment"
				end
END
GO
ALTER TABLE [dbo].[WeightAdjustLineDetail] ENABLE TRIGGER [adjustHistory]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PK ID setting' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettings', @level2type=N'COLUMN',@level2name=N'SettingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'value setting' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettings', @level2type=N'COLUMN',@level2name=N'Val'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ClientID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppSettings', @level2type=N'COLUMN',@level2name=N'ClientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Buying date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'concate all details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'VendorDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dari BuyingRegistration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'RegistrationNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference Invoice addon' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NTRM boolean' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'NTRM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Residue / MC boolean' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'MC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bale rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'StatusReject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'lock dari QC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'COLUMN',@level2name=N'QCLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'TRIGGER',@level2name=N'by2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingLineDetail', @level2type=N'TRIGGER',@level2name=N'byHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Buying date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'concate all details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'VendorDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dari BuyingRegistration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'RegistrationNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total lot dari reg
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'TotalLot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'data sampling range' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQC', @level2type=N'COLUMN',@level2name=N'SamplingRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'lotNbr collective' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bale rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'StatusReject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'lotNbr sample
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingQCDetail', @level2type=N'COLUMN',@level2name=N'LotNbrSample'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estimate tobacco weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingRegistration', @level2type=N'COLUMN',@level2name=N'EstWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estimate tobacco weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingRegistration', @level2type=N'COLUMN',@level2name=N'EstLot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingRegistration', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingRegistration', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuyingRegistration', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldLotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'old netto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldNetto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Old Stage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldSubitem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'TRIGGER',@level2name=N'directpack2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectPackingLineDetail', @level2type=N'TRIGGER',@level2name=N'directpackHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldLotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'old netto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldNetto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Old Stage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'COLUMN',@level2name=N'OldSubitem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'TRIGGER',@level2name=N'directtemppack2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DirectTempPackingLineDetail', @level2type=N'TRIGGER',@level2name=N'directtemppackHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'WarehouseIDFrom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Warehouse Site ID tujuan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'WarehouseIDTo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight from scale / in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'TotalWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'trans Type "DISPATCH"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'TransType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dispatch OUT number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'DispatchOUTNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'penyedia logistik' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'LogisticService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nopol kendaraan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLine', @level2type=N'COLUMN',@level2name=N'LisencePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unit cost issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'UnitCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ext cost issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineData', @level2type=N'COLUMN',@level2name=N'ExtCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unit cost baru' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'UnitCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ext cost' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'COLUMN',@level2name=N'ExtCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'TRIGGER',@level2name=N'dispatchINHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from history
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'TRIGGER',@level2name=N'dispatchINHistoryDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'TRIGGER',@level2name=N'dispatchINstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchINLineDetail', @level2type=N'TRIGGER',@level2name=N'dispatchINstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'WarehouseIDFrom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Warehouse Site ID tujuan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'WarehouseIDTo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight from scale / in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'TotalWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'penyedia logistik' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'LogisticService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nopol kendaraan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLine', @level2type=N'COLUMN',@level2name=N'LisencePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unit cost' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'UnitCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ext cost' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'COLUMN',@level2name=N'ExtCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'TRIGGER',@level2name=N'DispatchOUTHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from history
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'TRIGGER',@level2name=N'DispatchOUTHistoryDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'TRIGGER',@level2name=N'DispatchOUTstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N're-add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DispatchOUTLineDetail', @level2type=N'TRIGGER',@level2name=N'DispatchOUTstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ferment Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'FermentType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unit cost baru dari kalkulasi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'UnitCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ext cost dair issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'ExtCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'TRIGGER',@level2name=N'FermentINstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N're-add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineINDetail', @level2type=N'TRIGGER',@level2name=N'FermentINstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'fermentoutstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FermentDirectLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'fermentoutstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'always SYNCED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImport', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'TRIGGER',@level2name=N'import2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryImportDetail', @level2type=N'TRIGGER',@level2name=N'importHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryItem', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Deksripsi kode inventory tembakau' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryItem', @level2type=N'COLUMN',@level2name=N'Descr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'status item (ACtive ?)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryItem', @level2type=N'COLUMN',@level2name=N'ItemStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'inventoryID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'lot number
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'berat masuk inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'NettoIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'berat keluar inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'NettoOUT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tanggal transaksi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'TransactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'process code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'catatan history' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryTransHistory', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight from scale / in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'TotalWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'ProcessType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unapplied Balance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'UnappliedBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'notes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'shrikage volume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineIN', @level2type=N'COLUMN',@level2name=N'ShrinkBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'grouping (staple)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'LotGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'details creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'TRIGGER',@level2name=N'LineINHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from history
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'TRIGGER',@level2name=N'LineINHistoryDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'TRIGGER',@level2name=N'LineINstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N're-add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineINDetail', @level2type=N'TRIGGER',@level2name=N'LineINstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ref document IN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'RefINNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight from scale / in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'TotalWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'ProcessType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'notes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUT', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'zero Cost item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'ZeroCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'LineOUTHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove from history
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'LineOUTHistoryDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'lineoutstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDetail', @level2type=N'TRIGGER',@level2name=N'lineoutstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ref document IN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'RefINNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ref document IN Donor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'RefINDonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight from scale / in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'TotalWeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProcessingLineOUTDonor', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Buying date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'concate all details' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'VendorDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total value of cash advance at invoice time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'TotalCashAdvance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total tax deduct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'TotaxTaxDeduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total payment deduction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'TotalPaymentDeduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total payment aftar tax and deduct' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'TotalPayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nama buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nama admin invoice' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'AdminName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoice', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ref buying doc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'ReceiptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total receipt from buying (IDR)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'ReceiptAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'persentase pajak' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'TaxPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total deduction from tax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'TaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'deduction percentage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'DeductPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'deduction amount (IDR)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'DeductAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total payment amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'PaymentAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'vol var' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'VolumeVariable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'vol cur' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'COLUMN',@level2name=N'VolumeCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'update invoice nbr to buying' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'TRIGGER',@level2name=N'inv2buying01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remove invoiceID if deleted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PurchaseInvoiceDetail', @level2type=N'TRIGGER',@level2name=N'inv2Buying02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NTRM boolean' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'NTRM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bale rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'StatusReject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'OldLotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Residue / MC boolean' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'MC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'TRIGGER',@level2name=N'rec2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassLineDetail', @level2type=N'TRIGGER',@level2name=N'recHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'OldLotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'TRIGGER',@level2name=N'recpro2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReclassProcessLineDetail', @level2type=N'TRIGGER',@level2name=N'recproHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total cost from released issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLine', @level2type=N'COLUMN',@level2name=N'TotalCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'OldWeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReworkLineDetail', @level2type=N'TRIGGER',@level2name=N'rework2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calibration time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ClientID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'ClientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleCalibration', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'doc date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total qty from sales order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'TotalQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total weight alocated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'TotalAllocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference SO number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'AcumaticaRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ship2contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'CustomerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ship2address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'CustomerLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference Shipment number acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'AcumaticaShipmentNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SO desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'SODescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'penyedia logistik' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'LogisticService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nopol kendaraan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'LisencePlate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'shipment date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfo', @level2type=N'COLUMN',@level2name=N'ShippingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SoLine number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'COLUMN',@level2name=N'SOLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'flag 2 from stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'TRIGGER',@level2name=N'shipmentallocstock01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N're-add to stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'TRIGGER',@level2name=N'shipmentallocstock02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoAllocation', @level2type=N'TRIGGER',@level2name=N'shipmentHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SOLine number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShipmentInfoDetail', @level2type=N'COLUMN',@level2name=N'SOLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Source' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bale in stock = 1
rejected / taken out = 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'StatusStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'details creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockItem', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UnpackLineDetail', @level2type=N'TRIGGER',@level2name=N'unpack2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'line number PO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorPODetail', @level2type=N'COLUMN',@level2name=N'LineNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'total order qty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorPODetail', @level2type=N'COLUMN',@level2name=N'OrderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unapplied qty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorPODetail', @level2type=N'COLUMN',@level2name=N'QtyOnReceipts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'kode warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseLocation', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'kode warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseLocation', @level2type=N'COLUMN',@level2name=N'LocationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'desc warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseLocation', @level2type=N'COLUMN',@level2name=N'Descr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'kode warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseSite', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'desc warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseSite', @level2type=N'COLUMN',@level2name=N'Descr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WarehouseSite', @level2type=N'COLUMN',@level2name=N'Branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reclass date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'DocumentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'warehouse site ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'WarehouseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica ISSUE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'AcumaticaIssueRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference number acumatica RECEIPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'AcumaticaReceiptRefNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'log dari login user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'CreatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document creation time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document last modified time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLine', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'DocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'get inventoryID dari acumatica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'InventoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SubItem dari kombinasi 4 segmen opsi (3 sub +grade)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'SubItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'max 4 digit unique uat label. format blom ada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'LotNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Color' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Fermentation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'Fermentation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Length' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'Process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attribute Stalk Position' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'StalkPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'WeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base unit / unit of measurement' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'UoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free text input harga per UOM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'CostUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'remark' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 sync/export flag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'SyncDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nomer reference transaksi (unique generate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'OldDocumentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Qty dari timbangan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'OldWeightReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nama Buyer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'COLUMN',@level2name=N'BuyerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert to stock addon after insert' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'TRIGGER',@level2name=N'adjust2stock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insert history trans' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeightAdjustLineDetail', @level2type=N'TRIGGER',@level2name=N'adjustHistory'
GO
USE [master]
GO
ALTER DATABASE [ScaleAddonClean] SET  READ_WRITE 
GO
