use VTKITAPYAYIN

select * from PERSONEL
select min(maas) minmaas, max(maas) maxmaas, avg(maas) ortmaas, sum(maas) toplammaas from PERSONEL

select count(*) from PERSONEL where ulke = 'Türkiye'

select ulke, count(*) as kisisayisi, avg(maas) as ortmaas from PERSONEL group by ULKE order by kisisayisi desc

select count(*) kisisayisi,ulke,kent from PERSONEL group by ulke,kent order by ulke asc, kent desc
 
select kent from PERSONEL where ulke = 'Türkiye' group by kent having count(*) = 1



select * from PERSONEL where CINSIYET = 'E' and yas > (select avg(yas) from PERSONEL where ULKE = 'Türkiye' )

select * from PERSONEL where ulke in (select distinct ulke from PERSONEL where yas>32)

-- AVG, MIN, MAX, SUM, COUNT
-- ASCII, CHAR

select ascii('a'); -- char to ascii
select ascii('A'); 

select char(65) -- ascii to char

-- charindex, substring

select CHARINDEX('a','Anadana') -- ilk parametrede girilen parametrinin kaçýncý indexte olduðunu söyler (ilk index = 1)
select CHARINDEX('a','Anadana',3) -- ilk parametrede girilen parametrinin kaçýncý indexte olduðunu söyler, 3. parametreden baþlar

select SUBSTRING('Badanada',1,4) -- 1 den baþla 4 karakter boyunca bana getir
select SUBSTRING(isim,1,1), SUBSTRING(isim,2,len(isim)) from PERSONEL


-- UPPER, LOWER
select upper('AhmetHasimGülpiNARda') -- Hepsini büyük yazar
select LOWER('AhmetHasimGülpiNARda') -- Hepsini küçük yazar

select lower(isim) from PERSONEL

select * from PERSONEL where lower(isim) = lower('Ahmet')


-- left, right 
select right(isim,1) from PERSONEL -- saðdan 1 karakter getir
select left(isim,1) from PERSONEL -- soldan 1 karakter getir


-- TRIM, LTRIM, RTRIM
select len('     asdfasdfasdfads          ') -- saðdaki boþluk görmez
selecT trim('     asdfasdfasdfads          ')
selecT len(rtrim('         asdfasdfasdfads          ')) -- saðdaki bolþuk görmez
selecT len(ltrim('     asdfasdfasdfads          ')) -- soldaki boþluk görmez


-- replace, stuff, concat

select replace ('AhmetAa','A','@')
select SUBSTRING(isim,1,len(isim)-1) + upper(right(isim,1)) from PERSONEL
select concat(SUBSTRING(isim,1,len(isim)-1) , upper(right(isim,1))) from PERSONEL
select stuff('SQL DERSLERÝ',1,3,'HTML')


select reverse(isim) from PERSONEL

select reverse('YUNUSEMREAY')


select str(185,10,5)
select len(str(185,10,3))


select * from PERSONEL where lower(left(soyisim,1)) = lower(right(soyisim,1))
select * from PERSONEL where lower(left(soyisim,1)) = lower(right(isim,1))

select * from PERSONEL where len(isim) > 5 and len(isim) < 10

select * from PERSONEL where lower(isim) = lower(reverse(isim)) -- bende "ADA" yok ondan olmadý

select isim from PERSONEL where CHARINDEX('a',isim)>0 and CHARINDEX('m',isim)>0
select isim from PERSONEL where lower(isim) like '%a%m%' or isim like '%m%a%'

select upper(ulke) from PERSONEL -- eksik var

--stuff(metin,baþlangýç,uzunluk,yerine geçecek)
select stuff(SOYISIM,len(soyisim),1,upper(right(soyisim,1))) from PERSONEL

select SUBSTRING(isim,1,len(isim)-1) + upper(SUBSTRING(isim,len(isim),1)) from PERSONEL

select * from UYELER where E_POSTA like '%@%.com'
select e_posta from UYELER where CHARINDEX('@',E_POSTA)>0 and CHARINDEX('.com',E_POSTA)>0 and
CHARINDEX('.com',E_POSTA)> CHARINDEX('@',E_POSTA)



-------------------------------------------------------------------------------------------------------------------- Bu kýsmda kendi kendime örnek çözdüm.
select * from PERSONEL

select sum(maas) as TOPLAM_MAAS, count(*) as PERSONEL_SAYISI, avg(maas) as ORTALAMA_MAAS,COUNT(where ulke='Türkiye') as BU_DA_SAÐLAMASI, min(MAAS), MAX(MAAS) from PERSONEL
select count(*) from PERSONEL where ulke='Türkiye' 
select ulke,COUNT(*),avg(maas) as ort_maas from PERSONEL group by ULKE order by COUNT(*) desc
select count(*),ulke,kent from PERSONEL group by ulke,kent order by ulke,kent asc  
select kent,count(*) from PERSONEL where ulke='Türkiye' group by kent having count(*) = 1
select ulke,min(maas) as MÝN_MAAS from PERSONEL group by ulke having min(maas)>3000 order by MÝN_MAAS
select ulke,cinsiyet,count(*) from PERSONEL group by ulke,cinsiyet ORDER BY ULKE
select * from PERSONEL where CINSIYET='E' and yas<(select avg(yas) from PERSONEL)








