select * from YAZARLAR

alter table yazarlar alter column yazar_no int not null;
alter table yazarlar add constraint pk_yazar primary key (yazar_no);


create table Tbl_Kitap(
kitap_no int primary key,
kitap_ad varchar(20),
yayinevi varchar(20),
yazar_id int foreign key references YAZARLAR (YAZAR_NO) DEFAULT 0
)


alter table TblðKitaplar add constraint fk_yazar_kitap (yazar_id) references Tbl_Yazar(yazar_no) -- sonradan tabloya foreign key ekleme

-- not null kýsýtý olmayan sonradan primary key yapýlamýyor.
-- primary key olmayan alan foreign key olmaz

select * from Tbl_Kitap
insert into Tbl_Kitap values(1,'Savas ve baris','Marti',1);
insert into Tbl_Kitap values(2,'Suc ve ceza','Ýþbankasý',2);
insert into Tbl_Kitap values(3,'Hayýr diy. Türkiye','Marti',4);


insert into Tbl_Kitap values(4,'Hayýr diy. Türkiye','Marti',5); -- yazar_no olmayan deðeri tabloya ekleyemeyiz


select * from Tbl_Kitap where yazar_id = (select yazar_no from YAZARLAR where ISIM = 'Alev')

select * from YAZARLAR
select * from Tbl_Kitap

select * from YAZARLAR y inner join Tbl_Kitap k on y.YAZAR_NO = k.yazar_id
select k.kitap_no,k.kitap_ad,y.ISIM,y.SOYISIM from YAZARLAR y inner join Tbl_Kitap k on y.YAZAR_NO = k.yazar_id


select k.kitap_no,k.kitap_ad,y.ISIM,y.SOYISIM from Tbl_Kitap k right outer join YAZARLAR y on y.YAZAR_NO = k.yazar_id -- right deðeri bu örnekte bütün yazarlarý getirirken left deseydik bütün 
--kitaplarý getiremsi gerekirdi, hepsini getirmek için left/right yerine "full" kullanýlmasý gerekemketedir. 
--Bunu kullanma amacýmýz kitabý olmayan yazarlarý ya da yazarý olmayan kitaplarý da görüntülemek isteðimizden kaynaklanmaktadýr.

delete from YAZARLAR where isim = 'lev' -- kitaplar tablosunda 'lev' yazarýna ait kitap olduðu için silme iþlemei gerçekleþtirilemez. Kitabý olmayan yazarlarý silebiliriz.




-------------------------------------------------------------------------------------------------------------------- BU KISIMLARI SONRADAN EKLEDÝM
select * from PERSONEL where right(SOYISIM,1) = left(SOYISIM,1)
select * from PERSONEL where len(isim) BETWEEN 6 AND 9
select * from PERSONEL where isim = reverse(isim)
select * from PERSONEL where charindex('a',isim)>0 and charindex('l',isim)>0
update PERSONEL set ULKE='TÜRKÝYE' where ULKE='Türkiye'
select *,concat(SUBSTRING(SOYISIM,1,len(soyisim)-1),upper(right(SOYISIM,1))) from PERSONEL
select * from UYELER where CHARINDEX('@',E_POSTA)>0 and CHARINDEX('.com',E_POSTA)>0 and CHARINDEX('@',E_POSTA)< CHARINDEX('.com',E_POSTA)

select * from PERSONEL where (isim like '%h%') and (isim like '%e%')



