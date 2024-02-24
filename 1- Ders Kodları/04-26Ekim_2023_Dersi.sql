use VTDERS21EKIM;
Alter database [VTDERS21EKIM] modify name = [VTKITAPYAYIN] 
use VTKITAPYAYIN
select avg(maas) as ortalama_maas from PERSONEL where ULKE='T�rkiye' and CINSIYET = 'E';

select * from PERSONEL
select ulke from PERSONEL group by ulke -- ulkeleri gruplar / ��kt�lar� alfabetik s�ralar
select isim from PERSONEL group by ulke -- guruplad���m�z ifadeyi select'ten sonra vermemiz gerekmektedir. (BURADA YAZDI�IM �FADE KISMIN YANLI�)

select ulke, avg(yas) from PERSONEL group by ulke

select ulke, avg(MAAS) from PERSONEL group by ulke order by ulke desc
select ulke, avg(MAAS) from PERSONEL group by ulke order by avg(MAAS) asc
select ulke, avg(MAAS) as ort_maas from PERSONEL group by ulke order by ort_maas asc


select CINSIYET from PERSONEL group by CINSIYET
select CINSIYET,isim, count(*) from PERSONEL group by CINSIYET,isim

select * from personel
select cinsiyet, ulke from personel group by CINSIYET, ULKE -- 2 �zelli�e g�re grupland�rma yap�lm��t�r
select cinsiyet, ulke, count(CINSIYET) from personel group by CINSIYET, ULKE -- count
select cinsiyet, ulke, count(*) as count_ from personel group by CINSIYET, ULKE -- count
select cinsiyet, ulke, count(*) as count_ ,sum(maas) as maas_sum,avg(maas) as avg_maas, avg(yas) as yas_avg from personel group by CINSIYET, ULKE
select cinsiyet, ulke, count(*) as count_ ,sum(maas) as sum_, avg(yas) as avg_ from personel group by CINSIYET, ULKE order by sum_

----------------------------------------------------------------------------------------------------------------------------------------------

-- maas� 2000'den fazla olan ki�ilere g�re 
-- ulke ve cinsiyete g�re gruplama yapan ve 
select * from personel
select cinsiyet, ulke, avg(yas) as ort_yas, count(*) from personel where MAAS > 2000 group by CINSIYET, ULKE

----------------------------------------------------------------------------------------------------------------------------------------------
-- having i�lemi
-- �lkelere g�re ki�ileri gruplayan ve grup yas ort 25 �st� ise getiren sorgu
select ulke,avg(yas) as ort_yas from personel group by ulke having avg(yas)>25--as ile having kullan�lamaz
select ulke from personel group by ulke having avg(yas)>25--as ile having kullan�lamaz


-- where ile having fark� --> where tabloda var olan stunlar �zerinde i�lem yapmay� sa�lar
-- --> having ise tablodan grupland�rd���m�z (virtual data) verilerin aras�ndan se�im yapar

select kent, count(*) as calisan_sayisi from PERSONEL group by kent having count(*) > 1 -- �rnek soru

-- 
select ulke, avg(maas) as maas_ort from PERSONEL  group by ulke having avg(maas)>3000
select ulke, avg(maas) as maas_ort from PERSONEL  where CINSIYET='E' group by ulke having avg(maas)>2000
select ulke,cinsiyet, avg(maas) as maas_ort from PERSONEL group by ulke,cinsiyet having avg(maas)>2000 and cinsiyet = 'E'
--

select ulke, cinsiyet, avg(maas) from PERSONEL group by ulke,CINSIYET having CINSIYET='E'

-- maas ortalams� 3000 den fazla olan ulkelerdeki erkek �al��anlar�n maas ortalamas�
SELECT ulke, AVG(maas) as ort_maas FROM PERSONEL WHERE CINSIYET = 'E' AND ulke IN (SELECT ulke FROM PERSONEL GROUP BY ulke HAVING AVG(maas) > 3000) GROUP BY ulke; -- bunu sonradn yazd�m / bence do�rusu bu

select ulke,avg(maas) as ort_maas from PERSONEL where CINSIYET='E' group by ulke having avg(maas)>2000
select ulke, avg(maas) as maas_ort from PERSONEL  group by ulke
select ulke,avg(maas) as ort_maas from PERSONEL where CINSIYET='E' group by ulke 

-- Maa�� 2000 e e�it veya �ok olan personelleri �lkelerine g�re gruplayan ve grubun ya� ort 25 e e�it veya daha b�y�kse bu gruplar�n �lke, ort yas, ort maas ve say�lar�n� getiren sorgu
select ulke,avg(yas) as ort_yas, avg(maas) as ort_maas,count(*) as kisi_say�s� from PERSONEL where maas >= 2000 group by ulke having avg(yas) >= 25
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

select * from PERSONEL;
select * from UYELER;

select * from personel, uyeler -- kartezyen �arp�m
-- Normalizasyon Kurallar� -- (sonraki hafta)





 

