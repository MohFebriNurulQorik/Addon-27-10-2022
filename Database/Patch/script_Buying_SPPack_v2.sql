USE [ScaleAddon]
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLine_v2]    Script Date: 07/09/2021 13:19:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetail_v2]    Script Date: 07/09/2021 13:19:30 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetailQC_v2]    Script Date: 07/09/2021 13:19:30 ******/
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
