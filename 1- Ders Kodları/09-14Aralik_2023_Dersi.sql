create database VT_ALISVERÝS2_

USE VT_ALISVERÝS2_

create table TblMusteriler(
id int primary key identity (1,1),
isim varchar(30) not null,
soyisim varchar(30) not null,
tckn char(11) not null,
ceptel char(11) not null,
mail varchar(30) not null);

create table TblUrunKategori(
id int primary key identity(1,1),
kategori varchar(30) not null)

-----foreign key ve primary key iliþkilerinde iki deðerinde veri tipi ayný olmalý

create table TblUrunler(
id int primary key identity(1,1),
ad varchar(50) not null,
fiyat float not null,
barkod char(15) not null,
urun_kategori_id int foreign key references TblUrunKategori(id))

create table TblMusteriAlisverisTarihi(
id int primary key identity(1,1),
tarih datetime default current_timestamp)

create table TblAlisverisKayit(
alisveris_id int foreign key references TblMusteriAlisverisTarihi(id),
musteri_id int foreign key references TblMusteriler(id),
urun_id int foreign key references TblUrunler(id),
urun_fiyat float not null,
adet int not null)


drop database VT_ALISVERÝS2


insert into TblMusteriler values ('Eslem','Göl','1111','5374512552','esslemty@gmail.com'),
                                 ('Sena','Yaman','2222','5374512552','senaxyaman@gmail.com') ,
                                 ('Ali','Kaya','3333','5374512552','boshayat@gmail.com') ,
								 ('Veli','Nur','1245','5254875652','esslemty@gmail.com') 


insert into TblUrunKategori values ('GIDA'),('ÞARKÜTERÝ'),('ÇÝKOLATA'),('BÝSKÜVÝ'),('UNLU MAMÜLLER'),('TEMÝZLÝK ÜRÜNLERÝ')

insert into TblUrunler values ('Çay', 29.75, '100',1),
                              ('Makarna', 5.75, '101',1),
                              ('Tereyaðý', 49.75, '102',2), 
							  ('Tadelle', 49.75, '103',3),	
                              ('Halley', 24.50, '104',4), 	
                              ('Nero', 2.5, '105',4), 							  						  						   
                              ('Ekmek', 1.4, '106',5),
							  ('Deterjan', 35.55, '107',5)


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

select * from TblUrunler

-- 1. müsteri çay, makarna, tereyaðý ve halley tek seferde almaktadýr. 

-- çay
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,1, @fiyat, 3)

insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,1,(select fiyat from TblUrunler where id = 1), 3) -- Boyle de yapýlabilir.


select * from TblAlisverisKayit

-- makarna
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,2, @fiyat, 5)

-- tereyaðý
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 3)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,3, @fiyat, 4)
																						  
-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,5, @fiyat, 7)
																						  

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)


-- 2. müsteri çay, makarna, tereyaðý ve halley tek seferde almaktadýr. 


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,1, @fiyat, 3)


-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,2, @fiyat, 5)


-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,6, @fiyat, 5)


-- 3. müsteri çay, makarna, tereyaðý ve halley tek seferde almaktadýr. 


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 4)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,4, @fiyat, 3)


-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,2, @fiyat, 10)


-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,5, @fiyat, 8)


-- 1. müsteri tekrar alýþveriþ yapmak istiyor

insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 6)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,6, @fiyat, 3)

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,2, @fiyat, 7)

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 3)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,3, @fiyat, 4)


update TblUrunler set fiyat = 17.25 where id = 1


select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)

--------------------------------------------------------------------------------------------------------

-- 2. müsteri tekrar alýþveriþ yapmak istiyor

insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (5,2,6, @fiyat, 4)

-- halley
Declare @fiyat float -- deðiskeni deklare etmeden kullanamayýz
set @fiyat = (select fiyat from TblUrunler where id = 4)  -- fiyat deðiþkeninin içersinide id = 1 olanýn deðeri aktarýlmýþ olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (5,2,2, @fiyat, 7)

-- SORULAR --

-- id si 1 olan müþterinin alýþveriþ geçmiþi

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriler.id = 1


-- DEVAMI FARKLI VERI TABANI UZERINDEN YAPILMISTIR.

