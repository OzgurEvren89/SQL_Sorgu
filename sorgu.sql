CREATE DATABASE SqlSinavi;
GO
USE [SqlSinavi]
GO
CREATE TABLE Urunler(
   Site varchar(500),
   Urun varchar(500),
   Fiyat decimal(18, 2)
);
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Teknosa','AppleIphone8',6000.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Hepsiburada','AppleIphone8',6120.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('MediaMarkt','AppleIphone8',5869.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Amazon','AppleIphone8',6000.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Teknosa','PS4',3999.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Hepsiburada','PS4',3999.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('MediaMarkt','PS4',3999.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Amazon','PS4',3850.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Teknosa','AppleMacBookPro',10999.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Hepsiburada','AppleMacBookPro',11250.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('MediaMarkt','AppleMacBookPro',10899.00)
GO
INSERT INTO [dbo].[Urunler]([Site],[Urun],[Fiyat])VALUES('Amazon','AppleMacBookPro',13450.00)
GO

select u.Urun as Urun,
	(select p.Site from Urunler p where p.Urun=U.Urun and p.Fiyat = Min(u.Fiyat)) as MinFiyatSiteAdi,
       MIN(U.Fiyat) as MinimumFiyat,
	   (select top(1) p.Site from Urunler p where p.Urun=U.Urun and p.Fiyat = Max(u.Fiyat)) as MaxFiyatSiteAdi,
       MAX(U.Fiyat) as MaksimumFiyat,
	   AVG(U.Fiyat) as OrtalamaFiyat
from Urunler u
Group By u.Urun