create database quiz1
use quiz1

create table TblMusteriler(
id int primary key identity(1,1),
isim varchar(30),
soyisim varchar(30),
mail varchar(30))


create table TblMusteriAlisverisTarihi(
id int primary key  identity(1,1),
tarih varchar(30))



create table TblUrunKategori(
id int primary key  identity(1,1),
kategori varchar(30))



create table TblUrunler(
id int primary key  identity(1,1),
ad varchar(30),
fiyat float,
barkod char(15),
urun_kategori_id int foreign key references TblUrunKategori(id))



create table TblAlisverisKayit(
alisveris_id int foreign key references TblMusteriAlisverisTarihi(id),
musteri_id int foreign key references TblMusteriler(id),
urun_id int foreign key references TblUrunler(id),
urun_fiyat float,
adet int)


insert into TblMusteriler values('Ali','KAYA','ak@com.tr'),
								('Hasan','ALAN','ha@com.tr'),
								('Ayse','Bilir','ab@com.tr')


insert into TblUrunKategori values('GIDA'),
								  ('SARKÜTERÝ'),
								  ('ÇÝKOLATA'),
								  ('BISKÜVI'),
								  ('UNLU MAMÜLLER'),
								  ('TEMIZLIK ÜRÜNLERI')



insert into TblMusteriAlisverisTarihi values('2022-11-09 12:52:03.987'),
											('2022-11-09 12:53:21.640'),
											('2022-11-09 12:53:44.877'),
											('2022-11-09 12:54:17.720'),
											('2022-11-09 12:55:09.670')

insert into TblUrunler values('Peynir',17.25,100,2),
							 ('Yumurta',23.5,101,1),
							 ('Çay',19.5,102,1),
							 ('Halley',1.5,103,4),
							 ('Negro',2.5,104,4),
							 ('Deterjan',35.55,105,6)


insert into TblAlisverisKayit values (1,1,1,15,3),
									 (1,1,2,23.5,5),
									 (1,1,3,19.5,4),
									 (1,1,5,2.5,4),
									 (2,2,1,15,3),
									 (2,2,2,23.5,5),
									 (2,2,6,35.55,5),
									 (3,3,4,1.5,3),
									 (3,3,2,23.5,10),
									 (3,3,5,2.5,8),
									 (4,1,6,33.55,3),
									 (4,1,2,23.5,7),
									 (4,1,3,19.5,4),
									 (5,2,1,17.25,4),
									 (5,2,4,1.5,7)

-------------------- 1.Soru --------------------						
select TblAlisverisKayit.alisveris_id,TblMusteriler.isim, TblMusteriler.soyisim, TblUrunler.ad, TblUrunler.fiyat, TblMusteriAlisverisTarihi.tarih from TblAlisverisKayit 
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id
inner join TblUrunler on TblAlisverisKayit.urun_id = TblUrunler.id 
inner join TblMusteriAlisverisTarihi on TblAlisverisKayit.alisveris_id = TblMusteriAlisverisTarihi.id



-------------------- 2.Soru --------------------	
select sum(urun_fiyat*adet) as TOPLAM_ALISCERIS_TUTARI from TblAlisverisKayit



-------------------- 3.Soru --------------------	
select sum(urun_fiyat*adet) from TblAlisverisKayit group by musteri_id



-------------------- 4.Soru --------------------   inner join ile dene
select TblAlisverisKayit.musteri_id, TblMusteriler.isim, TblMusteriler.soyisim,sum(urun_fiyat*adet)  from 
TblAlisverisKayit, TblMusteriler where TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblAlisverisKayit.musteri_id, TblMusteriler.isim, TblMusteriler.soyisim



-------------------- 5.Soru --------------------
select TblMusteriler.isim, TblMusteriler.soyisim,sum(urun_fiyat*adet)  from 
TblAlisverisKayit, TblMusteriler where TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.isim, TblMusteriler.soyisim order by sum(urun_fiyat*adet) asc


select TblMusteriler.isim, TblMusteriler.soyisim,sum(urun_fiyat*adet)  from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.isim, TblMusteriler.soyisim order by sum(urun_fiyat*adet) asc



-------------------- 6.Soru --------------------
select top 1 TblMusteriler.isim, TblMusteriler.soyisim,sum(urun_fiyat*adet)  from 
TblAlisverisKayit, TblMusteriler where TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.isim, TblMusteriler.soyisim order by sum(urun_fiyat*adet) desc


-------------------- 7.Soru ------------------
select alisveris_id, urun_fiyat*adet  from TblAlisverisKayit 


-------------------- 8.Soru ------------------
select alisveris_id, sum(urun_fiyat*adet)  from TblAlisverisKayit group by alisveris_id



-------------------- 9.Soru ------------------
select sum(urun_fiyat*adet)/count(*) from TblAlisverisKayit
select avg(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as tutar from TblAlisverisKayit


-------------------- 10.Soru ------------------
select TblMusteriler.isim, TblMusteriler.soyisim, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) from 
TblAlisverisKayit,TblMusteriler where TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.isim, TblMusteriler.soyisim having sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet)>300



select sum(urun_fiyat*adet) from TblAlisverisKayit
select TblAlisverisKayit.musteri_id, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) from TblAlisverisKayit group by TblAlisverisKayit.musteri_id

select TblMusteriler.id, TblMusteriler.isim, TblMusteriler.soyisim, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.id, TblMusteriler.isim, TblMusteriler.soyisim

select TblMusteriler.isim, TblMusteriler.soyisim, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.id, TblMusteriler.isim, TblMusteriler.soyisim order by sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet)

select top 1 TblMusteriler.isim, TblMusteriler.soyisim, sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) from TblAlisverisKayit
inner join TblMusteriler on TblAlisverisKayit.musteri_id = TblMusteriler.id group by TblMusteriler.id, TblMusteriler.isim, TblMusteriler.soyisim order by sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) desc

