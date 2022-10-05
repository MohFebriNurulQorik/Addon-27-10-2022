/*
 Navicat Premium Data Transfer

 Source Server         : ZephyrusG14 SQLExpress
 Source Server Type    : SQL Server
 Source Server Version : 15002080
 Source Host           : ZephyrusG14\SQLEXPRESS:1433
 Source Catalog        : ScaleAddon
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002080
 File Encoding         : 65001

 Date: 06/09/2021 10:16:43
*/


-- ----------------------------
-- Table structure for NumberingSetting
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[NumberingSetting]') AND type IN ('U'))
	DROP TABLE [dbo].[NumberingSetting]
GO

CREATE TABLE [dbo].[NumberingSetting] (
  [NumberingID] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [LastIncrementValue] int  NULL,
  [NumberingDate] date  NULL,
  [ModifiedDate] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[NumberingSetting] SET (LOCK_ESCALATION = TABLE)
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


-- ----------------------------
-- Primary Key structure for table NumberingSetting
-- ----------------------------
ALTER TABLE [dbo].[NumberingSetting] ADD CONSTRAINT [PK__Numberin__0A40A24A06F56EAC] PRIMARY KEY CLUSTERED ([NumberingID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

