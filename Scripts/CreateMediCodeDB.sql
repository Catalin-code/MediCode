USE [master]
GO
/****** Object:  Database [MediCode]    Script Date: 8/18/2021 6:25:32 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'MediCode')
BEGIN
CREATE DATABASE [MediCode]
END
GO
ALTER DATABASE [MediCode] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MediCode].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MediCode] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MediCode] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MediCode] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MediCode] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MediCode] SET ARITHABORT OFF 
GO
ALTER DATABASE [MediCode] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MediCode] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MediCode] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MediCode] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MediCode] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MediCode] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MediCode] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MediCode] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MediCode] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MediCode] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MediCode] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MediCode] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MediCode] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MediCode] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MediCode] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MediCode] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MediCode] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MediCode] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MediCode] SET  MULTI_USER 
GO
ALTER DATABASE [MediCode] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MediCode] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MediCode] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MediCode] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MediCode] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MediCode] SET QUERY_STORE = OFF
GO
USE [MediCode]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MediCode]
GO
/****** Object:  Table [dbo].[drugs]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[drugs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[drugs](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[dosage] [int] NULL,
	[prescription_id] [int] NULL,
 CONSTRAINT [PK_drugs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[patients]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[patients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[patients](
	[id] [int] NOT NULL,
	[last_name] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[birth_date] [datetime] NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[prescriptions]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prescriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prescriptions](
	[id] [int] NOT NULL,
	[series] [nvarchar](50) NULL,
	[number] [nvarchar](50) NULL,
	[issue_date] [datetime] NULL,
	[patient_id] [int] NULL,
 CONSTRAINT [PK_prescriptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (1, N'ibuprofen', 24, 4, 1)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (2, N'cough drops', 1, 3, 1)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (3, N'paracetamol', 24, 3, 2)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (4, N'vitamin c', 32, 4, 2)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (5, N'nasal spray', 1, 2, 3)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (6, N'cough drops', 1, 3, 3)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (7, N'vitamin c', 32, 4, 3)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (8, N'allergy tablets', 60, 1, 4)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (9, N'ibuprofen', 24, 4, 5)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (10, N'vitamin c', 32, 4, 5)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (11, N'immunity booster', 16, 1, 6)
INSERT [dbo].[drugs] ([id], [name], [quantity], [dosage], [prescription_id]) VALUES (12, N'vitamin c', 32, 4, 6)
GO
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (1, N'Aldea', N'Vlad', CAST(N'1987-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (2, N'Ionescu', N'Madalina', CAST(N'1995-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (3, N'Dumitrescu', N'Ion', CAST(N'1990-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (4, N'Stanciu', N'Pavel', CAST(N'2000-01-31T00:00:00.000' AS DateTime))
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (5, N'Chirila', N'Andrei', CAST(N'1975-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[patients] ([id], [last_name], [first_name], [birth_date]) VALUES (6, N'Toma', N'Andreea', CAST(N'1998-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (1, N'VDFV', N'63956', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (2, N'NFBF', N'53952', CAST(N'2021-04-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (3, N'BCFD', N'39593', CAST(N'2021-08-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (4, N'MIED', N'18493', CAST(N'2021-12-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (5, N'FGHV', N'89324', CAST(N'2021-07-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[prescriptions] ([id], [series], [number], [issue_date], [patient_id]) VALUES (6, N'JLFJ', N'29563', CAST(N'2021-01-31T00:00:00.000' AS DateTime), 3)
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_drugs_prescriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[drugs]'))
ALTER TABLE [dbo].[drugs]  WITH CHECK ADD  CONSTRAINT [FK_drugs_prescriptions] FOREIGN KEY([prescription_id])
REFERENCES [dbo].[prescriptions] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_drugs_prescriptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[drugs]'))
ALTER TABLE [dbo].[drugs] CHECK CONSTRAINT [FK_drugs_prescriptions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_prescriptions_patients]') AND parent_object_id = OBJECT_ID(N'[dbo].[prescriptions]'))
ALTER TABLE [dbo].[prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_prescriptions_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_prescriptions_patients]') AND parent_object_id = OBJECT_ID(N'[dbo].[prescriptions]'))
ALTER TABLE [dbo].[prescriptions] CHECK CONSTRAINT [FK_prescriptions_patients]
GO
/****** Object:  StoredProcedure [dbo].[create_drug]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_drug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[create_drug] AS' 
END
GO
ALTER PROC [dbo].[create_drug]
@id int,
@name nvarchar(50),
@quantity int,
@dosage int,
@prescription_id int
AS
BEGIN
INSERT INTO drugs(id, name, quantity, dosage, prescription_id)
VALUES (@id, @name, @quantity, @dosage, @prescription_id)
END
GO
/****** Object:  StoredProcedure [dbo].[create_patient]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_patient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[create_patient] AS' 
END
GO
ALTER PROC [dbo].[create_patient]
@id int,
@last_name nvarchar(50),
@first_name nvarchar(50),
@birth_date datetime
AS
BEGIN
INSERT INTO patients(id, last_name, first_name, birth_date)
VALUES (@id, @last_name, @first_name, @birth_date)
END
GO
/****** Object:  StoredProcedure [dbo].[create_prescription]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[create_prescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[create_prescription] AS' 
END
GO
ALTER PROC [dbo].[create_prescription]
@id int,
@series nvarchar(50),
@number nvarchar(50),
@issue_date datetime,
@patient_id int
AS
BEGIN
INSERT INTO prescriptions(id, series, number, issue_date, patient_id)
VALUES (@id, @series, @number, @issue_date, @patient_id)
END
GO
/****** Object:  StoredProcedure [dbo].[delete_drug]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_drug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[delete_drug] AS' 
END
GO
ALTER PROC [dbo].[delete_drug]
@id int
AS
BEGIN
DELETE drugs
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[delete_patient]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_patient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[delete_patient] AS' 
END
GO
ALTER PROC [dbo].[delete_patient]
@id int
AS
BEGIN
DELETE patients
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[delete_prescription]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[delete_prescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[delete_prescription] AS' 
END
GO
ALTER PROC [dbo].[delete_prescription]
@id int
AS
BEGIN
DELETE prescriptions
WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[get_drugs_report]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_drugs_report]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_drugs_report] AS' 
END
GO
ALTER PROC [dbo].[get_drugs_report]
@start_date datetime,
@end_date datetime
AS
BEGIN
SELECT drugs.name, SUM(drugs.quantity) AS quantity FROM drugs
FULL JOIN prescriptions ON drugs.prescription_id = prescriptions.id
WHERE prescriptions.issue_date BETWEEN @start_date AND @end_date
GROUP BY drugs.name
ORDER BY quantity DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_patients_report]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_patients_report]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[get_patients_report] AS' 
END
GO
ALTER PROC [dbo].[get_patients_report]
@start_date datetime,
@end_date datetime
AS
BEGIN
SELECT patients.last_name, patients.first_name, COUNT(prescriptions.id) FROM patients
INNER JOIN prescriptions ON prescriptions.patient_id = patients.id
WHERE prescriptions.issue_date BETWEEN @start_date AND @end_date
GROUP BY patients.last_name, patients.first_name
END
GO
/****** Object:  StoredProcedure [dbo].[read_drugs]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[read_drugs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[read_drugs] AS' 
END
GO
ALTER PROC [dbo].[read_drugs]
AS
BEGIN
SELECT * FROM drugs
END
GO
/****** Object:  StoredProcedure [dbo].[read_patients]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[read_patients]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[read_patients] AS' 
END
GO
ALTER PROC [dbo].[read_patients]
AS
BEGIN
SELECT * FROM patients
END
GO
/****** Object:  StoredProcedure [dbo].[read_prescriptions]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[read_prescriptions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[read_prescriptions] AS' 
END
GO
ALTER PROC [dbo].[read_prescriptions]
AS
BEGIN
SELECT * FROM prescriptions
END
GO
/****** Object:  StoredProcedure [dbo].[update_drug]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[update_drug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[update_drug] AS' 
END
GO
ALTER PROC [dbo].[update_drug]
@id int,
@name nvarchar(50),
@quantity int,
@dosage int,
@prescription_id int
AS
BEGIN
UPDATE drugs SET name = @name, quantity = @quantity, dosage = @dosage, prescription_id = @prescription_id
WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[update_patient]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[update_patient]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[update_patient] AS' 
END
GO
ALTER PROC [dbo].[update_patient]
@id int,
@last_name nvarchar(50),
@first_name nvarchar(50),
@birth_date datetime
AS
BEGIN
UPDATE patients SET last_name = @last_name, first_name = @first_name, birth_date = @birth_date
WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[update_prescription]    Script Date: 8/18/2021 6:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[update_prescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[update_prescription] AS' 
END
GO
ALTER PROC [dbo].[update_prescription]
@id int,
@series nvarchar(50),
@number nvarchar(50),
@issue_date datetime,
@patient_id int
AS
BEGIN
UPDATE prescriptions SET series = @series, number = @number, issue_date = @issue_date, patient_id = @patient_id
WHERE id = @id
END
GO
USE [master]
GO
ALTER DATABASE [MediCode] SET  READ_WRITE 
GO
