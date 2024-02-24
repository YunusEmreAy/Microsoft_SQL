create database VT_ALISVER�S2_

USE VT_ALISVER�S2_

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

-----foreign key ve primary key ili�kilerinde iki de�erinde veri tipi ayn� olmal�

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


drop database VT_ALISVER�S2


insert into TblMusteriler values ('Eslem','G�l','1111','5374512552','esslemty@gmail.com'),
                                 ('Sena','Yaman','2222','5374512552','senaxyaman@gmail.com') ,
                                 ('Ali','Kaya','3333','5374512552','boshayat@gmail.com') ,
								 ('Veli','Nur','1245','5254875652','esslemty@gmail.com') 


insert into TblUrunKategori values ('GIDA'),('�ARK�TER�'),('��KOLATA'),('B�SK�V�'),('UNLU MAM�LLER'),('TEM�ZL�K �R�NLER�')

insert into TblUrunler values ('�ay', 29.75, '100',1),
                              ('Makarna', 5.75, '101',1),
                              ('Tereya��', 49.75, '102',2), 
							  ('Tadelle', 49.75, '103',3),	
                              ('Halley', 24.50, '104',4), 	
                              ('Nero', 2.5, '105',4), 							  						  						   
                              ('Ekmek', 1.4, '106',5),
							  ('Deterjan', 35.55, '107',5)


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

select * from TblUrunler

-- 1. m�steri �ay, makarna, tereya�� ve halley tek seferde almaktad�r. 

-- �ay
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,1, @fiyat, 3)

insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,1,(select fiyat from TblUrunler where id = 1), 3) -- Boyle de yap�labilir.


select * from TblAlisverisKayit

-- makarna
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,2, @fiyat, 5)

-- tereya��
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 3)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,3, @fiyat, 4)
																						  
-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (1,1,5, @fiyat, 7)
																						  

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)


-- 2. m�steri �ay, makarna, tereya�� ve halley tek seferde almaktad�r. 


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,1, @fiyat, 3)


-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,2, @fiyat, 5)


-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (2,2,6, @fiyat, 5)


-- 3. m�steri �ay, makarna, tereya�� ve halley tek seferde almaktad�r. 


insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 4)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,4, @fiyat, 3)


-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,2, @fiyat, 10)


-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 5)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (3,3,5, @fiyat, 8)


-- 1. m�steri tekrar al��veri� yapmak istiyor

insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 6)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,6, @fiyat, 3)

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 2)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,2, @fiyat, 7)

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 3)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (4,1,3, @fiyat, 4)


update TblUrunler set fiyat = 17.25 where id = 1


select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)

--------------------------------------------------------------------------------------------------------

-- 2. m�steri tekrar al��veri� yapmak istiyor

insert into TblMusteriAlisverisTarihi (tarih) values (current_timestamp);

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 1)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (5,2,6, @fiyat, 4)

-- halley
Declare @fiyat float -- de�iskeni deklare etmeden kullanamay�z
set @fiyat = (select fiyat from TblUrunler where id = 4)  -- fiyat de�i�keninin i�ersinide id = 1 olan�n de�eri aktar�lm�� olur.
insert into TblAlisverisKayit (alisveris_id,musteri_id, urun_id, urun_fiyat, adet ) values (5,2,2, @fiyat, 7)

-- SORULAR --

-- id si 1 olan m��terinin al��veri� ge�mi�i

select TblAlisverisKayit.alisveris_id, TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblAlisverisKayit.urun_fiyat as Eski_Fiyat, TblUrunler.fiyat as Yeni_Fiyat, TblAlisverisKayit.adet, TblMusteriAlisverisTarihi.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id)
where TblMusteriler.id = 1


-- DEVAMI FARKLI VERI TABANI UZERINDEN YAPILMISTIR.

