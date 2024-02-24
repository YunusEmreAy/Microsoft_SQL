use VTDERS21EKIM;
select * from KISILER;
select ad,soyad,sehir, id, adres from KISILER;--se�ti�imiz s�rada gelir
select distinct sehir from KISILER; -- tekrar edenleri kald�r�r, sadece �e�itleri getirir
select sehir='Istanbul' from KISILER; -- bu sorgu yanl��
select * from KISILER where sehir =	'Istanbul';
---------------------------------------------------------------------------
select * from UYELER;
select distinct cinsiyet from UYELER;
-----------------------------------------------------------------
-- where �art ifadesi
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
-- Cinsiyeti erekek olan, soy ismi ayd�n veya zafer olan kay�tlar� getir
select * from UYELER where CINSIYET = 'E' and (SOYISIM = 'Aydin' or SOYISIM = 'Zafer')

----------------------------------------------------------------------
select * from PERSONEL
select * from PERSONEL where ISIM = 'Ahmet' and ISIM = 'Mehmet'
-- Ya�� 30 dan b�y�k erkek veya ya�� 25 den k���k kad�n
select * from PERSONEL where (YAS > 30 and CINSIYET = 'E') or (YAS < 25 and CINSIYET = 'K')
-------------------------------------------------------------------------------------------------
-- (ya�� 30 dan b�y�k veya ankarada ya�ayan) ve (maas� 2500 den b�y�k veya kad�n olan)
select * from PERSONEL where (YAS > 30 or KENT = 'Ankara') and (MAAS > 2500 or CINSIYET = 'K')
-------------------------------------------------------------------------------------------------

select * from UYELER 
select * from UYELER order by isim -- isme g�re ba�tan sonra s�ralama
select * from UYELER order by isim asc -- isme g�re ba�tan sonra s�ralama (asc opsiyenel)
select * from UYELER order by isim desc -- isme g�re sondan ba�a s�ralama descending

select * from PERSONEL order by maas -- maas azdan �o�a g�re s�ralama
select * from PERSONEL order by maas asc -- maas azdan �o�a g�re s�ralama
select * from PERSONEL order by maas desc -- maas �oktan aza g�re s�ralama
------------------------------------------------------------------------------------------------
-- TOP i�leci

select * from PERSONEL

select top 5 per_no, isim from PERSONEL -- ilk 5 kay�t per_no ve isim

-- like i�leci

select * from PERSONEL
select * from PERSONEL where isim like 'A%' -- 'A' ile ba�layan
select * from PERSONEL where isim like '%s' -- 's' ile biten
select * from PERSONEL where isim like '%e%' -- 'e' i�erisinde 'e' bulunan, e ile ba�lay�p/bitebilir
select * from PERSONEL where isim like '%et%' -- 'et' i�erenler
-------------------------------------------------------------------------------------------
select * from UYELER
select * from UYELER where isim like 'M%m'
select * from UYELER where isim like '_e%' --'_[e]%' 2.harf 'e'
select * from UYELER where isim like '_[^e]%' -- 2. harf 'e' olmayanlar


select * from UYELER where isim like '__r%' -- 3.harf'r'

select * from UYELER where UYE_ADI like 'd[e]%' -- d harfiyle ba�layan, 2.harfi 'e' olan
----------------------------------------------------------------------------------------------
-- In i�leci


select * from PERSONEL

select * from PERSONEL where yas=22 or yas=23 or yas=25 or yas=26 
select * from PERSONEL where yas IN (22,23,25,26)
-- select * from PERSONEL where yas between XX and XX
select * from PERSONEL where isim IN('Ahmet','Mehmet')
------------------------------------------------------------------------------------------------
-- BETWEEN i�leci

select * from PERSONEL where yas between 20 and 26 -- 20/26 aras�ndaki verileri getirir
select * from PERSONEL where isim between 'A' and 'K' 

------------------------------------------------------------------------------------------------
-- AS s�zc��� kullan�m�

select * from PERSONEL
select isim as PERSONEL_ADI from PERSONEL
select isim as PERSONEL_ADI, * from PERSONEL
select *,isim as PERSONEL_ADI from PERSONEL -- burada 'as' s�zc��� �al��mad�


select PERSONEL_ADI from PERSONEL -- Atama yapmad��� i�in bu kod yanl��
------------------------------------------------------------------------------------------------
-- K�meleme fonksiyonlar�

select * from PERSONEL


select avg(maas) from PERSONEL -- maas ortalams�n� verir 
select avg(maas) as maas_ort from PERSONEL 
select avg(maas) as maas_ort from PERSONEL where ulke='T�rkiye' -- ortalama al�r
select sum(maas) as maas_toplam from PERSONEL where ulke='T�rkiye' -- toplar
-----------------------------------------------------------------------------------------------
-- ROUND, CEILING, FLOOR

Select ROUND(5.576, 1) -- 2. parametreyle --> virg�lden sonra ka� basamak olaca��na karar verilir ve gerekli yuvarlama i�lemi yap�l�r
Select ROUND(5.576, 1) as Round1

Select ROUND(5.576, 1) as Round1, 
	CEILING(5.376) as CEILING1, -- Her zaman yukar�ya yuvarlar
	FLOOR(5.576) AS FLOOR1 -- Her zaman a�a��ya yuvarlar

select CEILING(1.376)
-----------------------------------------------------------------------------------------------
-- COUNT i�leci (NULL Olanlar� saymaz)

select * from YAZARLAR 
select count(*) from YAZARLAR 
select count(isim) from YAZARLAR
select count(OLUM_YILI) from YAZARLAR
select count(*) from YAZARLAR where ULKE='T�rkiye'
select count(*) as TURKYAZARSAYISI from YAZARLAR where ULKE='T�rkiye'
------------------------------------------------------------------------------------------------
select count(distinct sehir) from KISILER
------------------------------------------------------------------------------------------------
-- MAX MIN i�leci

select * from PERSONEL -- as komutu yerine ' '(space) kullan�ld��� zaman 'as' kullanmaya gerek kalmaz
select max(yas) ENYASLI, min(yas) ENGENC from PERSONEL


select yas,isim from PERSONEL where yas= (select max(yas) from PERSONEL) -- ya�� en b�y�k olan�n isim ve ya��n� yazd�r�r
 