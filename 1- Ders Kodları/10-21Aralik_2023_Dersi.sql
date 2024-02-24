use VT_ALISVERIS2

create table Tblcinsiyet(
id int primary key,
cinsiyet varchar(10) not null)

insert into Tblcinsiyet values (1,'Kadýn'),
							   (2, 'Erkek'),
							   (3,'Bilinmeyen')

Alter table TblMusteriler add cinsId int foreign key references  Tblcinsiyet(id)


select * from TblMusteriler
select * from Tblcinsiyet


-- default constraint
alter table TblMusteriler add constraint DF_TblMusteriler_cinsId default 3 for cinsId -- bundan sonraki atamalarda default --> 3

insert into TblMusteriler (isim,soyisim,mail) values ('Veli','Atak','va@gmail.com'),
													 ('Ayhan','AKAN','aa@gmail.com')


insert into TblMusteriler values ('Fatma','Daðlý','fd@gmail.com',1)

insert into TblMusteriler values ('Ayhan','Akan','aa@gmail.com',null)



-- ***************************************************************************************************************************

/* NOT: Alter komutu ile yeni eklemek istenen alan þu özelliklereden birine sahip olmalýdýr.
	1. Null deðer alabilmeli veya default deðer tanýmlý olmalýdýr.
	2. Identity veya timestamp alaný olmaýldýr.
	3. 1. veya 2. durum saðlanmadýysa tablo tamamen boþ olmalýdýr.
*/

-- Varsayýlan deðer kýsmýný daha sonra kaldýrmak istediðimizi düþünelim !!!

-- alter table TblMusteriler drop constraint DF_TblMusteriler_cinsID -- Ya da arayüz ile sileceksin!!!

-- ***************************************************************************************************************************


--delete from TblCinsiyet where id=1 -- Baþka bir tabloda foreign key olarak kullanýlýyor.
-- Relationship'de delete rule --> Primary key'i silmeye çalýþýrsak diðer tabloda foreign key durumu varsa hata alacaðýz.
-- DELETE RULE


select * from TblMusteriler

-- foreign key silinmeye çalýþýþdýðý zaman 4 ihtimalden biri gerçekleþir vardýr.
-- 1. primary alan silmeye izin vermez. (No Action)
-- 2. primary'i ve foreign key olarak kullanan satýrý da sil. (Cascade)
-- 3. primary key alan silinir, foreign key olarak kullanýlane deðer null yapar. (Set Null)
-- 4. primary key alan silinir, foreign key olarak kullanýlane deðer default yapar. (Set Default)


-- Mantýklý olan --> Aktif bir sutun deðeri atar. Cascade kullanmaz !!!

insert into TblMusteriler values ('Dilek','Koc','dk@gmail.com',1)


insert into TblMusteriler values ('Kamil','Koc','kk@gmail.com',2)


delete from Tblcinsiyet where id = 2 -- silme iþleminin gerçekleþebilirmesi için tukarýdaki seçeneklerden birinin iþaretlenmesi gerekmektedir.

insert into TblUrunler values ('Yogurt',-25,'1215',2) -- fiyat "-25" olarak eklendi, bunu engellemek için aþaðýdaki iþlemler yapýlýr.

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
