use VTDERS21EKIM;
select * from KISILER;
select ad,soyad,sehir, id, adres from KISILER;--seçtiðimiz sýrada gelir
select distinct sehir from KISILER; -- tekrar edenleri kaldýrýr, sadece çeþitleri getirir
select sehir='Istanbul' from KISILER; -- bu sorgu yanlýþ
select * from KISILER where sehir =	'Istanbul';
---------------------------------------------------------------------------
select * from UYELER;
select distinct cinsiyet from UYELER;
-----------------------------------------------------------------
-- where þart ifadesi
select * from kisiler
select * from kisiler where sehir='Ankara'

select * from yazarlar where ulke='Rusya'

select * from yazarlar where DOGUM_YILI > 1821

select distinct ulke from yazarlar
select * from yazarlar

---------------------------------------------------------------------
select * from UYELER;
select * from UYELER where ISIM = 'Deniz' and CINSIYET = 'K' 

select * from UYELER where ISIM = 'Deniz' or CINSIYET = 'K' 
----------------------------------------------------------------------
-- Cinsiyeti erekek olan, soy ismi aydýn veya zafer olan kayýtlarý getir
select * from UYELER where CINSIYET = 'E' and (SOYISIM = 'Aydin' or SOYISIM = 'Zafer')

----------------------------------------------------------------------
select * from PERSONEL
select * from PERSONEL where ISIM = 'Ahmet' and ISIM = 'Mehmet'
-- Yaþý 30 dan büyük erkek veya yaþý 25 den küçük kadýn
select * from PERSONEL where (YAS > 30 and CINSIYET = 'E') or (YAS < 25 and CINSIYET = 'K')
-------------------------------------------------------------------------------------------------
-- (yaþý 30 dan büyük veya ankarada yaþayan) ve (maasý 2500 den büyük veya kadýn olan)
select * from PERSONEL where (YAS > 30 or KENT = 'Ankara') and (MAAS > 2500 or CINSIYET = 'K')
-------------------------------------------------------------------------------------------------

select * from UYELER 
select * from UYELER order by isim -- isme göre baþtan sonra sýralama
select * from UYELER order by isim asc -- isme göre baþtan sonra sýralama (asc opsiyenel)
select * from UYELER order by isim desc -- isme göre sondan baþa sýralama descending

select * from PERSONEL order by maas -- maas azdan çoða göre sýralama
select * from PERSONEL order by maas asc -- maas azdan çoða göre sýralama
select * from PERSONEL order by maas desc -- maas çoktan aza göre sýralama
------------------------------------------------------------------------------------------------
-- TOP iþleci

select * from PERSONEL

select top 5 per_no, isim from PERSONEL -- ilk 5 kayýt per_no ve isim

-- like iþleci

select * from PERSONEL
select * from PERSONEL where isim like 'A%' -- 'A' ile baþlayan
select * from PERSONEL where isim like '%s' -- 's' ile biten
select * from PERSONEL where isim like '%e%' -- 'e' içerisinde 'e' bulunan, e ile baþlayýp/bitebilir
select * from PERSONEL where isim like '%et%' -- 'et' içerenler
-------------------------------------------------------------------------------------------
select * from UYELER
select * from UYELER where isim like 'M%m'
select * from UYELER where isim like '_e%' --'_[e]%' 2.harf 'e'
select * from UYELER where isim like '_[^e]%' -- 2. harf 'e' olmayanlar


select * from UYELER where isim like '__r%' -- 3.harf'r'

select * from UYELER where UYE_ADI like 'd[e]%' -- d harfiyle baþlayan, 2.harfi 'e' olan
----------------------------------------------------------------------------------------------
-- In iþleci


select * from PERSONEL

select * from PERSONEL where yas=22 or yas=23 or yas=25 or yas=26 
select * from PERSONEL where yas IN (22,23,25,26)
-- select * from PERSONEL where yas between XX and XX
select * from PERSONEL where isim IN('Ahmet','Mehmet')
------------------------------------------------------------------------------------------------
-- BETWEEN iþleci

select * from PERSONEL where yas between 20 and 26 -- 20/26 arasýndaki verileri getirir
select * from PERSONEL where isim between 'A' and 'K' 

------------------------------------------------------------------------------------------------
-- AS sözcüðü kullanýmý

select * from PERSONEL
select isim as PERSONEL_ADI from PERSONEL
select isim as PERSONEL_ADI, * from PERSONEL
select *,isim as PERSONEL_ADI from PERSONEL -- burada 'as' sözcüðü çalýþmadý


select PERSONEL_ADI from PERSONEL -- Atama yapmadýðý için bu kod yanlýþ
------------------------------------------------------------------------------------------------
-- Kümeleme fonksiyonlarý

select * from PERSONEL


select avg(maas) from PERSONEL -- maas ortalamsýný verir 
select avg(maas) as maas_ort from PERSONEL 
select avg(maas) as maas_ort from PERSONEL where ulke='Türkiye' -- ortalama alýr
select sum(maas) as maas_toplam from PERSONEL where ulke='Türkiye' -- toplar
-----------------------------------------------------------------------------------------------
-- ROUND, CEILING, FLOOR

Select ROUND(5.576, 1) -- 2. parametreyle --> virgülden sonra kaç basamak olacaðýna karar verilir ve gerekli yuvarlama iþlemi yapýlýr
Select ROUND(5.576, 1) as Round1

Select ROUND(5.576, 1) as Round1, 
	CEILING(5.376) as CEILING1, -- Her zaman yukarýya yuvarlar
	FLOOR(5.576) AS FLOOR1 -- Her zaman aþaðýya yuvarlar

select CEILING(1.376)
-----------------------------------------------------------------------------------------------
-- COUNT iþleci (NULL Olanlarý saymaz)

select * from YAZARLAR 
select count(*) from YAZARLAR 
select count(isim) from YAZARLAR
select count(OLUM_YILI) from YAZARLAR
select count(*) from YAZARLAR where ULKE='Türkiye'
select count(*) as TURKYAZARSAYISI from YAZARLAR where ULKE='Türkiye'
------------------------------------------------------------------------------------------------
select count(distinct sehir) from KISILER
------------------------------------------------------------------------------------------------
-- MAX MIN iþleci

select * from PERSONEL -- as komutu yerine ' '(space) kullanýldýðý zaman 'as' kullanmaya gerek kalmaz
select max(yas) ENYASLI, min(yas) ENGENC from PERSONEL


select yas,isim from PERSONEL where yas= (select max(yas) from PERSONEL) -- yaþý en büyük olanýn isim ve yaþýný yazdýrýr
 