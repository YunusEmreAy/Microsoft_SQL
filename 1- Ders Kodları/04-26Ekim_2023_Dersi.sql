use VTDERS21EKIM;
Alter database [VTDERS21EKIM] modify name = [VTKITAPYAYIN] 
use VTKITAPYAYIN
select avg(maas) as ortalama_maas from PERSONEL where ULKE='Türkiye' and CINSIYET = 'E';

select * from PERSONEL
select ulke from PERSONEL group by ulke -- ulkeleri gruplar / çýktýlarý alfabetik sýralar
select isim from PERSONEL group by ulke -- gurupladýðýmýz ifadeyi select'ten sonra vermemiz gerekmektedir. (BURADA YAZDIÐIM ÝFADE KISMIN YANLIÞ)

select ulke, avg(yas) from PERSONEL group by ulke

select ulke, avg(MAAS) from PERSONEL group by ulke order by ulke desc
select ulke, avg(MAAS) from PERSONEL group by ulke order by avg(MAAS) asc
select ulke, avg(MAAS) as ort_maas from PERSONEL group by ulke order by ort_maas asc


select CINSIYET from PERSONEL group by CINSIYET
select CINSIYET,isim, count(*) from PERSONEL group by CINSIYET,isim

select * from personel
select cinsiyet, ulke from personel group by CINSIYET, ULKE -- 2 özelliðe göre gruplandýrma yapýlmýþtýr
select cinsiyet, ulke, count(CINSIYET) from personel group by CINSIYET, ULKE -- count
select cinsiyet, ulke, count(*) as count_ from personel group by CINSIYET, ULKE -- count
select cinsiyet, ulke, count(*) as count_ ,sum(maas) as maas_sum,avg(maas) as avg_maas, avg(yas) as yas_avg from personel group by CINSIYET, ULKE
select cinsiyet, ulke, count(*) as count_ ,sum(maas) as sum_, avg(yas) as avg_ from personel group by CINSIYET, ULKE order by sum_

----------------------------------------------------------------------------------------------------------------------------------------------

-- maasý 2000'den fazla olan kiþilere göre 
-- ulke ve cinsiyete göre gruplama yapan ve 
select * from personel
select cinsiyet, ulke, avg(yas) as ort_yas, count(*) from personel where MAAS > 2000 group by CINSIYET, ULKE

----------------------------------------------------------------------------------------------------------------------------------------------
-- having iþlemi
-- ülkelere göre kiþileri gruplayan ve grup yas ort 25 üstü ise getiren sorgu
select ulke,avg(yas) as ort_yas from personel group by ulke having avg(yas)>25--as ile having kullanýlamaz
select ulke from personel group by ulke having avg(yas)>25--as ile having kullanýlamaz


-- where ile having farký --> where tabloda var olan stunlar üzerinde iþlem yapmayý saðlar
-- --> having ise tablodan gruplandýrdýðýmýz (virtual data) verilerin arasýndan seçim yapar

select kent, count(*) as calisan_sayisi from PERSONEL group by kent having count(*) > 1 -- örnek soru

-- 
select ulke, avg(maas) as maas_ort from PERSONEL  group by ulke having avg(maas)>3000
select ulke, avg(maas) as maas_ort from PERSONEL  where CINSIYET='E' group by ulke having avg(maas)>2000
select ulke,cinsiyet, avg(maas) as maas_ort from PERSONEL group by ulke,cinsiyet having avg(maas)>2000 and cinsiyet = 'E'
--

select ulke, cinsiyet, avg(maas) from PERSONEL group by ulke,CINSIYET having CINSIYET='E'

-- maas ortalamsý 3000 den fazla olan ulkelerdeki erkek çalýþanlarýn maas ortalamasý
SELECT ulke, AVG(maas) as ort_maas FROM PERSONEL WHERE CINSIYET = 'E' AND ulke IN (SELECT ulke FROM PERSONEL GROUP BY ulke HAVING AVG(maas) > 3000) GROUP BY ulke; -- bunu sonradn yazdým / bence doðrusu bu

select ulke,avg(maas) as ort_maas from PERSONEL where CINSIYET='E' group by ulke having avg(maas)>2000
select ulke, avg(maas) as maas_ort from PERSONEL  group by ulke
select ulke,avg(maas) as ort_maas from PERSONEL where CINSIYET='E' group by ulke 

-- Maaþý 2000 e eþit veya çok olan personelleri ülkelerine göre gruplayan ve grubun yaþ ort 25 e eþit veya daha büyükse bu gruplarýn ülke, ort yas, ort maas ve sayýlarýný getiren sorgu
select ulke,avg(yas) as ort_yas, avg(maas) as ort_maas,count(*) as kisi_sayýsý from PERSONEL where maas >= 2000 group by ulke having avg(yas) >= 25
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

select * from PERSONEL;
select * from UYELER;

select * from personel, uyeler -- kartezyen çarpým
-- Normalizasyon Kurallarý -- (sonraki hafta)





 

