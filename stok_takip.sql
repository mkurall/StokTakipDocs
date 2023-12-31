USE [stok_takip_db]
GO
/****** Object:  Table [dbo].[TblKategoriler]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKategoriler](
	[KategaoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblKategoriler] PRIMARY KEY CLUSTERED 
(
	[KategaoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblKullanicilar]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKullanicilar](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](50) NOT NULL,
	[Yetki] [int] NULL,
 CONSTRAINT [PK_TblKullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblMusteriler]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMusteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](100) NOT NULL,
	[YetkiliAdSoyad] [nvarchar](30) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Mail] [nvarchar](50) NULL,
	[Adres] [nvarchar](100) NULL,
 CONSTRAINT [PK_TblMusteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblStokCikis]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblStokCikis](
	[IslemId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NOT NULL,
	[MusteriId] [int] NOT NULL,
	[BirimFiyat] [float] NOT NULL,
	[Adet] [float] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[IslemYapanPersonelId] [int] NOT NULL,
 CONSTRAINT [PK_TblStokCikis] PRIMARY KEY CLUSTERED 
(
	[IslemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblStokGiris]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblStokGiris](
	[IslemId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[BirimFiyat] [float] NOT NULL,
	[Adet] [float] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[IslemYapanPersonelId] [int] NOT NULL,
 CONSTRAINT [PK_TblStokGiris] PRIMARY KEY CLUSTERED 
(
	[IslemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblTedarikciler]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTedarikciler](
	[TedarikciId] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](100) NOT NULL,
	[YetkiliAdSoyad] [nvarchar](30) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Mail] [nvarchar](50) NULL,
	[Adres] [nvarchar](100) NULL,
 CONSTRAINT [PK_TblTedarikciler] PRIMARY KEY CLUSTERED 
(
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblUrunler]    Script Date: 30.11.2023 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUrunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunKodu] [nvarchar](10) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[UrunAd] [nvarchar](50) NOT NULL,
	[BirimId] [int] NOT NULL,
	[UrunAciklama] [nvarchar](100) NULL,
	[MinStok] [float] NULL,
	[MaksStok] [float] NULL,
 CONSTRAINT [PK_TblUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TblStokCikis]  WITH CHECK ADD  CONSTRAINT [FK_TblStokCikis_TblKullanicilar] FOREIGN KEY([IslemYapanPersonelId])
REFERENCES [dbo].[TblKullanicilar] ([KullaniciId])
GO
ALTER TABLE [dbo].[TblStokCikis] CHECK CONSTRAINT [FK_TblStokCikis_TblKullanicilar]
GO
ALTER TABLE [dbo].[TblStokCikis]  WITH CHECK ADD  CONSTRAINT [FK_TblStokCikis_TblMusteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[TblMusteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[TblStokCikis] CHECK CONSTRAINT [FK_TblStokCikis_TblMusteriler]
GO
ALTER TABLE [dbo].[TblStokCikis]  WITH CHECK ADD  CONSTRAINT [FK_TblStokCikis_TblUrunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[TblUrunler] ([UrunId])
GO
ALTER TABLE [dbo].[TblStokCikis] CHECK CONSTRAINT [FK_TblStokCikis_TblUrunler]
GO
ALTER TABLE [dbo].[TblStokGiris]  WITH CHECK ADD  CONSTRAINT [FK_TblStokGiris_TblKullanicilar] FOREIGN KEY([IslemYapanPersonelId])
REFERENCES [dbo].[TblKullanicilar] ([KullaniciId])
GO
ALTER TABLE [dbo].[TblStokGiris] CHECK CONSTRAINT [FK_TblStokGiris_TblKullanicilar]
GO
ALTER TABLE [dbo].[TblStokGiris]  WITH CHECK ADD  CONSTRAINT [FK_TblStokGiris_TblTedarikciler] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[TblTedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[TblStokGiris] CHECK CONSTRAINT [FK_TblStokGiris_TblTedarikciler]
GO
ALTER TABLE [dbo].[TblStokGiris]  WITH CHECK ADD  CONSTRAINT [FK_TblStokGiris_TblUrunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[TblUrunler] ([UrunId])
GO
ALTER TABLE [dbo].[TblStokGiris] CHECK CONSTRAINT [FK_TblStokGiris_TblUrunler]
GO
ALTER TABLE [dbo].[TblUrunler]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunler_TblKategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[TblKategoriler] ([KategaoriId])
GO
ALTER TABLE [dbo].[TblUrunler] CHECK CONSTRAINT [FK_TblUrunler_TblKategoriler]
GO
