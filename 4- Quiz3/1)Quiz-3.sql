use ARAC_SATIS  -- 21100011016 / Yunus Emre Ay --
				

select * from TblAraclar
select * from TblAracSahibi
select * from Tbl�l
select * from TblMarka
select * from TblModel
select * from TblVites

---------------------- 1.Soru ----------------------
-- 1. Ara� markas�-modeli, ara� sahibinin ad�-soyad�-ceptelefonu, arac�n vites t�r�, kilometresi ve fiyat bilgilerini getren sorguyu yaz�n�z.

Select TblMarka.isim, TblModel.model, TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel, TblVites.tur, TblAraclar.km, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
inner join TblVites on TblAraclar.vites_id = TblVites.id


---------------------- 2.Soru ----------------------
-- 2. Her Ara� Sahibinin ka� arac� oldu�unu getiren sorguyu yaz�n�z.

select TblAracSahibi.isim, TblAracSahibi.soyisim, count(*) as Arac_sayisi from TblAraclar  
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id group by TblAracSahibi.isim, TblAracSahibi.soyisim


---------------------- 3.Soru ----------------------
-- 3. Markalara g�re ara�lar�n ortalama fiyatlar�n� pahal�dan ucuza do�ru getiren sorguyu yaz�n�z. 

select TblMarka.isim, avg(TblAraclar.fiyat) as ortalama_fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id group by TblMarka.isim


---------------------- 4.Soru ----------------------
-- 4. 100000 km alt�ndaki d�z vites ara�lar�n marko, model, km, y�l ve fiyat bilgilerini getiren sorguyu yaz�n�z.

select TblMarka.isim, TblModel.model, TblAraclar.km, TblAraclar.y�l, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblVites on TblAraclar.vites_id = TblVites.id
where TblAraclar.km < 100000 and TblVites.tur='D�Z'


---------------------- 5.Soru ----------------------
-- 5. Markalara g�re A'dan Z'ye ve fiyata g�re pahal�dan ucuza do�ru ara�lar� listeleyen sorguyu yaz�n�z. 

Select TblMarka.isim, TblModel.model, TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel, TblVites.tur, TblAraclar.y�l, TblAraclar.km, TblAraclar.fiyat, TblAraclar.ilan_tarihi from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
inner join TblVites on TblAraclar.vites_id = TblVites.id
order by TblMarka.isim asc, TblAraclar.fiyat desc


---------------------- 6.Soru ----------------------
-- 6. D�z vites ve otomatik ara�lar�n ortalama fiyatlar�n� getiren sorguyu yaz�n�z.

select TblVites.tur, avg(TblAraclar.fiyat) as ortalama_fiyat from TblAraclar 
inner join TblVites on TblAraclar.vites_id = TblVites.id where TblVites.tur = 'D�z' or TblVites.tur = 'Otomatik'
group by TblVites.tur


---------------------- 7.Soru ----------------------
--7. Ara� sahiplerinin ad, soyad ve cep telefonu ile birlikte sahip olduklar� ara�lar�n piyasa de�erine g�re �oktan aza do�ru listeleyen kodu yaz�n�z.

select TblAracSahibi.isim, TblAracSahibi.soyisim, TblAracSahibi.ceptel,TblMarka.isim, TblModel.model, TblAraclar.fiyat from TblAraclar
inner join TblMarka on TblAraclar.marka_id = TblMarka.id
inner join TblModel on TblAraclar.model_id = TblModel.id
inner join TblAracSahibi on TblAraclar.sahip_id = TblAracSahibi.id
order by TblAraclar.fiyat desc