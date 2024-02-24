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

-----foreign key ve primary key ili�kilerinde iki de�erinde veri tipi ayn� olmal�


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

insert into TblMusteriler values ('Eslem','G�l','1111','5374512552','esslemty@gmail.com'),
                                 ('Sena','Yaman','2222','5374512552','senaxyaman@gmail.com') ,
                                 ('Ali','Kaya','3333','5374512552','boshayat@gmail.com') ,
								 ('Veli','Nur','1245','5254875652','esslemty@gmail.com') 

select * from TblMusteriler

insert into TblUrunKategori values ('GIDA'),('�ARK�TER�'),('��KOLATA'),('UNLU MAM�LLER'),('TEM�ZL�K �R�NLER�')

select * from TblUrunKategori

insert into TblUrunler values ('�ay', 29.75, '100',1),
                              ('Makarna', 5.75, '101',1),
                              ('Tereya��', 49.75, '102',2), 
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



-- A�a��da yaz�lm�� olan sorgunun yukar�da yaz�lm�� olan sorgudan fark�:
--A�a��da yaz�lan sorgu sonucunda 3 ayr� tablonun kartezyen �arp�m� ger�ekle�ir. "Where" sorgusu ile bu kartezyen �arp�m� snucunda olu�an ��kt�da filtreleme yap�l�r.
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih 
from TblAlisverisKayit, TblUrunler, TblMusteriler where (TblAlisverisKayit.urun_id = TblUrunler.id) and TblAlisverisKayit.musteri_id = TblMusteriler.id 


select * from TblUrunler
select * from TblUrunKategori

select TblUrunler.ad, TblUrunler.barkod, TblUrunler.fiyat, TblUrunKategori.kategori from TblUrunler, TblUrunKategori -- Dikkat! Kartezyen �arp�m.
where TblUrunler.urun_kategori_id = TblUrunKategori.id

select * from TblUrunler, TblUrunKategori

SELECT tblUrunler.ad, tblUrunler.barkod,tblUrunler.fiyat,tblUrunKategori.kategori
FROM tblUrunler INNER JOIN tblUrunKategori ON tblUrunler.urun_kategori_id = tblUrunKategori.id


select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih from (TblAlisverisKayit 
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunKategori on TblUrunKategori.id = TblUrunler.urun_kategori_id )



----------------------------- 4l� sorgu (inner join) -----------------------------
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih, TblUrunKategori.kategori from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id
inner join TblUrunKategori on TblUrunler.urun_kategori_id = TblUrunKategori.id



----------------------------- 4l� sorgu (where) -----------------------------
select TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblAlisverisKayit.tarih, TblUrunKategori.kategori 
from TblMusteriler, TblUrunler, TblAlisverisKayit, TblUrunKategori  -- Dikkat! Kartezyen �arp�m.
where (TblAlisverisKayit.musteri_id = TblMusteriler.id) and (TblAlisverisKayit.urun_id = TblUrunler.id) and (TblUrunler.urun_kategori_id = TblUrunKategori.id)

