USE [ScaleAddon]
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_BuyingLineDetailQC_v2]    Script Date: 15/09/2021 19:05:27 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_BuyingQC_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingQC_v2]
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
		@SamplingRange INT,
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM BuyingQC WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE BuyingQC	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, RegistrationNumber=@RegistrationNumber, OrderNbr=@OrderNbr, InventoryID=@InventoryID, VendorClass=@VendorClass, Status=@Status, TotalLot=@TotalLot, CreatorID=@CreatorID,SamplingRange=@SamplingRange
						WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID and @DocumentDate cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into BuyingQC (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,RegistrationNumber,OrderNbr,InventoryID,VendorClass,Status,TotalLot,CreatorID,SamplingRange)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@RegistrationNumber,@OrderNbr,@InventoryID,@VendorClass,@Status,@TotalLot,@CreatorID,@SamplingRange)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BuyingQCDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_BuyingQCDetail_v2]
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
/****** Object:  StoredProcedure [dbo].[Insert_DirectPackingLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectPackingLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DirectPackingLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
					    UPDATE DirectPackingLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
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
        INSERT into DirectPackingLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectPackingLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectPackingLineDetail_v2]
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
		@OldSubitem nvarchar(30),
		@OperationType int
		

)

AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DirectPackingLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
							UPDATE DirectPackingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldNetto=@OldNetto,BuyerName=@BuyerName,OldSubitem=@OldSubitem
							WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DirectPackingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldNetto,BuyerName,OldSubitem)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldNetto,@BuyerName,@OldSubitem)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectTempPackingLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectTempPackingLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DirectTempPackingLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE DirectTempPackingLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
						WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DirectTempPackingLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DirectTempPackingLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DirectTempPackingLineDetail_v2]
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
		@OldSubitem nvarchar(30),
		@OperationType int
		

)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DirectTempPackingLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
						UPDATE DirectTempPackingLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldNetto=@OldNetto,BuyerName=@BuyerName,OldSubitem=@OldSubitem
						WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DirectTempPackingLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldNetto,BuyerName,OldSubitem)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldNetto,@BuyerName,@OldSubitem)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLine_v2]
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
		@LisencePlate nvarchar(30),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DispatchINLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE DispatchINLine	SET WarehouseIDFrom=@WarehouseIDFrom , WarehouseIDTo=@WarehouseIDTo ,Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight,  AcumaticaRefNbr=@AcumaticaRefNbr, Note=@Note, DispatchOUTNbr=@DispatchOUTNbr, CreatorID=@CreatorID, LogisticService=@LogisticService, LisencePlate=@LisencePlate
						WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DispatchINLine (DocumentID,DocumentDate,WarehouseIDFrom,WarehouseIDTo,Status,TotalCost,TotalWeight,AcumaticaRefNbr,Note,DispatchOUTNbr,CreatorID, LogisticService, LisencePlate)
				Values (@DocumentID,@DocumentDate,@WarehouseIDFrom,@WarehouseIDTo,@Status,@TotalCost,@TotalWeight,@AcumaticaRefNbr,@Note,@DispatchOUTNbr,@CreatorID, @LogisticService, @LisencePlate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLineData_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLineData_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
)

AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DispatchINLineData WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DispatchINLineData (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchINLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchINLineDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DispatchINLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DispatchINLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchOUTLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchOUTLine_v2]
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
		@LisencePlate nvarchar(30),
		@OperationType int
		
)


AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DispatchOUTLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE DispatchOUTLine	SET WarehouseIDFrom=@WarehouseIDFrom , WarehouseIDTo=@WarehouseIDTo ,Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight,  AcumaticaRefNbr=@AcumaticaRefNbr, Note=@Note, CreatorID=@CreatorID, LogisticService=@LogisticService, LisencePlate=@LisencePlate
						WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@DocumentDate and @DocumentID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DispatchOUTLine (DocumentID,DocumentDate,WarehouseIDFrom,WarehouseIDTo,Status,TotalCost,TotalWeight,AcumaticaRefNbr,Note,CreatorID, LogisticService, LisencePlate)
				Values (@DocumentID,@DocumentDate,@WarehouseIDFrom,@WarehouseIDTo,@Status,@TotalCost,@TotalWeight,@AcumaticaRefNbr,@Note,@CreatorID, @LogisticService, @LisencePlate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DispatchOUTLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DispatchOUTLineDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM DispatchOUTLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@DocumentID and @LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into DispatchOUTLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,UnitCost,ExtCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@UnitCost,@ExtCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineIN_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineIN_v2]
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
		@Notes nvarchar(255),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ProcessingLineIN WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ProcessingLineIN	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, TotalWeight=@TotalWeight, ProcessType=@ProcessType, UnappliedBalance=@TotalWeight, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID, Notes=@Notes
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
        INSERT into ProcessingLineIN (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,TotalWeight,ProcessType,UnappliedBalance,AcumaticaRefNbr,BuyerName,CreatorID,Notes)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@TotalWeight,@ProcessType,@TotalWeight,@AcumaticaRefNbr,@BuyerName,@CreatorID,@Notes)
    END
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineINDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineINDetail_v2]
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
		@LotGroup nvarchar(20),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ProcessingLineINDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ProcessingLineINDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,BuyerName,LotGroup)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@BuyerName,@LotGroup)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineOUT_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineOUT_v2]
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
		@Notes nvarchar(255),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ProcessingLineOUT WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ProcessingLineOUT	SET WarehouseID=@WarehouseID , Status=@Status, RefINNbr=@RefINNbr,TotalCost=@TotalCost, TotalWeight=@TotalWeight, ProcessType=@ProcessType, AcumaticaRefNbr=@AcumaticaRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID, Notes=@Notes
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
        INSERT into ProcessingLineOUT (DocumentID,DocumentDate,WarehouseID,Status,RefINNbr,TotalCost,TotalWeight,ProcessType,AcumaticaRefNbr,BuyerName,CreatorID, Notes)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@RefINNbr,@TotalCost,@TotalWeight,@ProcessType,@AcumaticaRefNbr,@BuyerName,@CreatorID, @Notes)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ProcessingLineOUTDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ProcessingLineOUTDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ProcessingLineOUTDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ProcessingLineOUTDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,ZeroCost,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@ZeroCost,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PurchaseInvoice_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_PurchaseInvoice_v2]
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
		@CreatorID nvarchar(50),
		@OperationType int
)

AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM PurchaseInvoice WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE PurchaseInvoice	SET WarehouseID=@WarehouseID , VendorID=@VendorID, VendorDetails=@VendorDetails, TotalCashAdvance=@TotalCashAdvance, TotaxTaxDeduct=@TotaxTaxDeduct, TotalPaymentDeduct=@TotalPaymentDeduct, TotalPayment=@TotalPayment, Status=@Status, AcumaticaRefNbr=@AcumaticaRefNbr, NPWP=@NPWP, BuyerName=@BuyerName, AdminName=@AdminName, CreatorID=@CreatorID
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
        INSERT into PurchaseInvoice (DocumentID,DocumentDate,WarehouseID,VendorID,VendorDetails,TotalCashAdvance,TotaxTaxDeduct,TotalPaymentDeduct,TotalPayment,Status,AcumaticaRefNbr,NPWP,BuyerName,AdminName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@VendorID,@VendorDetails,@TotalCashAdvance,@TotaxTaxDeduct,@TotalPaymentDeduct,@TotalPayment,@Status,@AcumaticaRefNbr,@NPWP,@BuyerName,@AdminName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PurchaseInvoiceDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_PurchaseInvoiceDetail_v2]
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
		@VolumeCurrent decimal(19,2),
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM PurchaseInvoiceDetail WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID)
					BEGIN
						UPDATE PurchaseInvoiceDetail	SET ReceiptAmount=@ReceiptAmount , TaxPercentage=@TaxPercentage, TaxAmount=@TaxAmount, DeductPercentage=@DeductPercentage, DeductAmount=@DeductAmount, PaymentAmount=@PaymentAmount, SyncDetail=@SyncDetail, VolumeVariable=@VolumeVariable, VolumeCurrent=@VolumeCurrent
						WHERE ReceiptID=@ReceiptID AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@ReceiptID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into PurchaseInvoiceDetail (DocumentID,ReceiptID,ReceiptAmount,TaxPercentage,TaxAmount,DeductPercentage,DeductAmount,PaymentAmount,SyncDetail,VolumeVariable,VolumeCurrent)
				Values (@DocumentID,@ReceiptID,@ReceiptAmount,@TaxPercentage,@TaxAmount,@DeductPercentage,@DeductAmount,@PaymentAmount,@SyncDetail,@VolumeVariable,@VolumeCurrent)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ReclassLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ReclassLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
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
        INSERT into ReclassLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassLineDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
		

)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ReclassLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ReclassLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit, CostGross=@CostGross, NTRM=@NTRM, CostNTRM=@CostNTRM, CostNett=@CostNett, Remark=@Remark, StatusReject=@StatusReject, SyncDetail=@SyncDetail,OrderNbr=@OrderNbr,NoKontrak=@NoKontrak, OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldGrade=@OldGrade, MC=@MC,BuyerName=@BuyerName
						WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ReclassLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,CostGross,NTRM,CostNTRM,CostNett,Remark,StatusReject,SyncDetail,OrderNbr,NoKontrak,OldDocumentID,OldLotNbr,OldGrade,MC,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@CostGross,@NTRM,@CostNTRM,@CostNett,@Remark,@StatusReject,@SyncDetail,@OrderNbr,@NoKontrak,@OldDocumentID,@OldLotNbr,@OldGrade,@MC,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassProcessLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassProcessLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
		@TotalCost decimal(25,2),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@BuyerName nvarchar(100),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ReclassProcessLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ReclassProcessLine	SET WarehouseID=@WarehouseID , Status=@Status, TotalCost=@TotalCost, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, BuyerName=@BuyerName, CreatorID=@CreatorID
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
        INSERT into ReclassProcessLine (DocumentID,DocumentDate,WarehouseID,Status,TotalCost,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,BuyerName,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalCost,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@BuyerName,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ReclassProcessLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ReclassProcessLineDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
		

)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ReclassProcessLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ReclassProcessLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldLotNbr=@OldLotNbr, OldGrade=@OldGrade,BuyerName=@BuyerName
						WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ReclassProcessLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldLotNbr,OldGrade,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldLotNbr,@OldGrade,@BuyerName)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfo_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfo_v2]
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
    @ShippingDate date,
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ShipmentInfo WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE ShipmentInfo	SET WarehouseID=@WarehouseID , Status=@Status, TotalQty=@TotalQty, TotalAllocation=@TotalAllocation,AcumaticaRefNbr=@AcumaticaRefNbr,CustomerName=@CustomerName,CustomerLocation=@CustomerLocation, CreatorID=@CreatorID,AcumaticaShipmentNbr=@AcumaticaShipmentNbr,SODescription=@SODescription,LogisticService=@LogisticService,LisencePlate=@LisencePlate,ShippingDate=@ShippingDate
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
        INSERT into ShipmentInfo (DocumentID,DocumentDate,WarehouseID,Status,TotalQty,TotalAllocation,AcumaticaRefNbr,CustomerName,CustomerLocation,CreatorID,AcumaticaShipmentNbr,SODescription,LogisticService,LisencePlate,ShippingDate)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@TotalQty,@TotalAllocation,@AcumaticaRefNbr,@CustomerName,@CustomerLocation,@CreatorID,@AcumaticaShipmentNbr,@SODescription,@LogisticService,@LisencePlate,@ShippingDate)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfoAllocation_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfoAllocation_v2]
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
		@SOLine INT,
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ShipmentInfoAllocation WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
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
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ShipmentInfoAllocation (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color,Fermentation,Length,Process,StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,Remark,OldDocumentID,SyncDetail,SOLine)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color,@Fermentation,@Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@Remark,@OldDocumentID,@SyncDetail,@SOLine)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ShipmentInfoDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_ShipmentInfoDetail_v2]
(
		@DocumentID nvarchar(30),
		@WarehouseID nvarchar(30),
		@InventoryID nvarchar(30),
		@SubItem nvarchar(30),
		@Weight DECIMAL(19,2),
		@UoM nvarchar(6),
		@SOLine INT,
		@OperationType int
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM ShipmentInfoDetail WHERE SubItem=@SubItem AND DocumentID=@DocumentID)
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
						RAISERROR('@SubItem and @DocumentID cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into ShipmentInfoDetail (DocumentID,WarehouseID,InventoryID,SubItem,Weight,UoM,SOLine)
				Values (@DocumentID,@WarehouseID,@InventoryID,@SubItem,@Weight,@UoM,@SOLine)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_WeightAdjustLine_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_WeightAdjustLine_v2]
(
    @DocumentID nvarchar(30),
    @DocumentDate date,
    @WarehouseID nvarchar(30),
		@Status nvarchar(30),
    @AcumaticaIssueRefNbr nvarchar(255),
    @AcumaticaReceiptRefNbr nvarchar(255),
		@CreatorID nvarchar(50),
		@OperationType int
		
)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM WeightAdjustLine WHERE DocumentDate=@DocumentDate AND DocumentID=@DocumentID)
					BEGIN
						UPDATE WeightAdjustLine	SET WarehouseID=@WarehouseID , Status=@Status, AcumaticaIssueRefNbr=@AcumaticaIssueRefNbr, AcumaticaReceiptRefNbr=@AcumaticaReceiptRefNbr, CreatorID=@CreatorID
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
        INSERT into WeightAdjustLine (DocumentID,DocumentDate,WarehouseID,Status,AcumaticaIssueRefNbr,AcumaticaReceiptRefNbr,CreatorID)
				Values (@DocumentID,@DocumentDate,@WarehouseID,@Status,@AcumaticaIssueRefNbr,@AcumaticaReceiptRefNbr,@CreatorID)
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_WeightAdjustLineDetail_v2]    Script Date: 15/09/2021 19:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_WeightAdjustLineDetail_v2]
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
		@BuyerName nvarchar(100),
		@OperationType int
		

)
AS
BEGIN
IF @operationType = 1
    BEGIN
				IF EXISTS (SELECT 1 FROM WeightAdjustLineDetail WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID)
					BEGIN
						UPDATE WeightAdjustLineDetail	SET InventoryID=@InventoryID, SubItem=@SubItem, Source=@Source, Stage=@Stage, Form=@tForm, CropYear=@CropYear, Grade=@Grade, Area=@Area, Color=@Color, Fermentation=@Fermentation, Length=@Length, Process=@Process,StalkPosition=@StalkPosition, WeightRope=@WeightRope, WeightShipping=@WeightShipping, WeightReceive=@WeightReceive, WeightTare=@WeightTare, WeightNetto=@WeightNetto, UoM=@UoM, CostUnit=@CostUnit,  Remark=@Remark, SyncDetail=@SyncDetail,OldDocumentID=@OldDocumentID, OldWeightReceive=@OldWeightReceive, OldWeightTare=@OldWeightTare, OldWeightNetto=@OldWeightNetto,BuyerName=@BuyerName
						WHERE LotNbr=@LotNbr AND DocumentID=@DocumentID
					END
				ELSE
					BEGIN
						RAISERROR('@LotNbr cannot be found', 16, 1)
						RETURN --exit now
					END
    END
ELSE
    BEGIN
        INSERT into WeightAdjustLineDetail (DocumentID,InventoryID,SubItem,LotNbr,Source,Stage,Form,CropYear,Grade,Area,Color, Fermentation, Length, Process, StalkPosition,WeightRope,WeightShipping,WeightReceive,WeightTare,WeightNetto,UoM,CostUnit,Remark,SyncDetail,OldDocumentID,OldWeightReceive,OldWeightTare,OldWeightNetto,BuyerName)
				Values (@DocumentID,@InventoryID,@SubItem,@LotNbr,@Source,@Stage,@tForm,@CropYear,@Grade,@Area,@Color, @Fermentation, @Length,@Process,@StalkPosition,@WeightRope,@WeightShipping,@WeightReceive,@WeightTare,@WeightNetto,@UoM,@CostUnit,@Remark,@SyncDetail,@OldDocumentID,@OldWeightReceive,@OldWeightTare,@OldWeightNetto,@BuyerName)
    END
    
END
GO
