CREATE DATABASE [Diplomna];
GO
 
USE [Diplomna]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [Brands_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[WebAddress] [varchar](max) NOT NULL,
	[Logo] [varbinary](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [Companies_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuel]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Fuel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Increases]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Increases](
	[Companies_ID] [int] NOT NULL,
	[Risk_ID] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[PosNeg] [varchar](1) NOT NULL,
	[TypeValue] [varchar](1) NULL,
 CONSTRAINT [Increases_pk] PRIMARY KEY CLUSTERED 
(
	[Companies_ID] ASC,
	[Risk_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Brands_ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modifications]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Models_ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[EngineVolume] [int] NOT NULL,
	[EnginePower] [int] NOT NULL,
	[EngineFuel] [int] NULL,
	[Doors] [tinyint] NOT NULL,
	[ProduceFrom] [int] NOT NULL,
	[ProduceTo] [int] NOT NULL,
	[InsuranceValue] [money] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Modifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Risk]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Risk](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [Risk_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TariffNumbers]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TariffNumbers](
	[Companies_ID] [int] NOT NULL,
	[TypeInsurance_ID] [int] NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [TariffNumbers_pk] PRIMARY KEY CLUSTERED 
(
	[Companies_ID] ASC,
	[TypeInsurance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeInsurance]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeInsurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MinNumber] [int] NOT NULL,
	[MaxNumber] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [TypeInsurance_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Companies_ID] [int] NULL,
 CONSTRAINT [Users_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brands_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF__Companies__Statu__1273C1CD]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Models] ADD  CONSTRAINT [DF_Models_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Modifications] ADD  CONSTRAINT [DF_Modifications_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Risk] ADD  CONSTRAINT [DF_Risk_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[TypeInsurance] ADD  CONSTRAINT [DF_TypeInsurance_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Increases]  WITH CHECK ADD  CONSTRAINT [Increases_Companies] FOREIGN KEY([Companies_ID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Increases] CHECK CONSTRAINT [Increases_Companies]
GO
ALTER TABLE [dbo].[Increases]  WITH CHECK ADD  CONSTRAINT [Increases_Risk] FOREIGN KEY([Risk_ID])
REFERENCES [dbo].[Risk] ([ID])
GO
ALTER TABLE [dbo].[Increases] CHECK CONSTRAINT [Increases_Risk]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Brands] FOREIGN KEY([Brands_ID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Brands]
GO
ALTER TABLE [dbo].[Modifications]  WITH CHECK ADD  CONSTRAINT [FK_Modifications_Fuel] FOREIGN KEY([EngineFuel])
REFERENCES [dbo].[Fuel] ([ID])
GO
ALTER TABLE [dbo].[Modifications] CHECK CONSTRAINT [FK_Modifications_Fuel]
GO
ALTER TABLE [dbo].[Modifications]  WITH CHECK ADD  CONSTRAINT [FK_Modifications_Models] FOREIGN KEY([Models_ID])
REFERENCES [dbo].[Models] ([ID])
GO
ALTER TABLE [dbo].[Modifications] CHECK CONSTRAINT [FK_Modifications_Models]
GO
ALTER TABLE [dbo].[TariffNumbers]  WITH CHECK ADD  CONSTRAINT [TariffNumbers_Companies] FOREIGN KEY([Companies_ID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[TariffNumbers] CHECK CONSTRAINT [TariffNumbers_Companies]
GO
ALTER TABLE [dbo].[TariffNumbers]  WITH CHECK ADD  CONSTRAINT [TariffNumbers_TypeInsurance] FOREIGN KEY([TypeInsurance_ID])
REFERENCES [dbo].[TypeInsurance] ([ID])
GO
ALTER TABLE [dbo].[TariffNumbers] CHECK CONSTRAINT [TariffNumbers_TypeInsurance]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Companies] FOREIGN KEY([Companies_ID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Companies]
GO
/****** Object:  StoredProcedure [dbo].[AddIncrease]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddIncrease]
@CompanyID int,
@RiskID int,
@Value float,
@PosNeg varchar(1)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Increases (Companies_ID,Risk_ID,Value,PosNeg)
		VALUES (@CompanyID,@RiskID,@Value,@PosNeg)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50009,@message,1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AddTariffNumber]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTariffNumber]
@CompanyID int,
@TypeInsurance int,
@Value float
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO TariffNumbers (Companies_ID, TypeInsurance_ID, Value)
		VALUES (@CompanyID,@TypeInsurance,@Value)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50008,@message,1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateBrand]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateBrand]
@name varchar(50)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Brands (Name)
		VALUES (@name)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50003, @message, 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClause]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateClause]
@name varchar(50),
@minnum int,
@maxnum int
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO TypeInsurance (Name, MaxNumber, MinNumber)
		VALUES (@name,@maxnum,@minnum)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50001, @message, 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateCompany]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCompany]
@Name varchar(100),
@Phone int,
@Email varchar(50),
@WebAddress varchar(max),
@Logo varbinary(max)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Companies (Name, Phone, Email, WebAddress, Logo)
		VALUES (@Name,@Phone,@Email,@WebAddress,@Logo)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50006,@message,1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateModel]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateModel]
@BrandID int,
@Name varchar(50)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Models (Brands_ID,Name)
		VALUES (@BrandID,@Name)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50004, @message, 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateModification]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateModification]
@ModelID int,
@Name varchar(50),
@EngineVolume int,
@EnginePower int,
@EngineFuel varchar(20),
@Doors int,
@ProduceFrom int,
@ProduceTo int,
@InsuranceValue money
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Modifications (Models_ID, Name, EngineVolume, EnginePower, EngineFuel, Doors, ProduceFrom, ProduceTo,InsuranceValue)
		VALUES (@ModelID,@Name,@EngineVolume,@EnginePower,@EngineFuel,@Doors,@ProduceFrom,@ProduceTo,@InsuranceValue)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50005, @message, 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRisk]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRisk]
@name varchar(50)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Risk (Name)
		VALUES (@name)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50002, @message, 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
@Username varchar(50),
@Password varchar(32),
@Email varchar(50),
@FirstName varchar(50),
@LastName varchar(50),
@CompanyID int
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		INSERT INTO Users (Username, [Password], Email, [Type], FirstName, LastName, Companies_ID)
		VALUES (@Username,@Password,@Email,2,@FirstName,@LastName,@CompanyID)
	END TRY
	BEGIN CATCH
		SET @message = 'Записът не може да бъде добавен!';
		THROW 50007,@message,1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[NewPassword]    Script Date: 29.10.2017 г. 16:07:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewPassword]
@UserID int,
@NewPassword varchar(100)
AS
BEGIN
	DECLARE @message varchar(max)
	BEGIN TRY
		UPDATE Users
		SET [Password] = @NewPassword
		WHERE ID = @UserID
	END TRY
	BEGIN CATCH
		SET @message = 'Заявката не може да бъде изпълнена!';
		THROW 50010,@message,1
	END CATCH
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Положетелно или отрецателно число' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Increases', @level2type=N'COLUMN',@level2name=N'PosNeg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Процент или число' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Increases', @level2type=N'COLUMN',@level2name=N'TypeValue'
GO
