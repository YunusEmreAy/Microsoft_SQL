create database vt_alisveris
use vt_alisveris


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


create table TblAlisverisKayit(
alisveris_id int primary key identity(1,1),
musteri_id int foreign key references TblMusteriler(id),
urun_id int foreign key references TblUrunler(id),
adet int not null,
tarih datetime default current_timestamp )

---------------------------------

insert into TblMusteriler values ('Eslem','Göl','1111','5374512552','esslemty@gmail.com'),
                                 ('Sena','Yaman','2222','5374512552','senaxyaman@gmail.com') ,
                                 ('Ali','Kaya','3333','5374512552','boshayat@gmail.com') ,
								 ('Veli','Nur','1245','5254875652','esslemty@gmail.com') 

select * from TblMusteriler

insert into TblUrunKategori values ('GIDA'),('ÞARKÜTERÝ'),('ÇÝKOLATA'),('UNLU MAMÜLLER'),('TEMÝZLÝK ÜRÜNLERÝ')

select * from TblUrunKategori

insert into TblUrunler values ('Çay', 29.75, '100',1),
                              ('Makarna', 5.75, '101',1),
                              ('Tereyaðý', 49.75, '102',2), 
							  ('Tadelle', 49.75, '103',3),	
                              ('Halley', 24.50, '104',4), 	
                              ('Nero', 2.5, '105',4), 							  						  						   
                              ('Ekmek', 1.4, '106',5),
							  ('Deterjan', 35.55, '107',5)

select * from TblUrunler

insert into TblAlisverisKayit (musteri_id, urun_id, adet ) values (1,2,5),
                                                                  (2,5,3),
								                            	  (3,7,2),
									                              (1,6,4)
															 
															
insert into TblAlisverisKayit (musteri_id, urun_id, adet ) values (2,4,5)																  

select * from TblAlisverisKayit

---------------------------------------
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih from( TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id  )



-- Aþaðýda yazýlmýþ olan sorgunun yukarýda yazýlmýþ olan sorgudan farký:
--Aþaðýda yazýlan sorgu sonucunda 3 ayrý tablonun kartezyen çarpýmý gerçekleþir. "Where" sorgusu ile bu kartezyen çarpýmý snucunda oluþan çýktýda filtreleme yapýlýr.
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih 
from TblAlisverisKayit, TblUrunler, TblMusteriler where (TblAlisverisKayit.urun_id = TblUrunler.id) and TblAlisverisKayit.musteri_id = TblMusteriler.id 


select * from TblUrunler
select * from TblUrunKategori

select TblUrunler.ad, TblUrunler.barkod, TblUrunler.fiyat, TblUrunKategori.kategori from TblUrunler, TblUrunKategori -- Dikkat! Kartezyen Çarpým.
where TblUrunler.urun_kategori_id = TblUrunKategori.id

select * from TblUrunler, TblUrunKategori

SELECT tblUrunler.ad, tblUrunler.barkod,tblUrunler.fiyat,tblUrunKategori.kategori
FROM tblUrunler INNER JOIN tblUrunKategori ON tblUrunler.urun_kategori_id = tblUrunKategori.id


select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id )



----------------------------- 4lü sorgu (inner join) -----------------------------
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih, TblUrunKategori.kategori from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblUrunKategori on TblUrunler.urun_kategori_id = TblUrunKategori.id



----------------------------- 4lü sorgu (where) -----------------------------
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih, TblUrunKategori.kategori 
from TblMusteriler, TblUrunler, TblAlisverisKayit, TblUrunKategori  -- Dikkat! Kartezyen Çarpým.
where (TblAlisverisKayit.musteri_id = TblMusteriler.id) and (TblAlisverisKayit.urun_id = TblUrunler.id) and (TblUrunler.urun_kategori_id = TblUrunKategori.id)

