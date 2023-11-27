USE [stok_takip_12a_db]
GO
/****** Object:  Table [dbo].[TblKullanicilar]    Script Date: 27.11.2023 10:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKullanicilar](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](50) NOT NULL,
	[Yetki] [int] NULL,
 CONSTRAINT [PK_TblKullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblStokGiris]    Script Date: 27.11.2023 10:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblStokGiris](
	[IslemId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[Adet] [float] NOT NULL,
	[BirimFiyat] [float] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[PersonelId] [int] NOT NULL,
	[Silindi] [bit] NULL,
 CONSTRAINT [PK_TblStokGiris] PRIMARY KEY CLUSTERED 
(
	[IslemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblTedarikciler]    Script Date: 27.11.2023 10:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTedarikciler](
	[TedarikciId] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](100) NOT NULL,
	[YetkiliAdSoyad] [nvarchar](50) NULL,
	[Adres] [nvarchar](100) NULL,
	[Tel] [nvarchar](13) NULL,
	[Mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
