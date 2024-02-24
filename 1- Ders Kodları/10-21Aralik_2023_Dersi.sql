use VT_ALISVERIS2

create table Tblcinsiyet(
id int primary key,
cinsiyet varchar(10) not null)

insert into Tblcinsiyet values (1,'Kad�n'),
							   (2, 'Erkek'),
							   (3,'Bilinmeyen')

Alter table TblMusteriler add cinsId int foreign key references  Tblcinsiyet(id)


select * from TblMusteriler
select * from Tblcinsiyet


-- default constraint
alter table TblMusteriler add constraint DF_TblMusteriler_cinsId default 3 for cinsId -- bundan sonraki atamalarda default --> 3

insert into TblMusteriler (isim,soyisim,mail) values ('Veli','Atak','va@gmail.com'),
													 ('Ayhan','AKAN','aa@gmail.com')


insert into TblMusteriler values ('Fatma','Da�l�','fd@gmail.com',1)

insert into TblMusteriler values ('Ayhan','Akan','aa@gmail.com',null)



-- ***************************************************************************************************************************

/* NOT: Alter komutu ile yeni eklemek istenen alan �u �zelliklereden birine sahip olmal�d�r.
	1. Null de�er alabilmeli veya default de�er tan�ml� olmal�d�r.
	2. Identity veya timestamp alan� olma�ld�r.
	3. 1. veya 2. durum sa�lanmad�ysa tablo tamamen bo� olmal�d�r.
*/

-- Varsay�lan de�er k�sm�n� daha sonra kald�rmak istedi�imizi d���nelim !!!

-- alter table TblMusteriler drop constraint DF_TblMusteriler_cinsID -- Ya da aray�z ile sileceksin!!!

-- ***************************************************************************************************************************


--delete from TblCinsiyet where id=1 -- Ba�ka bir tabloda foreign key olarak kullan�l�yor.
-- Relationship'de delete rule --> Primary key'i silmeye �al���rsak di�er tabloda foreign key durumu varsa hata alaca��z.
-- DELETE RULE


select * from TblMusteriler

-- foreign key silinmeye �al����d��� zaman 4 ihtimalden biri ger�ekle�ir vard�r.
-- 1. primary alan silmeye izin vermez. (No Action)
-- 2. primary'i ve foreign key olarak kullanan sat�r� da sil. (Cascade)
-- 3. primary key alan silinir, foreign key olarak kullan�lane de�er null yapar. (Set Null)
-- 4. primary key alan silinir, foreign key olarak kullan�lane de�er default yapar. (Set Default)


-- Mant�kl� olan --> Aktif bir sutun de�eri atar. Cascade kullanmaz !!!

insert into TblMusteriler values ('Dilek','Koc','dk@gmail.com',1)


insert into TblMusteriler values ('Kamil','Koc','kk@gmail.com',2)


delete from Tblcinsiyet where id = 2 -- silme i�leminin ger�ekle�ebilirmesi i�in tukar�daki se�eneklerden birinin i�aretlenmesi gerekmektedir.

insert into TblUrunler values ('Yogurt',-25,'1215',2) -- fiyat "-25" olarak eklendi, bunu engellemek i�in a�a��daki i�lemler yap�l�r.

update TblUrunler set fiyat = 25 where fiyat < 0
alter table TblUrunler add constraint CK_TblUrunler_fiyatkontrol check (fiyat>0 and fiyat<1000)
-------------------------------------------------------------------------------------------------------------------------
-- VIEW (sanal tablo)

select TblUrunKategori.kategori, count(*) as URUN_SAYISI from TblUrunKategori 
inner join TblUrunler on TblUrunKategori.id = TblUrunler.urun_kategori_id group by TblUrunKategori.kategori

create view vwKategoriyeGoreUrunSayisi as  -- sanal tablo olusturduk
select TblUrunKategori.kategori, count(*) as URUN_SAYISI from TblUrunKategori 
inner join TblUrunler on TblUrunKategori.id = TblUrunler.urun_kategori_id group by TblUrunKategori.kategori

select * from vwKategoriyeGoreUrunSayisi

drop view vwKategoriyeGoreUrunSayisi -- sanal tabloyu siler


create view vwKategoriyeGoreUrunSayisiBiskuvi as  -- sanal tablo olusturduk
select TblUrunKategori.kategori, count(*) as URUN_SAYISI from TblUrunKategori 
inner join TblUrunler on TblUrunKategori.id = TblUrunler.urun_kategori_id where TblUrunKategori.kategori = 'Biskuvi' group by TblUrunKategori.kategori

select * from vwKategoriyeGoreUrunSayisiBiskuvi
